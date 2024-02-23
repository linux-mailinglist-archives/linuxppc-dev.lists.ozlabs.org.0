Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B66860B58
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 08:30:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=birTqkb6;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9ktyOyU9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Th1rH3QW1z3vYY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 18:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=birTqkb6;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=9ktyOyU9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Th1qW0lmDz3c1g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 18:29:43 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708673377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HaA9fQcqVYSuNg3wkRSEZWU32RdGNi0Gngw0SdVL3to=;
	b=birTqkb6S3mj0vdYA18Ur/BPk8EwAlE45/GWI5qRKle3zsNaENUwBMIPxhy/wf1e2BmKaL
	Al1pDVkOEK0bGEhW+VQFvi4D/Yp5kIRtjOBiHOC7qed8hpNgbjLEClDkbg4jADpSLFshaP
	w2/IwyY+MRrPD/Vf2HCnqkOjLgrwr54+QJ4Gj8OpsnsTvoCxP/cYJP1NVCscr0xJaPTbMu
	6/QahWITN6d/C1GJ79JcTJAglZQSqpYxaDdXFMcUlZuMmTqutTUYy/47iOxfjWzJ4slKIi
	p6jeNKGJuyB6RzhCeSxqe2xUi4HESXponoDtpONSWF1bwOJEG7Eu7vxP3MombQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708673377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HaA9fQcqVYSuNg3wkRSEZWU32RdGNi0Gngw0SdVL3to=;
	b=9ktyOyU9vD7z+zHFv9WQ2D0q27MFF7CdOuldZ0azOdzfOrY5tHMJiYiRNDJd+k5uPPn9m6
	pXpzIcrgwGPoA5CA==
To: Bitao Hu <yaoma@linux.alibaba.com>, dianders@chromium.org,
 akpm@linux-foundation.org, liusong@linux.alibaba.com, pmladek@suse.com,
 kernelfans@gmail.com, deller@gmx.de, npiggin@gmail.com,
 tsbogend@alpha.franken.de, James.Bottomley@HansenPartnership.com,
 jan.kiszka@siemens.com
Subject: Re: [PATCHv9 2/3] irq: use a struct for the kstat_irqs in the
 interrupt descriptor
In-Reply-To: <3f4b7dbe-93c1-4cb0-8233-18e8432409f8@linux.alibaba.com>
References: <20240222093420.13956-1-yaoma@linux.alibaba.com>
 <20240222093420.13956-3-yaoma@linux.alibaba.com> <87jzmwfxak.ffs@tglx>
 <3f4b7dbe-93c1-4cb0-8233-18e8432409f8@linux.alibaba.com>
Date: Fri, 23 Feb 2024 08:29:36 +0100
Message-ID: <87frxjeizj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 23 2024 at 15:18, Bitao Hu wrote:
> On 2024/2/22 21:22, Thomas Gleixner wrote:
>>> -	if (desc->kstat_irqs) {
>>> -		for_each_online_cpu(j)
>>> -			any_count |= data_race(*per_cpu_ptr(desc->kstat_irqs, j));
>>> -	}
>>> +	if (desc->kstat_irqs)
>>> +		any_count = data_race(desc->tot_count);
>> 
>> This is an unrelated change and needs to be split out into a separate
>> patch with a proper changelog which explains why this is equivalent.
>> 
>
> Alright, I will remove this change witch is not related to the purpose
> of this patch.
>
> I guess that the purpose of suggesting this change in your V1 response
> was to speedup the 'show_interrupts'. However, after reviewing the
> usage of 'desc->tot_count' in 'unsigned int kstat_irqs(unsigned int 
> irq)', I think the change might be as follows:
>
> diff --git a/kernel/irq/proc.c b/kernel/irq/proc.c
> index 623b8136e9af..53b8d6edd7ac 100644
> --- a/kernel/irq/proc.c
> +++ b/kernel/irq/proc.c
> @@ -489,8 +489,13 @@ int show_interrupts(struct seq_file *p, void *v)
>                  goto outsparse;
>
>          if (desc->kstat_irqs) {
> -               for_each_online_cpu(j)
> -                       any_count |= 
> data_race(per_cpu(desc->kstat_irqs->cnt, j));
> +               if (!irq_settings_is_per_cpu_devid(desc) &&
> +                   !irq_settings_is_per_cpu(desc) &&
> +                   !irq_is_nmi(desc))
> +                       any_count = data_race(desc->tot_count);
> +               else
> +                       for_each_online_cpu(j)
> +                               any_count |= 
> data_race(per_cpu(desc->kstat_irqs->cnt, j));
>          }
>
>          if ((!desc->action || irq_desc_is_chained(desc)) && !any_count)
>
> Is my idea correct?

Yes.
