Return-Path: <linuxppc-dev+bounces-6597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113EDA4B051
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Mar 2025 08:32:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5DDf0XWfz2xfX;
	Sun,  2 Mar 2025 18:32:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740900753;
	cv=none; b=gm05AuTzxP3MbTlsj/OnN4K0Es2iWbjsC7ZpC9HuZz8FeCBO+qOZNFXws75OY6s6gc49s2DrtiNf/ca6n1lUksnNqG5uNqTgPIwr3jmncs43RtUX4ovH7Hw8jvwOXaoltmk9NqGywhKOGn1PqRwrTFR+K0cSCckh08fuQSc28mDjYUQpKuOyxJeH9mgP0xqn9DXsq12Ulty2d06LGKR6q5H0qr8gJM4/JzLrtX9MHJnmr7x2QBBcJJGDrpqGfDyUrEOMLoNwYc0lV2YgEqw/cApO8+FsuCf0+TF+VNJj5VLG5o3DdBXL9k0xo9ciAo0KHGxTpALzpge3zjZPNnq4AA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740900753; c=relaxed/relaxed;
	bh=G9tcvHcD5mXLiBCT94Xacz3XJRhpdDRG8RLlqSwKDZU=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=SGRMv0CHDCIiYkXkqKyT5VFFTJHYRtq627M0+jFYT4TzWwd39JTT5xxtkEuSzeOiYR0/LgmlGrtxBUJh1hjYIwWPRQx/AHjX2KYDpTAZMddzOvgwf+ddyjHgukrVekqRxpRfElC/YxmItCLmgmiUC3jqxOInkwvmA6/LZIFC/rrfPtjyIdk+d46L+GDpP+HipBCqK1pWDY0Md81c1wgEQI3WnEGuoCaRUbvX2EdHxp9wK6Me88OeZLUoXdjwltI6U1XUbeaKGB7VzhsXc8UaL/ROydJbWrRVYXdctASLGH0JolHrpkpJBPGu4bn6O9UD0N9Sz5QPYfAfWppquX+h9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OCGa36nZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OCGa36nZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z5DDc05QNz2xSC
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Mar 2025 18:32:30 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-22398e09e39so7606905ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Mar 2025 23:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740900748; x=1741505548; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=G9tcvHcD5mXLiBCT94Xacz3XJRhpdDRG8RLlqSwKDZU=;
        b=OCGa36nZsKFyc9/oI3WCq3RgivxJOWIt/r3yiRvoph8RTGpjxnraN2NhpI6gbs0IOb
         vn9p0KXYMQubOYc5OERxllUMz1WGgAhq+NggqJFqtsEE7HLUYBvVMQAZumyctXPlg/SF
         tJ3HAtheSXDtfCm7I59SFM9eNFMpsDlQpY3jLgl8PWNCW4dWN26+RVcdIWBpyNLT4fj8
         UE3Hzg96iozSecfDDicpr6OuCjJTvA7cWeIWaR0Y2aGKrWuUZ51QZgMO22WklwumS/wm
         i6o8jQhneS2kFPZy+ImL5q9gIPr1VTFiKVaLFj98KSiowKbAdDpfP41FxqadHrNW19oZ
         4vFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740900748; x=1741505548;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G9tcvHcD5mXLiBCT94Xacz3XJRhpdDRG8RLlqSwKDZU=;
        b=Gx7BdQ9tHfb4QneSC5AgoaFyxvHCMUMD4GDNO2uJKHh19Ds7IAKV88EARV1kL6P6Se
         AnUFyqH+Hl/DOujroZBOtON94uSs3/7BwvqOnJR0UHzaDxaR8jODckgyzDrPZPxnO4vO
         T+3IzNSyuFboxqyZ57iKfWmDWe4oKRb4IquIKPlIbJRverLEla8gp+D+t+rL8UIx3BeK
         v0ZxBAPxWl8JjHXrG3Q5RzprQsZPVsgFrfNjt5GTyBK+tnmJ8GggwFlSuAekSMLPt9gu
         bV8RTSQzeUJTN7rK27ZJfsxGSMPiCMzbW1EJlU9DhBafH1dEag3MrbdLvKQbr1DaTkrE
         lwmA==
X-Forwarded-Encrypted: i=1; AJvYcCX/vAYa18Fc2TQGurBmz+rAeLu9SRLCQLy3ZlxhqU6JoejFAwPZqdEC7Ldf35WXVz7venQUgEVncelUBKY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxG/GrlAABDJ2OLNBLZxDBIi4RkjCd9L8qm/xGyt2vQ1Y++clmq
	snxDhAeXqvUNBwteSLXB7psW1y/jLRJwHOOwpUei87R4OLMQS/Fn
X-Gm-Gg: ASbGncscYFaS64guMhpw6cs+eQnco0gS4lMkeigc8UBrugNavuy3A+8++O9JXPcq0S5
	KsMbv5r+uEcY1j9BgDArZzkNNC4ZgEKOrWwtywc3eTbQsssdY+b0iIouNfMRX+CXR/WCM62lSmu
	Dvzft0KCif3HabLPsN+D2NLbUv82kpkZa4i5gTxPQI5EFdgkhdb8JRV5mX8u4je2QyMjHzv8hX8
	pket6A0Bj0zmfcFnf0Elku3YJfmCHbVDOFcOCYQQyNlkpPN+aQgOuakJkABK6Nd7Bm6d7wInorL
	yeayQE+gjoX9C2yErRqdswObBFa55pIyn7k+vw==
X-Google-Smtp-Source: AGHT+IFzFkieeBb2NMMU42EFRDtFPiGvetD+bFoMuUMaS1B/SYB94zXTA2T9Hwz60Qwu7pPhLgTIFw==
X-Received: by 2002:a17:902:d48f:b0:220:ee5e:6bb with SMTP id d9443c01a7336-22368fc0c71mr134863535ad.20.1740900748354;
        Sat, 01 Mar 2025 23:32:28 -0800 (PST)
Received: from dw-tp ([49.205.218.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5dcesm57364525ad.119.2025.03.01.23.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Mar 2025 23:32:27 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v4] powerpc/hugetlb: Disable gigantic hugepages if fadump is active
In-Reply-To: <20250128043358.163372-1-sourabhjain@linux.ibm.com>
Date: Sun, 02 Mar 2025 12:05:20 +0530
Message-ID: <87h64cgct3.fsf@gmail.com>
References: <20250128043358.163372-1-sourabhjain@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> The fadump kernel boots with limited memory solely to collect the kernel
> core dump. Having gigantic hugepages in the fadump kernel is of no use.

Sure got it.

> Many times, the fadump kernel encounters OOM (Out of Memory) issues if
> gigantic hugepages are allocated.
>
> To address this, disable gigantic hugepages if fadump is active by
> returning early from arch_hugetlb_valid_size() using
> hugepages_supported(). When fadump is active, the global variable
> hugetlb_disabled is set to true, which is later used by the
> PowerPC-specific hugepages_supported() function to determine hugepage
> support.
>
> Returning early from arch_hugetlb_vali_size() not only disables
> gigantic hugepages but also avoids unnecessary hstate initialization for
> every hugepage size supported by the platform.
>
> kernel logs related to hugepages with this patch included:
> kernel argument passed: hugepagesz=1G hugepages=1
>
> First kernel: gigantic hugepage got allocated
> ==============================================
>
> dmesg | grep -i "hugetlb"
> -------------------------
> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 1.00 GiB page
> HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
> HugeTLB: 0 KiB vmemmap can be freed for a 2.00 MiB page
>
> $ cat /proc/meminfo | grep -i "hugetlb"
> -------------------------------------
> Hugetlb:         1048576 kB

Was this tested with patch [1] in your local tree?

[1]: https://web.git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?id=d629d7a8efc33

IIUC, this patch [1] disables the boot time allocation of hugepages.
Isn't it also disabling the boot time allocation for gigantic huge pages
passed by the cmdline params like hugepagesz=1G and hugepages=2 ?


> HugeTLB: registered 1.00 GiB page size, pre-allocated 1 pages
This print comes from report_hugepages(). The only place from where
report_hugepages() gets called is hugetlb_init(). hugetlb_init() is what
is responsible for hugepages & gigantic hugepage allocations of the
passed kernel cmdline params.

But hugetlb_init() already checks for hugepages_supported() in the very
beginning. So I am not sure whether we need this extra patch to disable
gigantic hugepages allocation by the kernel cmdline params like
hugepagesz=1G and hugepages=2 type of options.

Hence I was wondering if you had this patch [1] in your tree when you were
testing this?

But I may be missing something. Could you please help clarify on whether
we really need this patch to disable gigantic hugetlb page allocations?

>
> Fadump kernel: gigantic hugepage not allocated
> ===============================================
>
> dmesg | grep -i "hugetlb"
> -------------------------
> [    0.000000] HugeTLB: unsupported hugepagesz=1G
> [    0.000000] HugeTLB: hugepages=1 does not follow a valid hugepagesz, ignoring
> [    0.706375] HugeTLB support is disabled!
> [    0.773530] hugetlbfs: disabling because there are no supported hugepage sizes
>
> $ cat /proc/meminfo | grep -i "hugetlb"
> ----------------------------------
> <Nothing>
>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

I guess the extra " in the above was not adding me in the cc list.
Hence I missed to see this patch early.

-ritesh


> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changelog:
>
> v1:
> https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/
>
> v2:
> https://lore.kernel.org/all/20250124103220.111303-1-sourabhjain@linux.ibm.com/
>  - disable gigantic hugepage in arch code, arch_hugetlb_valid_size()
>
> v3:
> https://lore.kernel.org/all/20250125104928.88881-1-sourabhjain@linux.ibm.com/
>  - Do not modify the initialization of the shift variable
>
> v4:
> - Update commit message to include how hugepages_supported() detects
>   hugepages support when fadump is active
> - Add Reviewed-by tag
> - NO functional change
>
> ---
>  arch/powerpc/mm/hugetlbpage.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index 6b043180220a..88cfd182db4e 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -138,6 +138,9 @@ bool __init arch_hugetlb_valid_size(unsigned long size)
>  	int shift = __ffs(size);
>  	int mmu_psize;
>
> +	if (!hugepages_supported())
> +		return false;
> +
>  	/* Check that it is a page size supported by the hardware and
>  	 * that it fits within pagetable and slice limits. */
>  	if (size <= PAGE_SIZE || !is_power_of_2(size))
> --
> 2.48.1

