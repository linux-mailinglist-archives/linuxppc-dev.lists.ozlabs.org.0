Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B19931B59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 22:01:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QRlV3xtQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QRlV3xtQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNCkm67C2z3cjv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 06:01:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QRlV3xtQ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QRlV3xtQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNCk50Crxz30Wq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 06:00:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721073640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15Dmclh4kIckOnCQwprcdxOX/buxG2q7LphezAtYVv8=;
	b=QRlV3xtQexjn8woHW4g/x+2UCzIj3HAtcsL6wCiJWb3z703Ha1AT93PhAem2UskadX5SZ9
	rnRyBLYX8jxIHqpvqQFhIJqmZHp+lYKKTBslfxuVNZWX3RgXiI6wcf62tcYGKYJFNx8vlL
	bHZNTlS8Z8s56mzgyiXrG39eOXP0Xk4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721073640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15Dmclh4kIckOnCQwprcdxOX/buxG2q7LphezAtYVv8=;
	b=QRlV3xtQexjn8woHW4g/x+2UCzIj3HAtcsL6wCiJWb3z703Ha1AT93PhAem2UskadX5SZ9
	rnRyBLYX8jxIHqpvqQFhIJqmZHp+lYKKTBslfxuVNZWX3RgXiI6wcf62tcYGKYJFNx8vlL
	bHZNTlS8Z8s56mzgyiXrG39eOXP0Xk4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-wZje7avZOsqliie8jp5RbQ-1; Mon, 15 Jul 2024 16:00:38 -0400
X-MC-Unique: wZje7avZOsqliie8jp5RbQ-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b5e99c06efso9844076d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 13:00:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721073638; x=1721678438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15Dmclh4kIckOnCQwprcdxOX/buxG2q7LphezAtYVv8=;
        b=iiEGdeTd/sx7neKYooSthv8+tANclHn4L4ATDfweRvGOhOAuqbdJYZw3Yqsf1QiUAq
         kEY0+oLI1ozYZ0ItU1NXUPBobDscNm0WCkpcDQuQ5QLDuYKrusTiJdoMl0GqgiY88+Me
         mSrcNTOCd3L1A5IcJfJUTkPmeP8Crjd5MRfCrwjpsbidxpswF5i43fJCzwsSJJ+aMH5c
         CN0P6iL5U9MXyDE/QpHB/si/xVEL1EnjxeOJAtQ8nx7b2VohPKlAjTKf7QfeIrWgkOPj
         hSBt4jtaBfA9uQ1us4BkCcfsdfnGC/r1Ji4nVA/x01fWVqJpaCcmBXD8jr1+xHSaz8bF
         QAKw==
X-Forwarded-Encrypted: i=1; AJvYcCXWqQ9hm8i1GyPDq/NpPqIY/6Xl4LuOzHkpThn79rjOoMZh+IZjpzwAV83ToS6mteL12bIVUNIxENBCwj0tuEeB55HXglTyFQgQzl8+Gw==
X-Gm-Message-State: AOJu0YwWMgugS/VoH+a5QdP3N8/sjokyKz9GnU754fjg2iFV99GNjGsh
	CHP2zKLv16EuOXg+5z+Tzg+XNZ+ZW4iV/n73X8instmSlr6Pa6Brw3VfQEYpRHpNdKQxM4ecz/P
	jL5U4WuHnT7gWu282kFo51f3fvvRJTWcu5UlvFmcpd49XpJV6Pk60wpsppzom4mM=
X-Received: by 2002:a05:6214:31a0:b0:6b7:586c:6d9 with SMTP id 6a1803df08f44-6b77df58959mr5345396d6.7.1721073637960;
        Mon, 15 Jul 2024 13:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6GZr9wMOYCEvghsINr3u6w1OSLohUo6zAjbcvIW8QTcL9i2DqhQXaU6Y+D7OVjwAgKHeENQ==
X-Received: by 2002:a05:6214:31a0:b0:6b7:586c:6d9 with SMTP id 6a1803df08f44-6b77df58959mr5345176d6.7.1721073637602;
        Mon, 15 Jul 2024 13:00:37 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b76199d5a2sm24091186d6.60.2024.07.15.13.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 13:00:37 -0700 (PDT)
Date: Mon, 15 Jul 2024 16:00:34 -0400
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] mm/mprotect: Fix dax puds
Message-ID: <ZpV_4ms0X5SQj0xx@x1n>
References: <20240715192142.3241557-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240715192142.3241557-1-peterx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2024 at 03:21:34PM -0400, Peter Xu wrote:
> [Based on mm-unstable, commit 31334cf98dbd, July 2nd]

I forgot to update here in the cover letter; it's actually based on the
lastest..  Which is 79ae458094ff, as of today (July 15th).

-- 
Peter Xu

