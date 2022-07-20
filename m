Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506D357B435
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 11:55:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnrg02kd1z3bnV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 19:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X1c633oe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X1c633oe;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnrfK18R5z2xkY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 19:55:03 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id c6so14500861pla.6
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 02:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=xNGrrxee7AVgjLLgGUO/8Ejr4tO3Q9/xUyQPY0kXPR8=;
        b=X1c633oeiqq4s6i3eQC2s2IidwaCciB1pXTRCvmk3ZDTFz+NHOtu4zLyv02qe3wj1A
         vqNIOrnJk9OZowfjsIdhGw118IsEbJYRU8I5QyzWyN9m7LbHHA7NXW/26xtp98WSbPf2
         PkF5vBugwo/ZgudhDOEbb2mx+4KVgjdQMuUyRKpIhD6cMIDR6Bf5ooSICckJzAX2Se7Z
         D0InlwoL0vK3M27srv8VdNr36Ir7Q1h5ZI1YjyDtUn6z1s/9yxAaDBC/ORJvQs3q0HTr
         pjh9w24c2RnTG1vpPM/zHCMttRqmJ2jj8w4JKCtQfWlXd8Kb8l7J3ca98z+XI9QpRnLq
         jaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=xNGrrxee7AVgjLLgGUO/8Ejr4tO3Q9/xUyQPY0kXPR8=;
        b=WuT1yjY2DSYldtyInItUUncaUFHLE3kXf9mNFFta8+cTHG4rTlJ/QJeFm6eCLfdAQ2
         vgZyGbvr+nzbm9WIfDsX0tBBx6AK6TWr88aqFP7w2vGCapUm6jnPjMFyUaLWMP5A7Ivr
         1wWFQLapnKzilG4QNM6glKUKugA3ucR+rlgVLRxaV7BdmLhb24G1ZlGiFZyeIr+Yiiid
         jEP8rmZuC35QAJNkOpewtG38ncLKOgcQTMI+6h/eOrjlMUNbE/M3ywh9bls5MZKxXJzX
         txdMT3XD8c7egy4epLTVPRO79wUa5lp2TiwjpCN2OB7ppY1QTr6LxlCNL+ZkqUR+wiZ4
         pQYg==
X-Gm-Message-State: AJIora8k2hSTZEtcV0+qSqvKRENbSQoXABTC6mrMr0Swv/LJRxM7YkC+
	224+cRjwmyI6tqkAgIqtd/kWlK9XTO8=
X-Google-Smtp-Source: AGRyM1sFWi8Im64/LemnzoUMOP9UPN0cgj5W6hpgdfw1Ddhz+1pYOB1fglfkOA06y1rdFgBvODxR/A==
X-Received: by 2002:a17:90a:d50d:b0:1ef:9130:f96b with SMTP id t13-20020a17090ad50d00b001ef9130f96bmr4387112pju.235.1658310899868;
        Wed, 20 Jul 2022 02:54:59 -0700 (PDT)
Received: from localhost (27-33-251-27.static.tpgi.com.au. [27.33.251.27])
        by smtp.gmail.com with ESMTPSA id t126-20020a628184000000b0050dc7628148sm13203333pfd.34.2022.07.20.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 02:54:59 -0700 (PDT)
Date: Wed, 20 Jul 2022 19:54:54 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc: add BookS wait opcode macro
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <20220711031128.151437-1-npiggin@gmail.com>
	<20220712162903.GO25951@gate.crashing.org>
In-Reply-To: <20220712162903.GO25951@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1658310023.4smrdizxcf.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of July 13, 2022 2:29 am:
> Hi!
>=20
> On Mon, Jul 11, 2022 at 01:11:27PM +1000, Nicholas Piggin wrote:
>> The wait instruction has a different encoding between BookE and BookS.
>> Add the BookS variant.
>=20
>>  #define PPC_RAW_WAIT(w)			(0x7c00007c | __PPC_WC(w))
>> +#define PPC_RAW_WAIT_BOOKS(w, p)	(0x7c00003c | __PPC_WC(w) | __PPC_PL(p=
))
>=20
> The embedded extensions are no longer part of the PowerPC architecture,
> so wouldn't it be a better way forward to rename the existing one,
> instead?  A bit more work now, but less in the future :-)

And I actually misremembered this too, was off digging and asking
about it, but the change isn't strictly BookE vs BookS, but rather
the wait opcode was changed in ISA v3.0, which is a bit of an
unfortunate landmine.

It seems apparently POWER8 implemented a non-architected instruction
'waitasec' that uses this opcode, then I suppose it was decided to
continue with that opcode in v3.0 when BookE was dropped, for reasons.
Maybe it was more widely used?

In any case, I will rename it. Precedent is divided. We have
PPC_RAW_TLBIEL_v205 for older tlbiel, and PPC_ISA_3_0_INVALIDATE_ERAT
for a new ERAT invalidation instruction. I guess making the older
instruction the exceptional case ends up being better in the long
term.

Thanks,
Nick

