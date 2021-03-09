Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BDB331C04
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 02:07:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvcWh1L6Zz3cSL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 12:07:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JaDOx7Hb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JaDOx7Hb; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvcWF325tz30LH
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 12:07:19 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id a188so8368690pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Mar 2021 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Wk1gFwIrxLf+tndudWrI/O2U2AkCABbC1w+8Jve6Q/I=;
 b=JaDOx7HbJudQtPEtCEs6GGJ7g7ZtzTnT6GmnmZtJQzLanHfB49LhYRkF6yQM+XDudH
 A8ZT0ef5wfUpPaACOcwcujLpSyQIkeppZQdclxxdCFNF3/cCBMbssk7EbW92Gro+rb0r
 UNndRyZXpqFWRPkaOFZK6dR8QoRBo3T/LxlwAIkoV9IxUsEaQJMz/4Nlor1tOGf6Ntjz
 /P+LSKdgj82rg9cfWODJW5Doj18oYwxgiV1mjznqQBsuhNZq2hVunZCP6ddnLfMtfbWV
 /ve76hZrBlZY9D8PU/NHxY1YGBHqY5QxbaWdLohjauYYIDeHlbvoALnoNxnNF+V4qg67
 mFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Wk1gFwIrxLf+tndudWrI/O2U2AkCABbC1w+8Jve6Q/I=;
 b=s48FZlMPF3n5L+Zd7TP3Po9xzGr38uLh8ru+bn57oF36SyA4e0WSQHb4BdW3kUYNFv
 yCZ4+SNQJ4jTmrMTKgYYhC4WtZGGVXSYvsSZ+WLww4c0GBKRP2bGrsXL+AqfUL4HTMvq
 qOJ357QICRq5N8h+XTp0i5TvH66IEm3hvI0RXCTcjoJWPcdBCJ1KFyCAr4wQ0Emk/41t
 2c98vHkAcyWQmaArr3StIZYUBOi1HEMcf6L/K1/CgPGGT/s0G4FJbWjmRj+4vK1aJjPg
 z3Pr1U0nri8hvWGCrdE8BbcPLxGx3LvZlZewEaAQ5193cLzzVhXUwW4MGgYkYLG59rgX
 6Omw==
X-Gm-Message-State: AOAM533CWgCDVQdnmuemVmYGwOBgknWFNHd/lm5dQLQbzDr3QeqDkMEP
 HXmCLDdljHeafZS4HYtLaqA=
X-Google-Smtp-Source: ABdhPJz8PNWozzV4nHM4WDieKH5ZfHtUk5b13eum5F6lFnMGET4J7Bl4puV8MQr/qIpGU0iCIG/VtA==
X-Received: by 2002:aa7:8ad5:0:b029:1df:5a5a:80e1 with SMTP id
 b21-20020aa78ad50000b02901df5a5a80e1mr23459375pfd.52.1615252036077; 
 Mon, 08 Mar 2021 17:07:16 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id s27sm10687329pgk.77.2021.03.08.17.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 17:07:15 -0800 (PST)
Date: Tue, 09 Mar 2021 11:07:09 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] KVM: PPC: Book3S HV: Do not expose HFSCR sanitisation to
 nested hypervisor
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210305231055.2913892-1-farosas@linux.ibm.com>
 <1615191200.1pjltfhe7o.astroid@bobo.none> <87eegpn0un.fsf@linux.ibm.com>
In-Reply-To: <87eegpn0un.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1615250895.ey7uv2nfuf.astroid@bobo.none>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of March 9, 2021 1:04 am:
> Nicholas Piggin <npiggin@gmail.com> writes:
>=20
>> Excerpts from Fabiano Rosas's message of March 6, 2021 9:10 am:
>>> As one of the arguments of the H_ENTER_NESTED hypercall, the nested
>>> hypervisor (L1) prepares a structure containing the values of various
>>> hypervisor-privileged registers with which it wants the nested guest
>>> (L2) to run. Since the nested HV runs in supervisor mode it needs the
>>> host to write to these registers.
>>>=20
>>> To stop a nested HV manipulating this mechanism and using a nested
>>> guest as a proxy to access a facility that has been made unavailable
>>> to it, we have a routine that sanitises the values of the HV registers
>>> before copying them into the nested guest's vcpu struct.
>>>=20
>>> However, when coming out of the guest the values are copied as they
>>> were back into L1 memory, which means that any sanitisation we did
>>> during guest entry will be exposed to L1 after H_ENTER_NESTED returns.
>>>=20
>>> This is not a problem by itself, but in the case of the Hypervisor
>>> Facility Status and Control Register (HFSCR), we use the intersection
>>> between L2 hfscr bits and L1 hfscr bits. That means that L1 could use
>>> this to indirectly read the (hv-privileged) value from its vcpu
>>> struct.
>>>=20
>>> This patch fixes this by making sure that L1 only gets back the bits
>>> that are necessary for regular functioning.
>>
>> The general idea of restricting exposure of HV privileged bits, but
>> for the case of HFSCR a guest can probe the HFCR anyway by testing which=
=20
>> facilities are available (and presumably an HV may need some way to know
>> what features are available for it to advertise to its own guests), so
>> is this necessary? Perhaps a comment would be sufficient.
>>
>=20
> Well, I'd be happy to force them through the arduous path then =3D);

That's not a very satisifying justification.

> and
> there are features that are emulated by the HV which L1 would not be
> able to probe.

It should be able to trivially by measuring timing.

>=20
> I think we should implement a mechanism that stops all leaks now, rather
> than having to ponder about this every time we touch an hv_reg in that
> structure.

This does not follow. There is already a "leak" via a timing or faulting=20
side channel, so by definition we can't stop all leaks just by filtering=20
the register value.

So what we need to do first I think is define what the threat is. What=20
is the problem with the L1 knowing what the HFSCR is? If we can identify
a threat then we would appear to have much bigger problems. If not, then
this change can not be justified on the basis of security AFAIKS.

> I'm not too worried about HFSCR specifically.

HFSCR is pretty special because its behaviour makes it quite trivial to
extrapolate. It also has the fault cause bits in it that aren't being
sanitised either so that would have to be thought about.

> Let me think about this some more and see if I can make it more generic,
> I realise that sticking the saved_hfscr on the side is not the most
> elegant approach.

I would say returning an error from the hcall if the caller tries to=20
enable an HFSCR bit that it's not allowed to would be the easiest
approach. At least then a well meaning but optimistic guest won't try
to enable and advertise missing features to its nested guests and have
them crash strangely, rather it would just stop up front.

I don't think trying to obscure HFSCR in general will ever be possible=20
though.

Thanks,
Nick
