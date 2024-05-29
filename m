Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 006E88D3473
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:22:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZeXuGQhf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4ty4lWkz884t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:12:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=ZeXuGQhf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Too many DNS lookups) smtp.mailfrom=suse.com (client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com; envelope-from=osalvador@suse.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4tF1DgFz3vcy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:11:48 +1000 (AEST)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5238b5c07efso2138663e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 03:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716977504; x=1717582304; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k0oPejzF1w45d4ohzjxE+rStMmo86jxOO0aZ2z51+qs=;
        b=ZeXuGQhfpmEzxz2Pv7eel/DspfBjQ8H5ggTmmEsMVJfNBWz2ZHO7tKGM3ljVOS+3ui
         AYRnW+bcoYMtIa/lLFi+a01ELhcfkJGsfXaeiXZE2QXMzME/1G6w37U9SLQwtmpU9CoA
         ky2BVuIExD9mKFpJeuytznL9x5CrsDYCVcDlaPm/YyCQSP1tyHoUut9Yy9wDO2GonCDu
         FOypE38kLCjJRKklDSDJvgy2X8EMAkCk7pcDifOsqvTxwv42hloKde6jjWfJkrQyKBxr
         u79WqtPyWo+bDHtQXa2Ovj7hJN9ew24fx47Fbo1FlS1hYIDBS+HwBX4ZNcnHM12Eacte
         bZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716977504; x=1717582304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0oPejzF1w45d4ohzjxE+rStMmo86jxOO0aZ2z51+qs=;
        b=b1s2N9RdtcysU5gKg6NVXQ1rFdkjnLWxry/vt5DmJMf5nlfKz/EeKF4hqrWvK2X82v
         n1LY6N0aTYfShAf+LiADJFPbpFPd37YyofhvU2ZJRjyEgFANfLXth2kVVV1B4PcG4SW9
         oBC2B26i6a3AWwGbddZjZtq63QoBQ26QfoY7zlALIxkOaRprh/HQeYX5XZE5t2c5JWst
         9TyeSkaRkuVEC13Dvi/rioUHsOH5q7ZLnn0HpVb44XnBzJ9HmksugChWgu1AbEFjbRXy
         QA8xcoEeg1TdXDKFP8z+z+jmWxxSkx1nooHelww15KEcuDqp1JtCyooWknX5ZPWDyLLr
         AlZg==
X-Forwarded-Encrypted: i=1; AJvYcCU2m+eWvHEqiVjNbP0TGZR9G+rEl0/7nBVxXLQjE3xcYeTdMU1jsphT2fESoRIGE3hhUL4Rijrj0ktLrp5OwOjCMCIUDteiE786srVuYQ==
X-Gm-Message-State: AOJu0YyxlLfVhfyhqVr5pXs90b29d0OiyFHq6kGxtxHpVseiqioqPEsh
	ZNFk/F3MLHmy/k5OOLm7Ul5VG5WFBdJ1FDpkEQQ2cXF6LnqxJc95wa4al4H4ysI=
X-Google-Smtp-Source: AGHT+IFgYrZo5ta4E3uoE7uAwXaw0QkKXO8VSmlKA6YJb4kJBFmoM8GRlbMlJbE7XEdqt2jjmDPZMw==
X-Received: by 2002:a19:8c5e:0:b0:51d:bbb:7a4e with SMTP id 2adb3069b0e04-529645e344bmr9036378e87.24.1716977503662;
        Wed, 29 May 2024 03:11:43 -0700 (PDT)
Received: from localhost.localdomain (62.83.84.125.dyn.user.ono.com. [62.83.84.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-421089cd6f7sm174662585e9.46.2024.05.29.03.11.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 03:11:43 -0700 (PDT)
From: Oscar Salvador <osalvador@suse.com>
X-Google-Original-From: Oscar Salvador <osalvador@suse.de>
Date: Wed, 29 May 2024 12:11:41 +0200
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v4 14/16] powerpc/64s: Use contiguous PMD/PUD instead
 of HUGEPD
Message-ID: <Zlb_XT12arHu9vu3@localhost.localdomain>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <610be6003a6d215e9e9ca87d7f5402042da1e355.1716815901.git.christophe.leroy@csgroup.eu>
 <Zlb0BugOwko4PrLm@localhost.localdomain>
 <315d1dc7-9eda-45cd-863d-803bfae4c29b@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <315d1dc7-9eda-45cd-863d-803bfae4c29b@csgroup.eu>
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
Cc: Oscar Salvador <osalvador@suse.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024 at 10:07:55AM +0000, Christophe Leroy wrote:
> We can't but I didn't want to leave nb undefined or with a value that 
> might lead to writing in the weed. Value 1 seems a safe default.

Might be worth to throw a WARN_ON?

> >> diff --git a/arch/powerpc/mm/book3s64/hugetlbpage.c b/arch/powerpc/mm/book3s64/hugetlbpage.c
> >> index 5a2e512e96db..83c3361b358b 100644
> >> --- a/arch/powerpc/mm/book3s64/hugetlbpage.c
> >> +++ b/arch/powerpc/mm/book3s64/hugetlbpage.c
> >> @@ -53,6 +53,16 @@ int __hash_page_huge(unsigned long ea, unsigned long access, unsigned long vsid,
> >>   		/* If PTE permissions don't match, take page fault */
> >>   		if (unlikely(!check_pte_access(access, old_pte)))
> >>   			return 1;
> >> +		/*
> >> +		 * If hash-4k, hugepages use seeral contiguous PxD entries
> > 'several'
> >> +		 * so bail out and let mm make the page young or dirty
> >> +		 */
> >> +		if (IS_ENABLED(CONFIG_PPC_4K_PAGES)) {
> >> +			if (!(old_pte & _PAGE_ACCESSED))
> >> +				return 1;
> >> +			if ((access & _PAGE_WRITE) && !(old_pte & _PAGE_DIRTY))
> >> +				return 1;
> > 
> > I have 0 clue about this code. What would happen if we do not bail out?
> > 
> 
> In that case the pte_xchg() in the while () will only set ACCESS or 
> DIRTY bit on the first PxD entry, not on all cont-PxD entries.

I see, thanks for explaining.


-- 
Oscar Salvador
SUSE Labs
