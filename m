Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE2FEBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 19:20:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tpFY5fjpzDqR6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 03:20:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="UDLJlhBF"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tpCz62bDzDqNn
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 03:19:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 44tpCv00Zkz9v1kM;
 Tue, 30 Apr 2019 19:19:07 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=UDLJlhBF; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rKe8bcM0kqZZ; Tue, 30 Apr 2019 19:19:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 44tpCt5h8rz9v1kF;
 Tue, 30 Apr 2019 19:19:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1556644746; bh=8M9gBHLm9qLvpKuZX/2ssSbHZfFKU8w8o0K+AXL3j6o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UDLJlhBFtSat+7juCpwpai6J+FXOCEyq4VXAoPPRThPSgZT484ylZa/AuqFsDhQQt
 xovxPbswSQzR14ffx8wMPLNOtUo3+ADODFGJqkRt3KwbLYSEjkr/WuOQwkyhL/eypA
 ot7Rx5E4eT0Go6ISIxv7Sdc/0wzZ7J1sQWjS8QBQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7E11F8B8F3;
 Tue, 30 Apr 2019 19:19:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ROkgZ5J4l8t6; Tue, 30 Apr 2019 19:19:08 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D37A18B8DF;
 Tue, 30 Apr 2019 19:19:07 +0200 (CEST)
Subject: Re: [PATCH 4/5] soc/fsl/qe: qe.c: support fsl,qe-snums property
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
 Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>
References: <20190430133615.25721-1-rasmus.villemoes@prevas.dk>
 <20190430133615.25721-5-rasmus.villemoes@prevas.dk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <4c1c4fe8-9412-2543-e9bc-83b7e5d7c202@c-s.fr>
Date: Tue, 30 Apr 2019 19:19:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430133615.25721-5-rasmus.villemoes@prevas.dk>
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
> The current code assumes that the set of snum _values_ to populate the
> snums[] array with is a function of the _number_ of snums
> alone. However, reading table 4-30, and its footnotes, of the QUICC
> Engine Block Reference Manual shows that that is a bit too naive.
> 
> As an alternative, this introduces a new binding fsl,qe-snums, which
> automatically encodes both the number of snums and the actual values to
> use. Conveniently, of_property_read_variable_u8_array does exactly
> what we need.
> 
> For example, for the MPC8309, one would specify the property as
> 
>                 fsl,qe-snums = /bits/ 8 <
>                         0x88 0x89 0x98 0x99 0xa8 0xa9 0xb8 0xb9
>                         0xc8 0xc9 0xd8 0xd9 0xe8 0xe9>;
> 
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>   .../devicetree/bindings/soc/fsl/cpm_qe/qe.txt      |  8 +++++++-
>   drivers/soc/fsl/qe/qe.c                            | 14 +++++++++++++-
>   2 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt
> index d7afaff5faff..05f5f485562a 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe.txt
> @@ -18,7 +18,8 @@ Required properties:
>   - reg : offset and length of the device registers.
>   - bus-frequency : the clock frequency for QUICC Engine.
>   - fsl,qe-num-riscs: define how many RISC engines the QE has.
> -- fsl,qe-num-snums: define how many serial number(SNUM) the QE can use for the
> +- fsl,qe-snums: This property has to be specified as '/bits/ 8' value,
> +  defining the array of serial number (SNUM) values for the virtual
>     threads.
>   
>   Optional properties:
> @@ -34,6 +35,11 @@ Recommended properties
>   - brg-frequency : the internal clock source frequency for baud-rate
>     generators in Hz.
>   
> +Deprecated properties
> +- fsl,qe-num-snums: define how many serial number(SNUM) the QE can use
> +  for the threads. Use fsl,qe-snums instead to not only specify the
> +  number of snums, but also their values.
> +
>   Example:
>        qe@e0100000 {
>   	#address-cells = <1>;
> diff --git a/drivers/soc/fsl/qe/qe.c b/drivers/soc/fsl/qe/qe.c
> index aff9d1373529..af3c2b2b268f 100644
> --- a/drivers/soc/fsl/qe/qe.c
> +++ b/drivers/soc/fsl/qe/qe.c
> @@ -283,7 +283,6 @@ EXPORT_SYMBOL(qe_clock_source);
>    */
>   static void qe_snums_init(void)
>   {
> -	int i;

Why do you move this one ?

>   	static const u8 snum_init_76[] = {
>   		0x04, 0x05, 0x0C, 0x0D, 0x14, 0x15, 0x1C, 0x1D,
>   		0x24, 0x25, 0x2C, 0x2D, 0x34, 0x35, 0x88, 0x89,
> @@ -304,9 +303,22 @@ static void qe_snums_init(void)
>   		0x28, 0x29, 0x38, 0x39, 0x48, 0x49, 0x58, 0x59,
>   		0x68, 0x69, 0x78, 0x79, 0x80, 0x81,
>   	};
> +	struct device_node *qe;
>   	const u8 *snum_init;
> +	int i;
>   
>   	bitmap_zero(snum_state, QE_NUM_OF_SNUM);
> +	qe = qe_get_device_node();
> +	if (qe) {
> +		i = of_property_read_variable_u8_array(qe, "fsl,qe-snums",
> +						       snums, 1, QE_NUM_OF_SNUM);
> +		of_node_put(qe);
> +		if (i > 0) {
> +			qe_num_of_snum = i;
> +			return;

In that case you skip the rest of the init ? Can you explain ?

Christophe

> +		}
> +	}
> +
>   	qe_num_of_snum = qe_get_num_of_snums();
>   
>   	if (qe_num_of_snum == 76)
> 
