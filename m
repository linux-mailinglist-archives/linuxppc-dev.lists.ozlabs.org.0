Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C619707510
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 00:04:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QM6Zt6XyKz3fJj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 May 2023 08:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=IucBH8Nm;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pdYEFwlX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=IucBH8Nm;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=pdYEFwlX;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QM6Yy4bPmz3bjy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 May 2023 08:03:32 +1000 (AEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 01B1B3200933;
	Wed, 17 May 2023 18:03:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Wed, 17 May 2023 18:03:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1684361008; x=1684447408; bh=OlHnVK1DUusxWV+wmyioDrwuWgbSdxRZ6Mc
	R57h5ja0=; b=IucBH8NmwS7psEkwhWgXroQH7b02zaZuXFQ29gEAl4CYhfTaeS6
	Iv6EpAIWQanX8easevSY/X0KFa2ECCdPMqh2cJAsvnE2ppqeRm9zm/h2TVWPYrZP
	K5w+4WOTMn9H/Kcd4IParkWB2Zbkw43em6GuOeB7FrG64d/cCZVSbdaAe+Z8cZUf
	eFRqZymWP3k7KaykHcna95ttyT6FFuy0mlDAYLkDPoqXT068uUq6ZTA02K++3UnI
	Z7zMy/+XjWKny6fOPJ6SglqwXdt0ImvtTB5aQCwJLXts7S6IQLIknGBVH7mMhjNd
	kLrckdw2KQDRNkLIo7QjGjEvkOA+3ssvb5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1684361008; x=1684447408; bh=OlHnVK1DUusxWV+wmyioDrwuWgbSdxRZ6Mc
	R57h5ja0=; b=pdYEFwlXFJPNMtT/WbW3GS4DrOJfI8g+W2c82uiWuskGo0esxK2
	rppLsEe5cnXbp4pIz8sEYUhXwvzz8EL3jgafU8htKyJHwlRTeFsFJogo6TwbOG8B
	BSHOaV83iWm5AzvDLxw4X6/QOQZQHoI+ZmszO3/gV7ksc3cxs+WUDApdHdID2463
	k1JWRakm5Hm8Ms2wItlOrseiiwVCJQFYZ6fBcJ4762Z4V4Y9ZfVfmOPdBNnRGraZ
	1g2VkVN027Rs0kVYvfVTNAiq1AAjC9ykE9nkaYERTE+DMigM6VPmFPogASFYhFkU
	j7lA6Bld+l6wg5Y9CPKvwSsK0gS2axzzimg==
X-ME-Sender: <xms:L09lZK8Efre11GV54o35INUgqnkiBrdaL-7CAq6hC-8uPDqq_PrZvw>
    <xme:L09lZKtUJ7TtCH_ozO2Nmbmvf5YZ4tvgY6BbQ3B24JzTwnqbwVElHUNdbS4JOwWQ8
    piWrbV0lPS_PgMDEA>
X-ME-Received: <xmr:L09lZAAH1VmSk5qgwA29m-Lh5JRl4lAZ4iI1MvdNoyi-qEhKDDXiVqJi1l7g10gvuGXA4rKREmUpc5ORII_xyw5Q4n7020ZCWc1aJ48AyP7Zcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeeivddgtdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucgfrhhlucfvnfffucdljedmnecujfgurhepkffuhf
    fvveffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpeftuhhsshgvlhhlucevuhhr
    rhgvhicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpe
    etgfeilefhueefvedvkeehieefjefgfeegheetudekiefguddutdeukeetveelleenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurh
    esrhhushhsvghllhdrtggt
X-ME-Proxy: <xmx:L09lZCdn4VygZUX5T3pP1ytJ1cm9UaLYU0iZPRVTkDgswnUacaxlNQ>
    <xmx:L09lZPO53TQdwKYkWAlMOiCCot0n4vqPs5ynWa5KNFkeoypO93UshA>
    <xmx:L09lZMkaY15htDfuYJmmy7goIccUat1esZ8eDmrwlp6H8ZxMvTCKNw>
    <xmx:ME9lZF2QGTVzI40x2NWWUmRYCWYn4zbmVPn-ve6LWkZbgFP2xuMuJg>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 May 2023 18:03:26 -0400 (EDT)
Message-ID: <290087de21f20ea8d22db9fa0b8dfc7e2486ab28.camel@russell.cc>
Subject: Re: [PATCH] powerpc/security: Fix Speculation_Store_Bypass
 reporting on Power10
From: Russell Currey <ruscur@russell.cc>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 18 May 2023 08:03:23 +1000
In-Reply-To: <20230517074945.53188-1-mpe@ellerman.id.au>
References: <20230517074945.53188-1-mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
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
Cc: rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-05-17 at 17:49 +1000, Michael Ellerman wrote:
> Nageswara reported that /proc/self/status was showing "vulnerable"
> for
> the Speculation_Store_Bypass feature on Power10, eg:
>=20
> =C2=A0 $ grep Speculation_Store_Bypass: /proc/self/status
> =C2=A0 Speculation_Store_Bypass:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vuln=
erable
>=20
> But at the same time the sysfs files, and lscpu, were showing "Not
> affected".
>=20
> This turns out to simply be a bug in the reporting of the
> Speculation_Store_Bypass, aka. PR_SPEC_STORE_BYPASS, case.
>=20
> When SEC_FTR_STF_BARRIER was added, so that firmware could
> communicate
> the vulnerability was not present, the code in ssb_prctl_get() was
> not
> updated to check the new flag.
>=20
> So add the check for SEC_FTR_STF_BARRIER being disabled. Rather than
> adding the new check to the existing if block and expanding the
> comment
> to cover both cases, rewrite the three cases to be separate so they
> can
> be commented separately for clarity.
>=20
> Fixes: 84ed26fd00c5 ("powerpc/security: Add a security feature for
> STF barrier")
> Cc: stable@vger.kernel.org=C2=A0# v5.14+
> Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Russell Currey <ruscur@russell.cc>
