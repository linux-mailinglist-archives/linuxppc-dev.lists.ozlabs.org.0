Return-Path: <linuxppc-dev+bounces-7502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C74FA7EECE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Apr 2025 22:16:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZWgTb4lDCz2yr8;
	Tue,  8 Apr 2025 06:16:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744056995;
	cv=none; b=Owhcw+XNTR8MfTCN52Roiemn9HheXRhl+DltZtjnlFckNlltV58Q6LNV45Q0BQiEkx4t2rQ744e41HcGP59LZoY7iEYue00uS2269H8XtteYTGzT9DqVsO81PcFPXnHtbw3Y5sdfCLDwSaOIftpfUkpSpps3bpaPcS/Lfm4tUNLm591VJzaYbTd6Ud8Xut9p1AZmRPfKQOoprtCo/SZka/QvBCUb78FD/atJciNu90BqAGMl+VCQDbPqtJrj9eVGqQ1B4Q/EYLFQMjKLdBwi2kvztNoOOi+AVQiQ5hW92Ckb87Mlws49kngxQJbunwmYi3MwRvFqWv9uyGOr6PT6Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744056995; c=relaxed/relaxed;
	bh=320OaCT86enNInbScxL4u2fF7y7/R5XQkYspgIzkt/E=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=bm2AUND2bDs/gib/lq78r+LgSZeuvG1bzi79bT3mMMRWAxkP3EskxL1gYNoKpiD+kxUO5EfmHGC4/Xv1enlKwwMEmdBM6C5DRotfd+YQhIOJHPEjqllvre7Y0EZzwuH3Vqy5nhpYJ8SzVePth82Z8e38TIZWMolZEymxKvxRc1QX9ybben/5LN/T625HKAzYDJn0u3kmF3YXIhl8Ia+Z2FV74oaCkHTm/ByYP4WmyiK9Dr9vfiSwBZoM/dWStaQ9V+QZy7RGHlbE6RzIp7+2+obtMNsSEGsqWkwfIs/OMG4UIYHEBOWGbkCXBHTXjNedQLMNPTQAf12vsAHU7nB2yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wq1Eifox; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Wq1Eifox;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZWgTZ4kgtz2ygm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Apr 2025 06:16:33 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2295d78b433so45616905ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Apr 2025 13:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744056990; x=1744661790; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=320OaCT86enNInbScxL4u2fF7y7/R5XQkYspgIzkt/E=;
        b=Wq1EifoxRkA7/VVrRmzS0HfXyLzqZC3L5xgmRH7DMvTPy3pym+Co1nUFaUPJUgiTz+
         NDvViKpLFIvNFtJ1fN5YqM9Wrq1q4TALvzycJpnf1zyjxpbTatg8Kn5YnnH8liBhJKuq
         mVEYZyxWR19y/b1e8OOA9Y5WShy4nYuBBYdkwXiecsdsPFf/cHTjId41xnUmn6VtnM7Z
         oxAXfIAAuDMqm8V3iis64tgxCattQ8EAwena5wJVAGMFxJzVIfa1ltXklr2iO3m39zLQ
         valcDyIBDVFKW6q1ckpvbZlh+QcsTDLWxl2ugMlWPZFRBnM521a0MdMGizflrcY3jdIR
         qjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744056990; x=1744661790;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=320OaCT86enNInbScxL4u2fF7y7/R5XQkYspgIzkt/E=;
        b=KKDMf/0NYelIEYIX7gYTCk/QljDuUYarjfk746h9xR6u3DLWLyV/UCQZv5JJ6TKmEx
         i9FkXWoXmTKWQE252WmaODVJ43DuSEEAvnYXmRqMGTZl29c5bCb+8SIkDya6Vaj7sVc5
         wS3r2Eqc75TzjyDi6TRUa1BSHUP8j7/YZdNE63RkxwAipn5hAO/hcmWbfG4iZx95c5Dh
         F4uHdFtnno8YNkUou8BAyPIqhmdeZ2WqiW0QEsIfKb6zr4ifgfIfOkd7QPA4J2lRHhKa
         PQD88T/q1ZnQdYzrcv/dw1+f0C5ovproARX9h1ivSx/qGz+Yq44Y5D5OCBYNlX0KlR5P
         PLOg==
X-Forwarded-Encrypted: i=1; AJvYcCUw/YJVm8A4Y4UpppMlYAbdAh41nFeFX8DEhyJwSOCUAZdjyRLtzpp9qKkgnMBymRQ487h6VfCudrjCwO8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzdH63Gv62cUslAtcSSNjlwJB1koUKpbMNpp00Os0fUJKIQrEKG
	257SEifFyn8OKv05pZE9mu+en1IpL07bS9amzG9if6C/6HQ8yjZNrdDxKA==
X-Gm-Gg: ASbGnctEeQRZYHoRPGHHfxU6QkcnbsJbcjqIi6Sfrt7RnHT4DdYzaMF+dysHGNfbAdI
	7dXey6qB7EL4a8WBxFr8toIxszxKysViRujsxQRW+Wc8YUE1z+xk7JSylghWMZyYL0qG9Su4moX
	KrpA869GHczVTQgJezmAVscEjn0PnZariHL8o0loGX8uGRKR1rc2V260bjQdqoqbBqnSRxkzv+p
	KmX5jW3rUqJaYFmv5xvNyUcYRM7FRMOofB97i+888gbZlP0gseYlyFi9dcSn0aRSeTlmdxFjv34
	H44ypvhjNhZOInqDx6lEATbreq/d5otXnoM=
X-Google-Smtp-Source: AGHT+IEsGU7LLCIXUt4rWDBH0S52gNGm8P1IWLeL5I+bcIYwZm9KgUhMTkyxy5p/f9G5vxj+m8SRxA==
X-Received: by 2002:a17:903:3bc6:b0:224:584:6eef with SMTP id d9443c01a7336-22a8a0a3617mr210436045ad.41.1744056990206;
        Mon, 07 Apr 2025 13:16:30 -0700 (PDT)
Received: from dw-tp ([171.76.81.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785ad8besm85108885ad.28.2025.04.07.13.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 13:16:29 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Stefan Berger <stefanb@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: masriniv@in.ibm.com, Hari Bathini <hbathini@linux.ibm.com>, Aboorva Devarajan <aboorvad@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: Re: kexec failing with KVM on Power8 baremetal host
In-Reply-To: <c683fcdc-38e7-4bed-8bfe-dcf6f122da6a@linux.ibm.com>
Date: Tue, 08 Apr 2025 01:06:11 +0530
Message-ID: <8734ejzrv8.fsf@gmail.com>
References: <c683fcdc-38e7-4bed-8bfe-dcf6f122da6a@linux.ibm.com>
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
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MALFORMED_FREEMAIL,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Stefan Berger <stefanb@linux.ibm.com> writes:

> I bisected Linux between 6.13.0 and 6.12.0 due to failing kexec on a 
> Power8 baremetal host on 6.13.0:
>
> 8fec58f503b296af87ffca3898965e3054f2b616 is the first bad commit
> commit 8fec58f503b296af87ffca3898965e3054f2b616
> Author: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Date:   Fri Oct 18 22:59:50 2024 +0530
>
>      book3s64/hash: Add kfence functionality
>
>      Now that linear map functionality of debug_pagealloc is made generic,
>      enable kfence to use this generic infrastructure.
>
>      1. Define kfence related linear map variables.
>         - u8 *linear_map_kf_hash_slots;
>         - unsigned long linear_map_kf_hash_count;
>         - DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
>      2. The linear map size allocated in RMA region is quite small
>         (KFENCE_POOL_SIZE >> PAGE_SHIFT) which is 512 bytes by default.
>      3. kfence pool memory is reserved using memblock_phys_alloc() which has
>         can come from anywhere.
>         (default 255 objects => ((1+255) * 2) << PAGE_SHIFT = 32MB)
>      4. The hash slot information for kfence memory gets added in linear map
>         in hash_linear_map_add_slot() (which also adds for debug_pagealloc).
>
>      Reported-by: Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
>      Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>      Link: 
> https://patch.msgid.link/5c2b61941b344077a2b8654dab46efa0322af3af.1729271995.git.ritesh.list@gmail.com
>
>   arch/powerpc/include/asm/kfence.h     |   5 ---
>   arch/powerpc/mm/book3s64/hash_utils.c | 162 
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
>   2 files changed, 149 insertions(+), 18 deletions(-)
>
>
> Reverting part of this patch by applying the following changes to 6.13.0 
> resolves the issue:

Sorry for the delay in getting back to this, we have been going back and
forth on a few other work priorities. Nevertheless, Aboorva (cc'd)
helped in analyzing & has root caused the reported problem. Let me
summarize the findings. Aboorva, please add if I missed any details in
here:

1. The issue reported on this is not related to the above mentioned
patch. The issue can also be reproduced on v6.12 or older kernel where
we didn't have this series (with CONFIG_KFENCE=y).

2. The issue is happening during kexec_sequence(), i.e.
kexec_copy_flush() -> copy_segments -> copy_page(dest, addr). Note that
the dest address in copy_page() is obtained during kexec load time.

The root cause of the issue is - that the dest address in above
copy_page() function is falling into a kfence region, which is causing
the page fault.

Now, as per the kexec_sequence(), we are not supposed to take a page
fault during that path after the local_paca->data_offset is changed to
some poison value. We do disable the MMU for most other cases except
for Hash on Pseries. That is also the reason why the issue is only seen
on Hash on Pseries and not on Radix. 


On debugging further, we found that kexec on ppc tries to find the
memory region using "for_each_mem_range_rev()" rather than using
"for_each_free_mem_range_reverse()". i.e. 

- Ƒ __locate_mem_hole_top_down
  - Ƒ locate_mem_hole_top_down_ppc64
    - Ƒ arch_kexec_locate_mem_hole
      - Ƒ kexec_add_buffer
        - Ƒ kexec_purgatory_setup_kbuf
          - Ƒ kexec_load_purgatory
            + Ƒ elf64_load


IMO, it should be something like below diff... so that we could avoid using
a region which is in use by someone else e.g. kfence.

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index dc65c1391157..771b7dbaae0b 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -66,7 +66,7 @@ static int __locate_mem_hole_top_down(struct kexec_buf *kbuf,
        phys_addr_t start, end;
        u64 i;
 
-       for_each_mem_range_rev(i, &start, &end) {
+       for_each_free_mem_range_reverse(i, NUMA_NO_NODE, MEMBLOCK_NONE, &start, &end, NULL) {
                /*
                 * memblock uses [start, end) convention while it is
                 * [start, end] here. Fix the off-by-one to have the
@@ -165,7 +165,7 @@ static int __locate_mem_hole_bottom_up(struct kexec_buf *kbuf,
        phys_addr_t start, end;
        u64 i;
 
-       for_each_mem_range(i, &start, &end) {
+       for_each_free_mem_range(i, NUMA_NO_NODE, MEMBLOCK_NONE, &start, &end, NULL) {
                /*
                 * memblock uses [start, end) convention while it is
                 * [start, end] here. Fix the off-by-one to have the


3. In the latest 6.15-rc1 release, it looks like these custom arch
specific functions "__locate_mem_hole_top_down()" etc. has been removed
[1] (For some other reason though).  Aboorva, also verified that the
issue is not seen on v6.15-rc1 anymore. 

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=6e5250eaa665fac681926251a8d7f5f418103399


@Stefan,
Can you give v6.15-rc1 a try to confirm that the issue is indeed fixed
at your end too? For this we need not add any custom changes, v6.15-rc1
with kfence enabled on Hash should not give any issues during kexec.


Next steps: 
- We still need to see how this needs to be fixed in the older stable
  kernels. Can we backport the necessary patches from this series [2] or do
  we need a separate change to backport.

[2]: https://lore.kernel.org/all/20250131113830.925179-5-sourabhjain@linux.ibm.com/


-ritesh




>
>
> diff --git a/arch/powerpc/include/asm/kfence.h 
> b/arch/powerpc/include/asm/kfence.h
> index 1f7cab58ab2c..e7981719313c 100644
> --- a/arch/powerpc/include/asm/kfence.h
> +++ b/arch/powerpc/include/asm/kfence.h
> @@ -10,6 +10,7 @@
>
>   #include <linux/mm.h>
>   #include <asm/pgtable.h>
> +#include <asm/mmu.h>
>
>   #ifdef CONFIG_PPC64_ELF_ABI_V1
>   #define ARCH_FUNC_PREFIX "."
> @@ -25,6 +26,10 @@ static inline void disable_kfence(void)
>
>   static inline bool arch_kfence_init_pool(void)
>   {
> +#ifdef CONFIG_PPC64
> +       if (!radix_enabled())
> +               return false;
> +#endif
>          return !kfence_disabled;
>   }

