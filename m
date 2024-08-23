Return-Path: <linuxppc-dev+bounces-446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED37595C7C5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 10:14:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqtCL6sN7z309W;
	Fri, 23 Aug 2024 18:14:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724400878;
	cv=none; b=c0Dv/Qdl8sbqN9cIAtFjQHL8NmhyDI1mKIxsD5PPgqVT9DrHg6A5AgSYaEIRNcDVHgizPwJzFLcWGC+RxaaYk0rqQfk+txBuE8U2jCHRDFIYC24K+iT5C2wIPglUUGG8wb3id/XXXPkY+C46bfv5cNbfdS9lIZw77dv4CZBGSEsVMtGSNCwIuVSGmybVBt1yAbtAgtmpgVcKyKwPUl6UJVrzLmbfHs4DCi+zat4RQu+xPWdvrboydjmP/qf3x+BJz9Vbfq6u4YNdFELqcW0WBflOJSopHgm2AlkOjVPgj7tqqED26t264zYIJyW9YZ7/po8JCxtVGCfiixq83yPTnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724400878; c=relaxed/relaxed;
	bh=NbLw9dO1rV2PMkimMEc92UBTFK7Y7CVtxNTTmL4lhR8=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=lSm4DXeOjrHMuJ3V6U2C9EK7RQWBy2j/d/YqDIrbqEyEdBfFmwz8N9dID6Ko8TXzh1j+tQfwG/lhshjcy2nGLkrhvSGbfGDWP7UTwX2RM9r92D+FHCK9Aj2XAIaSpHqTxP7q0CXyOA61DhabGhUig/8/LCn6fzVJFr8S2OQFtAkzi2hShmYFMNVBQMutYS+jBwbDqU1HT/6XEYq5DsezjGjCIMTToYpN7L1rcIjldMN6tLNrXKAuRCuRLqfEkCKzRBtevtrAMHxp8ocuSSOQgd2tcgMdql2IoEz4PnwHD+68fEASMijyDgBWvObOC+tQClS+88eO85BqFiXqNrleMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqtCL2nqgz3094
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 18:14:38 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WqtCH48bPz9sRr;
	Fri, 23 Aug 2024 10:14:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rmBw-5KNRs2O; Fri, 23 Aug 2024 10:14:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WqtCH2z51z9rvV;
	Fri, 23 Aug 2024 10:14:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 536C68B77D;
	Fri, 23 Aug 2024 10:14:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id jiQWCn7DIRyZ; Fri, 23 Aug 2024 10:14:35 +0200 (CEST)
Received: from [192.168.233.10] (PO24418.IDSI0.si.c-s.fr [192.168.233.10])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A38C68B763;
	Fri, 23 Aug 2024 10:14:34 +0200 (CEST)
Message-ID: <44115cf1-232c-41db-a66d-8e6989f20ac9@csgroup.eu>
Date: Fri, 23 Aug 2024 10:14:33 +0200
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
Subject: Re: [PATCH v2 34/36] soc: fsl: cpm1: qmc: Add support for QUICC
 Engine (QE) implementation
To: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240808071132.149251-1-herve.codina@bootlin.com>
 <20240808071132.149251-35-herve.codina@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240808071132.149251-35-herve.codina@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 08/08/2024 à 09:11, Herve Codina a écrit :
> Add support for the QMC (QUICC Multichannel Controller) available in
> some PowerQUICC SoC that uses a QUICC Engine (QE) block such as MPC8321.
> 
> This QE QMC is similar to the CPM QMC except that it uses UCCs (Unified
> Communication Controllers) instead of SCCs (Serial Communication
> Controllers). Also, compared against the CPM QMC, this QE QMC does not
> use a fixed area for the UCC/SCC parameters area but it uses a dynamic
> area allocated and provided to the hardware at runtime.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/soc/fsl/qe/Kconfig |   9 +-
>   drivers/soc/fsl/qe/qmc.c   | 209 +++++++++++++++++++++++++++++++++++--
>   2 files changed, 204 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/soc/fsl/qe/Kconfig b/drivers/soc/fsl/qe/Kconfig
> index 734744874730..5e3c996eb19e 100644
> --- a/drivers/soc/fsl/qe/Kconfig
> +++ b/drivers/soc/fsl/qe/Kconfig
> @@ -17,7 +17,7 @@ config QUICC_ENGINE
>   
>   config UCC_SLOW
>   	bool
> -	default y if SERIAL_QE
> +	default y if SERIAL_QE || (CPM_QMC && QUICC_ENGINE)
>   	help
>   	  This option provides qe_lib support to UCC slow
>   	  protocols: UART, BISYNC, QMC
> @@ -46,12 +46,13 @@ config CPM_TSA
>   	  controller
>   
>   config CPM_QMC
> -	tristate "CPM QMC support"
> +	tristate "CPM/QE QMC support"
>   	depends on OF && HAS_IOMEM
> -	depends on CPM1 || (FSL_SOC && CPM && COMPILE_TEST)
> +	depends on CPM1 || QUICC_ENGINE || \
> +		   (FSL_SOC && (CPM || QUICC_ENGINE) && COMPILE_TEST)
>   	depends on CPM_TSA
>   	help
> -	  Freescale CPM QUICC Multichannel Controller
> +	  Freescale CPM/QE QUICC Multichannel Controller
>   	  (QMC)
>   
>   	  This option enables support for this
> diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
> index 8ff7eaaa4c50..b3a9534441ee 100644
> --- a/drivers/soc/fsl/qe/qmc.c
> +++ b/drivers/soc/fsl/qe/qmc.c
> @@ -19,24 +19,29 @@
>   #include <linux/platform_device.h>
>   #include <linux/slab.h>
>   #include <soc/fsl/cpm.h>
> +#include <soc/fsl/qe/ucc_slow.h>
> +#include <soc/fsl/qe/qe.h>
>   #include <sysdev/fsl_soc.h>
>   #include "tsa.h"
>   
> -/* SCC general mode register high (32 bits) */
> +/* SCC general mode register low (32 bits) (GUMR_L in QE) */
>   #define SCC_GSMRL	0x00
>   #define SCC_GSMRL_ENR		BIT(5)
>   #define SCC_GSMRL_ENT		BIT(4)
>   #define SCC_GSMRL_MODE_MASK	GENMASK(3, 0)
>   #define SCC_CPM1_GSMRL_MODE_QMC	FIELD_PREP_CONST(SCC_GSMRL_MODE_MASK, 0x0A)
> +#define SCC_QE_GSMRL_MODE_QMC	FIELD_PREP_CONST(SCC_GSMRL_MODE_MASK, 0x02)
>   
> -/* SCC general mode register low (32 bits) */
> +/* SCC general mode register high (32 bits) (identical to GUMR_H in QE) */
>   #define SCC_GSMRH	0x04
>   #define   SCC_GSMRH_CTSS	BIT(7)
>   #define   SCC_GSMRH_CDS		BIT(8)
>   #define   SCC_GSMRH_CTSP	BIT(9)
>   #define   SCC_GSMRH_CDP		BIT(10)
> +#define   SCC_GSMRH_TTX		BIT(11)
> +#define   SCC_GSMRH_TRX		BIT(12)
>   
> -/* SCC event register (16 bits) */
> +/* SCC event register (16 bits) (identical to UCCE in QE) */
>   #define SCC_SCCE	0x10
>   #define   SCC_SCCE_IQOV		BIT(3)
>   #define   SCC_SCCE_GINT		BIT(2)
> @@ -45,6 +50,10 @@
>   
>   /* SCC mask register (16 bits) */
>   #define SCC_SCCM	0x14
> +
> +/* UCC Extended Mode Register (8 bits, QE only) */
> +#define SCC_QE_UCC_GUEMR	0x90
> +
>   /* Multichannel base pointer (32 bits) */
>   #define QMC_GBL_MCBASE		0x00
>   /* Multichannel controller state (16 bits) */
> @@ -75,6 +84,15 @@
>   #define QMC_GBL_TSATTX		0x60
>   /* CRC constant (16 bits) */
>   #define QMC_GBL_C_MASK16	0xA0
> +/* Rx framer base pointer (16 bits, QE only) */
> +#define QMC_QE_GBL_RX_FRM_BASE	0xAC
> +/* Tx framer base pointer (16 bits, QE only) */
> +#define QMC_QE_GBL_TX_FRM_BASE	0xAE
> +/* A reserved area (0xB0 -> 0xC3) that must be initialized to 0 (QE only) */
> +#define QMC_QE_GBL_RSV_B0_START	0xB0
> +#define QMC_QE_GBL_RSV_B0_SIZE	0x14
> +/* QMC Global Channel specific base (32 bits, QE only) */
> +#define QMC_QE_GBL_GCSBASE	0xC4
>   
>   /* TSA entry (16bit entry in TSATRX and TSATTX) */
>   #define QMC_TSA_VALID		BIT(15)
> @@ -217,6 +235,7 @@ struct qmc_chan {
>   
>   enum qmc_version {
>   	QMC_CPM1,
> +	QMC_QE,
>   };
>   
>   struct qmc_data {
> @@ -237,6 +256,8 @@ struct qmc {
>   	void __iomem *scc_pram;
>   	void __iomem *dpram;
>   	u16 scc_pram_offset;
> +	u32 dpram_offset;
> +	u32 qe_subblock;
>   	cbd_t __iomem *bd_table;
>   	dma_addr_t bd_dma_addr;
>   	size_t bd_size;
> @@ -249,6 +270,11 @@ struct qmc {
>   	struct qmc_chan *chans[64];
>   };
>   
> +static void qmc_write8(void __iomem *addr, u8 val)
> +{
> +	iowrite8(val, addr);
> +}
> +
>   static void qmc_write16(void __iomem *addr, u16 val)
>   {
>   	iowrite16be(val, addr);
> @@ -289,6 +315,14 @@ static void qmc_setbits32(void __iomem *addr, u32 set)
>   	qmc_write32(addr, qmc_read32(addr) | set);
>   }
>   
> +static bool qmc_is_qe(const struct qmc *qmc)
> +{
> +	if (IS_ENABLED(CONFIG_QUICC_ENGINE) && IS_ENABLED(CONFIG_CPM))
> +		return qmc->data->version == QMC_QE;
> +
> +	return IS_ENABLED(CONFIG_QUICC_ENGINE);
> +}
> +
>   int qmc_chan_get_info(struct qmc_chan *chan, struct qmc_chan_info *info)
>   {
>   	struct tsa_serial_info tsa_info;
> @@ -806,6 +840,13 @@ static int qmc_chan_cpm1_command(struct qmc_chan *chan, u8 qmc_opcode)
>   	return cpm_command(chan->id << 2, (qmc_opcode << 4) | 0x0E);
>   }
>   
> +static int qmc_chan_qe_command(struct qmc_chan *chan, u32 cmd)
> +{
> +	if (!qe_issue_cmd(cmd, chan->qmc->qe_subblock, chan->id, 0))
> +		return -EIO;
> +	return 0;
> +}
> +
>   static int qmc_chan_stop_rx(struct qmc_chan *chan)
>   {
>   	unsigned long flags;
> @@ -820,7 +861,9 @@ static int qmc_chan_stop_rx(struct qmc_chan *chan)
>   	}
>   
>   	/* Send STOP RECEIVE command */
> -	ret = qmc_chan_cpm1_command(chan, 0x0);
> +	ret = qmc_is_qe(chan->qmc) ?
> +		qmc_chan_qe_command(chan, QE_QMC_STOP_RX) :
> +		qmc_chan_cpm1_command(chan, 0x0);
>   	if (ret) {
>   		dev_err(chan->qmc->dev, "chan %u: Send STOP RECEIVE failed (%d)\n",
>   			chan->id, ret);
> @@ -857,7 +900,9 @@ static int qmc_chan_stop_tx(struct qmc_chan *chan)
>   	}
>   
>   	/* Send STOP TRANSMIT command */
> -	ret = qmc_chan_cpm1_command(chan, 0x1);
> +	ret = qmc_is_qe(chan->qmc) ?
> +		qmc_chan_qe_command(chan, QE_QMC_STOP_TX) :
> +		qmc_chan_cpm1_command(chan, 0x1);
>   	if (ret) {
>   		dev_err(chan->qmc->dev, "chan %u: Send STOP TRANSMIT failed (%d)\n",
>   			chan->id, ret);
> @@ -1627,9 +1672,62 @@ static int qmc_cpm1_init_resources(struct qmc *qmc, struct platform_device *pdev
>   	return 0;
>   }
>   
> +static int qmc_qe_init_resources(struct qmc *qmc, struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	int ucc_num;
> +	s32 info;
> +
> +	qmc->scc_regs = devm_platform_ioremap_resource_byname(pdev, "ucc_regs");
> +	if (IS_ERR(qmc->scc_regs))
> +		return PTR_ERR(qmc->scc_regs);
> +
> +	ucc_num = tsa_serial_get_num(qmc->tsa_serial);
> +	if (ucc_num < 0)
> +		return dev_err_probe(qmc->dev, ucc_num, "Failed to get UCC num\n");
> +
> +	qmc->qe_subblock = ucc_slow_get_qe_cr_subblock(ucc_num);
> +	if (qmc->qe_subblock == QE_CR_SUBBLOCK_INVALID) {
> +		dev_err(qmc->dev, "Unsupported ucc num %u\n", ucc_num);
> +		return -EINVAL;
> +	}
> +	/* Allocate the 'Global Multichannel Parameters' and the
> +	 * 'Framer parameters' areas. The 'Framer parameters' area
> +	 * is located right after the 'Global Multichannel Parameters'.
> +	 * The 'Framer parameters' need 1 byte per receive and transmit
> +	 * channel. The maximum number of receive or transmit channel
> +	 * is 64. So reserve 2 * 64 bytes for the 'Framer parameters'.
> +	 */
> +	info = devm_qe_muram_alloc(qmc->dev, UCC_SLOW_PRAM_SIZE + 2 * 64,
> +				   ALIGNMENT_OF_UCC_SLOW_PRAM);
> +	if (IS_ERR_VALUE(info)) {
> +		dev_err(qmc->dev, "cannot allocate MURAM for PRAM");
> +		return -ENOMEM;
> +	}
> +	if (!qe_issue_cmd(QE_ASSIGN_PAGE_TO_DEVICE, qmc->qe_subblock,
> +			  QE_CR_PROTOCOL_UNSPECIFIED, info)) {
> +		dev_err(qmc->dev, "QE_ASSIGN_PAGE_TO_DEVICE cmd failed");
> +		return -EIO;
> +	}
> +	qmc->scc_pram = qe_muram_addr(info);
> +	qmc->scc_pram_offset = info;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "dpram");
> +	if (!res)
> +		return -EINVAL;
> +	qmc->dpram_offset = res->start - qe_muram_dma(qe_muram_addr(0));
> +	qmc->dpram = devm_ioremap_resource(qmc->dev, res);
> +	if (IS_ERR(qmc->scc_pram))
> +		return PTR_ERR(qmc->scc_pram);
> +
> +	return 0;
> +}
> +
>   static int qmc_init_resources(struct qmc *qmc, struct platform_device *pdev)
>   {
> -	return qmc_cpm1_init_resources(qmc, pdev);
> +	return qmc_is_qe(qmc) ?
> +		qmc_qe_init_resources(qmc, pdev) :
> +		qmc_cpm1_init_resources(qmc, pdev);
>   }
>   
>   static int qmc_cpm1_init_scc(struct qmc *qmc)
> @@ -1656,9 +1754,69 @@ static int qmc_cpm1_init_scc(struct qmc *qmc)
>   	return 0;
>   }
>   
> +static int qmc_qe_init_ucc(struct qmc *qmc)
> +{
> +	u32 val;
> +	int ret;
> +
> +	/* Set the UCC in slow mode */
> +	qmc_write8(qmc->scc_regs + SCC_QE_UCC_GUEMR,
> +		   UCC_GUEMR_SET_RESERVED3 | UCC_GUEMR_MODE_SLOW_RX | UCC_GUEMR_MODE_SLOW_TX);
> +
> +	/* Connect the serial (UCC) to TSA */
> +	ret = tsa_serial_connect(qmc->tsa_serial);
> +	if (ret)
> +		return dev_err_probe(qmc->dev, ret, "Failed to connect TSA serial\n");
> +
> +	/* Initialize the QMC tx startup addresses */
> +	if (!qe_issue_cmd(QE_PUSHSCHED, qmc->qe_subblock,
> +			  QE_CR_PROTOCOL_UNSPECIFIED, 0x80)) {
> +		dev_err(qmc->dev, "QE_CMD_PUSH_SCHED tx cmd failed");
> +		ret = -EIO;
> +		goto err_tsa_serial_disconnect;
> +	}
> +
> +	/* Initialize the QMC rx startup addresses */
> +	if (!qe_issue_cmd(QE_PUSHSCHED, qmc->qe_subblock | 0x00020000,
> +			  QE_CR_PROTOCOL_UNSPECIFIED, 0x82)) {
> +		dev_err(qmc->dev, "QE_CMD_PUSH_SCHED rx cmd failed");
> +		ret = -EIO;
> +		goto err_tsa_serial_disconnect;
> +	}
> +
> +	/* Re-init RXPTR and TXPTR with the content of RX_S_PTR and
> +	 * TX_S_PTR (RX_S_PTR and TX_S_PTR are initialized during
> +	 * qmc_setup_tsa() call
> +	 */
> +	val = qmc_read16(qmc->scc_pram + QMC_GBL_RX_S_PTR);
> +	qmc_write16(qmc->scc_pram + QMC_GBL_RXPTR, val);
> +	val = qmc_read16(qmc->scc_pram + QMC_GBL_TX_S_PTR);
> +	qmc_write16(qmc->scc_pram + QMC_GBL_TXPTR, val);
> +
> +	/* Init GUMR_H and GUMR_L registers (SCC GSMR_H and GSMR_L) */
> +	val = SCC_GSMRH_CDS | SCC_GSMRH_CTSS | SCC_GSMRH_CDP | SCC_GSMRH_CTSP |
> +	      SCC_GSMRH_TRX | SCC_GSMRH_TTX;
> +	qmc_write32(qmc->scc_regs + SCC_GSMRH, val);
> +
> +	/* enable QMC mode */
> +	qmc_write32(qmc->scc_regs + SCC_GSMRL, SCC_QE_GSMRL_MODE_QMC);
> +
> +	/* Disable and clear interrupts */
> +	qmc_write16(qmc->scc_regs + SCC_SCCM, 0x0000);
> +	qmc_write16(qmc->scc_regs + SCC_SCCE, 0x000F);
> +
> +	return 0;
> +
> +err_tsa_serial_disconnect:
> +	tsa_serial_disconnect(qmc->tsa_serial);
> +	return ret;
> +}
> +
>   static int qmc_init_xcc(struct qmc *qmc)
>   {
> -	return qmc_cpm1_init_scc(qmc);
> +	return qmc_is_qe(qmc) ?
> +		qmc_qe_init_ucc(qmc) :
> +		qmc_cpm1_init_scc(qmc);
>   }
>   
>   static void qmc_exit_xcc(struct qmc *qmc)
> @@ -1742,6 +1900,22 @@ static int qmc_probe(struct platform_device *pdev)
>   	qmc_write32(qmc->scc_pram + QMC_GBL_C_MASK32, 0xDEBB20E3);
>   	qmc_write16(qmc->scc_pram + QMC_GBL_C_MASK16, 0xF0B8);
>   
> +	if (qmc_is_qe(qmc)) {
> +		/* Zeroed the reserved area */
> +		memset_io(qmc->scc_pram + QMC_QE_GBL_RSV_B0_START, 0,
> +			  QMC_QE_GBL_RSV_B0_SIZE);
> +
> +		qmc_write32(qmc->scc_pram + QMC_QE_GBL_GCSBASE, qmc->dpram_offset);
> +
> +		/* Init 'framer parameters' area and set the base addresses */
> +		memset_io(qmc->scc_pram + UCC_SLOW_PRAM_SIZE, 0x01, 64);
> +		memset_io(qmc->scc_pram + UCC_SLOW_PRAM_SIZE + 64, 0x01, 64);
> +		qmc_write16(qmc->scc_pram + QMC_QE_GBL_RX_FRM_BASE,
> +			    qmc->scc_pram_offset + UCC_SLOW_PRAM_SIZE);
> +		qmc_write16(qmc->scc_pram + QMC_QE_GBL_TX_FRM_BASE,
> +			    qmc->scc_pram_offset + UCC_SLOW_PRAM_SIZE + 64);
> +	}
> +
>   	ret = qmc_init_tsa(qmc);
>   	if (ret)
>   		return ret;
> @@ -1757,7 +1931,7 @@ static int qmc_probe(struct platform_device *pdev)
>   	if (ret)
>   		return ret;
>   
> -	/* Init SCC */
> +	/* Init SCC (CPM1) or UCC (QE) */
>   	ret = qmc_init_xcc(qmc);
>   	if (ret)
>   		return ret;
> @@ -1811,7 +1985,7 @@ static void qmc_remove(struct platform_device *pdev)
>   	/* Disable interrupts */
>   	qmc_write16(qmc->scc_regs + SCC_SCCM, 0);
>   
> -	/* Exit SCC */
> +	/* Exit SCC (CPM1) or UCC (QE) */
>   	qmc_exit_xcc(qmc);
>   }
>   
> @@ -1825,8 +1999,23 @@ static const struct qmc_data qmc_data_cpm1 = {
>   	.rpack = 0x00000000,
>   };
>   
> +static const struct qmc_data qmc_data_qe = {
> +	.version = QMC_QE,
> +	.tstate = 0x30000000,
> +	.rstate = 0x30000000,
> +	.zistate = 0x00000200,
> +	.zdstate_hdlc = 0x80FFFFE0,
> +	.zdstate_transp = 0x003FFFE2,
> +	.rpack = 0x80000000,
> +};
> +
>   static const struct of_device_id qmc_id_table[] = {
> +#if IS_ENABLED(CONFIG_CPM1)
>   	{ .compatible = "fsl,cpm1-scc-qmc", .data = &qmc_data_cpm1 },
> +#endif
> +#if IS_ENABLED(CONFIG_QUICC_ENGINE)
> +	{ .compatible = "fsl,qe-ucc-qmc", .data = &qmc_data_qe },
> +#endif
>   	{} /* sentinel */
>   };
>   MODULE_DEVICE_TABLE(of, qmc_id_table);
> @@ -1986,5 +2175,5 @@ struct qmc_chan *devm_qmc_chan_get_bychild(struct device *dev,
>   EXPORT_SYMBOL(devm_qmc_chan_get_bychild);
>   
>   MODULE_AUTHOR("Herve Codina <herve.codina@bootlin.com>");
> -MODULE_DESCRIPTION("CPM QMC driver");
> +MODULE_DESCRIPTION("CPM/QE QMC driver");
>   MODULE_LICENSE("GPL");

