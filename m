Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C07825BF9E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:55:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXXLP2jHWz3c6r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 18:55:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nvXLTwTu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=21cnbao@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nvXLTwTu;
	dkim-atps=neutral
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXXKp2nblz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 18:54:53 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id sd10so3656796ejc.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 01:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=sc4HrH+dawwbyFY4jxaPYFax97q7PbwtRdCVIa2eWag=;
        b=nvXLTwTum0Zu+Nzwkb/Va5KR7MpZoNKJUWh0AvWe8HdVcr1Grhklhdo1BZW8sba5fw
         BGnTPKQw9TWdIn1AwbWmhqYPWj/FVYt+uu55rzvSXj7gyQEl6nisi0K/8PiKq+G1vate
         OwUz5f2/PwR248iBS39pCnt+cZvqAUi3xnXwI/CPS+xFuJqBAs2z3QcTEXopA/PS8206
         LsKWiJynHncuR2MFh2DVSwmUKzCR6RXBe0hFSksOj2krERKhpYbj6OOLJgFNJt7NSBQ6
         hVqA13u7w8pzq63oY/Yhzl8fszOLZBKNoD8poD5JuUBZFek7tviVQ4tIq4kb5M10FNKT
         s1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=sc4HrH+dawwbyFY4jxaPYFax97q7PbwtRdCVIa2eWag=;
        b=NJi9rZXGil8S3SC6oC9YNfv1O7DPWC+RwmCo2sb8WqH6l8HDJ1+bTN+iCWv+rgYdvp
         Qv2lgoZzgOZ9Nwralr8v91Hqx/jjBuZTKPI8H51rEVzKmwuyogCnFId+Co18Wnb7pi0O
         Z8mznn2l9tP68Q7kQ7axINU5wggGJZoZsfoAJfu+DbaRhmED/3LvKy2aJu6rSvPLtiba
         7/dXFqfLO9n+2wjQO8+NW5oYQqMn2CocroRnPeOGveHPPZzgY+q9o+I/+k+k29t5HgZU
         +mGgbBqw47SRAJdpFr3pJzw0xGoOfNImkDz61Dq/Gkpk3EZRQgREiVKj7GbstsBgSam3
         jTgg==
X-Gm-Message-State: ACrzQf2bmM4UUMHay65knO6sOLXGQSw9KWrT0tYvGFMn+gFhKTDuyvuU
	26b1eck6wb1MQEmdYRf7QVaDc5lSUJLcHxmMWsI=
X-Google-Smtp-Source: AMsMyM5mpmqn+gfhEkasy6u301zqGqQeURhHcxEGpcBIv8VPgxV44BVkZMurDLR6PBxFMgmK/214xxyLA2GRvdonQRQ=
X-Received: by 2002:a17:907:c13:b0:781:d3c2:5015 with SMTP id
 ga19-20020a1709070c1300b00781d3c25015mr4799862ejc.457.1663750486484; Wed, 21
 Sep 2022 01:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220921084302.43631-1-yangyicong@huawei.com> <20220921084302.43631-2-yangyicong@huawei.com>
In-Reply-To: <20220921084302.43631-2-yangyicong@huawei.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 21 Sep 2022 20:54:35 +1200
Message-ID: <CAGsJ_4ydO=CegfrAF=jYmhOffXd7zKaFp_YxhdMgnoNGA8mBQQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] mm/tlbbatch: Introduce arch_tlbbatch_should_defer()
To: Yicong Yang <yangyicong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: wangkefeng.wang@huawei.com, prime.zeng@hisilicon.com, anshuman.khandual@arm.com, linux-doc@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, yangyicong@hisilicon.com, linux-mm@kvack.org, guojian@oppo.com, linux-riscv@lists.infradead.org, will@kernel.org, Anshuman Khandual <khandual@linux.vnet.ibm.com>, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, x86@kernel.org, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, openrisc@lists.librecores.org, darren@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 21, 2022 at 8:45 PM Yicong Yang <yangyicong@huawei.com> wrote:
>
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>
> The entire scheme of deferred TLB flush in reclaim path rests on the
> fact that the cost to refill TLB entries is less than flushing out
> individual entries by sending IPI to remote CPUs. But architecture
> can have different ways to evaluate that. Hence apart from checking
> TTU_BATCH_FLUSH in the TTU flags, rest of the decision should be
> architecture specific.
>
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> [https://lore.kernel.org/linuxppc-dev/20171101101735.2318-2-khandual@linux.vnet.ibm.com/]
> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
> [Rebase and fix incorrect return value type]
> Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---

Reviewed-by: Barry Song <baohua@kernel.org>

>  arch/x86/include/asm/tlbflush.h | 12 ++++++++++++
>  mm/rmap.c                       |  9 +--------
>  2 files changed, 13 insertions(+), 8 deletions(-)
>
> diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
> index cda3118f3b27..8a497d902c16 100644
> --- a/arch/x86/include/asm/tlbflush.h
> +++ b/arch/x86/include/asm/tlbflush.h
> @@ -240,6 +240,18 @@ static inline void flush_tlb_page(struct vm_area_struct *vma, unsigned long a)
>         flush_tlb_mm_range(vma->vm_mm, a, a + PAGE_SIZE, PAGE_SHIFT, false);
>  }
>
> +static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
> +{
> +       bool should_defer = false;
> +
> +       /* If remote CPUs need to be flushed then defer batch the flush */
> +       if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> +               should_defer = true;
> +       put_cpu();
> +
> +       return should_defer;
> +}
> +
>  static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
>  {
>         /*
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 93d5a6f793d2..cd8cf5cb0b01 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -690,17 +690,10 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, bool writable)
>   */
>  static bool should_defer_flush(struct mm_struct *mm, enum ttu_flags flags)
>  {
> -       bool should_defer = false;
> -
>         if (!(flags & TTU_BATCH_FLUSH))
>                 return false;
>
> -       /* If remote CPUs need to be flushed then defer batch the flush */
> -       if (cpumask_any_but(mm_cpumask(mm), get_cpu()) < nr_cpu_ids)
> -               should_defer = true;
> -       put_cpu();
> -
> -       return should_defer;
> +       return arch_tlbbatch_should_defer(mm);
>  }
>
>  /*
> --
> 2.24.0
>
