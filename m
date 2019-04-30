Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D036FE9D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 19:15:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tp7k2BlRzDqQ8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 03:15:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jaHONJag"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tp6J17vdzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 03:14:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44tp6C0br5z9v1kD;
 Tue, 30 Apr 2019 19:14:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jaHONJag; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 28SLzoUUzGbw; Tue, 30 Apr 2019 19:14:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44tp6B6dMTz9v1kB;
 Tue, 30 Apr 2019 19:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556644450; bh=A7G/2KqxzWbTnXWEeSBLCU6DxyGDCeHI1S20L1RVAek=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jaHONJagi6eI3MX1rdfK9DvAXTJkyerHUQjLKdbaUtvJNKk5z0ocxab5JJgVi86L5
 Etpb3NORzRIkuPSFgW8Prlik24h43ZjpW/I9nX4HXSLdJMDzy7O+YJt3mvlUq2WgVX
 tv0cNM+egOUkeAwRFOTtEKUq/Otwx9PD2jgiuC7s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A2F3E8B8F3;
 Tue, 30 Apr 2019 19:14:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2aqvcPYnRHU3; Tue, 30 Apr 2019 19:14:12 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F40AD8B8DF;
 Tue, 30 Apr 2019 19:14:11 +0200 (CEST)
Subject: Re: [PATCH 3/5] soc/fsl/qe: qe.c: introduce qe_get_device_node helper
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190430133615.25721-4-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <263abc47-3334-01b5-49ca-2d876a9ea537@c-s.fr>
Date: Tue, 30 Apr 2019 19:14:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430133615.25721-4-rasmus.villemoes@prevas.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Valentin Longchamp <valentin.longchamp@keymile.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/04/2019 à 15:36, Rasmus Villemoes a écrit :
> The 'try of_find_compatible_node(NULL, NULL, "fsl,qe"), fall back to
> of_find_node_by_type(NULL, "qe")' pattern is repeated five
> times. Factor it into a common helper.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>


> ---
>   drivers/soc/fsl/qe/qe.c | 71 +++++++++++++++++------------------------
>   1 file changed, 29 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index d0393f83145c..aff9d1373529 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -56,6 +56,20 @@ static unsigned int qe_num_of_snum;
>   
>   static phys_addr_t qebase = -1;
>   
> +static struct device_node *qe_get_device_node(void)
> +{
> +	struct device_node *qe;
> +
> +	/*
> +	 * Newer device trees have an "fsl,qe" compatible property for the QE
> +	 * node, but we still need to support older device trees.
> +	 */
> +	qe = of_find_compatible_node(NULL, NULL, "fsl,qe");
> +	if (qe)
> +		return qe;
> +	return of_find_node_by_type(NULL, "qe");
> +}
> +
>   static phys_addr_t get_qe_base(void)
>   {
>   	struct device_node *qe;
> @@ -65,12 +79,9 @@ static phys_addr_t get_qe_base(void)
>   	if (qebase != -1)
>   		return qebase;
>   
> -	qe = of_find_compatible_node(NULL, NULL, "fsl,qe");
> -	if (!qe) {
> -		qe = of_find_node_by_type(NULL, "qe");
> -		if (!qe)
> -			return qebase;
> -	}
> +	qe = qe_get_device_node();
> +	if (!qe)
> +		return qebase;
>   
>   	ret = of_address_to_resource(qe, 0, &res);
>   	if (!ret)
> @@ -164,12 +175,9 @@ unsigned int qe_get_brg_clk(void)
>   	if (brg_clk)
>   		return brg_clk;
>   
> -	qe = of_find_compatible_node(NULL, NULL, "fsl,qe");
> -	if (!qe) {
> -		qe = of_find_node_by_type(NULL, "qe");
> -		if (!qe)
> -			return brg_clk;
> -	}
> +	qe = qe_get_device_node();
> +	if (!qe)
> +		return brg_clk;
>   
>   	prop = of_get_property(qe, "brg-frequency", &size);
>   	if (prop && size == sizeof(*prop))
> @@ -563,16 +571,9 @@ struct qe_firmware_info *qe_get_firmware_info(void)
>   
>   	initialized = 1;
>   
> -	/*
> -	 * Newer device trees have an "fsl,qe" compatible property for the QE
> -	 * node, but we still need to support older device trees.
> -	*/
> -	qe = of_find_compatible_node(NULL, NULL, "fsl,qe");
> -	if (!qe) {
> -		qe = of_find_node_by_type(NULL, "qe");
> -		if (!qe)
> -			return NULL;
> -	}
> +	qe = qe_get_device_node();
> +	if (!qe)
> +		return NULL;
>   
>   	/* Find the 'firmware' child node */
>   	fw = of_get_child_by_name(qe, "firmware");
> @@ -618,16 +619,9 @@ unsigned int qe_get_num_of_risc(void)
>   	unsigned int num_of_risc = 0;
>   	const u32 *prop;
>   
> -	qe = of_find_compatible_node(NULL, NULL, "fsl,qe");
> -	if (!qe) {
> -		/* Older devices trees did not have an "fsl,qe"
> -		 * compatible property, so we need to look for
> -		 * the QE node by name.
> -		 */
> -		qe = of_find_node_by_type(NULL, "qe");
> -		if (!qe)
> -			return num_of_risc;
> -	}
> +	qe = qe_get_device_node();
> +	if (!qe)
> +		return num_of_risc;
>   
>   	prop = of_get_property(qe, "fsl,qe-num-riscs", &size);
>   	if (prop && size == sizeof(*prop))
> @@ -647,16 +641,9 @@ unsigned int qe_get_num_of_snums(void)
>   	const u32 *prop;
>   
>   	num_of_snums = 28; /* The default number of snum for threads is 28 */
> -	qe = of_find_compatible_node(NULL, NULL, "fsl,qe");
> -	if (!qe) {
> -		/* Older devices trees did not have an "fsl,qe"
> -		 * compatible property, so we need to look for
> -		 * the QE node by name.
> -		 */
> -		qe = of_find_node_by_type(NULL, "qe");
> -		if (!qe)
> -			return num_of_snums;
> -	}
> +	qe = qe_get_device_node();
> +	if (!qe)
> +		return num_of_snums;
>   
>   	prop = of_get_property(qe, "fsl,qe-num-snums", &size);
>   	if (prop && size == sizeof(*prop)) {
> 
