Return-Path: <linuxppc-dev+bounces-1211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE87C972A7F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2024 09:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2wBJ2d6cz2yTy;
	Tue, 10 Sep 2024 17:22:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725952920;
	cv=none; b=iF06Z8dI9RD2m/Unyird+hAH0rlbXpZ1ARy8I0hGFGMqjHCoqQEpixQx4GYYB6W5APR35WGTpRapOGI4TMrbgyHkC+obr6tMBMwToOwho95fSH6oYGI2rSlkfhJRLyQ3bAuuAi1xSKYUec3r3mVQAICOGP4oBq/22uorSpdgF/B9jbubiXoPDeQi7AcaIRYifEKQKAdMGdLMwUwxpDkrk7mZ33tv/hWhdtMh8lemsmuZE2ReNv0xgf3Y2cVlg2eehdkHm5Y1X67kXy1ZTIUn1KTl5OR7kttd3gD30oE5A+PBGDJsIFKLly5GmrnSKP6t+fcCLYN59+e8rG9bwz9gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725952920; c=relaxed/relaxed;
	bh=Qz+HWMixHr0TkuldBWJSnvho7DM/meoSWBHgTf1z3jg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CTnj4l/HLK7qSZ8KmWMdpbb6Xl2kWIEF9z40spiuSiuNPiJThyU6YpUksK3xzeHOT4+dzpwV/l/C+UtCW/8ksVq6u21EMQzYS/EkYTC+G2ntYw7AQSbCnrYJUkHqyqgP1oR6LehIYFE2tn6NKLKjGte7JRiWtoMZR/KwbiV+AXStnZmLupwNsHk3NFv5BohN2quiYzatZJLWtsyihVdcTfJbUCNYnqNHrqayJPA8hC59HkQqKITv+uvoWJasrervc63rnU9Viys7uwZ8kSQdDuiscMxne5qnDGF8nM9PXOkpHytZNjx9gBNg5xROhcEn66Ho08dH6dMp5XT06jDaxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iphENexq; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iphENexq;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2wBH43Mqz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 17:21:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725952919;
	bh=Qz+HWMixHr0TkuldBWJSnvho7DM/meoSWBHgTf1z3jg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iphENexqZe9/ZJuQmHiRaEn0ojN/WywFBqLg8sghZ8XhuGjQ9EXmRMx7+AbHhZqju
	 f/Yf0LMRKw2+SIsdbwjbWYA2ocrNG7N6yJerQ+bSOE+NjPIUI+8oWFe283TRV16piV
	 aHcM5NcRL5NByW/PPK6u9OP1sldZ3VwUiqJLvarDWjprkTb8XMNyMfLpBwsqRQLpw2
	 cVrKIQuslBo0GWuExk/LAStJrZOzEkiMRzCmp3cmiBIXdGJeN5nsK1WzoacDFyqKP1
	 6KeF2fI+xxiXmD+E6oZgJEyQSxj5GLMJNNs7Eu0xqbeHWLRQVQFe6hwOTxsqolaqf8
	 v7gUGXGMo3/+g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X2wBG43XYz4wc3;
	Tue, 10 Sep 2024 17:21:58 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Ryan B. Sullivan" <rysulliv@redhat.com>, Joe Lawrence
 <joe.lawrence@redhat.com>
Cc: live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 pmladek@suse.com, mbenes@suse.cz, jikos@kernel.org, jpoimboe@kernel.org,
 naveen.n.rao@linux.ibm.com, christophe.leroy@csgroup.eu, npiggin@gmail.com
Subject: Re: [PATCH] powerpc/ftrace: restore r2 to caller's stack on
 livepatch sibling call
In-Reply-To: <Zt8jaSQjpwtfJaVx@sullivan-work>
References: <87ed6q13xk.fsf@mail.lhotse>
 <20240815160712.4689-1-rysulliv@redhat.com>
 <9ec85e72-85dd-e9bc-6531-996413014629@redhat.com>
 <Zt8jaSQjpwtfJaVx@sullivan-work>
Date: Tue, 10 Sep 2024 17:21:57 +1000
Message-ID: <87bk0wrn1m.fsf@mail.lhotse>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain

"Ryan B. Sullivan" <rysulliv@redhat.com> writes:
> Hello all,
>
> Just wanted to ping and see if there was any further feedback or
> questions regarding the patch?

Hi Ryan,

I'd really like a selftest that triggers the sibling call behaviour.

As I said upthread I tried writing one but failed. Which you later
explained is because the cross-module sibling call is not generated by
the compiler but rather by the code being objcopy'ed (or similar).

I think it should be possible to trick the compiler into letting us do a
cross-module sibling call by doing it in an inline asm block. Obviously
that's non-standard, but I think it might work well enough for a test?

We have an example of calling a function within an inline asm block in
call_do_irq().

I'll try to find time to get that done, but I can't promise when.

cheers

