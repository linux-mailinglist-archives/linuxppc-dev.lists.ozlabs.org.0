Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDE561F0A6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 11:30:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5SDx4XM8z3cJd
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 21:30:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XLupANfJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XLupANfJ;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5SCz4b7mz301Z
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 21:30:05 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id v4-20020a17090a088400b00212cb0ed97eso9855796pjc.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 02:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4A0KPNMqMai1UshvVHWyeS+A8gxY3O1mK2zuPWTU+IQ=;
        b=XLupANfJYmzGcElVva4bYxg6Bld45wWuNloNkaq8FcQocY4g6/NsbERrf9821akoGh
         AjTn3fJ9Ns+pgoNX+BVkMRfyiFCLPO+jrmBj8CDrzcbtdhGXBEn3Yfy0FNhW46rAjZ16
         cglpawfaviHp2xy22H5rJd5BNZd7/NVZndFf4ibCRY1ZO65IY8hDPSlnshPFnsHtTxuu
         DpgDB8cbfUl60clY1H8Sc2NJBOj46+R0nsEXEdvycgxNzoTZ7LcbmmqqIpDfl/PjL4SF
         9GK6lKrvV2ALmoSZDmdC1fPI69rKHSmxUAj60H4CtJJ6jn5oejz03wzbstVMz133x7Oz
         6Dug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4A0KPNMqMai1UshvVHWyeS+A8gxY3O1mK2zuPWTU+IQ=;
        b=ZrxxqOSqLqHja3tJYuLFDjSUtxuWEw9vE8atLL8deVoMzoE/tyUzDwo1xbaLyptdSX
         T8O/+b1EOvQGVbeK/HUYEtXpU2QAZ7cYoH6qWBZwa+GoNXixLfI1PgVWiT9lnQLxSctu
         sm5I6ij739eo8rgsv2PZUcx6prnw7KQ3d2LbzRV7AhDCnSsaErDVvQ/Nri1yaVJZwSH9
         Al7Qq/t/nd/2Huf3k7xR/kXnyo3Yr8qet96pTkR2OEUkbt8/OCZ7wFUc1VqZSf3wi9CU
         xBpuTS/UpxaB7a6MOapoeYfYnR1lRytJmTSDwMCoI4WzrN+fJ+HKx2UUflLizcllhGQh
         d4aQ==
X-Gm-Message-State: ACrzQf0PBJOFm5vuTrEXA3K9j1UvkUu3iCvaW+GGp6NfcG5ljaiRU43D
	b6srRILT4eNlVLQ81UgMjDg=
X-Google-Smtp-Source: AMsMyM52J+jJud1tyBw0pkC6bA4W1uzsB55jBsblX+EseZE8BjdjptTlXl90wfQKGCx3OZyLq11pSQ==
X-Received: by 2002:a17:90a:a608:b0:213:f2a6:d90a with SMTP id c8-20020a17090aa60800b00213f2a6d90amr39897910pjq.93.1667817002135;
        Mon, 07 Nov 2022 02:30:02 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id ik12-20020a170902ab0c00b00187197c499asm4691665plb.164.2022.11.07.02.29.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:30:01 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 20:29:56 +1000
Message-Id: <CO5ZS71V6MJL.1IWT63LG32HL9@bobo>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
Subject: Re: [PATCH 3/5] powerpc/kprobes: Use preempt_enable() rather than
 the no_resched variant
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
 <72639f75fe66f931ec8c2165276ffbfb0fe1006f.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <72639f75fe66f931ec8c2165276ffbfb0fe1006f.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 21, 2022 at 3:28 AM AEST, Naveen N. Rao wrote:
> preempt_enable_no_resched() is just the same as preempt_enable() when we
> are in a irqs disabled context. kprobe_handler() and the post/fault
> handlers are all called with irqs disabled. As such, convert those to
> just use preempt_enable().

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/kprobes.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index 88f42de681e1f8..86ca5a61ea9afb 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -369,7 +369,7 @@ int kprobe_handler(struct pt_regs *regs)
> =20
>  			if (ret > 0) {
>  				restore_previous_kprobe(kcb);
> -				preempt_enable_no_resched();
> +				preempt_enable();
>  				return 1;
>  			}
>  		}
> @@ -382,7 +382,7 @@ int kprobe_handler(struct pt_regs *regs)
>  	if (p->pre_handler && p->pre_handler(p, regs)) {
>  		/* handler changed execution path, so skip ss setup */
>  		reset_current_kprobe();
> -		preempt_enable_no_resched();
> +		preempt_enable();
>  		return 1;
>  	}
> =20
> @@ -395,7 +395,7 @@ int kprobe_handler(struct pt_regs *regs)
> =20
>  			kcb->kprobe_status =3D KPROBE_HIT_SSDONE;
>  			reset_current_kprobe();
> -			preempt_enable_no_resched();
> +			preempt_enable();
>  			return 1;
>  		}
>  	}
> @@ -404,7 +404,7 @@ int kprobe_handler(struct pt_regs *regs)
>  	return 1;
> =20
>  no_kprobe:
> -	preempt_enable_no_resched();
> +	preempt_enable();
>  	return ret;
>  }
>  NOKPROBE_SYMBOL(kprobe_handler);
> @@ -490,7 +490,7 @@ int kprobe_post_handler(struct pt_regs *regs)
>  	}
>  	reset_current_kprobe();
>  out:
> -	preempt_enable_no_resched();
> +	preempt_enable();
> =20
>  	/*
>  	 * if somebody else is singlestepping across a probe point, msr
> @@ -529,7 +529,7 @@ int kprobe_fault_handler(struct pt_regs *regs, int tr=
apnr)
>  			restore_previous_kprobe(kcb);
>  		else
>  			reset_current_kprobe();
> -		preempt_enable_no_resched();
> +		preempt_enable();
>  		break;
>  	case KPROBE_HIT_ACTIVE:
>  	case KPROBE_HIT_SSDONE:
> --=20
> 2.38.0

