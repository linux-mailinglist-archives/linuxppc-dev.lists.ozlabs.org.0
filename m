Return-Path: <linuxppc-dev+bounces-2974-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 398E19C0360
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 12:07:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkfRS2nVWz3blF;
	Thu,  7 Nov 2024 22:07:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730977636;
	cv=none; b=R93xk6v9dzT4XzAk4I+hlgrOmzHqfFsEm8AkMRQjgFhyQapMBbTyG1xaEq8spD77+fgw8zJghbMyc7/BY3nKLZI8qNrLjb0kaMwwCOFA3D1rUHTG+j1tOiLkWXlL4SDo6d7xDO+xHYK583NQwVFcM+f6jJBzkkRMHhstYEpeP7Y/oZIVyz4LsmJUSrlnPaDxhXJCTaeRslfN22NLZc5UzLFPeMLdNjJv6kFNxIZGeiyybu1GbCv7gvoNZZKQu8VwEL0ptHxlpII7ujVaxCFL7mlwWyW5O0bU+wfDiT4RaGYZrHwLrTOwDX5aDY5TfTYtRQoekD/x/tQrnArI2/9MKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730977636; c=relaxed/relaxed;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZGez6xPvtiUVDZqTk6WN972l6ZlzsTM/CeVLH6Vrvydjzi9dQj7lqjmJLqjM1ADsIz+2jxSMI4e73AuqB7tN4V/e1pXr0qeHpQrS+5GPjQnw/C7gmMmebc53AozdrAnUmlGxwTJlW/x13zKRTyNZHcXxuOszqK/tlJaLZ2C4CQH8SmtZWftPhhXbb1Vuj5pHT6MjoMkGQpMqRL46OTo1TeodvKFZVVjf479ODNAQmm8Zq1alnkETye9zxKZw38H/oTuQIPneD90RID8azGsiZIE4MlHlzI/lMZSNfVs1UakiMupATMHX2e2atA0DQMSfiK8rB27PkifPj0vwfLrhQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CWZa3o68; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CWZa3o68;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkfRR0mHSz3blC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 22:07:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61344A4378D;
	Thu,  7 Nov 2024 11:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D8C4CECC;
	Thu,  7 Nov 2024 11:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977624;
	bh=wWy454JTOGwB3Dt5B8irjoHMNnCGPA3U2n8E8e3Bk0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWZa3o68QMtmlz5POUfbiLm5sYgt9IukvYZXN97Djjp9HIdmseiG15pDIVmBC6RiA
	 m2POD/vZ4N06dRngbW2hegsUAdIFmM/r86xPqXoLUPY4D0BTkQ7Y/W8jjnxYLKRadn
	 6pvdun9SekcnvlcAE/R/faCsTcDAueuGZXcpO2ZLfG8SL4eFlNWtJWzUnykueK3CFa
	 0WJ23Z+8RlCz9+fPUa1uNv2z6pXpFbOUj+9ORYnifzISrGxwQEEuhJ+OC3ft2fv0DD
	 4asM8n3W0BkaqI4fbNgICo9Og/FQv+ZgLBWjyjAJwyR6vibJrt85QY2gVIiO4Mq1oC
	 H5F67hRkq2pOw==
Date: Thu, 7 Nov 2024 12:07:01 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abhinav Saxena <xandfury@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] Documentation: dt-bindings: Fix repeated words
Message-ID: <huswmfhrf4mfewxchalts4chpddo4z67bg3kmsr3cfhhstob75@pzzuwfcvoiay>
References: <20241107061124.105930-1-xandfury@gmail.com>
 <20241107061124.105930-2-xandfury@gmail.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241107061124.105930-2-xandfury@gmail.com>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Nov 06, 2024 at 11:11:23PM -0700, Abhinav Saxena wrote:
> Fix unintentional word repetitions in devicetree binding documentation:
> - usb.txt: Fix repeated "two"
> - mvebu-devbus.txt: Fix repeated "from"
> - gpio.txt: Fix repeated "Both"
> - pinctrl-bindings.txt: Fix repeated "device"
> - cavium/bootbus.txt: Fix repeated "one"

This we see from the diff. This is trivial commit, so rather write
concise commit msg.

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

With changes above:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


