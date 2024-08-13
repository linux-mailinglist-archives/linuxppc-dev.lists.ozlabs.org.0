Return-Path: <linuxppc-dev+bounces-64-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A069509C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 18:06:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XWwo8k9x;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQjnk3Mo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wjx8F1kD3z2y8q;
	Wed, 14 Aug 2024 02:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XWwo8k9x;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQjnk3Mo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wjx8D52NJz2xBx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 02:06:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723565175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ngm8li87jva0MeGPwBLbq3/xV5MA2uvy1j63HC/7xUw=;
	b=XWwo8k9x2UKtWzNq24M9sWF93v4ee2PnrWh7k4XJRxFShrzZK9HPjRe/uAdJYzF28hVAZC
	hZ3CXR1RuDFOOW4JSUOfOBLEjOtNEyxewnQz3fp2piFqnc1CUp2XZXTKoePmQPpnfsDp/o
	WOQdBa0Dq55Kad3crcwE3j9bNs23rZs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723565176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ngm8li87jva0MeGPwBLbq3/xV5MA2uvy1j63HC/7xUw=;
	b=XQjnk3MoxR7UDE3qt18P/4SUyU8jA8EWOqdR6ZRoMJhxKGSSnVgbMy5y5Xh+6NzjYeAHcK
	CbI15Kou0Ox7cYVN8vTAePtjUPaN5a6g9hSHpeAl1WXGDQ0y4wRbV80UVv6N3sl7QodrUd
	mi/02YDGz9F+ubLPS0i6XC1ItfwKsmA=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-9cKt5xBBPwyxGt7ekkVVww-1; Tue, 13 Aug 2024 12:06:13 -0400
X-MC-Unique: 9cKt5xBBPwyxGt7ekkVVww-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6b79fbc7ed2so14272906d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 09:06:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723565173; x=1724169973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngm8li87jva0MeGPwBLbq3/xV5MA2uvy1j63HC/7xUw=;
        b=kVsZ/ID98v9vSoH6shTDirQ4dV22NWWUDvu9M1Si1lnkavD6qbmS3QMgf+3SpgO4ca
         rqXWM+/cAw0GPldoAaK6MKQoZI2k6TwZrskscf8eEHXNSf71/FPVGFr6JisdQD3N7tBs
         67Feayx2oGSQRH5YZb0P0qS/ZPgiXJmowScqOvkejJKdP+bNWYOHNLXe3AGe9cZJwAh5
         AgTXd15XhSJLb4CNYI9GeCGmHA9VuWOrLFy3bPKk3qt4Hhw7BA89QwBs49J3CRV86ynq
         wnnDGZRWbIjO6cLkYVC0Am3qN7rsEBCsG0S2twTNFDK/D5RcbTMW+y0ZZJ80rS2OArc/
         c+4g==
X-Forwarded-Encrypted: i=1; AJvYcCXFjW4Qo95d1RE4FIdHMwdiT7xyld0zi2KkE1cZ6pHFO21VKc7tHN9dB45WCas7Yz/BrbJccITsq0vNv5Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygHlGL1sdxj0Tr5S46YvgB+KiaA+c+Fo5Rz1LgcWfx0odJz1aJ
	QjOQzgFFKJ+jMNkxqePI3jaK9+LscoE7ls5GOQgRtDJhN3hQzWcyRcyZcLPlw4VY1fqwcnHmGmb
	oPLf5MhuO1BVdFCr1U8LDXkoiEqd7gMpLcFoIDXTtcSzieYvN/X7+J2rdPLpBMBM=
X-Received: by 2002:a05:620a:29d2:b0:7a4:cd97:2f88 with SMTP id af79cd13be357-7a4ee310ce2mr6340385a.2.1723565173433;
        Tue, 13 Aug 2024 09:06:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGbZLztqXKfgxfdmDtb4eEPXUZcOYPJmJftY5UJc57FF2tbxPHB7ckCU0WLlZvmNEOA/klIA==
X-Received: by 2002:a05:620a:29d2:b0:7a4:cd97:2f88 with SMTP id af79cd13be357-7a4ee310ce2mr6337985a.2.1723565173024;
        Tue, 13 Aug 2024 09:06:13 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7df5690sm352320985a.96.2024.08.13.09.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:06:12 -0700 (PDT)
Date: Tue, 13 Aug 2024 12:06:08 -0400
From: Peter Xu <peterx@redhat.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	"Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>, Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v5 0/7] mm/mprotect: Fix dax puds
Message-ID: <ZruEcHS3Yk1O9ovI@x1n>
References: <20240812181225.1360970-1-peterx@redhat.com>
 <87plqc1tab.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <87plqc1tab.fsf@mail.lhotse>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Aug 13, 2024 at 10:50:04PM +1000, Michael Ellerman wrote:
> > - Power, as no hardware on hand.
> 
> Does it need some specific configuration, or just any Power machine will do?

I am not familiar with both dax and power to be sure on the hardware
implications here, sorry.  I think as long as one can create some /dev/dax
with 1g mapping alignment (I suppose normally with ndctl) then it should be
able to hit the mprotect() path.

One can verify first without this series that it could trigger a bad pud,
then it'll be away after this series applied.  Meanwhile the mprotect()
should apply on the 1g dax range properly.

Thanks,

-- 
Peter Xu


