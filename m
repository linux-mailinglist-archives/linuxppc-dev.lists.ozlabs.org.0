Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16404609879
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 05:09:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mwg5r6xWqz3cB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Oct 2022 14:09:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=Sq5cz7o8;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZUgX565f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=66.111.4.25; helo=out1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=Sq5cz7o8;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZUgX565f;
	dkim-atps=neutral
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mwg4y3wtdz2xJN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Oct 2022 14:08:34 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9F0975C0076;
	Sun, 23 Oct 2022 23:08:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 23 Oct 2022 23:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1666580912; x=
	1666667312; bh=wbs8CojDDdLchxVZ/SuPyz6Ay9H3J/UdX6f+0tnCJRk=; b=S
	q5cz7o8ouu5UbphbIndpxAkPnXfgCUU+a9LwBmncIu59NrvBSjKdLEl2TZhY8Ygs
	XgPX69QKaeXHaBtHOto+yNJUO+vwLD/cspxkhT/3Xw8RI5qyZvMXaQukCQV3aKjv
	fvpYF7+BwtzTzJiATRnFKBdMBjCBqbIRrAWYaFZDvNPJI+m8oNWmR+JOkRu0i063
	CogVSE2/lFEMuTpFEHlfaybSXz2ncr/dF3Hb72H60xGWuJ63AP489QhKlMB0+jhn
	Rsk0RNg3A/ThO0vewluDWR19PL7EbKTTDIcipjhS1SWDJPUODIKdi7ILHvhxS0O7
	CYerlWioNjScCfTXwv8fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666580912; x=
	1666667312; bh=wbs8CojDDdLchxVZ/SuPyz6Ay9H3J/UdX6f+0tnCJRk=; b=Z
	UgX565fYaaWqcVRl/sCG2v+8xu6kr08+7J6F9Z9N29ggoC/jeceQCuxolbM/mGil
	1IbWbEDzG2/pyEB9jcolYNgKx9pfBjsWgJue/AVRiWT7wIotv1QBu29ycyTOXyIv
	10QMd2RbzbJpYset+gORIRXCOhxa8tQXpPI2A08Zb0WP+HEErnF7Ws9tH6b8SEhe
	g0gx5fhKeqdEhd3RRnAvbvXP9t1OQBSDcGm1sTmdVisydl+51qGNoqI9Z9YpuIoS
	cFunHRon+DEWIv/CFwws4eRrCmVeOHNaPI3dY6hV7H/B1HApYJ3tvbnWxTkzoOKJ
	nXK+OkQSXBv8uUX0wwu0g==
X-ME-Sender: <xms:sAFWY-bSmniIiLZlt6O9L1pXWZPoz2F-orKPlado9bFi34vG0X46yA>
    <xme:sAFWYxaMZJs7k2rKf0UbEFqns1CVYrXeorAinV2tqXTri-mNa1EAmc4vz9-f92Ijx
    GpM9bl7J-a5pisCAQ>
X-ME-Received: <xmr:sAFWY4_BU68k6NcZHsV9L3kTCNSezG8YMNRhtMa6TqvURAlFp0UzmyAgz8KCFpQhRQNlP9B97KCQ4p1oYrDfiz6W1BZNoMPo-4G3SXQnvloqtA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgedtfedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddtmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:sAFWYwpQR52Jhw_zm5dDN6XYS7kNQtq9odjRjn5CantlhhSCB1KGEQ>
    <xmx:sAFWY5rUwbp-gODr9OhQBdcxFIXpL52wvnnxtKDyDu2kYUupzqPh2Q>
    <xmx:sAFWY-R9aLQZ2tP-8Bzw65AngdjBotLX-DAEp9tMQTAm5Fvz-raVvw>
    <xmx:sAFWYyDjdbcN8m3pp1fzR4tFXZcYp9dut258fzc6GgjHFq7VnIHT9A>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Oct 2022 23:08:30 -0400 (EDT)
Message-ID: <51ad065e97e6cd21786a024299722479d31da99f.camel@russell.cc>
Subject: Re: [PATCH v8 2/6] powerpc/code-patching: Use WARN_ON and fix check
 in poking_init
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 24 Oct 2022 14:08:28 +1100
In-Reply-To: <20221021052238.580986-3-bgray@linux.ibm.com>
References: <20221021052238.580986-1-bgray@linux.ibm.com>
	 <20221021052238.580986-3-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
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
Cc: jniethe5@gmail.com, cmr@bluescreens.de, npiggin@gmail.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-10-21 at 16:22 +1100, Benjamin Gray wrote:
> From: "Christopher M. Riedl" <cmr@bluescreens.de>
>=20
> The latest kernel docs list BUG_ON() as 'deprecated' and that they
> should be replaced with WARN_ON() (or pr_warn()) when possible. The
> BUG_ON() in poking_init() warrants a WARN_ON() rather than a
> pr_warn()
> since the error condition is deemed "unreachable".
>=20
> Also take this opportunity to fix the failure check in the WARN_ON():
> cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, ...) returns a positive
> integer
> on success and a negative integer on failure.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Russell Currey <ruscur@russell.cc>
