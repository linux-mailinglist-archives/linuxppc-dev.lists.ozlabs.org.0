Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CF43165D9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 12:59:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbJGW5mmlzDvYB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 22:59:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=THJK4iLS; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbHy34qvvzDspn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 22:45:29 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id z7so1059402plk.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 03:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=RfDhu/uL/77zJ3oJ69eDcS8fMUfapdMpkyxYxqSUWOM=;
 b=THJK4iLSaQwaGdWBh1kzXSPduZZa/a7SxS/VUsGKLdE78kyplTyQhGIpvwwuhk4uqr
 M0q7Kx0fhPw4VwKtreXT2E/AVLOoN4QE4JUa40lk8h/tcVMGWZ+TPtnDECQWKXEJPPHM
 GEHGNl2A6dGTmVrLPfn3OstEW2mC8xcIGrWR6kTnJ0C81VJH/7xv/bVTe++amP0F7244
 BVO99PSo6+Julj3wN56rDwoP0SZKhlnkOS3Vqt+7Ohvr9AT3eTJL+TyM9sb2jYJsmTpH
 5re0reVNqpb0cC3Uuk5iJD6Q2L8i+cqSX2+R7+/FhQOQrVMq9Lj0mPzcSVmonHXxki8/
 sXug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RfDhu/uL/77zJ3oJ69eDcS8fMUfapdMpkyxYxqSUWOM=;
 b=uPlVgonRb7PeR3tGhKtjnIo/t1k43TwqgK3efnr7FrwWtcdz6PXhofwdmgVyjj6Elo
 25O9vs0Qs+z59Zk2h/Ras1F1b5Ax2xFzS8BJhRC300ASJOVbv63y/QcneqUrOn51BLxw
 BAT2ur0PB2FW4AVRudSt1UIuHP/LcW4wddRqoJSjwAv2Iq69KnN6VJt7Ekq5M0gtxbP/
 t1TTtRV9MAJFIpDw0FB3EYB39NICpwFx9tcCFcJ2OZTCRN44OykjzMUJCZjTwgTgiQHH
 XurdXhLclsuX2G7rZeK/h5SJRow/RdDSUgDJPpg5dMmsxVtUmTl/0zUVK9BKWzWth/sG
 1yTQ==
X-Gm-Message-State: AOAM530+uW1IVd7uj/aT46qaxgpkll9e8i501JUCbwQFlxbptBL7E4gw
 Qz48BnxEHWP4codH4mn3TZQ=
X-Google-Smtp-Source: ABdhPJylJ+ZUo+vlSZf0Tsvc5ZIMtjLGtViXg2bHCy43PwNlxihqGrmWeYjJx/UitUj0gIu/kXGA6w==
X-Received: by 2002:a17:90a:c798:: with SMTP id
 gn24mr2767255pjb.161.1612957520871; 
 Wed, 10 Feb 2021 03:45:20 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id u18sm2000287pjn.18.2021.02.10.03.45.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 03:45:20 -0800 (PST)
Date: Wed, 10 Feb 2021 21:45:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: interrupt_exit_kernel_prepare() on booke/32 has a useless 'mfmsr'
 and two 'wrteei 0'
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <f143d4a9-bb8f-82d6-8b17-c39aff486caa@csgroup.eu>
In-Reply-To: <f143d4a9-bb8f-82d6-8b17-c39aff486caa@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612956047.1868npztxj.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 10, 2021 7:21 pm:
> 44x/bamboo_defconfig
>=20
> For the mfmsr, that's because mfmsr is defined as 'asm volatile'. Is that=
 correct ? Reading MSR=20
> doesn't have any side effects as far as I know, should we remove the vola=
tile ?

Well I'm not really sure. It depends on the MSR value, so it must not=20
assume it's unchanging.

If you just have asm ("mfmsr %0" : "=3Dr"(msr)) then that's wrong because=20
it will omit the second mfmsr in a mfmsr() ; mtmsr() ; mfmsr() sequence.

Adding a "memory" clobber there makes gcc produce the second mfmsr, but=20
I don't know if that's really the right thing to do.

>=20
> For the wrteei, that's because we are calling __hard_EE_RI_disable() afte=
r local_irq_save(). On=20
> booke those two fonctions do exactly the same because RI doesn't exist. C=
ould we replace that by a=20
> __hard_RI_disable() that would be a nop on booke ?

Not on 64-bit because local_irq_disable() doesn't disable EE there.
You could have something like __hard_EE_RI_disable_irqoff() that is to=20
be called only in irq disabled region. But is that just adding too much=20
complexity to try to keep 32 and 64 bit unified?

Maybe just making different code paths for 32 and 64 would be best.=20
32-bit seems fairly simple

	if (!arch_irq_disabled_regs(regs)) {
                /* Returning to a kernel context with local irqs enabled. *=
/
                WARN_ON_ONCE(!(regs->msr & MSR_EE));

       		local_irq_disable();
                if (IS_ENABLED(CONFIG_PREEMPT)) {
                        /* Return to preemptible kernel context */
                        if (unlikely(*ti_flagsp & _TIF_NEED_RESCHED)) {
                                if (preempt_count() =3D=3D 0)
                                        preempt_schedule_irq();
                        }
                }
		trace_hardirqs_on();
		__hard_RI_disable();
        } else {
		__hard_EE_RI_disable();
	}

You could get rid of that entirely if no preempt or irq tracing and just
have __hard_EE_RI_disable even AFAIKS.

Thanks,
Nick
