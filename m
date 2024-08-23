Return-Path: <linuxppc-dev+bounces-442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5730D95C7AE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:13:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqtB527wvz305X;
	Fri, 23 Aug 2024 18:13:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400813;
	cv=none; b=baWt76VNNhl/UNxHwKmqEucvz7VumbABDaFB0cFP27yAo+yNxsIC2WKyY7EGSfjgFmKuGBtzRJAMTBBBtzKPLC/y86ISsYcQTSlGMJVloHbDRwlGuYyzjzQXJDQvmEu/RhngWQZ7Yjlg/jTWtyxNjl3JrH0d8v7V/iOoULvPwbmyOuZ8UQHiOiwGRfzbRQJZBgdEF4HPffB0bEnZnaJUvXMdj2ouvML1gf3rZTOTtYlwFn5sn7Us1GgQH1dlaql+qQhWI8IxGMG5V+qbn7Ly08E9R0lwGaG59lk9/xqcO9VmQZ7suXuiTti/Rc3CpOlSlrZmZE5YrnMBRxyfaIFHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400813; c=relaxed/relaxed;
	bh=blM0EEHrmb8lbsfBH2wYnJz72beXx43a4x1LcizG+Q0=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=iIcaGoavitzwVJc9JbGox1mTyvApWIwuQbngrQ145t+cBs1CkY+m+/E4bs4lMJkIh9WaTXiL/vxUJ7Zu5+r6c+lFGoxZHdw4DcOtuttll9TVGIn4wjx7jsEIaIqWP6GvHDlUU+n/4Zfamh5fN9zbIduvGmGHZr9medbzTkRYB4/jwmDo23Og0vnKNZND7KUgrtQ2k8OXOxqaao2qvMdoveYkFEVmmhQtzRTSSMfeeY7TioEpw1kfNtfjdqfWzAStS8iij+Kuum3KNCnsD9sZbkC31NPHzARF8EqUBO5Eb2Vvg+BtnmWWHma4RDZFHP7lGTCCpa27mOv4qbm5kp3EQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqtB45QHyz3051
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:13:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqtB14Lf7z9sRr;
	Fri, 23 Aug 2024 10:13:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hmcQWiwSfRN; Fri, 23 Aug 2024 10:13:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqtB13XhNz9rvV;
	Fri, 23 Aug 2024 10:13:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 67F5E8B77D;
	Fri, 23 Aug 2024 10:13:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id OEB9s8w2hMYk; Fri, 23 Aug 2024 10:13:29 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D921B8B763;
	Fri, 23 Aug 2024 10:13:28 +0200 (CEST)
Message-ID: <50bb8062-757a-4838-8497-55ce7555bf96@csgroup.eu>
Date: Fri, 23 Aug 2024 10:13:27 +0200
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
Subject: Re: [PATCH v2 30/36] soc: fsl: cpm1: qmc: Rename SCC_GSMRL_MODE_QMC
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-31-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-31-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Current code handles CPM1 version of QMC. Even if GSMRL is specific to
> the CPM1 version, the exact same purpose and format register (GUMRL) is
> present in the QUICC Engine (QE) version of QMC. Compared to the QE
> version, the values defined for the mode bitfield are different and the
> 0x0A value defined for the QMC mode is CPM1 specific.
> 
> In order to prepare the support for the QE version, rename this bitfield
> value to clearly identify it as CPM1 specific.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/qmc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 63af2608c3cd..062477b7426e 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -27,7 +27,7 @@
>   #define SCC_GSMRL_ENR		BIT(5)
>   #define SCC_GSMRL_ENT		BIT(4)
>   #define SCC_GSMRL_MODE_MASK	GENMASK(3, 0)
> -#define SCC_GSMRL_MODE_QMC	FIELD_PREP_CONST(SCC_GSMRL_MODE_MASK, 0x0A)
> +#define SCC_CPM1_GSMRL_MODE_QMC	FIELD_PREP_CONST(SCC_GSMRL_MODE_MASK, 0x0A)
>   
>   /* SCC general mode register low (32 bits) */
>   #define SCC_GSMRH	0x04
> @@ -1642,7 +1642,7 @@ static int qmc_cpm1_init_scc(struct qmc *qmc)
>   	qmc_write32(qmc->scc_regs + SCC_GSMRH, val);
>   
>   	/* enable QMC mode */
> -	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_GSMRL_MODE_QMC);
> +	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_CPM1_GSMRL_MODE_QMC);
>   
>   	/* Disable and clear interrupts */
>   	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);

