Return-Path: <linuxppc-dev+bounces-428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8064395C776
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqt4Q3Y8Xz2yq4;
	Fri, 23 Aug 2024 18:08:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400518;
	cv=none; b=AwTAsSE0vL2XrSWvozGMkzaD6241XZGYuai1oiNAchtZ2AL/MRH19P6gEEF4aKxvxAAlm2j2f+KhI6f2ox0uTv9uC88mUZ2IPniZ9A5OsXBkocsfrZ6gzdgVnlUFQpSdVXcsK8zsmR3s/bVCLYm1qseHwIJl2vZV8MZnWbdFRhsU+irB6H1s/w7NJF2m+JgZN2JYQ7YacSUY5Xh/7bGvfiXbticI5QQj7frbG3qnq4PtCZbGjHYlMc6S5MXVEMbv9CUaVa7RLj5ZAA3VD0+Br6noluU7D3UHpANK8mmQiJf9bV4AiOOzwJhaFxviGlDvDDHJXuWhogDP5RcXQjWbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400518; c=relaxed/relaxed;
	bh=x6nU32wr6qB8YUiCvYnTtZ4ejF7LltjK+XXwUcFrAGI=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=JRX+YeyI0uKlJ+9bVpiWap4vfbw9ebvBmPHaOZVtHI5ZsUCHl4aly1DrZekwQ8dKrXJeO5WxDnIVE/dG5ETI3hBem3mgrkdpEk1bNSStUPTdkdm/bbP3zI1OLrHf9LVU4dUojhn7JGhIWE/O6dOc+zVdgu5SNiPuLp9kdTPOIbQrdjwzNyzmfjMfqH4IpcAgduplEp4dg6a6Y4pIuRnUy09qgvCnBzfVcg03VsVIeKLLoCPBXiqQSNy5MYNo9rl+KF1vo+jeRfzIQosz9LiIHWTTrfV/VEDBE00WJmVqS0M2CxP4toftBKrU0FSEqRB4HbG98IESE5zAVkoEc1Bk5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqt4P6DYmz2ypx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:08:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wqt4L5lDLz9sRr;
	Fri, 23 Aug 2024 10:08:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXdTfW5WaKOL; Fri, 23 Aug 2024 10:08:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wqt4L4Q3Rz9rvV;
	Fri, 23 Aug 2024 10:08:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 856DA8B77D;
	Fri, 23 Aug 2024 10:08:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id xSweINle_7SH; Fri, 23 Aug 2024 10:08:34 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CA3C88B763;
	Fri, 23 Aug 2024 10:08:33 +0200 (CEST)
Message-ID: <5785e0b0-1f6c-4975-a037-7c6b9a818987@csgroup.eu>
Date: Fri, 23 Aug 2024 10:08:32 +0200
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
Subject: Re: [PATCH v2 14/36] soc: fsl: cpm1: tsa: Add support for QUICC
 Engine (QE) implementation
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-15-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-15-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Add support for the time slot assigner (TSA) available in some
> PowerQUICC SoC that uses a QUICC Engine (QE) block such as MPC8321.
> 
> The QE TSA is similar to the CPM1 TSA except that it uses UCCs (Unified
> Communication Controllers) instead of SCCs (Serial Communication
> Controllers).
> Also, compared against the CPM1 TSA, this QE TSA can handle up to 4 TDMs
> instead of 2 and allows to configure the logic level of sync signals.
> 
> At a lower level, compared against CPM TSA implementation, some
> registers are slightly different even if same features are present.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/Kconfig |   9 +-
>   drivers/soc/fsl/qe/tsa.c   | 329 +++++++++++++++++++++++++++++++++++--
>   2 files changed, 319 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> index fa9ffbed0e92..734744874730 100644
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -31,14 +31,15 @@ config UCC_FAST
>   
>   config UCC
>   	bool
> -	default y if UCC_FAST || UCC_SLOW
> +	default y if UCC_FAST || UCC_SLOW || (CPM_TSA && QUICC_ENGINE)
>   
>   config CPM_TSA
> -	tristate "CPM TSA support"
> +	tristate "CPM/QE TSA support"
>   	depends on OF && HAS_IOMEM
> -	depends on CPM1 || (CPM && COMPILE_TEST)
> +	depends on CPM1 || QUICC_ENGINE || \
> +		   ((CPM || QUICC_ENGINE) && COMPILE_TEST)
>   	help
> -	  Freescale CPM Time Slot Assigner (TSA)
> +	  Freescale CPM/QE Time Slot Assigner (TSA)
>   	  controller.
>   
>   	  This option enables support for this
> diff --git a/drivers/soc/fsl/qe/tsa.c b/drivers/soc/fsl/qe/tsa.c
> index 297721a0d2b6..c540cf9144c0 100644
> --- a/drivers/soc/fsl/qe/tsa.c
> +++ b/drivers/soc/fsl/qe/tsa.c
> @@ -9,6 +9,7 @@
>   
>   #include "tsa.h"
>   #include <dt-bindings/soc/cpm1-fsl,tsa.h>
> +#include <dt-bindings/soc/qe-fsl,tsa.h>
>   #include <linux/bitfield.h>
>   #include <linux/clk.h>
>   #include <linux/io.h>
> @@ -17,6 +18,7 @@
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
> +#include <soc/fsl/qe/ucc.h>
>   
>   /* TSA SI RAM routing tables entry (CPM1) */
>   #define TSA_CPM1_SIRAM_ENTRY_LAST	BIT(16)
> @@ -31,14 +33,37 @@
>   #define TSA_CPM1_SIRAM_ENTRY_CSEL_SMC1	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x5)
>   #define TSA_CPM1_SIRAM_ENTRY_CSEL_SMC2	FIELD_PREP_CONST(TSA_CPM1_SIRAM_ENTRY_CSEL_MASK, 0x6)
>   
> -/* SI mode register (32 bits) */
> +/* TSA SI RAM routing tables entry (QE) */
> +#define TSA_QE_SIRAM_ENTRY_LAST		BIT(0)
> +#define TSA_QE_SIRAM_ENTRY_BYTE		BIT(1)
> +#define TSA_QE_SIRAM_ENTRY_CNT_MASK	GENMASK(4, 2)
> +#define TSA_QE_SIRAM_ENTRY_CNT(x)	FIELD_PREP(TSA_QE_SIRAM_ENTRY_CNT_MASK, x)
> +#define TSA_QE_SIRAM_ENTRY_CSEL_MASK	GENMASK(8, 5)
> +#define TSA_QE_SIRAM_ENTRY_CSEL_NU	FIELD_PREP_CONST(TSA_QE_SIRAM_ENTRY_CSEL_MASK, 0x0)
> +#define TSA_QE_SIRAM_ENTRY_CSEL_UCC5	FIELD_PREP_CONST(TSA_QE_SIRAM_ENTRY_CSEL_MASK, 0x1)
> +#define TSA_QE_SIRAM_ENTRY_CSEL_UCC1	FIELD_PREP_CONST(TSA_QE_SIRAM_ENTRY_CSEL_MASK, 0x9)
> +#define TSA_QE_SIRAM_ENTRY_CSEL_UCC2	FIELD_PREP_CONST(TSA_QE_SIRAM_ENTRY_CSEL_MASK, 0xa)
> +#define TSA_QE_SIRAM_ENTRY_CSEL_UCC3	FIELD_PREP_CONST(TSA_QE_SIRAM_ENTRY_CSEL_MASK, 0xb)
> +#define TSA_QE_SIRAM_ENTRY_CSEL_UCC4	FIELD_PREP_CONST(TSA_QE_SIRAM_ENTRY_CSEL_MASK, 0xc)
> +
> +/*
> + * SI mode register :
> + * - CPM1: 32bit register split in 2*16bit (16bit TDM)
> + * - QE: 4x16bit registers, one per TDM
> + */
>   #define TSA_CPM1_SIMODE		0x00
> +#define TSA_QE_SIAMR		0x00
> +#define TSA_QE_SIBMR		0x02
> +#define TSA_QE_SICMR		0x04
> +#define TSA_QE_SIDMR		0x06
>   #define   TSA_CPM1_SIMODE_SMC2			BIT(31)
>   #define   TSA_CPM1_SIMODE_SMC1			BIT(15)
>   #define   TSA_CPM1_SIMODE_TDMA_MASK		GENMASK(11, 0)
>   #define   TSA_CPM1_SIMODE_TDMA(x)		FIELD_PREP(TSA_CPM1_SIMODE_TDMA_MASK, x)
>   #define   TSA_CPM1_SIMODE_TDMB_MASK		GENMASK(27, 16)
>   #define   TSA_CPM1_SIMODE_TDMB(x)		FIELD_PREP(TSA_CPM1_SIMODE_TDMB_MASK, x)
> +#define     TSA_QE_SIMODE_TDM_SAD_MASK		GENMASK(15, 12)
> +#define     TSA_QE_SIMODE_TDM_SAD(x)		FIELD_PREP(TSA_QE_SIMODE_TDM_SAD_MASK, x)
>   #define     TSA_CPM1_SIMODE_TDM_MASK		GENMASK(11, 0)
>   #define     TSA_SIMODE_TDM_SDM_MASK		GENMASK(11, 10)
>   #define       TSA_SIMODE_TDM_SDM_NORM		FIELD_PREP_CONST(TSA_SIMODE_TDM_SDM_MASK, 0x0)
> @@ -49,7 +74,8 @@
>   #define     TSA_SIMODE_TDM_RFSD(x)		FIELD_PREP(TSA_SIMODE_TDM_RFSD_MASK, x)
>   #define     TSA_SIMODE_TDM_DSC			BIT(7)
>   #define     TSA_SIMODE_TDM_CRT			BIT(6)
> -#define     TSA_CPM1_SIMODE_TDM_STZ		BIT(5)
> +#define     TSA_CPM1_SIMODE_TDM_STZ		BIT(5) /* bit 5: STZ in CPM1 */
> +#define     TSA_QE_SIMODE_TDM_SL		BIT(5) /* bit 5: SL in QE */
>   #define     TSA_SIMODE_TDM_CE			BIT(4)
>   #define     TSA_SIMODE_TDM_FE			BIT(3)
>   #define     TSA_SIMODE_TDM_GM			BIT(2)
> @@ -66,6 +92,13 @@
>   #define   TSA_CPM1_SIGMR_RDM_STATIC_TDMAB	FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x2)
>   #define   TSA_CPM1_SIGMR_RDM_DYN_TDMAB		FIELD_PREP_CONST(TSA_CPM1_SIGMR_RDM_MASK, 0x3)
>   
> +/* QE SI global mode register high (8 bits) */
> +#define TSA_QE_SIGLMRH	0x08
> +#define TSA_QE_SIGLMRH_END	BIT(3)
> +#define TSA_QE_SIGLMRH_ENC	BIT(2)
> +#define TSA_QE_SIGLMRH_ENB	BIT(1)
> +#define TSA_QE_SIGLMRH_ENA	BIT(0)
> +
>   /* SI clock route register (32 bits) */
>   #define TSA_CPM1_SICR	0x0C
>   #define   TSA_CPM1_SICR_SCC2_MASK		GENMASK(15, 8)
> @@ -113,9 +146,12 @@ struct tsa_tdm {
>   
>   #define TSA_TDMA	0
>   #define TSA_TDMB	1
> +#define TSA_TDMC	2 /* QE implementation only */
> +#define TSA_TDMD	3 /* QE implementation only */
>   
>   enum tsa_version {
>   	TSA_CPM1 = 1, /* Avoid 0 value */
> +	TSA_QE,
>   };
>   
>   struct tsa {
> @@ -126,7 +162,15 @@ struct tsa {
>   	spinlock_t	lock; /* Lock for read/modify/write sequence */
>   	enum tsa_version version;
>   	int tdms; /* TSA_TDMx ORed */
> +#if IS_ENABLED(CONFIG_QUICC_ENGINE)
> +	struct tsa_tdm tdm[4]; /* TDMa, TDMb, TDMc and TDMd */
> +#else
>   	struct tsa_tdm tdm[2]; /* TDMa and TDMb */
> +#endif
> +	/* Same number of serials for CPM1 and QE:
> +	 * CPM1: NU, 3 SCCs and 2 SMCs
> +	 * QE: NU and 5 UCCs
> +	 */
>   	struct tsa_serial {
>   		unsigned int id;
>   		struct tsa_serial_info info;
> @@ -144,6 +188,11 @@ static inline void tsa_write32(void __iomem *addr, u32 val)
>   	iowrite32be(val, addr);
>   }
>   
> +static inline void tsa_write16(void __iomem *addr, u16 val)
> +{
> +	iowrite16be(val, addr);
> +}
> +
>   static inline void tsa_write8(void __iomem *addr, u8 val)
>   {
>   	iowrite8(val, addr);
> @@ -154,16 +203,34 @@ static inline u32 tsa_read32(void __iomem *addr)
>   	return ioread32be(addr);
>   }
>   
> +static inline u16 tsa_read16(void __iomem *addr)
> +{
> +	return ioread16be(addr);
> +}
> +
>   static inline void tsa_clrbits32(void __iomem *addr, u32 clr)
>   {
>   	tsa_write32(addr, tsa_read32(addr) & ~clr);
>   }
>   
> +static inline void tsa_clrbits16(void __iomem *addr, u16 clr)
> +{
> +	tsa_write16(addr, tsa_read16(addr) & ~clr);
> +}
> +
>   static inline void tsa_clrsetbits32(void __iomem *addr, u32 clr, u32 set)
>   {
>   	tsa_write32(addr, (tsa_read32(addr) & ~clr) | set);
>   }
>   
> +static bool tsa_is_qe(const struct tsa *tsa)
> +{
> +	if (IS_ENABLED(CONFIG_QUICC_ENGINE) && IS_ENABLED(CONFIG_CPM))
> +		return tsa->version == TSA_QE;
> +
> +	return IS_ENABLED(CONFIG_QUICC_ENGINE);
> +}
> +
>   static int tsa_cpm1_serial_connect(struct tsa_serial *tsa_serial, bool connect)
>   {
>   	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> @@ -197,15 +264,62 @@ static int tsa_cpm1_serial_connect(struct tsa_serial *tsa_serial, bool connect)
>   	return 0;
>   }
>   
> +static int tsa_qe_serial_connect(struct tsa_serial *tsa_serial, bool connect)
> +{
> +	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> +	unsigned long flags;
> +	int ucc_num;
> +	int ret;
> +
> +	switch (tsa_serial->id) {
> +	case FSL_QE_TSA_UCC1:
> +		ucc_num = 0;
> +		break;
> +	case FSL_QE_TSA_UCC2:
> +		ucc_num = 1;
> +		break;
> +	case FSL_QE_TSA_UCC3:
> +		ucc_num = 2;
> +		break;
> +	case FSL_QE_TSA_UCC4:
> +		ucc_num = 3;
> +		break;
> +	case FSL_QE_TSA_UCC5:
> +		ucc_num = 4;
> +		break;
> +	default:
> +		dev_err(tsa->dev, "Unsupported serial id %u\n", tsa_serial->id);
> +		return -EINVAL;
> +	}
> +
> +	spin_lock_irqsave(&tsa->lock, flags);
> +	ret = ucc_set_qe_mux_tsa(ucc_num, connect);
> +	spin_unlock_irqrestore(&tsa->lock, flags);
> +	if (ret) {
> +		dev_err(tsa->dev, "Connect serial id %u to TSA failed (%d)\n",
> +			tsa_serial->id, ret);
> +		return ret;
> +	}
> +	return 0;
> +}
> +
>   int tsa_serial_connect(struct tsa_serial *tsa_serial)
>   {
> -	return tsa_cpm1_serial_connect(tsa_serial, true);
> +	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> +
> +	return tsa_is_qe(tsa) ?
> +		tsa_qe_serial_connect(tsa_serial, true) :
> +		tsa_cpm1_serial_connect(tsa_serial, true);
>   }
>   EXPORT_SYMBOL(tsa_serial_connect);
>   
>   int tsa_serial_disconnect(struct tsa_serial *tsa_serial)
>   {
> -	return tsa_cpm1_serial_connect(tsa_serial, false);
> +	struct tsa *tsa = tsa_serial_get_tsa(tsa_serial);
> +
> +	return tsa_is_qe(tsa) ?
> +		tsa_qe_serial_connect(tsa_serial, false) :
> +		tsa_cpm1_serial_connect(tsa_serial, false);
>   }
>   EXPORT_SYMBOL(tsa_serial_disconnect);
>   
> @@ -268,10 +382,39 @@ static void tsa_cpm1_init_entries_area(struct tsa *tsa, struct tsa_entries_area
>   	}
>   }
>   
> +static void tsa_qe_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
> +				     u32 tdms, u32 tdm_id, bool is_rx)
> +{
> +	resource_size_t eighth;
> +	resource_size_t half;
> +
> +	eighth = tsa->si_ram_sz / 8;
> +	half = tsa->si_ram_sz / 2;
> +
> +	/*
> +	 * One half of the SI RAM used for Tx, the other one for Rx.
> +	 * In each half, 1/4 of the area is assigned to each TDM.
> +	 */
> +	if (is_rx) {
> +		/* Rx: Second half of si_ram */
> +		area->entries_start = tsa->si_ram + half + (eighth * tdm_id);
> +		area->entries_next = area->entries_start + eighth;
> +		area->last_entry = NULL;
> +	} else {
> +		/* Tx: First half of si_ram */
> +		area->entries_start = tsa->si_ram + (eighth * tdm_id);
> +		area->entries_next = area->entries_start + eighth;
> +		area->last_entry = NULL;
> +	}
> +}
> +
>   static void tsa_init_entries_area(struct tsa *tsa, struct tsa_entries_area *area,
>   				  u32 tdms, u32 tdm_id, bool is_rx)
>   {
> -	tsa_cpm1_init_entries_area(tsa, area, tdms, tdm_id, is_rx);
> +	if (tsa_is_qe(tsa))
> +		tsa_qe_init_entries_area(tsa, area, tdms, tdm_id, is_rx);
> +	else
> +		tsa_cpm1_init_entries_area(tsa, area, tdms, tdm_id, is_rx);
>   }
>   
>   static const char *tsa_cpm1_serial_id2name(struct tsa *tsa, u32 serial_id)
> @@ -289,9 +432,26 @@ static const char *tsa_cpm1_serial_id2name(struct tsa *tsa, u32 serial_id)
>   	return NULL;
>   }
>   
> +static const char *tsa_qe_serial_id2name(struct tsa *tsa, u32 serial_id)
> +{
> +	switch (serial_id) {
> +	case FSL_QE_TSA_NU:	return "Not used";
> +	case FSL_QE_TSA_UCC1:	return "UCC1";
> +	case FSL_QE_TSA_UCC2:	return "UCC2";
> +	case FSL_QE_TSA_UCC3:	return "UCC3";
> +	case FSL_QE_TSA_UCC4:	return "UCC4";
> +	case FSL_QE_TSA_UCC5:	return "UCC5";
> +	default:
> +		break;
> +	}
> +	return NULL;
> +}
> +
>   static const char *tsa_serial_id2name(struct tsa *tsa, u32 serial_id)
>   {
> -	return tsa_cpm1_serial_id2name(tsa, serial_id);
> +	return tsa_is_qe(tsa) ?
> +		tsa_qe_serial_id2name(tsa, serial_id) :
> +		tsa_cpm1_serial_id2name(tsa, serial_id);
>   }
>   
>   static u32 tsa_cpm1_serial_id2csel(struct tsa *tsa, u32 serial_id)
> @@ -351,10 +511,69 @@ static int tsa_cpm1_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
>   	return 0;
>   }
>   
> +static u32 tsa_qe_serial_id2csel(struct tsa *tsa, u32 serial_id)
> +{
> +	switch (serial_id) {
> +	case FSL_QE_TSA_UCC1:	return TSA_QE_SIRAM_ENTRY_CSEL_UCC1;
> +	case FSL_QE_TSA_UCC2:	return TSA_QE_SIRAM_ENTRY_CSEL_UCC2;
> +	case FSL_QE_TSA_UCC3:	return TSA_QE_SIRAM_ENTRY_CSEL_UCC3;
> +	case FSL_QE_TSA_UCC4:	return TSA_QE_SIRAM_ENTRY_CSEL_UCC4;
> +	case FSL_QE_TSA_UCC5:	return TSA_QE_SIRAM_ENTRY_CSEL_UCC5;
> +	default:
> +		break;
> +	}
> +	return TSA_QE_SIRAM_ENTRY_CSEL_NU;
> +}
> +
> +static int tsa_qe_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
> +			    u32 count, u32 serial_id)
> +{
> +	void __iomem *addr;
> +	u32 left;
> +	u32 val;
> +	u32 cnt;
> +	u32 nb;
> +
> +	addr = area->last_entry ? area->last_entry + 2 : area->entries_start;
> +
> +	nb = DIV_ROUND_UP(count, 8);
> +	if ((addr + (nb * 2)) > area->entries_next) {
> +		dev_err(tsa->dev, "si ram area full\n");
> +		return -ENOSPC;
> +	}
> +
> +	if (area->last_entry) {
> +		/* Clear last flag */
> +		tsa_clrbits16(area->last_entry, TSA_QE_SIRAM_ENTRY_LAST);
> +	}
> +
> +	left = count;
> +	while (left) {
> +		val = TSA_QE_SIRAM_ENTRY_BYTE | tsa_qe_serial_id2csel(tsa, serial_id);
> +
> +		if (left > 8) {
> +			cnt = 8;
> +		} else {
> +			cnt = left;
> +			val |= TSA_QE_SIRAM_ENTRY_LAST;
> +			area->last_entry = addr;
> +		}
> +		val |= TSA_QE_SIRAM_ENTRY_CNT(cnt - 1);
> +
> +		tsa_write16(addr, val);
> +		addr += 2;
> +		left -= cnt;
> +	}
> +
> +	return 0;
> +}
> +
>   static int tsa_add_entry(struct tsa *tsa, struct tsa_entries_area *area,
>   			 u32 count, u32 serial_id)
>   {
> -	return tsa_cpm1_add_entry(tsa, area, count, serial_id);
> +	return tsa_is_qe(tsa) ?
> +		tsa_qe_add_entry(tsa, area, count, serial_id) :
> +		tsa_cpm1_add_entry(tsa, area, count, serial_id);
>   }
>   
>   static int tsa_of_parse_tdm_route(struct tsa *tsa, struct device_node *tdm_np,
> @@ -470,7 +689,18 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   		case 1:
>   			tsa->tdms |= BIT(TSA_TDMB);
>   			break;
> +		case 2:
> +			if (!tsa_is_qe(tsa))
> +				goto invalid_tdm; /* Not available on CPM1 */
> +			tsa->tdms |= BIT(TSA_TDMC);
> +			break;
> +		case 3:
> +			if (!tsa_is_qe(tsa))
> +				goto invalid_tdm;  /* Not available on CPM1 */
> +			tsa->tdms |= BIT(TSA_TDMD);
> +			break;
>   		default:
> +invalid_tdm:
>   			dev_err(tsa->dev, "%pOF: Invalid tdm_id (%u)\n", tdm_np,
>   				tdm_id);
>   			of_node_put(tdm_np);
> @@ -536,10 +766,14 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   		if (of_property_read_bool(tdm_np, "fsl,fsync-rising-edge"))
>   			tdm->simode_tdm |= TSA_SIMODE_TDM_FE;
>   
> +		if (tsa_is_qe(tsa) &&
> +		    of_property_read_bool(tdm_np, "fsl,fsync-active-low"))
> +			tdm->simode_tdm |= TSA_QE_SIMODE_TDM_SL;
> +
>   		if (of_property_read_bool(tdm_np, "fsl,double-speed-clock"))
>   			tdm->simode_tdm |= TSA_SIMODE_TDM_DSC;
>   
> -		clk = of_clk_get_by_name(tdm_np, "l1rsync");
> +		clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "rsync" : "l1rsync");
>   		if (IS_ERR(clk)) {
>   			ret = PTR_ERR(clk);
>   			of_node_put(tdm_np);
> @@ -553,7 +787,7 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   		}
>   		tdm->l1rsync_clk = clk;
>   
> -		clk = of_clk_get_by_name(tdm_np, "l1rclk");
> +		clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "rclk" : "l1rclk");
>   		if (IS_ERR(clk)) {
>   			ret = PTR_ERR(clk);
>   			of_node_put(tdm_np);
> @@ -568,7 +802,7 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   		tdm->l1rclk_clk = clk;
>   
>   		if (!(tdm->simode_tdm & TSA_SIMODE_TDM_CRT)) {
> -			clk = of_clk_get_by_name(tdm_np, "l1tsync");
> +			clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "tsync" : "l1tsync");
>   			if (IS_ERR(clk)) {
>   				ret = PTR_ERR(clk);
>   				of_node_put(tdm_np);
> @@ -582,7 +816,7 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   			}
>   			tdm->l1tsync_clk = clk;
>   
> -			clk = of_clk_get_by_name(tdm_np, "l1tclk");
> +			clk = of_clk_get_by_name(tdm_np, tsa_is_qe(tsa) ? "tclk" : "l1tclk");
>   			if (IS_ERR(clk)) {
>   				ret = PTR_ERR(clk);
>   				of_node_put(tdm_np);
> @@ -597,6 +831,17 @@ static int tsa_of_parse_tdms(struct tsa *tsa, struct device_node *np)
>   			tdm->l1tclk_clk = clk;
>   		}
>   
> +		if (tsa_is_qe(tsa)) {
> +			/*
> +			 * The starting address for TSA table must be set.
> +			 * 512 entries for Tx and 512 entries for Rx are
> +			 * available for 4 TDMs.
> +			 * We assign entries equally -> 128 Rx/Tx entries per
> +			 * TDM. In other words, 4 blocks of 32 entries per TDM.
> +			 */
> +			tdm->simode_tdm |= TSA_QE_SIMODE_TDM_SAD(4 * tdm_id);
> +		}
> +
>   		ret = tsa_of_parse_tdm_rx_route(tsa, tdm_np, tsa->tdms, tdm_id);
>   		if (ret) {
>   			of_node_put(tdm_np);
> @@ -640,8 +885,13 @@ static void tsa_init_si_ram(struct tsa *tsa)
>   	resource_size_t i;
>   
>   	/* Fill all entries as the last one */
> -	for (i = 0; i < tsa->si_ram_sz; i += 4)
> -		tsa_write32(tsa->si_ram + i, TSA_CPM1_SIRAM_ENTRY_LAST);
> +	if (tsa_is_qe(tsa)) {
> +		for (i = 0; i < tsa->si_ram_sz; i += 2)
> +			tsa_write16(tsa->si_ram + i, TSA_QE_SIRAM_ENTRY_LAST);
> +	} else {
> +		for (i = 0; i < tsa->si_ram_sz; i += 4)
> +			tsa_write32(tsa->si_ram + i, TSA_CPM1_SIRAM_ENTRY_LAST);
> +	}
>   }
>   
>   static int tsa_cpm1_setup(struct tsa *tsa)
> @@ -672,9 +922,50 @@ static int tsa_cpm1_setup(struct tsa *tsa)
>   	return 0;
>   }
>   
> +static int tsa_qe_setup(struct tsa *tsa)
> +{
> +	unsigned int sixmr;
> +	u8 siglmrh = 0;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(tsa->tdm); i++) {
> +		if (!tsa->tdm[i].is_enable)
> +			continue;
> +
> +		switch (i) {
> +		case 0:
> +			sixmr = TSA_QE_SIAMR;
> +			siglmrh |= TSA_QE_SIGLMRH_ENA;
> +			break;
> +		case 1:
> +			sixmr = TSA_QE_SIBMR;
> +			siglmrh |= TSA_QE_SIGLMRH_ENB;
> +			break;
> +		case 2:
> +			sixmr = TSA_QE_SICMR;
> +			siglmrh |= TSA_QE_SIGLMRH_ENC;
> +			break;
> +		case 3:
> +			sixmr = TSA_QE_SIDMR;
> +			siglmrh |= TSA_QE_SIGLMRH_END;
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		/* Set SI mode register */
> +		tsa_write16(tsa->si_regs + sixmr, tsa->tdm[i].simode_tdm);
> +	}
> +
> +	/* Enable TDMs */
> +	tsa_write8(tsa->si_regs + TSA_QE_SIGLMRH, siglmrh);
> +
> +	return 0;
> +}
> +
>   static int tsa_setup(struct tsa *tsa)
>   {
> -	return tsa_cpm1_setup(tsa);
> +	return tsa_is_qe(tsa) ? tsa_qe_setup(tsa) : tsa_cpm1_setup(tsa);
>   }
>   
>   static int tsa_probe(struct platform_device *pdev)
> @@ -695,6 +986,9 @@ static int tsa_probe(struct platform_device *pdev)
>   	case TSA_CPM1:
>   		dev_info(tsa->dev, "CPM1 version\n");
>   		break;
> +	case TSA_QE:
> +		dev_info(tsa->dev, "QE version\n");
> +		break;
>   	default:
>   		dev_err(tsa->dev, "Unknown version (%d)\n", tsa->version);
>   		return -EINVAL;
> @@ -760,7 +1054,12 @@ static void tsa_remove(struct platform_device *pdev)
>   }
>   
>   static const struct of_device_id tsa_id_table[] = {
> +#if IS_ENABLED(CONFIG_CPM1)
>   	{ .compatible = "fsl,cpm1-tsa", .data = (void *)TSA_CPM1 },
> +#endif
> +#if IS_ENABLED(CONFIG_QUICC_ENGINE)
> +	{ .compatible = "fsl,qe-tsa", .data = (void *)TSA_QE },
> +#endif
>   	{} /* sentinel */
>   };
>   MODULE_DEVICE_TABLE(of, tsa_id_table);
> @@ -869,5 +1168,5 @@ struct tsa_serial *devm_tsa_serial_get_byphandle(struct device *dev,
>   EXPORT_SYMBOL(devm_tsa_serial_get_byphandle);
>   
>   MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
> -MODULE_DESCRIPTION("CPM TSA driver");
> +MODULE_DESCRIPTION("CPM/QE TSA driver");
>   MODULE_LICENSE("GPL");

