Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE770868A26
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 08:49:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=htlqT1yO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkV4D3Px4z3vZr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 18:49:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=htlqT1yO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=liusong@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkV3V0xNCz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 18:48:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1709020111; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=ANqhyhYFXNbDTvGM7IZr9p+VwuyJreRc2hLrirn5IY4=;
	b=htlqT1yO5e5cMacS6j9kou8nY4UoeAvtcV3VARjJ5oTTYY9ao0TqJXb9ab4518egq0UkvsB6bE7JjXZSD+IB5YBhRC4DAKdj6ktHGvgm9XdRNJm87wPo1XFvYf6aOBV4NL3Zcyvd2EONyNWKviCGBoTFfXnpDxogJbHJ9PbSVxg=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R421e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046059;MF=liusong@linux.alibaba.com;NM=1;PH=DS;RN=15;SR=0;TI=SMTPD_---0W1M4M.M_1709020108;
Received: from 30.178.80.107(mailfrom:liusong@linux.alibaba.com fp:SMTPD_---0W1M4M.M_1709020108)
          by smtp.aliyun-inc.com;
          Tue, 27 Feb 2024 15:48:29 +0800
Message-ID: <2c1d0ece-a781-4bf7-89dd-cea428842d05@linux.alibaba.com>
Date: Tue, 27 Feb 2024 15:48:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv10 3/4] genirq: Avoid summation loops for /proc/interrupts
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 tglx@linutronix.de, akpm@linux-foundation.org, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
References: <20240226020939.45264-1-yaoma@linux.alibaba.com>
 <20240226020939.45264-4-yaoma@linux.alibaba.com>
From: Liu Song <liusong@linux.alibaba.com>
In-Reply-To: <20240226020939.45264-4-yaoma@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


在 2024/2/26 10:09, Bitao Hu 写道:
> We could use the irq_desc::tot_count member to avoid the summation
> loop for interrupts which are not marked as 'PER_CPU' interrupts in
> 'show_interrupts'. This could reduce the time overhead of reading
> /proc/interrupts.
>
> Originally-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Bitao Hu <yaoma@linux.alibaba.com>
> ---
>   include/linux/irqdesc.h | 2 ++
>   kernel/irq/irqdesc.c    | 2 +-
>   kernel/irq/proc.c       | 9 +++++++--
>   3 files changed, 10 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
> index 2912b1998670..1ee96d7232b4 100644
> --- a/include/linux/irqdesc.h
> +++ b/include/linux/irqdesc.h
> @@ -121,6 +121,8 @@ static inline void irq_unlock_sparse(void) { }
>   extern struct irq_desc irq_desc[NR_IRQS];
>   #endif
>   
> +extern bool irq_is_nmi(struct irq_desc *desc);
> +
>   static inline unsigned int irq_desc_kstat_cpu(struct irq_desc *desc,
>   					      unsigned int cpu)
>   {
> diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
> index 9cd17080b2d8..56a767957a9d 100644
> --- a/kernel/irq/irqdesc.c
> +++ b/kernel/irq/irqdesc.c
> @@ -955,7 +955,7 @@ unsigned int kstat_irqs_cpu(unsigned int irq, int cpu)
>   	return desc && desc->kstat_irqs ? per_cpu(desc->kstat_irqs->cnt, cpu) : 0;
>   }
>   
> -static bool irq_is_nmi(struct irq_desc *desc)
> +bool irq_is_nmi(struct irq_desc *desc)
>   {
>   	return desc->istate & IRQS_NMI;
>   }
> diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
> index 6954e0a02047..b3b1b93f0410 100644
> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -489,8 +489,13 @@ int show_interrupts(struct seq_file *p, void *v)
>   		goto outsparse;
>   
>   	if (desc->kstat_irqs) {
> -		for_each_online_cpu(j)
> -			any_count |= data_race(per_cpu(desc->kstat_irqs->cnt, j));
> +		if (!irq_settings_is_per_cpu_devid(desc) &&
> +		    !irq_settings_is_per_cpu(desc) &&
> +		    !irq_is_nmi(desc))
> +			any_count = data_race(desc->tot_count);
> +		else
> +			for_each_online_cpu(j)
> +				any_count |= data_race(per_cpu(desc->kstat_irqs->cnt, j));
>   	}
>   
>   	if ((!desc->action || irq_desc_is_chained(desc)) && !any_count)

The modification borrows from the implementation of |kstat_irqs. Looks 
good.|

|Reviewed-by: Liu Song <liusong@linux.alibaba.com> |

||

