Return-Path: <linuxppc-dev+bounces-1110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CFC96F3BB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 13:56:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0ZRn2SZVz30H7;
	Fri,  6 Sep 2024 21:55:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725623733;
	cv=none; b=PyM1KVuuUenCrtuClF/7Upj2DAXiEsiESVDITbICi/Nv25ACBKDMhY0VyCo67vf8QedTHGCA/ERH7/tlapnrbJJzejlfh8a0EbCnfbbQJwyh6XML0JjERKlLcjdZS/atjnXJoiSItZm13R39yi4I29atUt1o8W1OFIjzqnqscRu8VMeWadrRypVWOMuJwauJGkn+HvQ1g06tCG2Wse9EM9O8wiUBd2JVYXQkjVXcDM2g1ME3jVFBwX5m9995Gr4/SnVQ6wrIZrldO5mHYq2WjNiiXp/IRFzjvhzAfsnUz2P/38WLt1ZkAnSYBnJUb690AhKqRU6KSmpg/AWnBqMPyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725623733; c=relaxed/relaxed;
	bh=XD5S7wtRfSmpajM5vt2XcsQTSnGwAlSGuzX0SDRteqQ=;
	h=DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type; b=l2fi/Clh/e6/hV7LJZSLZ7qxRnJIH1TIKPsamQODHDX/ZMH8423NwZ+JSNdFdeA4pE4nRsv3U9MFYwCctRf0S/go9I8ihuO6q4qlL/oLYd5aC1dlbZcbpEGybuVjSJCoLrHkdoW1FCVkCniO+YdUtBBZSFS8QqRXj65Pzd4Of5xub2z31SKaU+GKQMK99kEcjG9v/s4MAfl8Uz9yD5zC15+79gDMQ4qyc4cEGPAprukMRfYLIayfJa2lcMJ9tbYUrooUWuOY6hoshEdgprGtYE0yum6+1TYEwG8yESrDmr+TqxV9IxSLHUMD+gDRw7TSS5T7vap3L0U9czHtLHJq/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r9Gvw1T9; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=r9Gvw1T9;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0ZRn239Kz30Gh
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2024 21:55:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1725623733;
	bh=XD5S7wtRfSmpajM5vt2XcsQTSnGwAlSGuzX0SDRteqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r9Gvw1T9xVKtQcgSQejkO74vTirB8ULaI8BSvBG1vF0P/5QnsekLn8yWWXE3eZapM
	 3grqpJNtEXBLChk4YjLAl2uYdwOqNpD410DjN71Fkm9MVsYNNQf6GJqdmI3aSgMUyc
	 pm7l8D2P1VGkpiSc/r/FftWZp3joD1+itprwwz/pMxeN3CNfOPreR5+OCwYM9ptAZH
	 ElH2j36TVpLX6exiPvGIVdQoLtMt4qX8X2NEIrT5mRruffTfKNs5RpBbOWGhBDXDcv
	 9vVV7vwuFnKq384x+U4p2HHlkLb7pbbPSp1YnThd7Y9MLFX8v3AHvr1IEun5fcMRbG
	 xRe8lz3DGinKw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4X0ZRn0csYz4x9G;
	Fri,  6 Sep 2024 21:55:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Haren Myneni <haren@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, tyreld@linux.ibm.com, brking@linux.ibm.com, hbabu@us.ibm.com, kernel test robot <lkp@intel.com>
In-Reply-To: <20240822025028.938332-1-haren@linux.ibm.com>
References: <20240822025028.938332-1-haren@linux.ibm.com>
Subject: Re: [PATCH v3 1/3] powerpc/pseries: Use correct data types from pseries_hp_errorlog struct
Message-Id: <172562357208.467568.6562213165745120464.b4-ty@ellerman.id.au>
Date: Fri, 06 Sep 2024 21:52:52 +1000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On Wed, 21 Aug 2024 19:50:26 -0700, Haren Myneni wrote:
> _be32 type is defined for some elements in pseries_hp_errorlog
> struct but also used them u32 after be32_to_cpu() conversion.
> 
> Example: In handle_dlpar_errorlog()
> hp_elog->_drc_u.drc_index = be32_to_cpu(hp_elog->_drc_u.drc_index);
> 
> And later assigned to u32 type
> dlpar_cpu() - u32 drc_index = hp_elog->_drc_u.drc_index;
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/pseries: Use correct data types from pseries_hp_errorlog struct
      https://git.kernel.org/powerpc/c/b76e0d4215b6b622127ebcceaa7f603313ceaec4
[2/3] powerpc/pseries/dlpar: Remove device tree node for DLPAR IO remove
      https://git.kernel.org/powerpc/c/17a51171c20d590d3d3c632bcdd946f5fc3c0061
[3/3] powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add
      https://git.kernel.org/powerpc/c/02b98ff44a57c1376c5a92a8518fda5c82bb5a91

cheers

