Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EBBFED7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 19:28:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tpQp00rCzDqXB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 03:28:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="ujTQdwmK"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tpPN3CgtzDqGN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 03:27:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44tpPF1kWvz9vB2f;
 Tue, 30 Apr 2019 19:27:13 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=ujTQdwmK; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SKPy5gPho9In; Tue, 30 Apr 2019 19:27:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44tpPF0PWvz9vB2d;
 Tue, 30 Apr 2019 19:27:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556645233; bh=CiyJsTqHm5VKfq00rEpHJAK9KzqoqbhlzPXSaD1Lpgg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ujTQdwmKpxAV2UodghfYbrsSATH3/PVUAoOrjQfQUYNrxXSxkIp4zrCYatyJo5LNR
 9hZz+mTp+IkfkVh4yB6psaCKP1wkDe9JZFK65y9UmS3QTr+rtd7eAWziXs7ROr3wb3
 UQUC/+jpg8SYsMhJp94oYo+R5SCpGUxeEyPcAXPU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B88F98B8F3;
 Tue, 30 Apr 2019 19:27:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ch6gyJW-WEhM; Tue, 30 Apr 2019 19:27:14 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 100C68B8DF;
 Tue, 30 Apr 2019 19:27:14 +0200 (CEST)
Subject: Re: [PATCH 5/5] soc/fsl/qe: qe.c: fold qe_get_num_of_snums into
 qe_snums_init
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190430133615.25721-6-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <35a50a5b-061c-236a-16ff-0389bf34d736@c-s.fr>
Date: Tue, 30 Apr 2019 19:27:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430133615.25721-6-rasmus.villemoes@prevas.dk>
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
> The comment "No QE ever has fewer than 28 SNUMs" is false; e.g. the
> MPC8309 has 14. The code path returning -EINVAL is also a recipe for
> instant disaster, since the caller (qe_snums_init) uncritically
> assigns the return value to the unsigned qe_num_of_snum, and would
> thus proceed to attempt to copy 4GB from snum_init_46[] to the snum[]
> array.
> 
> So fold the handling of the legacy fsl,qe-num-snums into
> qe_snums_init, and make sure we do not end up using the snum_init_46
> array in cases other than the two where we know it makes sense.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>   drivers/net/ethernet/freescale/ucc_geth.c |  2 +-
>   drivers/soc/fsl/qe/qe.c                   | 54 +++++++----------------
>   include/soc/fsl/qe/qe.h                   |  2 +-
>   3 files changed, 19 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
> index eb3e65e8868f..5748eb8464d0 100644
> --- a/drivers/net/ethernet/freescale/ucc_geth.c
> +++ b/drivers/net/ethernet/freescale/ucc_geth.c
> @@ -3837,7 +3837,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
>   		}
>   
>   	if (max_speed == SPEED_1000) {
> -		unsigned int snums = qe_get_num_of_snums();
> +		unsigned int snums = qe_num_of_snum;
>   
>   		/* configure muram FIFOs for gigabit operation */
>   		ug_info->uf_info.urfs = UCC_GETH_URFS_GIGA_INIT;
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index af3c2b2b268f..8c3b3c62d81b 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -52,7 +52,8 @@ EXPORT_SYMBOL(qe_immr);
>   
>   static u8 snums[QE_NUM_OF_SNUM];	/* Dynamically allocated SNUMs */
>   static DECLARE_BITMAP(snum_state, QE_NUM_OF_SNUM);
> -static unsigned int qe_num_of_snum;
> +unsigned int qe_num_of_snum;
> +EXPORT_SYMBOL(qe_num_of_snum);

By exporting the object you allow other drivers to modify it. Is that 
really what we want ?

Why not keep qe_get_num_of_snums() as a helper that simply returns 
qe_num_of_snum ?

>   
>   static phys_addr_t qebase = -1;
>   
> @@ -308,26 +309,34 @@ static void qe_snums_init(void)
>   	int i;
>   
>   	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
> +	qe_num_of_snum = 28; /* The default number of snum for threads is 28 */
>   	qe = qe_get_device_node();
>   	if (qe) {
>   		i = of_property_read_variable_u8_array(qe, "fsl,qe-snums",
>   						       snums, 1, QE_NUM_OF_SNUM);
> -		of_node_put(qe);
>   		if (i > 0) {
> +			of_node_put(qe);
>   			qe_num_of_snum = i;
>   			return;
>   		}
> +		/*
> +		 * Fall back to legacy binding of using the value of
> +		 * fsl,qe-num-snums to choose one of the static arrays
> +		 * above.
> +		 */
> +		of_property_read_u32(qe, "fsl,qe-num-snums", &qe_num_of_snum);
> +		of_node_put(qe);
>   	}
>   
> -	qe_num_of_snum = qe_get_num_of_snums();
> -
>   	if (qe_num_of_snum == 76)
>   		snum_init = snum_init_76;
> -	else
> +	else if (qe_num_of_snum == 28 || qe_num_of_snum == 46)
>   		snum_init = snum_init_46;
> -
> -	for (i = 0; i < qe_num_of_snum; i++)
> -		snums[i] = snum_init[i];
> +	else {
> +		pr_err("QE: unsupported value of fsl,qe-num-snums: %u\n", qe_num_of_snum);
> +		return;
> +	}

The first leg of the if/else must have {} too when the second leg has them.

> +	memcpy(snums, snum_init, qe_num_of_snum);
>   }
>   
>   int qe_get_snum(void)
> @@ -645,35 +654,6 @@ unsigned int qe_get_num_of_risc(void)
>   }
>   EXPORT_SYMBOL(qe_get_num_of_risc);
>   
> -unsigned int qe_get_num_of_snums(void)

I think this function should remain and just return num_of_snums, see my 
other comment above.

Christophe


> -{
> -	struct device_node *qe;
> -	int size;
> -	unsigned int num_of_snums;
> -	const u32 *prop;
> -
> -	num_of_snums = 28; /* The default number of snum for threads is 28 */
> -	qe = qe_get_device_node();
> -	if (!qe)
> -		return num_of_snums;
> -
> -	prop = of_get_property(qe, "fsl,qe-num-snums", &size);
> -	if (prop && size == sizeof(*prop)) {
> -		num_of_snums = *prop;
> -		if ((num_of_snums < 28) || (num_of_snums > QE_NUM_OF_SNUM)) {
> -			/* No QE ever has fewer than 28 SNUMs */
> -			pr_err("QE: number of snum is invalid\n");
> -			of_node_put(qe);
> -			return -EINVAL;
> -		}
> -	}
> -
> -	of_node_put(qe);
> -
> -	return num_of_snums;
> -}
> -EXPORT_SYMBOL(qe_get_num_of_snums);
> -
>   static int __init qe_init(void)
>   {
>   	struct device_node *np;
> diff --git a/include/soc/fsl/qe/qe.h b/include/soc/fsl/qe/qe.h
> index b3d1aff5e8ad..af5739850bf4 100644
> --- a/include/soc/fsl/qe/qe.h
> +++ b/include/soc/fsl/qe/qe.h
> @@ -212,7 +212,7 @@ int qe_setbrg(enum qe_clock brg, unsigned int rate, unsigned int multiplier);
>   int qe_get_snum(void);
>   void qe_put_snum(u8 snum);
>   unsigned int qe_get_num_of_risc(void);
> -unsigned int qe_get_num_of_snums(void);
> +extern unsigned int qe_num_of_snum;
>   
>   static inline int qe_alive_during_sleep(void)
>   {
> 
