Return-Path: <linuxppc-dev+bounces-433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1C395C78C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:10:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt6b3QZZz2ytQ;
	Fri, 23 Aug 2024 18:10:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400631;
	cv=none; b=F57JWQ76UwOWuIwTQLoloXgJShN8wtuYY+4pSynyR/+pOIZdlr36rZxB0v4l2G+L5WQLKRynrZvDvZxSldWhD3sDmT8moMVb8uLDiN6FwtPaQArkS3aaVkOrQrJOp5JzBICorECwC1ic1jdwwQXORpr4G/Nc9BSFJ5IhRWU8NIhPGieqfC9TXDGjJb+GVSQOI62YatHfyPDpXTaJTGBLFE8zoPlJg+owEFtzGmbm51z5NEtJkUhH6053ifzzuIXmDV8Udj1LGfscX0ZKxQUprBkhjYLrTZpWS60Zods9YkQ0/hK9ZQhoTyn8Thy37KMooQVDoCt+HVVg6FWfx2Xo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400631; c=relaxed/relaxed;
	bh=tmbwXdyYCwW4j2JidEjzxsWQ9gFPGgstLhFoQJdQrYs=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=ZFUP/xtkGKpX3clNe/vsnwbevVFtmVyvhyj0xV4BwoZ4b1wmOHndoQG0NG6wLDYtLxibjiiRVpVi3NPsSwnqrYX4TeoG9TV+T+Ei1U51Ocdqnx2tACUCBtsqdEdN345u1C1ejLXekYxqMUzR5zjxuKBxDr3htMCz/PcoywK7+R+ib/pfqU33dKDvTAWymDCg8qPgKiYhOqjRFFpFf/vAlZ9XCJGsD/KUZBHgawkcbJGuANeyxA+ZaxMdFNpRYh+nJbbKgKurEG/8CC4AbOw+1RflEpqwBxUsp7SnzjRjCk+VN2SA4tgfZbV/703zZUPY5NFLyjSoPF3eEKVkvVnQHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt6b1GlRz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:10:30 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt6X0kbKz9sRr;
	Fri, 23 Aug 2024 10:10:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6fEcinwE3CeY; Fri, 23 Aug 2024 10:10:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt6W73mYz9rvV;
	Fri, 23 Aug 2024 10:10:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E0BCE8B77D;
	Fri, 23 Aug 2024 10:10:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id aOnz-ziVcxln; Fri, 23 Aug 2024 10:10:27 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 611238B763;
	Fri, 23 Aug 2024 10:10:27 +0200 (CEST)
Message-ID: <5721db08-5139-49a3-8614-0fcd674a762c@csgroup.eu>
Date: Fri, 23 Aug 2024 10:10:26 +0200
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
Subject: Re: [PATCH v2 21/36] soc: fsl: cpm1: qmc: Fix 'transmiter' typo
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-22-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-22-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> checkpatch.pl raises the following issue
>    CHECK: 'transmiter' may be misspelled - perhaps 'transmitter'?
> 
> Indeed, fix it.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 04466e735302..2d54d7400d2d 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -1715,7 +1715,7 @@ static int qmc_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_disable_intr;
>   
> -	/* Enable transmiter and receiver */
> +	/* Enable transmitter and receiver */
>   	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_ENR | SCC_GSMRL_ENT);
>   
>   	platform_set_drvdata(pdev, qmc);
> @@ -1742,7 +1742,7 @@ static void qmc_remove(struct platform_device *pdev)
>   {
>   	struct qmc *qmc = platform_get_drvdata(pdev);
>   
> -	/* Disable transmiter and receiver */
> +	/* Disable transmitter and receiver */
>   	qmc_setbits32(qmc->scc_regs + SCC_GSMRL, 0);
>   
>   	/* Disable interrupts */

