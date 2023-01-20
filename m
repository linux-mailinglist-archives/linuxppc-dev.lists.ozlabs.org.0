Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD02D675AE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:14:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5hx4sjLz3fJB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:14:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=gRblk5Rx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=doPsdZWm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=gRblk5Rx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=doPsdZWm;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5h11yYmz3fFw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:14:09 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id BE4733200A56;
	Fri, 20 Jan 2023 12:14:05 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 12:14:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674234845; x=1674321245; bh=uvttBhFM8u
	1G9tqdLBJZ4jCPXN4Y8Kiz6reEs0adZb4=; b=gRblk5RxB8qqlwnNy2XXQjMxwo
	673enU/+pEl0fTPjCoXn9jn5zMcS4MLQn00+X229J9lezO/lUyZgteBjm0SfcFnV
	idOHfxQIQX9MC7e15h6YAVVzLqV93OnwwRJ9E8Eb4JfQwteCCDgGI7lf1MJ/9eZT
	pc691PeLWKqlolOaDPW00Tw/Lm/yMDMczLkDtqexPONVmVwf3IY0hekpMaS9Dtqz
	wIjSSf3frSTRjAVbrSPihZGeqKhvi7IRIKT5NkG3WOdo8MKiIX/2tjh1Iognpiqg
	yn3PEtW8EC7xrAHl+4EiH13DByUZ8QaSZ9GfjYa1UsOywdS6eEw+BUJxyioA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674234845; x=1674321245; bh=uvttBhFM8u1G9tqdLBJZ4jCPXN4Y
	8Kiz6reEs0adZb4=; b=doPsdZWmTrGmmD+jxmidfxsAkAUSgovN3gKx1JLDM30I
	VuilmhKbLaaVObnD3mBB2YssC+1l57SsXL4v3mxR3JakbFI7xZCXiKGeZLMPe4fk
	rRINCqut1a4HBXokq2f/tpvktkKdKwpnCwo/xXC5JAGT5bhsYRlAGvvjtPEZYlg+
	BOT0QDnYJdR76JDfBF2a5d/b5rKXQLfXcFXWb1GXSM5qKN1QkvkyWkOj95f4F7cu
	HqfS4Cdi1aHM0eml7vmQC7ZETWzr60m+5O8dutD0u+lxrfqAHXYfYOe88rOLnW0f
	V7hfc+j1pmMsLZ5QOSLietAu504Vqu9cQPyC0zPCnA==
X-ME-Sender: <xms:28vKY94yJhen1eq7ZETQOrvpBKIp5uIGlxWqRHCm3r6LDSzF0r6RZQ>
    <xme:28vKY644ld3dOkLbm1izB8ijNGD9K8Y3x0mZDsJ-WJSJTe3xs3Zr_ZqqN8l-q-gYI
    jJ_yr6DEU4jpdBiwVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeu
    feehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:28vKY0fOPYVpAqE2kT6wfytxOQeuhOpqz8DleBU_Co0K4i4dANCjEw>
    <xmx:28vKY2IK_EL8xIPpn7GNJdywVPHs87pVfrdZj5jRh6L2x0BCGFAqCA>
    <xmx:28vKYxI8QMF_vjB9xAFGjjnfg97jPdxaFCoe1wQQ9Epll2TrIbkwIg>
    <xmx:3cvKY5-yxqvZdOWAkzUqsWg639mLgnRQBBd_n_pang38XKtkf19D7g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6E70EB60086; Fri, 20 Jan 2023 12:14:03 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <647fd07b-6b87-4d6d-9dfe-7cc7b95253b6@app.fastmail.com>
In-Reply-To: <20230120133455.3962413-10-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
 <20230120133455.3962413-10-alexander.stein@ew.tq-group.com>
Date: Fri, 20 Jan 2023 18:13:42 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Olof Johansson" <olof@lixom.net>, "Shawn Guo" <shawnguo@kernel.org>,
 "Li Yang" <leoyang.li@nxp.com>, "Russell King" <linux@armlinux.org.uk>,
 "Marek Vasut" <marex@denx.de>,
 "Marcel Ziswiler" <marcel.ziswiler@toradex.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nick Desaulniers" <ndesaulniers@google.com>,
 "Nicolas Schier" <nicolas@fjasle.eu>
Subject: Re: [PATCH v2 09/10] kbuild: Add config fragment merge functionality
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
Cc: devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, soc@kernel.org, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023, at 14:34, Alexander Stein wrote:
> From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
>
> So far this function was only used locally in powerpc, some other
> architectures might benefit from it. Move it into
> scripts/Makefile.defconf.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Directly applied from 
> https://lore.kernel.org/linux-arm-kernel/20200203184820.4433-2-nsaenzjulienne@suse.de/T/#m96968dd45c0aaa88e0a7387024b5ac13b002363d

Acked-by: Arnd Bergmann <arnd@arndb.de>

I can probably best take this through the soc tree directly
along with patch 10, while the first eight patches should
got through the nxp maintainer tree.

    Arnd
