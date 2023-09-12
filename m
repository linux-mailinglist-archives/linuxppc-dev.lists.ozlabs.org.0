Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EE379D720
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 19:04:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=twQH/1qG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlVLC4bgYz3cHd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 03:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=twQH/1qG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlVKL0Y6Vz3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 03:03:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7C0FCCE1DDE;
	Tue, 12 Sep 2023 17:03:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D4D0C433C7;
	Tue, 12 Sep 2023 17:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694538210;
	bh=2W640/p1T0Aq9kmII2hkn+rYKZ5SpA1fs1dP8heOBVE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=twQH/1qGdGnYrPhAdtFIYKDpnDu0YDSj0/qE7BHTojiV8GgXeZR/OyC2APe4CIAbW
	 ZpPz1wvm5p05LuOgwADE9jSJNlHv/2QAZJO28c/sHoCv/Avp9hRLKak4J+n4NKG7bd
	 b39QcSIcLmrAa2Lh42SaS7GwEmcILv8OQHVWRq2bmZyzR0p/gAPkrwfjh922twekwN
	 JandcIUmRGgcut1LkoNcI2u841cYPADh/i7aBtJiDE35QwEu8gLV6O3ymP8r5rpCFl
	 EV8lbxUqAalMECxcFncPDxyxx/+R+gtwP0O2QhbDdj8OZY+vbfXDty88nWvfEZkDHJ
	 b6Sc7H2rU2FbQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Sep 2023 20:03:26 +0300
Message-Id: <CVH3NT4ZIBNS.22HFUP0WCDY26@suppilovahvero>
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Nayna" <nayna@linux.vnet.ibm.com>, =?utf-8?q?Michal_Such=C3=A1nek?=
 <msuchanek@suse.de>, <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.14.0
References: <20230907165224.32256-1-msuchanek@suse.de>
 <20230907173232.GD8826@kitsune.suse.cz>
 <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
In-Reply-To: <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, James
 Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, joeyli <jlee@suse.com>, linux-security-module@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 12, 2023 at 6:39 AM EEST, Nayna wrote:
>
> On 9/7/23 13:32, Michal Such=C3=A1nek wrote:
> > Adding more CC's from the original patch, looks like get_maintainers is
> > not that great for this file.
> >
> > On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
> >> No other platform needs CA_MACHINE_KEYRING, either.
> >>
> >> This is policy that should be decided by the administrator, not Kconfi=
g
> >> dependencies.
>
> We certainly agree that flexibility is important. However, in this case,=
=20
> this also implies that we are expecting system admins to be security=20
> experts. As per our understanding, CA based infrastructure(PKI) is the=20
> standard to be followed and not the policy decision. And we can only=20
> speak for Power.

In the end this is dictating policy for no compelling reason, and
that is the bottom line here, not playing a mind game what type of
expertise a sysadmin might or might not have.

BR, Jarkko
