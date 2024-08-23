Return-Path: <linuxppc-dev+bounces-448-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF195C7CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:15:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqtD443qcz2yxf;
	Fri, 23 Aug 2024 18:15:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400916;
	cv=none; b=LBYSAKDuq0AJCAnKX8M7u+8IJgjlv7eeVfWuz0xFX4ZBwP20xrvoQvYd6iZBKni+32vkAhQZNk/VBhNpBCmcci9I7PCQfNa7tPnx/yFNFled1CkV+vzc9Mm7VjATOfQEVdk3zpwGH7DJE7wdfFpq0wWEfdwV7xrFWlxeYppt9Wt/klJyGqEEodlzpElOSESk5NHshIbZO6kXOFVmCR6KRufSNniBlCKTMA532HyWPbz0qIT7I16Af/tGxf8fvSRCbRaJOWZ7svfv5OYpBYx+yjQoI6dRifsCWI661P5va68tilTb/oOv0e7pVeFjAJmodj8ijrnXTHf8WTVVT6p2eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400916; c=relaxed/relaxed;
	bh=8LGQVSJj+zTkBEnPdupkthNlJJok4kEKiFTmi0MKchw=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=l2D/Bdkg3moUXsSKTIw9cjzddDOwx2vxuQ6L6UIHGz17gt+ZDtrG90a9mhnGCXwDG0ZQA2+pfSvfPcK9e9z+A3xsURMfxTJx55SFr9HurcOxk+v/CC0jqM6kYs94/9d+xwCZAKluf9u5mkTlEelUa4NcAB2knU59LXE6ju2L/hpbqo/jZyfuz74TD3R6UIYA11q1WXTV6MUE4FF1yrBZqWbV+muIWylUdxp0LSZMctOSxp6LassWgrFdublgwYYweFfEmGchYtxP/+T5d4ym1u0hnZ+L53r3982r5XXYmC0m0pfiybtSKYbJKMdNYmEx3x8h46Gfzgz9iNZPgA1I8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqtD41jlJz2yxY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:15:15 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqtD10DNtz9sRr;
	Fri, 23 Aug 2024 10:15:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FXoGByX6bG9Q; Fri, 23 Aug 2024 10:15:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqtD06XWMz9rvV;
	Fri, 23 Aug 2024 10:15:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CE2358B77D;
	Fri, 23 Aug 2024 10:15:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id wGaRUWbdC5iu; Fri, 23 Aug 2024 10:15:12 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A5758B763;
	Fri, 23 Aug 2024 10:15:12 +0200 (CEST)
Message-ID: <3217f63f-0d23-477f-b1e1-b2204773ac90@csgroup.eu>
Date: Fri, 23 Aug 2024 10:15:11 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 36/36] MAINTAINERS: Add QE files related to the
 Freescale QMC controller
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-37-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-37-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> The Freescale QMC controller driver supports both QE and CPM1.
> 
> Add the newly introduced QE files to the existing entry.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1d32d38f2247..1331bdeb7386 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -8996,6 +8996,7 @@ M:	Herve Codina <herve.codina@bootlin.com>
>   L:	linuxppc-dev@lists.ozlabs.org
>   S:	Maintained
>   F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
> +F:	Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe-ucc-qmc.yaml
>   F:	drivers/soc/fsl/qe/qmc.c
>   F:	include/soc/fsl/qe/qmc.h
>   

