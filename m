Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A338675B0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jan 2023 18:20:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nz5pw2Ywqz3fK0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Jan 2023 04:20:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ta4oy1s1;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=l/OkIMIl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=ta4oy1s1;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=l/OkIMIl;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nz5p05rB1z2yw6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Jan 2023 04:19:20 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 7190C3200A5C;
	Fri, 20 Jan 2023 12:19:17 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 20 Jan 2023 12:19:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1674235157; x=1674321557; bh=AN63Zk9FUH
	XtB/1LDWKyjPugYkaPfboH8yCsuuO7QPs=; b=ta4oy1s1AdxLORjET+xauHRdR5
	NcbGi5cLHSey+FpTmv5ZC193wrgm2ovoDrIuYhzJXXZ+i5vJeQ4SoRHyB5D5KecC
	iXNUbnN4wzRnjQD6svlrGR+wUvYwpEGj1XRFU+HFOQ12Hb6tTPfdSYMU/skLOmo8
	w9Xr5VvQq3L5bgx2LNbZvWNgaNyJGfAtFx4+RyOlcvgLX7fLr1tDHcwtXMGOqXed
	3/TATPBktImtX56gMo7xDgc4nU3KmumzhQd/Elz7DPmbgOYOWhAGJ9joeV4gFi/i
	aD5MlNtMOIjQvp0yk+7265KbkmfReznpXigOGwvTGcmENPdEli46eemx7fhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1674235157; x=1674321557; bh=AN63Zk9FUHXtB/1LDWKyjPugYkaP
	fboH8yCsuuO7QPs=; b=l/OkIMIlYk2aLfnTY+EPhfjYf3kNra1kPmw+smJwoPT2
	K7Uxj4cdQhaKrOlaRHvPok1/HLjAzDXAJHG46jslpUERDQ51cFxlaWPRnXSekrMO
	g1T5kI0e6HDJ3iMgHZxQB8X/SzkjhE8Y1J3u5H3qJwgKNnDMmrim2ahfSXkDfTD4
	BRr3gLLTRZ8GZLPqIDy/SA9UzIDv0WVuhOnWN533RUAbI/juEZzoxij8Og0thReG
	IZp8bm5GrqAvCBVDZZYbvUtXUwo9dnI8hWotJ/u4gZ4i6ORoGrBUHexzWx7pN55+
	xvPfmkak4Tl03QIZjujVXwPUYWHrVtntkSYy9SxNlw==
X-ME-Sender: <xms:FM3KY4_buGub8-rqfTs4N8Yg42GbfDG0sCX2z11pHq1cgiJ7b7zrkg>
    <xme:FM3KYwsSwqT37FU8sAzoL23BpyyI_2eVteajl26e0cyAa_AO0n0O15V59m6v2pHB-
    2r-dNOC3XsrnJadUpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudduvddguddtvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:FM3KY-DoW6b0kGI3nWdnykYIonxorpLHx6qV3SeAZ4G-BGAzLWBYNg>
    <xmx:FM3KY4fTvpsB_OCYr7UVTStx_ocSeh-5--vi3xmD6KbWRLangTN-TA>
    <xmx:FM3KY9MeAxGkge2iPLDUQrl6MCt-q0PNhETlDF5gBN7m4h4TTF97jw>
    <xmx:Fc3KY6wq1Jled5Q_fzzY9NELrs3G2rh8APyCtOgZQEWRLqQ96wZqQA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0A0C0B60086; Fri, 20 Jan 2023 12:19:15 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-85-gd6d859e0cf-fm-20230116.001-gd6d859e0
Mime-Version: 1.0
Message-Id: <67c572e1-20ca-4ed2-9e15-047341bb338b@app.fastmail.com>
In-Reply-To: <20230120133455.3962413-11-alexander.stein@ew.tq-group.com>
References: <20230120133455.3962413-1-alexander.stein@ew.tq-group.com>
 <20230120133455.3962413-11-alexander.stein@ew.tq-group.com>
Date: Fri, 20 Jan 2023 18:18:54 +0100
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
Subject: Re: [PATCH v2 10/10] ARM: add multi_v7_lpae_defconfig
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
> The only missing configuration option preventing us from using
> multi_v7_defconfig with the Raspberry Pi 4 is ARM_LPAE. It's needed as
> the PCIe controller found on the SoC depends on 64bit addressing, yet
> can't be included as not all v7 boards support LPAE.
>
> Introduce multi_v7_lpae_defconfig, built off multi_v7_defconfig, which will
> avoid us having to duplicate and maintain multiple similar configurations.
>
> Needless to say the Raspberry Pi 4 is not the only platform that can
> benefit from this new configuration.
>
> Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

This is ok in principle, two minor points though:

> +include $(srctree)/scripts/Makefile.defconf
> +PHONY += multi_v7_lpae_defconfig
> +multi_v7_lpae_defconfig:
> +	$(call merge_into_defconfig,multi_v7_defconfig,lpae)
> 
>  define archhelp
>    echo  '* zImage        - Compressed kernel image (arch/$(ARCH)/boot/zImage)'

The new target does not get listed in 'make help' as far as I can
tell, can you add it there in the process?

> diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
> new file mode 100644
> index 0000000000000..19bab134e014b
> --- /dev/null
> +++ b/arch/arm/configs/lpae.config
> @@ -0,0 +1 @@
> +CONFIG_ARM_LPAE=y

My feeling is that we probably want CONFIG_VMSPLIT_2G=y here
as well, given that a lot of the systems that want LPAE
will have a lot of memory, and are limited by the amount
of lowmem even when CONFIG_HIGHMEM is enabled.

Can you make sure that this works on your machine, and
include this option?

     Arnd
