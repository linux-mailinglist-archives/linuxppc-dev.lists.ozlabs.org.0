Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6FA9FE92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 11:35:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JLFl07ydzDr7g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:35:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="G57TuQr0"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JLCj59ZczDqWN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 19:33:53 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id m9so969136pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 02:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=jRC0AdFddS5YFGo+OnsblGkBQurknLKLMo9EImn0kQg=;
 b=G57TuQr0FfUPmLQh1AKnRnpsxTvQZCYg2lT9+z6aX7pZRxfvKeBi/ueyMiiJ/T2FK7
 blBVX+EN3nMTxiAA1GUgeq3UvEjXl/IQHHHnT5j41TXEvl7vmBwhNUHAzyLUm9dpIgsu
 SNr7RWstIS0bwpzPUrcBGCWFauonUGYyI0ILUeJXwhjLmmswsb/83rAEtmu6gRKdJR04
 jwBtMTKe1ouIlncV+4UOTSPDwyFnZcbuSQJPPdGtuyOELp72UL+ozF3WXv6cMWQfutA6
 2hmD1HzwQ6pSk7VliB+s1xmWto5wbzxaeClLaem95vXXK32Uo8mK7fod8iFvpaq6qZtl
 cx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=jRC0AdFddS5YFGo+OnsblGkBQurknLKLMo9EImn0kQg=;
 b=n7onQTngbF1lDB8EblNaiPbQ2zeNf3ZM0P/8fE6yNNffCWXjKsvp4vuyPAU5oPdYqC
 6Mv17c56c6lTxP7gsP2xocOOCumuiydH5FA5k5VDXiGlHrUZ2KtADBDuWX9E7CzKh+RR
 7pblCN21S2zNiL3VJTHyveSdhcSuTj/Xy4j3cArdnj4HNoclw5hLVmt5Pt9HJ1QZ3vOo
 w2JFSbPLG4NN/472qB0GrW0vUZj6EIFoWI6c235YwhNnYfiT74V8fKU+XhWMNCa3O2Sk
 FJnCRHmc0f0/bWgpHzAouFIQw2UtwUnpQLgpNS2L8XwRdiokta2gIpdNer6t27xwK/61
 wxyA==
X-Gm-Message-State: APjAAAUOLiEdsTuemnWm6muB1bmOBF/SJRLN6xQjJZjiw67VLpDDrwy4
 jYVM5QL1xzhEX58VZx7XGPl4ZXT1
X-Google-Smtp-Source: APXvYqzIUb1nF2M5U9jSrNloik/Kp0unuZn5oVbjk3FpUIVHBoXburuwQlk6oCusdeF1NstLdQKBCw==
X-Received: by 2002:a17:902:fe01:: with SMTP id
 g1mr2165102plj.154.1566984830251; 
 Wed, 28 Aug 2019 02:33:50 -0700 (PDT)
Received: from localhost (14-202-91-55.tpgi.com.au. [14.202.91.55])
 by smtp.gmail.com with ESMTPSA id 5sm1730197pgh.93.2019.08.28.02.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 02:33:49 -0700 (PDT)
Date: Wed, 28 Aug 2019 19:32:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 3/4] powerpc/64: system call remove non-volatile GPR
 save optimisation
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190827135548.21457-1-npiggin@gmail.com>
 <20190827135548.21457-4-npiggin@gmail.com>
 <3f91c62a-6d77-d34c-9477-3077afa5f4e8@c-s.fr>
In-Reply-To: <3f91c62a-6d77-d34c-9477-3077afa5f4e8@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566984031.5fm67bk15y.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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

Christophe Leroy's on August 28, 2019 7:02 pm:
>=20
>=20
> Le 27/08/2019 =C3=A0 15:55, Nicholas Piggin a =C3=A9crit=C2=A0:
>> powerpc has an optimisation where interrupts avoid saving the
>> non-volatile (or callee saved) registers to the interrupt stack frame if
>> they are not required.
>>=20
>> Two problems with this are that an interrupt does not always know
>> whether it will need non-volatiles; and if it does need them, they can
>> only be saved from the entry-scoped asm code (because we don't control
>> what the C compiler does with these registers).
>>=20
>> system calls are the most difficult: some system calls always require
>> all registers (e.g., fork, to copy regs into the child).  Sometimes
>> registers are only required under certain conditions (e.g., tracing,
>> signal delivery). These cases require ugly logic in the call chains
>> (e.g., ppc_fork), and require a lot of logic to be implemented in asm.
>=20
> Do you really find it ugly to just call function nvgprs() before calling=20
> sys_fork() ? I guess there are things a lot uglier.

That's not the ugly part, the ugly part is trashing the link register
and then branching directly to where it was supposed to return, which
is bad for any CPU which has a return predictor so we try to eliminate
it from the ppc64 kernel.

>> So remove the optimisation for system calls, and always save NVGPRs on
>> entry. Modern high performance CPUs are not so sensitive, because the
>> stores are dense in cache and can be hidden by other expensive work in
>> the syscall path -- the null syscall selftests benchmark on POWER9 is
>> not slowed (124.40ns before and 123.64ns after, i.e., within the noise).
>=20
> I did the test on PPC32:
>=20
> On an 885, null_syscall reports 2227ns (132MHz)
> If saving non-volatile regs, it goes to 2419, ie +8.6%
>=20
> On an 8321, null_syscall reports 1021ns (333MHz)
> If saving non-volatile regs, it goes to 1100, ie +7.7%
>=20
> So unless going to C compensates this degradation, I guess it is not=20
> worth it on PPC32.

Yeah that's unfortunate. It is a good optimization for small cores.

I doubt going to C would help for PPC32, probably be even slower.

>>  =20
>> -/* Save non-volatile GPRs, if not already saved. */
>> -_GLOBAL(save_nvgprs)
>> -	ld	r11,_TRAP(r1)
>> -	andi.	r0,r11,1
>> -	beqlr-
>> -	SAVE_NVGPRS(r1)
>> -	clrrdi	r0,r11,1
>> -	std	r0,_TRAP(r1)
>> -	blr
>> -_ASM_NOKPROBE_SYMBOL(save_nvgprs);
>=20
> I see it is added back somewhere below. Why don't you leave it where it i=
s ?

No longer used by syscalls so I it out from between other syscall=20
related code to improve icache.

Thanks,
Nick
=
