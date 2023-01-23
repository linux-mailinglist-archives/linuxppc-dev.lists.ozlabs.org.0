Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 160FB6775B2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 08:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0hkd6Z0wz3cFP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 18:36:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B93OkJvi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=nadav.amit@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=B93OkJvi;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0hjg3LbSz3045
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 18:36:05 +1100 (AEDT)
Received: by mail-wr1-x42f.google.com with SMTP id y1so5383292wru.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jan 2023 23:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wgOELi+0GLLFDRqtM9K/SOPPwlEPk5gkUlBy27WnbHg=;
        b=B93OkJviOA6e8TpHPeqQjlji4hoLV71Kb4swdlcDUj2ruZmkuPLm+wtIcOaMSikxGX
         zGf75x2K1pBgYlohzbaY80LlAsl0apssgjasj69sed7Rcqkz+f35/psiVWCp/ES777M0
         F/ZYCM25CgrWbYi83KDrTCg3KaYpKfVpg7B4CBm+eLPuKj8ufmjPB+NCVDY6vPSVqnLH
         EqaTHJM879e2ZQFQ6cxN0IY8hwwuxguNcZd5sN/P8Uu7XGSZdlaxOA5+ywT76M9yWBXy
         ArCVGU8yTsV597fRPIGL9OSSflkdbWlCSLRPwY4D7FJHb7oPiyXWI4q7zO9ZCGH5Ev6X
         MxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgOELi+0GLLFDRqtM9K/SOPPwlEPk5gkUlBy27WnbHg=;
        b=qDFU2BLeH/zZ3kFjXHdLoS0BqeHOzoR/cpDAAfwHxhUSGhRwQ54Qhley5LWuTYATQh
         pLVWSMWDNOVWYMgmyteVQn8Zt8Ng3wq+cAzNLs9NptUGRl+38KozxmpfwYdfjx+PmRzI
         HIcMy6T7X1WIn5F/EHEZDyX44fTDUdItlR6Co74/pUM4dZT78ygx/5MYDZboqc64I5VJ
         /6muMbRndmTy3r21p9j85mixzwRA4346xti6wr9OsJXSX1f9OtRK6ca+zM6V/j4wfLQE
         7fuQ4w0pcP8UwaWY4B1vMAmideyL5msB4YBL6MoI6OVIM7W/o8cW9695a/7UWN2fL5/z
         eAXQ==
X-Gm-Message-State: AFqh2kqeBz59NDiStGGsBq8VXx7kMUWt200Kwfcs/1gpQLrNqdUhjrmP
	jEalqoQnXdpFvJQ2ugN5Fo8=
X-Google-Smtp-Source: AMrXdXuqSx4yAhQaR73tNlp4h3VYBOLpcs4hjb1mTAIQerCXFQaQnHcLGQeXEz6WGulurruLqj7JGg==
X-Received: by 2002:a05:6000:1708:b0:2bd:daf1:9e4c with SMTP id n8-20020a056000170800b002bddaf19e4cmr22685079wrc.43.1674459358027;
        Sun, 22 Jan 2023 23:35:58 -0800 (PST)
Received: from [192.168.86.94] ([77.137.66.37])
        by smtp.gmail.com with ESMTPSA id e17-20020adfe7d1000000b0024cb961b6aesm4138922wrn.104.2023.01.22.23.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jan 2023 23:35:57 -0800 (PST)
Message-ID: <ee3844c0-b342-edc6-77cf-4cdc78e30a18@gmail.com>
Date: Mon, 23 Jan 2023 09:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.0
Subject: Re: [PATCH v6 2/5] lazy tlb: allow lazy tlb mm refcounting to be
 configurable
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20230118080011.2258375-1-npiggin@gmail.com>
 <20230118080011.2258375-3-npiggin@gmail.com>
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <20230118080011.2258375-3-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch <linux-arch@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Andy Lutomirski <luto@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/18/23 10:00 AM, Nicholas Piggin wrote:
> Add CONFIG_MMU_TLB_REFCOUNT which enables refcounting of the lazy tlb mm
> when it is context switched. This can be disabled by architectures that
> don't require this refcounting if they clean up lazy tlb mms when the
> last refcount is dropped. Currently this is always enabled, which is
> what existing code does, so the patch is effectively a no-op.
> 
> Rename rq->prev_mm to rq->prev_lazy_mm, because that's what it is.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   Documentation/mm/active_mm.rst |  6 ++++++
>   arch/Kconfig                   | 17 +++++++++++++++++
>   include/linux/sched/mm.h       | 18 +++++++++++++++---
>   kernel/sched/core.c            | 22 ++++++++++++++++++----
>   kernel/sched/sched.h           |  4 +++-
>   5 files changed, 59 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/mm/active_mm.rst b/Documentation/mm/active_mm.rst
> index 6f8269c284ed..2b0d08332400 100644
> --- a/Documentation/mm/active_mm.rst
> +++ b/Documentation/mm/active_mm.rst
> @@ -4,6 +4,12 @@
>   Active MM
>   =========
>   
> +Note, the mm_count refcount may no longer include the "lazy" users
> +(running tasks with ->active_mm == mm && ->mm == NULL) on kernels
> +with CONFIG_MMU_LAZY_TLB_REFCOUNT=n. Taking and releasing these lazy
> +references must be done with mmgrab_lazy_tlb() and mmdrop_lazy_tlb()
> +helpers which abstracts this config option.
> +
>   ::
>   
>    List:       linux-kernel
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 12e3ddabac9d..b07d36f08fea 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -465,6 +465,23 @@ config ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>   	  irqs disabled over activate_mm. Architectures that do IPI based TLB
>   	  shootdowns should enable this.
>   
> +# Use normal mm refcounting for MMU_LAZY_TLB kernel thread references.
> +# MMU_LAZY_TLB_REFCOUNT=n can improve the scalability of context switching
> +# to/from kernel threads when the same mm is running on a lot of CPUs (a large
> +# multi-threaded application), by reducing contention on the mm refcount.
> +#
> +# This can be disabled if the architecture ensures no CPUs are using an mm as a
> +# "lazy tlb" beyond its final refcount (i.e., by the time __mmdrop frees the mm
> +# or its kernel page tables). This could be arranged by arch_exit_mmap(), or
> +# final exit(2) TLB flush, for example.
> +#
> +# To implement this, an arch *must*:
> +# Ensure the _lazy_tlb variants of mmgrab/mmdrop are used when dropping the
> +# lazy reference of a kthread's ->active_mm (non-arch code has been converted
> +# already).
> +config MMU_LAZY_TLB_REFCOUNT
> +	def_bool y
> +
>   config ARCH_HAVE_NMI_SAFE_CMPXCHG
>   	bool
>   
> diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
> index 5376caf6fcf3..68bbe8d90c2e 100644
> --- a/include/linux/sched/mm.h
> +++ b/include/linux/sched/mm.h
> @@ -82,17 +82,29 @@ static inline void mmdrop_sched(struct mm_struct *mm)
>   /* Helpers for lazy TLB mm refcounting */
>   static inline void mmgrab_lazy_tlb(struct mm_struct *mm)
>   {
> -	mmgrab(mm);
> +	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
> +		mmgrab(mm);
>   }
>   
>   static inline void mmdrop_lazy_tlb(struct mm_struct *mm)
>   {
> -	mmdrop(mm);
> +	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT)) {
> +		mmdrop(mm);
> +	} else {
> +		/*
> +		 * mmdrop_lazy_tlb must provide a full memory barrier, see the
> +		 * membarrier comment finish_task_switch which relies on this.
> +		 */
> +		smp_mb();
> +	}
>   }

Considering the fact that mmdrop_lazy_tlb() replaced mmdrop() in various 
locations in which smp_mb() was not required, this comment might be 
confusing. IOW, for the cases in most cases where mmdrop_lazy_tlb() 
replaced mmdrop(), this comment was irrelevant, and therefore it now 
becomes confusing.

I am not sure the include the smp_mb() here instead of "open-coding" it 
helps.

>   
>   static inline void mmdrop_lazy_tlb_sched(struct mm_struct *mm)
>   {
> -	mmdrop_sched(mm);
> +	if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_REFCOUNT))
> +		mmdrop_sched(mm);
> +	else
> +		smp_mb(); // see above
>   }

Wrong style of comment.
