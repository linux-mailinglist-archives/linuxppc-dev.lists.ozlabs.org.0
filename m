Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9B81125E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 06:54:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44vjbQ1XkjzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 May 2019 14:54:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="oC51hi27"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44vjYt3CwfzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 May 2019 14:52:50 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44vjYn5z2vz9v0BV;
 Thu,  2 May 2019 06:52:45 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=oC51hi27; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0TUnsWMW3vXT; Thu,  2 May 2019 06:52:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44vjYn4rZBz9v0BC;
 Thu,  2 May 2019 06:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556772765; bh=oTUoNAvTbptkwHiQB4BoNv5xEebc0qVEEYx9fowqT+s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oC51hi27WAkc8iHZkPAl58pflieW+TouGLtmSDXZSe87JlN74wedySK6NhkoeGFA1
 Jq+AyX73+z7yScKsRYE+TYvzCeieb6eQ15HoV7fS9NC/ot6sx+7berTcq+2fmHLuJ/
 wmUYb/IjZpoGDMHaiuuZ/GwuFwGZdzX13EV1SlyU=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 79AC18B84E;
 Thu,  2 May 2019 06:52:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lb_56fQc7pmk; Thu,  2 May 2019 06:52:46 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DD09C8B74C;
 Thu,  2 May 2019 06:52:45 +0200 (CEST)
Subject: Re: [PATCH v2 5/6] soc/fsl/qe: qe.c: support fsl,qe-snums property
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-1-rasmus.villemoes@prevas.dk>
 <20190501092841.9026-6-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <53c8e642-5efa-c476-92b7-a70d5598b217@c-s.fr>
Date: Thu, 2 May 2019 06:52:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190501092841.9026-6-rasmus.villemoes@prevas.dk>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Rasmus Villemoes <Rasmus.Villemoes@prevas.se>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Scott Wood <oss@buserror.net>, Rob Herring <robh+dt@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/05/2019 à 11:29, Rasmus Villemoes a écrit :
> Add driver support for the newly introduced fsl,qe-snums property.
> 
> Conveniently, of_property_read_variable_u8_array does exactly what we
> need: If the property fsl,qe-snums is found (and has an allowed size),
> the array of values get copied to snums, and the return value is the
> number of snums - we cannot assign directly to num_of_snums, since we
> need to check whether the return value is negative.
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   drivers/soc/fsl/qe/qe.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index 0fb8b59f61ad..325d689cbf5c 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -283,7 +283,6 @@ EXPORT_SYMBOL(qe_clock_source);
>    */
>   static void qe_snums_init(void)
>   {
> -	int i;
>   	static const u8 snum_init_76[] = {
>   		0x04, 0x05, 0x0C, 0x0D, 0x14, 0x15, 0x1C, 0x1D,
>   		0x24, 0x25, 0x2C, 0x2D, 0x34, 0x35, 0x88, 0x89,
> @@ -304,7 +303,21 @@ static void qe_snums_init(void)
>   		0x28, 0x29, 0x38, 0x39, 0x48, 0x49, 0x58, 0x59,
>   		0x68, 0x69, 0x78, 0x79, 0x80, 0x81,
>   	};
> +	struct device_node *qe;
>   	const u8 *snum_init;
> +	int i;
> +
> +	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
> +	qe = qe_get_device_node();
> +	if (qe) {
> +		i = of_property_read_variable_u8_array(qe, "fsl,qe-snums",
> +						       snums, 1, QE_NUM_OF_SNUM);
> +		of_node_put(qe);
> +		if (i > 0) {
> +			qe_num_of_snum = i;
> +			return;
> +		}
> +	}
>   
>   	qe_num_of_snum = qe_get_num_of_snums();
>   
> @@ -313,7 +326,6 @@ static void qe_snums_init(void)
>   	else
>   		snum_init = snum_init_46;
>   
> -	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
>   	memcpy(snums, snum_init, qe_num_of_snum);
>   }
>   
> 
