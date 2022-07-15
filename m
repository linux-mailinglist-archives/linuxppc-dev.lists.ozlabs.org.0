Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0978B576810
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 22:18:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ll2k1023Yz3cdK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 06:18:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=YNYV3Y5X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ascii.art.br (client-ip=23.83.212.19; helo=black.elm.relay.mailchannels.net; envelope-from=tuliom@ascii.art.br; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ascii.art.br header.i=@ascii.art.br header.a=rsa-sha256 header.s=dreamhost header.b=YNYV3Y5X;
	dkim-atps=neutral
Received: from black.elm.relay.mailchannels.net (black.elm.relay.mailchannels.net [23.83.212.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ll2jD4TxPz2ywN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 06:17:50 +1000 (AEST)
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 12F108011CC;
	Fri, 15 Jul 2022 20:17:47 +0000 (UTC)
Received: from pdx1-sub0-mail-a246.dreamhost.com (unknown [127.0.0.6])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3C3FB8020A1;
	Fri, 15 Jul 2022 20:17:46 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1657916266; a=rsa-sha256;
	cv=none;
	b=conZWtvaLb8leNctbhzTBy0itpgi7a6EYRIKnVwu/9dHrxztgr/VQBYXC23NjByQnCW5sN
	P8O8l1GNfXQMva2UMg8GEygQrnGFZyESOrpsYhfRxxf2prRVEKqmUZbH6wWKbRPoBR7eV4
	6t2nyXQIA80MpV9U908Tvfk5ASqGJVNTJNiKcy3KoD4LtLU69bXOEcbJZFtIR78m2mq7xW
	dy38LpRKBTCboWtOZY4DERcyhznAEd+PUs23u8zBsr/DmLaGuDZu1879KiWaVD6l13xvh1
	QQB/fsbB/hxg3tPjXSHIOm8q6xVLBs86I/dTw9vL/Uzm5l4HWEMUU9KEHNT7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1657916266;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=SYK18b1hhU2thRBwWHUzN7ytYM5/Q6Nhxq6SaNm2vDk=;
	b=6HuJTdzgidePNIVRPceo8UgrrITGJWX78jQDmh3jzc4UQEb3SoyHLUAOoAm+KaBdTB14RP
	gN0lwkID6KE/w5onp+gU4VyYnD9reVvR2DCRqaStuC4usW5j9TfqK66i+8JeAhhx8+PYOf
	KSE1F4RVj8Xgjs8s2mpKBtCr0HeUtX0+Na4lXID760Pr8iqCLForlySaA/bMRxwmx9zoYv
	QOHN6rUUhlGdw68sTDSWUwOAkygJFZSGjnhjSR5zdPfCtlUlLvFn/hWCSD79WDxTI/8HbR
	5aPDQYS1d+kL00yjQ9JM1uMARPC+68soetXMjnpuBcWTqsjTSuDcr00EkYX93g==
ARC-Authentication-Results: i=1;
	rspamd-674ffb986c-j8hc2;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=tuliom@ascii.art.br
X-Sender-Id: dreamhost|x-authsender|tuliom@ascii.art.br
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|tuliom@ascii.art.br
X-MailChannels-Auth-Id: dreamhost
X-Interest-Tasty: 3d09516725622e95_1657916266538_587779153
X-MC-Loop-Signature: 1657916266538:4032144885
X-MC-Ingress-Time: 1657916266538
Received: from pdx1-sub0-mail-a246.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.124.238.78 (trex/6.7.1);
	Fri, 15 Jul 2022 20:17:46 +0000
Received: from ascii.art.br (unknown [138.121.65.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: tuliom@ascii.art.br)
	by pdx1-sub0-mail-a246.dreamhost.com (Postfix) with ESMTPSA id 4Ll2j53fNKz3g;
	Fri, 15 Jul 2022 13:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ascii.art.br;
	s=dreamhost; t=1657916265;
	bh=SYK18b1hhU2thRBwWHUzN7ytYM5/Q6Nhxq6SaNm2vDk=;
	h=From:To:Cc:Subject:Date:Content-Type;
	b=YNYV3Y5XygtkfayBgk4SXsGTvg2qvFv2bjmb6tFk7mbbHRE/gBkD1xTUa3ONUphqm
	 Zf7BOgwGCOuYv7NE6MEiyarQbrxK8/aRw06F2LXJo7P9mmer+q6NRANBzTj9aMFgEK
	 25/m2yEIl7S/RmUcVPIvjQ3EIX6422/Z3rscfwSJK1qFbNoDenK3s1aa1mXLT7Z+38
	 UPnpoc06kepxixxXXaAkRcZNkTOaAvnZSuKwh+VESRabTSbSp05cxp+OjZl4YxudoH
	 BjsJC3m4iOvO//u3rjwk4C6sFF3VuATfKjmXK+RNbuGWuzZF5+BqCoLYmxADq9Srq5
	 bkwiTk1rv2Kpg==
From: Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: add documentation for HWCAPs
In-Reply-To: <20220715195951.GA25951@gate.crashing.org>
References: <20220715012636.165948-1-npiggin@gmail.com>
 <877d4euskv.fsf@linux.ibm.com> <20220715195951.GA25951@gate.crashing.org>
User-Agent: Notmuch/0.36 (http://notmuchmail.org) Emacs/27.2
 (x86_64-redhat-linux-gnu)
Date: Fri, 15 Jul 2022 17:17:42 -0300
Message-ID: <874jziuo49.fsf@linux.ibm.com>
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
Cc: Florian Weimer <fweimer@redhat.com>, gcc@gcc.gnu.org, libc-alpha@sourceware.org, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Segher Boessenkool <segher@kernel.crashing.org> writes:

> That is a usability problem.  Can it be fixed, or will that create its
> own compatibility problems?  In practice I mean.  If it is, the C
> libraries could fix it up, for new programs, and then after a while the
> kernel can do the sane thing?
>
> How big is the problem, anyway?  Is it only 2.05, or also 2.04, 2.03?

PPC_FEATURE_ARCH_2_05 is the first bit referring to an ISA level.
Before that, AT_HWCAP used to have bits for specific processors, e.g.
PPC_FEATURE_CELL and PPC_FEATURE_POWER4.

Notice that glibc creates its own hwcap-based information that is used by
__builtin_cpu_supports().  In this case bits PPC_FEATURE_ARCH_2_05,
PPC_FEATURE_POWER5_PLUS, PPC_FEATURE_POWER5 and PPC_FEATURE_POWER4 are enabled
whenever if the processor is compatible with the features provided by any of
the previous processors [1].
AT_HWCAP and AT_HWCAP2 are kept intact, though.

[1] https://sourceware.org/git/?p=glibc.git;a=blob;f=sysdeps/powerpc/hwcapinfo.c;h=afde05f86382413ce1f0c38e33c9bdd38d6b7e9d;hb=HEAD#l45

-- 
Tulio Magno
