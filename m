Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6776261F011
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 11:15:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N5RvB1qlkz3cKL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 21:15:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fHkV4u2F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fHkV4u2F;
	dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5RtC6wYwz3bb0
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 21:14:42 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id g24so10639494plq.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Nov 2022 02:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JohleVQNWRfXYYN5Jk2sz8FM2qGTpv3ppkX2Ej3J31Y=;
        b=fHkV4u2FKXlxvAQ76zV0a5VCZ9ohMx6yYnnnUWEXo6sJI4hFnJ0zscGYQqSGERPu9/
         TY/5O8ardEpNbDSW4UD49keQN7Id0YGeDuBeZ9oCK53k3/BA+zds/hVBxS176XzUaVrM
         Ljmiz12r1yuCdKj0MX2S92ONA9XPfvg1GEmYAVCNZB1WLXxUFlx7aEs9P4FH5DuvbXOQ
         lZw8YZZMmHiORrhwfEsCU5wmQiljQVYlpCA5bEOx+xpKp+GCBnntOqA2B2C2havzKod3
         d98q2wFlY01DZXMhoRLICgdeU0Aly5q/1D8gERurQ1tndnNwAVzEOaBrChezKClxqJMR
         kQIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JohleVQNWRfXYYN5Jk2sz8FM2qGTpv3ppkX2Ej3J31Y=;
        b=djawKKCHDp8kZrwgW/+XchU4xRbyfGzJUzeqFE/mJvqhUZ7ius6Us1/76oNYAlEvoL
         vx/Y65nvvdlegcuwg3tcu0BnkJvk/pxrxbH55FbJi8Eq/Qpmb5qsWd2RLnkaw/zhVXOJ
         hwarySGXUc2s9WF24ftu4ubWq/NnL1yijv6gMGoirU0N1opCEL02Hm7xHo54iq6SGbf3
         GkDwFGnHluEVjhPC7+7jmaBYXuYbbaxc0AvwKNfrJMgLkdsP8GEfJyj3dJFMQCTXbr1n
         PAL22oT2DuzP3g6kXH8ZICcQLAm4KJz/MHzpI9B4sHuk3xS8KkUGP1OgM/iLFHic7iZg
         qcSA==
X-Gm-Message-State: ACrzQf0o96pMaFjSrA0xr+4rrUDyr6yl1IFSNOqDhu7w/PxAHNw/pwgn
	6Phdm5gIZLWHfrZ1qIlp6pE=
X-Google-Smtp-Source: AMsMyM7QAusmQqq7QfhJqU+vxQz7m39Wnxbt1uth5/Qg7IbS66Bsyp2fwzBda5cE5s62CdJ2KxOmlw==
X-Received: by 2002:a17:90b:38cd:b0:214:184f:4007 with SMTP id nn13-20020a17090b38cd00b00214184f4007mr32698377pjb.82.1667816078794;
        Mon, 07 Nov 2022 02:14:38 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id im23-20020a170902bb1700b0017c37a5a2fdsm4559435plb.216.2022.11.07.02.14.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 02:14:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 07 Nov 2022 20:14:32 +1000
Message-Id: <CO5ZGEJVLRZ7.238O5NMW5P1B2@bobo>
Subject: Re: [PATCH 1/5] powerpc/kprobes: Remove preempt disable around call
 to get_kprobe() in arch_prepare_kprobe()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <cover.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
 <1043d06a0affed83a4a46dd29466e72820ee215d.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
In-Reply-To: <1043d06a0affed83a4a46dd29466e72820ee215d.1666262278.git.naveen.n.rao@linux.vnet.ibm.com>
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
> arch_prepare_kprobe() is called from register_kprobe() via
> prepare_kprobe(), or through register_aggr_kprobe(), both with the
> kprobe_mutex held. Per the comment for get_kprobe():
>   /*
>    * This routine is called either:
>    *	- under the 'kprobe_mutex' - during kprobe_[un]register().
>    *				OR
>    *	- with preemption disabled - from architecture specific code.
>    */

That comment should read [un]register_kprobe(), right?

>
> As such, there is no need to disable preemption around the call to
> get_kprobe(). Drop the same.

And prepare_kprobe() and register_aggr_kprobe() are both called with
kprobe_mutex held so you rely on the same protection. This seems to
fix a lost-resched bug with preempt kernels too.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Reported-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/kprobes.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.=
c
> index bd7b1a03545948..88f42de681e1f8 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -158,9 +158,7 @@ int arch_prepare_kprobe(struct kprobe *p)
>  		printk("Cannot register a kprobe on the second word of prefixed instru=
ction\n");
>  		ret =3D -EINVAL;
>  	}
> -	preempt_disable();
>  	prev =3D get_kprobe(p->addr - 1);
> -	preempt_enable_no_resched();
> =20
>  	/*
>  	 * When prev is a ftrace-based kprobe, we don't have an insn, and it
> --=20
> 2.38.0

