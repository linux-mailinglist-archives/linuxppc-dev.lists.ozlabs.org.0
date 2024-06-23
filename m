Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2B913C83
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Jun 2024 17:43:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ToptW+fC;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ToptW+fC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W6b340bnmz3cXw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 01:43:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ToptW+fC;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ToptW+fC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W6b2L5j4cz30Tt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 01:42:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719157349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=49HpQTD2yqwpDIdZGHTzCNAJyeZfRMkM4BNUXs9LRBk=;
	b=ToptW+fCiUotwg+NXo+8RE+lsTtrm3UZ0Qw70e2QD6RHW/bpsgaSXK08HrxtA7b+jYO8dm
	N1OCTeZyHl714ZFdQg0huj5A03+YMxumyzdQ1LT32YbJNyL7v7fX29TQwpugk4uzTJSdIy
	bWvcsL9JVKYY7Yx2avGKfmkUvfOxW+s=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719157349;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=49HpQTD2yqwpDIdZGHTzCNAJyeZfRMkM4BNUXs9LRBk=;
	b=ToptW+fCiUotwg+NXo+8RE+lsTtrm3UZ0Qw70e2QD6RHW/bpsgaSXK08HrxtA7b+jYO8dm
	N1OCTeZyHl714ZFdQg0huj5A03+YMxumyzdQ1LT32YbJNyL7v7fX29TQwpugk4uzTJSdIy
	bWvcsL9JVKYY7Yx2avGKfmkUvfOxW+s=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-_xZm73aGM3GLPSUXbhsOtg-1; Sun, 23 Jun 2024 11:42:28 -0400
X-MC-Unique: _xZm73aGM3GLPSUXbhsOtg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-44154a1fc17so361701cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Jun 2024 08:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719157347; x=1719762147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49HpQTD2yqwpDIdZGHTzCNAJyeZfRMkM4BNUXs9LRBk=;
        b=SQHenj8mMEWejAd9rYAb+oSS53Yll7n4x7sVc7TIlS6WdIPDwYsShm8ZY7Zx2gj93U
         GKQL8HWDET+LulLcdg/S4waCAxPz/79Wm/B+6JxdiBAnTWW4MVkL6UIwtagGUhNYV+S2
         b6iZ91NkP2COCxtBKiBhnb38OrjxQVtJZL9mX9lz95GS3bpNpuqfpx5omL+KLaqs7LVf
         NxxtjzMvTFhBsxvV2QtKpTnhyudhnNnNDph0oEXmCSrt7nEryV0b62g+onJb8C8XMU57
         Q/xCjfQG2XwuLu0mZp4AdnePdb1tTMh2xoORjonju82A+NpdbbWU07vmQMt9KerWWjK2
         a6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCVKlcz4gFIImP5RamN87/RhbQC5+4fOVsYpCSMpo8o3BNqa5e1wxrV4++4AVhKVTqAt7ydUjhDQB03CuE3eLFppnwjiHvrCz1qIOLsJuQ==
X-Gm-Message-State: AOJu0YwoXhNRdIwnAWB12MmxU/dWKTKOvvGLjY3DxwC/YzmxnkgzJOW3
	fd0Vxg+GvJLjbrrul2NOtj4wVYVnIzxsY46N+Wi0G0BwO9bDwama+HHR3rWaMpj90AeMABqTCW3
	Fir7Mp/kMYZkI0UnzXV/Q4SfGQbkT6Eqz5aqpdPkwPFxg7SlIjR0kwMfcB7BJntQ=
X-Received: by 2002:ac8:5748:0:b0:440:565a:920a with SMTP id d75a77b69052e-444cf710e9dmr46703271cf.2.1719157347314;
        Sun, 23 Jun 2024 08:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDWtNbBGBpmQxIF+5cLIUwj0ebBIF6aR+2q9TF+Eqc5ywm7H5/7hWNuQ8dMyVTY79V+vfiyQ==
X-Received: by 2002:ac8:5748:0:b0:440:565a:920a with SMTP id d75a77b69052e-444cf710e9dmr46703081cf.2.1719157346867;
        Sun, 23 Jun 2024 08:42:26 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444c3b4b42asm31681401cf.91.2024.06.23.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 08:42:26 -0700 (PDT)
Date: Sun, 23 Jun 2024 11:42:23 -0400
From: Peter Xu <peterx@redhat.com>
To: Dave Hansen <dave.hansen@intel.com>
Subject: Re: [PATCH 6/7] mm/x86: Add missing pud helpers
Message-ID: <ZnhCX-GMRn_uYDF8@x1n>
References: <20240621142504.1940209-1-peterx@redhat.com>
 <20240621142504.1940209-7-peterx@redhat.com>
 <4fb4b087-cae2-4516-a34e-cb4c72be13eb@intel.com>
 <ZnWgG7WmZWS-xWJU@x1n>
 <5daa82f5-b5ea-42d7-a074-122734ad99db@intel.com>
MIME-Version: 1.0
In-Reply-To: <5daa82f5-b5ea-42d7-a074-122734ad99db@intel.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024 at 09:11:56AM -0700, Dave Hansen wrote:
> It's in the "Determination of Access Rights" section.
> 
> 	A linear address is a shadow-stack address if the following are
> 	true of the translation of the linear address: (1) the R/W flag
> 	(bit 1) is 0 and the dirty flag (bit 6) is 1 in the paging-
> 	structure entry that maps the page containing the linear
> 	address; and (2) the R/W flag is 1 in every other paging-
> 	structure entry controlling the translation of the linear
> 	address.

Thanks.  It'll be nice if this can be referenced in the pgtable definitions
too in some way.

[...]

> One big thing I did in this review was make sure that the PMD and PUD
> helpers were doing the same thing.  Would you mind circling back and
> double-checking the same before you repost this?

Sure, I'll make sure I'll at least add a comment if it doesn't match and
explain why.  I actually did it already e.g. in the _modify path for shadow
stack, but I failed this spot.

The page table check thing is really rare that I overlooked, could be
relevant to what I used to hit a bug but fixed around this area, so I
forgot to add it back, but I really can't remember. I'll keep an extra eye
on that.

Thanks,

-- 
Peter Xu

