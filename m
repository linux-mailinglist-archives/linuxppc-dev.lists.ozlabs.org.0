Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C3C91E3F6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 17:23:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tuSKZcGD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCVDV6wvyz3cJl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 01:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tuSKZcGD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCVCr3LZ9z3bhD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 01:22:48 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 47367CE17D1;
	Mon,  1 Jul 2024 15:22:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21A10C116B1;
	Mon,  1 Jul 2024 15:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719847366;
	bh=stsqNjcBtVTaNvoSI47EdoM4mGvxzLnZJvbW9mPkCtI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=tuSKZcGD5JfgmUY/kbcDLt95zePIcfcCnlBKKRTLe7XtcyRXvFRlHYJGk4a7IAeXh
	 XSUlmOFMVjHf/Qgj9aCCuBO5RVyTLsuTxxB/Q1s7mlOGlZmnrXcbYvza6/YEmAZEvc
	 FlUEYTyOKWklRCGbf/GGXupL2TgmmwrV85x82iLokynwoQChODdTN/hfB18iJMi5+b
	 ir9tsoFZZVtME3DeGFHXsvljfzFWBlLkeKcW34s4VpGA1rmdoO/yEIHcHr8ZAwLkUV
	 DHTF5yRzeDe87GQ9SgvsOtQsCWBJZpkYp2Qrono1ohQ27yTZQvyTYozkssN+scvbwL
	 oIh9PyTcKgNIg==
Message-ID: <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Date: Mon, 01 Jul 2024 15:22:42 +0000
In-Reply-To: <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
	 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
	 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40) 
MIME-Version: 1.0
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
Cc: naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2024-06-28 at 17:00 +0200, Linux regression tracking (Thorsten Leem=
huis) wrote:
> [CCing the regression list]
>=20
> On 20.06.24 00:34, Stefan Berger wrote:
> > Jarkko,
> > =C2=A0 are you ok with this patch?
>=20
> Hmmm, hope I did not miss anythng, but looks like nothing happened for
> about 10 days here. Hence:
>=20
> Jarkko, looks like some feedback from your side really would help to
> find a path to get this regression resolved before 6.10 is released.
>=20
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

Sorry for latency, and except a bit more slow phase also during
July because I'm most of this month on Holiday, except taking care
6.11 release.

This really is a bug in the HMAC code not in the IBM driver as=20
it should not break because of a new feature, i.e. this is only
correct conclusions, give the "no regressions" rule.

Since HMAC is by default only for x86_64 and it does not break
defconfig's, we should take time and fix the actual issue.

BR, Jarkko
