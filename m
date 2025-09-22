Return-Path: <linuxppc-dev+bounces-12518-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3232B924E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:50:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpyT6sSpz3cYL;
	Tue, 23 Sep 2025 02:50:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758559841;
	cv=none; b=BXXJ6XNfJYQ7/gcD1SptG/uekR43OBO5m9mEiLhn904q+U3Na8KYz/VMvBKETq/cN3EYPuZiMRNuOs/A4oltjQKmSwjb2TWeCjG5YEvtF2dxozDtbp5B03OfnqQInorPgqiu8L6qazLYJTrhypm1CHHj2hn20gxAn/p+vf717/HVCGIvS7yk8l49VbV/3ipXah2V2WgWyfN75LIiqYVMsffUfczhfVmhjfqK2A9yLoKo6KteAmVfAx2S5zxDq/rRK7kEYey7rSyYangvibiiUHwSMmpY5KzicRcO+7A/fkGlU0PsdKi6pmCBqfAQXkHb33Wx5scHV3VN4etyIiq4VA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758559841; c=relaxed/relaxed;
	bh=vWLKqdI5BefueXIWfx/ntxD0M+MLTqzn3zk+19665Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=VY+n0xC3wzyTXy5p2RBx5hk+LYoxifZVQA3tKM3HY0v4XU+QetBCQ46eGtQ5pW9p+YOIK8p+3mWdacjuoEDiZ1SOkb0jC5B5isLp9FEDSu7P5RXFOfXPvrX5f/nY/fZ9UIAJUjqVKOm4eqB68ji/fc7Pbsbxwp0xxE3CpWVn8FkmBFMdwDMXD4GE/p29o61oZtbIc9dpH5f4JoCdureUF2Mld1jgcbKNB2Ylo8hPXGk52FV/IjE+hBZRJbhS7JLr8uKChLUgOzkAzkpycmpFuJwYRUlnwGubW/DS/v6KnYUA9olKLtb+43QEoBl7zoC39SrlsQp3fg8fHmHR3qHjUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpyT2BSPz3cYJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:50:41 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cVmRV5tQlz9sSq;
	Mon, 22 Sep 2025 16:57:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6AKFTWFAHC2Q; Mon, 22 Sep 2025 16:57:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cVmRV5Bmkz9sSn;
	Mon, 22 Sep 2025 16:57:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A2D7D8B768;
	Mon, 22 Sep 2025 16:57:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Gby56WHi2ndH; Mon, 22 Sep 2025 16:57:10 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1C65B8B763;
	Mon, 22 Sep 2025 16:57:10 +0200 (CEST)
Message-ID: <31c6a5ad-08ac-46b2-9362-84484482bd06@csgroup.eu>
Date: Mon, 22 Sep 2025 16:57:09 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] bus: fsl-mc: Check return value of
 platform_get_resource()
To: Salah Triki <salah.triki@gmail.com>, Ioana Ciornei
 <ioana.ciornei@nxp.com>, Markus Elfring <Markus.Elfring@web.de>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <aKwuK6TRr5XNYQ8u@pc>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <aKwuK6TRr5XNYQ8u@pc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 25/08/2025 à 11:34, Salah Triki a écrit :
> [Vous ne recevez pas souvent de courriers de salah.triki@gmail.com. D?couvrez pourquoi ceci est important ? https://aka.ms/LearnAboutSenderIdentification ]
> 
> platform_get_resource() returns NULL in case of failure, so check its
> return value and propagate the error in order to prevent NULL pointer
> dereference.
> 
> Fixes: 6305166c8771 ("bus: fsl-mc: Add ACPI support for fsl-mc")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
> Changes in v2:
>     - Add Fixes and Cc tags, as suggested by Markus Elfring and Christophe
>       Leroy.
>     - Remove blank line before the if statement, as suggested by Markus
>       Elfring.
>     - Replace ENODEV with EINVAL, as suggestd by Christophe Leroy.
> 
>   drivers/bus/fsl-mc/fsl-mc-bus.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index 7671bd158545..cd83cd564736 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -1105,6 +1105,9 @@ static int fsl_mc_bus_probe(struct platform_device *pdev)
>           * Get physical address of MC portal for the root DPRC:
>           */
>          plat_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       if (!plat_res)
> +               return -EINVAL;
> +
>          mc_portal_phys_addr = plat_res->start;
>          mc_portal_size = resource_size(plat_res);
>          mc_portal_base_phys_addr = mc_portal_phys_addr & ~0x3ffffff;
> --
> 2.43.0
> 

Applied, thanks!

Christophe

