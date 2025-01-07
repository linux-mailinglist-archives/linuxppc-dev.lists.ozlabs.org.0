Return-Path: <linuxppc-dev+bounces-4792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A855A04CE3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 00:01:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSRP64gNzz2yD6;
	Wed,  8 Jan 2025 10:01:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736290874;
	cv=none; b=hkPT6KGdB1OL4y9gXfQHQxi7YXzVkDCuUXEMUB529VRXdeJvVa1JvOgEnNPy+nT8SqLZwQyb4m3D3vh+ensuYbDUqGwJrfXn22YGIsnVgmhJkA1La/ZxsoHRFLereTBJrPqFNB2D96KFosADha1jKjRl2ehgQyxNQtp9PTguO16D6J41DhCkmRBZn9Z6WpK06r2LX28vJJ9rg8E4S+wK/iQDyvW4neHk0VPHNdRcYDDzzoU3pKkgQjxK6H4ernf4psUCNPAVr1+1ARqA4mFgh/flPgaX/+mgbaQnw4gy9mrXLb67mUcYZIrogbPv/9z3QZUxxbE/+i7Mnl+OduuShg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736290874; c=relaxed/relaxed;
	bh=oKNPpPln1dq6JzdrqWFdARjtMxHIDxSUZwktQBs/ig0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLiqMewE3jahJ3qkK79PWW6XTht+PBR5QvxhWF/oSS6ZIri2GU7J1A4rw5m+GJ2rIB8B4lNbUIPnKhF95l+1yaqgl4BQCNeWRZYotJZF5Dn92appZZfrdALDPxB/5CJvU+NomMzEYurTRP3mVyiaG0beMxJ0rjFZMYERTIppAkpld+PjntkdOYG0fnryk59im+YmCxp6jJyGaLfrBBsRjXlE7ZnDpjDREd2y48uddFhJvnJQeck0pxTjAzBUEg1u/XTD27JDurLXAn/GSrvltpzL3ArPtvJJNIj4eCu7jt4ehp3/yFz53JXpCfti7znM7U7KYxVV/KNg10AJSDWwUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mbWNCIVd; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mbWNCIVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSRP31xVlz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 10:01:08 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 1668924002D
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 00:01:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736290862; bh=ql/VMdwMNYI4OeumrsAV90Qo71dCO+1E5E929QhrV7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=mbWNCIVdf7W+//FaBBJw39+KdLxo8Ymi1tmmHyuWehn4vslPFgfne7mpg1whR72PD
	 llWhC6BbH/deWJdqfA6e+SG4aDXmdcZJkzlwpphJTQTwvyeeOXl8wbrvLU1HkJyNN/
	 8EueOmBSdQo80mgCftPBtHHT/RhmTuBEZanwkkUuslRwoTsA2VlwFNqkBIcQ5SUzis
	 y1RZgrOp486x8oa3jO4y8By5oaUanR/z00O0Vvgm3dSiPwrCiFB2BxRfhJK6sy1d9O
	 OYNZgW3SMFXsXF7OaNQQwgMH6YLiUCZ1YZXPMZnDEAWSEUZkxuSBP9JsQkY8OAO10i
	 2gHisC6RFjO8g==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YSRNp409yz9rxP;
	Wed,  8 Jan 2025 00:00:58 +0100 (CET)
Date: Tue,  7 Jan 2025 23:00:58 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 08/19] powerpc: boot: Enable FIT image generation
Message-ID: <Z32yKoW2ozZs2oA_@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-8-86f78ba2a7af@posteo.net>
 <f4552e33-87d9-4b71-be21-f6884e4b5fa1@csgroup.eu>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <f4552e33-87d9-4b71-be21-f6884e4b5fa1@csgroup.eu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 06, 2025 at 02:52:59PM +0100, Christophe Leroy wrote:
> 
> 
> Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> > [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > The Flat Image Tree (FIT) format combines a kernel, a set of
> > devicetrees, and optionally additional resources into a single file that
> > can be loaded by a bootloader such as U-Boot. Generating a FIT image as
> > part of the kernel build reduces the need for additional build scripts,
> > and produces a single boot image without falling back to one of the
> > many legacy methods implemented in arch/powerpc/boot/Makefile, which
> > would require additional changes for arch/powerpc/boot for each board.
> 
> Will that allow compressed vmlinux ?

Yes, the make_fit.py script can compress included data (kernel, dtb),
and the logic in scripts/Makefile.lib makes use of this feature.
By default, gzip is used:

# Use this to override the compression algorithm
FIT_COMPRESSION ?= gzip

quiet_cmd_fit = FIT     $@
      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
		--name '$(UIMAGE_NAME)' \
		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)


Best regards,
J. Neuschäfer

