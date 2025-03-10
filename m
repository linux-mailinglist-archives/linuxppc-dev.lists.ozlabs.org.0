Return-Path: <linuxppc-dev+bounces-6857-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FA4A5A599
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 22:06:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZBTwQ1bQHz2yFK;
	Tue, 11 Mar 2025 08:06:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741640806;
	cv=none; b=QiQ0RvO1dQ3FemvVQgJLcfOJWfMTruBNsSJqiEUIf4P+isHRvtqE3awuqOG9CySr4aj39AG/tTA5unql6vlh0yHL0GcciUHFkbzsXKOXGp/FHi4OOcrmM3je0fCJmxh0G8TT/Ikx9nN1c50aXtpBwEkawXHSMRY5qkU7cBT/pvpWG8P3ap2Sp1Q4N98bkX1zl6xjsYiAcwQsX3l7/ef5m5q0s0bsj54QovUMcMJOh6YfEdbpY8xyL1wM4t8Z8c4rActRdfY7nKnAMhqwxjLijefGNgYCTyZfpS5luyTU7ZQVICIEowOEF03MycOS673wdI+SmFvawY9exVwCTSJvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741640806; c=relaxed/relaxed;
	bh=BcGs91sCbVQLvV+6zfmeli1+EZwfYNIbBo2dJuhv0co=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EeTZ+rlKpnhcRD+uffMZErhcIahsOaoftQY+ttnQb0zs1Gn8c01KV64YLTBiMyCrnKCU4yo7oSoici5QXHh02ItFrQ0aa1mPvO/5YjRcqvHcOuxwN1qcu6pV2Aww9Ga2tMZ1XWAmJVJgN9mGLMbUPWz7emwny8kF8Vc6uvYb/7cJLwmIpb1CF9F4Lg+KZir6cDedq1wgAkbpn4ePs4caEzYePJ8XJHeG6atVVLoDmOsOgkYQ1/RnMZb89SsKld6fqV/Ibs/ZzcPjFc/OPdXWeqmDffkQRdpLPwxVScMmlX96EEmm11uOStMkT9E/NxGREBzJUzXP5RVWn4MDqnXvoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ttHr8cmG; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ttHr8cmG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZBTwP2QNgz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Mar 2025 08:06:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7B99C5C628D;
	Mon, 10 Mar 2025 21:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF394C4CEEA;
	Mon, 10 Mar 2025 21:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741640801;
	bh=oezQm/NlqvpkxgAhyp0aHWDGb6ijzzY4BmowWL/8DaM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ttHr8cmGF+ms+kff7kQnZn/6JCpkF13AQHNSOSeG9UYG4mK3/v0Cl78/UoD8OlcSJ
	 qA1Xjx4yLlYtDLnraNTKL/cMYaAPPdwFxlEIS57IWGalz5MxDKmJPxq90WrTHLY/nY
	 3VV2/RgWOnFhVaklGQCk9rOajgztlz71l0EBRd2Td98CS6MQvZdkTHHizpcwEesm1Q
	 vOfcCnOi0n5k5BJidMr7UXB9Xnve3/dqgNwd26DCAX8AVJ/eXJah40mqIXl32CLPrO
	 +XHvjsDDllOkkROVTMSd4d+c4UwJtzzTnpYGPreq1Ez5XB2aFhNJ9l39lfTY2lKC1+
	 BlMjsaTTAPWyQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Crystal Wood <oss@buserror.net>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20250308-ppcyaml-dma-v4-1-20392ea81ec6@posteo.net>
References: <20250308-ppcyaml-dma-v4-1-20392ea81ec6@posteo.net>
Subject: Re: [PATCH v4] dt-bindings: dma: Convert fsl,elo*-dma to YAML
Message-Id: <174164079739.489187.17067218233592397100.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 02:36:37 +0530
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On Sat, 08 Mar 2025 19:33:39 +0100, J. Neuschäfer wrote:
> The devicetree bindings for Freescale DMA engines have so far existed as
> a text file. This patch converts them to YAML, and specifies all the
> compatible strings currently in use in arch/powerpc/boot/dts.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: Convert fsl,elo*-dma to YAML
      commit: 1fe283e850d6659dc3ccc295c6a0b470dd461047

Best regards,
-- 
~Vinod



