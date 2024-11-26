Return-Path: <linuxppc-dev+bounces-3558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B39A49D90B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 04:28:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xy7Lp11s7z2yGN;
	Tue, 26 Nov 2024 14:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732591682;
	cv=none; b=iLkw9WgwSFKPzfW6rwMmpnIJwQkJizi43Wm2vXLSfcM2VBeMFKQtRl1TOUWjkhvRHtFpb0EJY+Gq02IPF5NO13L2MpcTRoc6LaPkgZR7zKS4WK7IqUgLP3tAlhW+m2PDDrUS35JDo/dn+bemxy+cYl+OgammAb/jpN8oPLepG5J4wCMqSYHiQYHoCkh7TY7NyB/e1Jhw7Vf2sA2wtbQOjfpAEBkvxdhGuxem7yyO3xkeUXzveAId7Dn99KPC0Qj0NfTFL6cTr1ybw6RJBcYbWZCmLy+beI3Xc7dTOpE06/oUOj+Nxcp6qz7dRaoBBP4qKdGjeo+VJmDdQp2Fmoyhrg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732591682; c=relaxed/relaxed;
	bh=4HXkMnCHnK9z+sqyKvKwDDRFvXdTCSWPpKDF3bUrpvw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I9sr4xXKTrq6MHQxV1zE41kqQN1AqOB01EKk7/1MObOQOnP42JI6+x1IyfvlKF7z87obNXf0rN3IidFuU02hb40ZnSoUrh2teu0hwrTLyz5Gky75kUsBw8b6E3KxA8/TrOqgHvFZSRKibT7qyoFCoARjcw+UM8hZN6obQQZnybZtZ9bm8R5bRQ1ZJc38hGkr3cTi3i41hc2OJcAsmdxZq8emX4/uVZFbna4VCCrQCL9jWwL3OnCiGu0KvsQUX7mgCrSTjQU/oxcQJBDhNaacTMbkIL8KV1Fy+umESO7DA4h1mk0Z+2+3rPdWDMISMU+Bu1aqwk7D3cz5mfF/+rzm6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=B4hckH0r; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=B4hckH0r;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xy7Lm669nz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 14:28:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1732591676;
	bh=4HXkMnCHnK9z+sqyKvKwDDRFvXdTCSWPpKDF3bUrpvw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=B4hckH0rN76Y0a5y5nq1cchcJEn8jG4seVY3TR8tmA3y0hH1UiVVf7826nYgMuzib
	 SYA8iE+NvGHzG6AwAvjP01U1HideeZFnZ07JjGzxQx6b+D3ZE7vn+CHTk3RSagIyGh
	 gaxFq5bJ/6glvw5237EoJdpQuk5A9w/zpBzEYLqiyV8GvgwxZy4YiOmnDlNlHYs+mE
	 aMGYbVPYjA+m/J8c+SoKg5sstPL7HCXpCKyvri83s7ChVf6KnaB18tdSqavl2SRSDT
	 OZozNN9NS0DuMuM9W67bFbwgRO2QEM3kd3JtflILcuX+/HlTfSuE6/lNTdQzPSWnRK
	 Rw3SzWlmYIuPw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xy7Lg6yDQz4xfK;
	Tue, 26 Nov 2024 14:27:55 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: arnd@arndb.de, geert@linux-m68k.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 01/10] powerpc/chrp: Remove CHRP support
In-Reply-To: <20241121083846.3648473-1-glaubitz@physik.fu-berlin.de>
References: <20241114131114.602234-1-mpe@ellerman.id.au>
 <20241121083846.3648473-1-glaubitz@physik.fu-berlin.de>
Date: Tue, 26 Nov 2024 14:27:55 +1100
Message-ID: <87sere7jyc.fsf@mpe.ellerman.id.au>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de> writes:
> Hello Michael,

Hi Adrian,

>> The Linux CHRP code only supports a handful of machines, all 32-bit, eg.
>> IBM B50, bplan/Genesi Pegasos/Pegasos2, Total Impact briQ, and possibly
>> some from Motorola? No Apple machines should be affected.
>
> I have a Pegasos 2 and I planned on keeping it.

OK great. You're the first user we've heard from in quite a while :)

Any idea what is the latest kernel version you have run on it?

> Have you asked among the Amiga community whether they plan on discarding
> your hardware? I think it's always ill-fated to ask for popularity of
> hardware on just the LKML. Most users are not on the LKML.

I haven't because I don't really know anything about the Amiga
community, who they are, where they hang out, etc.

Please cross post this to any Amiga folks you know, or tell me where I
should post it.

We've maintained this code for over 20 years, at some point if there's
no one in the *Linux community* who cares about it then it's hard to
justify keeping it.

cheers

