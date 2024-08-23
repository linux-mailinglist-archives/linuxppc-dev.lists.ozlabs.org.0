Return-Path: <linuxppc-dev+bounces-420-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 055CA95C756
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:06:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt1S6YMzz2ysD;
	Fri, 23 Aug 2024 18:06:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400364;
	cv=none; b=FHzCj+RWrpZ/KbdqY84Tme1HKQJ0IwtSEJL96zwUNNoB+7gCvVGhzCL3djQ8eeTUprJGUx5rs774e7sIaem5x7M4qJxEcXmfXS20YIPcL8LkOhBjobm2m0T9AKQ6ydS5zpocHlsPNmng9s5hcXjsdydsrweJbEsA7PIhea/fnDb9gx5Lxa+1JrPQ5blkzqQuNImxKOV8pgO2gAtepD9wbzkNfEqQunS2xtbbVrQXuSBBtnX3sjm3RjrKX76eQpx2cGVGujOTkFFRn97wlbpDKscxjpnJeKsbIj8yRIA6J4WGuID4qRiMTDyV5wFRNoLTWkdi1+PsROcX+b25NSVKYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400364; c=relaxed/relaxed;
	bh=kKwROzTZZO7HFFsKIyQgYf9DjT29miSrvLcqz7jXJ/o=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=EpvsJ/x+DSE4gnkke5MM173gk3Sv7CnF69CYYutjKWq23Nlty2eXUox4gSbN9GV2uvjFQZS5/Mjd0Q6i8YVvYb1k9fIKS66hVRauT+zYtm0aDyZLGN8NAx1o39rMbSsJKIPGyedg8rS59WGBbycHF8GDu+RueD+zHCu8VC7dhmNCJquPAqvnmSlEBp/j3ZzG9KiDLeInyapSpOdV5i38HXI7YMJ3MYG0cFte6+sIgOjTsxu3e90NQmog9qB8OHfzYj8ITZl2bCin00nGpaD12ryzgiCBQMWSmI5V3oAsYupfQv4me+f4YqW/+a5OdrI1nnLBaFu3qcX/HHmGhSYvdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt1S4PcJz2ynn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:06:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt1P4Ftrz9sRr;
	Fri, 23 Aug 2024 10:06:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruhI3TKhrhbG; Fri, 23 Aug 2024 10:06:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt1P3VYzz9rvV;
	Fri, 23 Aug 2024 10:06:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 67D088B77D;
	Fri, 23 Aug 2024 10:06:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id mjy-OhivgLWQ; Fri, 23 Aug 2024 10:06:01 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D1DF08B763;
	Fri, 23 Aug 2024 10:06:00 +0200 (CEST)
Message-ID: <e217798f-af3b-464b-be6d-ea94668766b5@csgroup.eu>
Date: Fri, 23 Aug 2024 10:05:59 +0200
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
Subject: Re: [PATCH v2 09/36] soc: fsl: cpm1: tsa: Use ARRAY_SIZE() instead of
 hardcoded integer values
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-10-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-10-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Loops handling the tdm array use hardcoded size and the initialization
> part uses hardcoded indexes to initialize the array.
> 
> Use ARRAY_SIZE() to avoid the hardcoded size and initialize the array
> using a loop.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   drivers/soc/fsl/qe/tsa.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 244d521d8780..3d0c31a62dbb 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -448,8 +448,8 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   	int i;
>   
>   	tsa->tdms = 0;
> -	tsa->tdm[0].is_enable = false;
> -	tsa->tdm[1].is_enable = false;
> +	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++)
> +		tsa->tdm[i].is_enable = false;
>   
>   	for_each_available_child_of_node(np, tdm_np) {
>   		ret = of_property_read_u32(tdm_np, "reg", &tdm_id);
> @@ -609,7 +609,7 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   	return 0;
>   
>   err:
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++) {
>   		if (tsa->tdm[i].l1rsync_clk) {
>   			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
>   			clk_put(tsa->tdm[i].l1rsync_clk);
> @@ -710,7 +710,7 @@ static void tsa_remove(struct platform_device *pdev)
>   	struct tsa *tsa = platform_get_drvdata(pdev);
>   	int i;
>   
> -	for (i = 0; i < 2; i++) {
> +	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++) {
>   		if (tsa->tdm[i].l1rsync_clk) {
>   			clk_disable_unprepare(tsa->tdm[i].l1rsync_clk);
>   			clk_put(tsa->tdm[i].l1rsync_clk);

