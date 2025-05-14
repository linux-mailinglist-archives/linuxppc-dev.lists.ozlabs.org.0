Return-Path: <linuxppc-dev+bounces-8561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 830F6AB62F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 08:22:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy3D54SJ6z2yrR;
	Wed, 14 May 2025 16:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747203749;
	cv=none; b=TedOg0H3FzDlus7eYGlG/ykiLccA62nkogjMDDNKXikoF4OKLWeP+8GCh4uVUQ04rQMSt8LyeVtnY/zr6mQ8gxfRFhDH82j8GrpTSzaP3GyyvERucxHA/7lZT4T7tuvHjXH73NrtCxKdpl12xCAR1MSJdGEAzHYDZcipqAOTKLnrBJvC7YZDShvKExSE+ZhCRlrKzmpjaq5K8N1iMR5RUo8xp6vtxZvN5CwldQy/uTxOu0jmR5A9h2Avda6P02NHGamBdrW5PFsZzXCgL1+9gOqpQYasUKGZDSIHgvrN3sg5CK1HcU/03kIOpn2ZeTT1Xa4jhYFoFqiAEsOxwsWcHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747203749; c=relaxed/relaxed;
	bh=TpcnhsLrhDkPiVpw8TutfV9wpiw5v+hVj2kZ6M53/V0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FPsNTygUl9cC+P+xKIc9eWNqwo2mgakyo7HE7gHIw3h2x4pQxM8ZPeY0pdnp25RVv8746gXS+LOO+MKVOSnouS8SvUsBSQHgrCwCLh2fsaaNDW9DT5qTHXaJhBAkf/7vqbsR/D8btKTQIhjHlO8atHqAG7I2VVLsTPtJG3HfXYvDSwF5hkWvN0vYFgd8qQyh1T51G8JmwlV456/2Xw26rycWMGuE5CpaebJs+W7xq2apq84KzYNGe8liqXDBkLphU1TXiltaHRmSDgpf/Hti/C3aiu518qLOHBPcqLaHKhLOfh8/859TAkZO0gPq4BepvIUZPY7xstumw3C1hiCeEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbuBEoha; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mbuBEoha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy3D42Z7xz2yrC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 16:22:27 +1000 (AEST)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E2cRWp029333
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:22:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TpcnhsLrhDkPiVpw8TutfV9wpiw5v+hVj2kZ6M53/V0=; b=mbuBEohaaTRVXRQ3
	nRlsMvJA/63kSHK4tk97ct9Y9UcZVeOjTXlGol82OLGngt3/y2Jf/jsomkiQJiDX
	N13brAnQzZBfkCcFzzwK2EwzAX4RHWXojyw2UrpWMurejXPOYVCxY+8kLb8jDWdn
	hILGUZqSsoN8pnz/hGZC/es+m6V6l6hgE2v9WC/hlZRFzKmphlZnmvi6dkOqKhIP
	TydY+OznPP6bgSc0zGRC4rZU8BhL0wbCyNq3ushbTVt09lynOcce6kHF8IKB7vCu
	8fvAEZe8Rs+1xgrfYav82BIoGC/e1lYruoyrS6kd9iLv7wM7diNpIfhQhvgDuR3Q
	EnixEg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnhm3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:22:23 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e76805fecso92421925ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 23:22:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747203742; x=1747808542;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TpcnhsLrhDkPiVpw8TutfV9wpiw5v+hVj2kZ6M53/V0=;
        b=HMCRPjZaa7pIxlwXeBBf3b3hY6Irs5RThqKv+AVDc6auIj7l6OUEeWqCHMp7iwHt7y
         JvhQO7F7+q9nLpnYFuV/CS3LtGn+tyiaJTPm+LwuCxqhoWJHFm3vxN8vv7adJgHSVZCs
         GRLWq6sTVjlIedRxAsMhM0bGrMwvT/0+sTaIofADYS8hnseTbEoS/45Mj7NyFBDaFWtj
         zfV4Jylh6F1btyN77RDDLVJ4KtcHI7PgM42jrIUobpeZ05cEJP/02lo2T5S/Yb7RyCVM
         02c2b1eFBgRQDa6Dqz8onXt6Pz/sH6+I/4nIHuG4H9NSGYqwoRa+7GDPsVnq5u8mxr3h
         VywQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYvdm1SQNlQOGpBKB8hKsU7bwyzKZvxLsiTM3LHvmZK74t5tFB/aj7NL+Be+djGojMyg9Lpxtn7N4VI3w=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxFm3M1xh6LOLHURUB7OItHqxnQgtvzq741HwKdAlSsf/JGGYar
	EofGJhiKftsSvmd6QEm5+QrpdrLlULjtsC1dadbBao3biJByZ3e55rOD2H2msFF51MTFiJTzDia
	kU5xsIjCfliP/1U1xsJlC1zJPnl7aLJ52RJ+rCKMbFDA958Luu2ENtWeriosJOnZB
X-Gm-Gg: ASbGncvAFZhOmZyRKs9swOlpXCY37OH1ME7S6VDndrX4fC2k5Yk3sgXDzc+h63v7Uim
	flvlO+qBHRrMFllNwx886vLQ5eng03pEOHrPbCH2AqrqNNmQH73ZIgvd/F7X7UDS2b8oRCCdGSs
	WfwklRHb+lvWrpEzLKdbPwyXFQDoz1R0kd/tVqWD+MDPpmVZWKzh686EsoAveFswgX/ptfK270G
	oh9RiDD7IBQJqNGlBlYuGhKR+OUgAxd/0u6acFIGoI4dPaX6OTdj2H+XqStJ0mAGcuR2GYJ1yeH
	K63qyqkwgjxg+8vUuwWAm5uNWIaDhwdOg1VJRiKRbw==
X-Received: by 2002:a17:903:230d:b0:22e:4586:e33f with SMTP id d9443c01a7336-231981b9260mr30796385ad.45.1747203741904;
        Tue, 13 May 2025 23:22:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaXIvN8kd6OCTrUzx47gTLqMaj0yTncjdEtMWu1eqbRLeCm9H7LLRmX+0fMvEBUQxpsSm/dw==
X-Received: by 2002:a17:903:230d:b0:22e:4586:e33f with SMTP id d9443c01a7336-231981b9260mr30795875ad.45.1747203741359;
        Tue, 13 May 2025 23:22:21 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc753fe13sm91478365ad.14.2025.05.13.23.22.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:22:20 -0700 (PDT)
Message-ID: <1b4b7ee5-1d7e-573c-0647-44aad654354a@oss.qualcomm.com>
Date: Wed, 14 May 2025 11:52:13 +0530
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
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
        Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-5-7050093e2b50@linaro.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-5-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: wm3jyN6ZvchExJy69TshSvr8D3tpx-Uh
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824369f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=HZEN96OWHqwnsOiu:21 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=67gqzJqB-RPUT0o4obAA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: wm3jyN6ZvchExJy69TshSvr8D3tpx-Uh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1MyBTYWx0ZWRfX68QjFYIBECtO
 U6+a+M/sVUr3PR5WwTlFA2cJQDGmlB7EPQC3JBHmh8KxVQA3tpUV9fL5cxSRFh4dAqJolIVWjWg
 +TsEx0Ifv4zbgpm1/wJn6YjlM5goe8SZmxSAE7mCNJxdAeVDFEg8Tw5xzY4tSJTipnoFrcgWWG/
 TCyp8EtixFU2ANgMRCEw97rdYKyq3F8djD1P7HWwf0mfCYiDnLv1JdPw0wzTg6W9VbPxXFpo/VJ
 9SRB3x1yY6phw/SFOhPQ+tYKEr3qoMvWQ18YOqa7RQtgLUHQ0BIxZ0FlOiJz0kZG2rwAgX7RPnK
 FCEeBh69UnBzW8H7hbIkY7AfZTmcfLl3pwnz28jQG4cL5a5EjVXYfSR9LUxaXo3a+nWY0bv1Hjm
 xUW/vpalxWok6D+YIONDa0kcDcZSZ24QncblwiLkN0Okpy9Ou/5iOsNBQt2FGUJpQ22cZ8i3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_01,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140053
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> The PCIe link can go down under circumstances such as the device firmware
> crash, link instability, etc... When that happens, the PCIe slot needs to
> be reset to make it operational again. Currently, the driver is not
> handling the link down event, due to which the users have to restart the
> machine to make PCIe link operational again. So fix it by detecting the
> link down event and resetting the slot.
> 
> Since the Qcom PCIe controllers report the link down event through the
> 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
> bit in PARF_INT_ALL_MASK register.
> 
> Then in the case of the event, call pci_host_handle_link_down() API
> in the handler to let the PCI core handle the link down condition. Note
> that both link up and link down events could be set at a time when the
> handler runs. So always handle link down first.
> 
> The API will internally call, 'pci_host_bridge::reset_slot()' callback to
> reset the slot in a platform specific way. So implement the callback to
> reset the slot by first resetting the PCIe core, followed by reinitializing
> the resources and then finally starting the link again.
> 
Only one comment see below.
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>   drivers/pci/controller/dwc/Kconfig     |   1 +
>   drivers/pci/controller/dwc/pcie-qcom.c | 112 ++++++++++++++++++++++++++++++---
>   2 files changed, 105 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -296,6 +296,7 @@ config PCIE_QCOM
>   	select PCIE_DW_HOST
>   	select CRC8
>   	select PCIE_QCOM_COMMON
> +	select PCI_HOST_COMMON
>   	help
>   	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
>   	  PCIe controller uses the DesignWare core plus Qualcomm-specific
> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> index dc98ae63362db0422384b1879a2b9a7dc564d091..e577619d0f8ceddf0955139ae6b939842f8cb7be 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -34,6 +34,7 @@
>   #include <linux/units.h>
>   
>   #include "../../pci.h"
> +#include "../pci-host-common.h"
>   #include "pcie-designware.h"
>   #include "pcie-qcom-common.h"
>   
> @@ -55,6 +56,7 @@
>   #define PARF_INT_ALL_STATUS			0x224
>   #define PARF_INT_ALL_CLEAR			0x228
>   #define PARF_INT_ALL_MASK			0x22c
> +#define PARF_STATUS				0x230
>   #define PARF_SID_OFFSET				0x234
>   #define PARF_BDF_TRANSLATE_CFG			0x24c
>   #define PARF_DBI_BASE_ADDR_V2			0x350
> @@ -130,9 +132,14 @@
>   
>   /* PARF_LTSSM register fields */
>   #define LTSSM_EN				BIT(8)
> +#define SW_CLEAR_FLUSH_MODE			BIT(10)
> +#define FLUSH_MODE				BIT(11)
>   
>   /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
> -#define PARF_INT_ALL_LINK_UP			BIT(13)
> +#define INT_ALL_LINK_DOWN			1
> +#define INT_ALL_LINK_UP				13
> +#define PARF_INT_ALL_LINK_DOWN			BIT(INT_ALL_LINK_DOWN)
> +#define PARF_INT_ALL_LINK_UP			BIT(INT_ALL_LINK_UP)
>   #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
>   
>   /* PARF_NO_SNOOP_OVERRIDE register fields */
> @@ -145,6 +152,9 @@
>   /* PARF_BDF_TO_SID_CFG fields */
>   #define BDF_TO_SID_BYPASS			BIT(0)
>   
> +/* PARF_STATUS fields */
> +#define FLUSH_COMPLETED				BIT(8)
> +
>   /* ELBI_SYS_CTRL register fields */
>   #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
>   
> @@ -169,6 +179,7 @@
>   						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
>   
>   #define PERST_DELAY_US				1000
> +#define FLUSH_TIMEOUT_US			100
>   
>   #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
>   
> @@ -274,11 +285,14 @@ struct qcom_pcie {
>   	struct icc_path *icc_cpu;
>   	const struct qcom_pcie_cfg *cfg;
>   	struct dentry *debugfs;
> +	int global_irq;
>   	bool suspended;
>   	bool use_pm_opp;
>   };
>   
>   #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> +				  struct pci_dev *pdev);
>   
>   static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>   {
> @@ -1263,6 +1277,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>   			goto err_assert_reset;
>   	}
>   
> +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
> +
>   	return 0;
>   
>   err_assert_reset:
> @@ -1517,6 +1533,74 @@ static void qcom_pcie_icc_opp_update(struct qcom_pcie *pcie)
>   	}
>   }
>   
> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
> +				  struct pci_dev *pdev)
> +{
> +	struct pci_bus *bus = bridge->bus;
> +	struct dw_pcie_rp *pp = bus->sysdata;
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
> +	struct device *dev = pcie->pci->dev;
> +	u32 val;
> +	int ret;
> +
> +	/* Wait for the pending transactions to be completed */
> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
> +					 val & FLUSH_COMPLETED, 10,
> +					 FLUSH_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "Flush completion failed: %d\n", ret);
> +		goto err_host_deinit;
> +	}
> +
> +	/* Clear the FLUSH_MODE to allow the core to be reset */
> +	val = readl(pcie->parf + PARF_LTSSM);
> +	val |= SW_CLEAR_FLUSH_MODE;
> +	writel(val, pcie->parf + PARF_LTSSM);
> +
> +	/* Wait for the FLUSH_MODE to clear */
> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
> +					 !(val & FLUSH_MODE), 10,
> +					 FLUSH_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
> +		goto err_host_deinit;
> +	}
> +
> +	qcom_pcie_host_deinit(pp);
> +
> +	ret = qcom_pcie_host_init(pp);
> +	if (ret) {
> +		dev_err(dev, "Host init failed\n");
> +		return ret;
> +	}
> +
> +	ret = dw_pcie_setup_rc(pp);
> +	if (ret)
> +		goto err_host_deinit;
> +
> +	/*
> +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
> +	 * non-sticky.
> +	 */
> +	if (pcie->global_irq)
> +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> +
> +	qcom_pcie_start_link(pci);
> +	if (!dw_pcie_wait_for_link(pci))
> +		qcom_pcie_icc_opp_update(pcie);
This icc opp update can we removed as this can updated from the global
IRQ.

- Krishna Chaitanya.
> +
> +	dev_dbg(dev, "Slot reset completed\n");
> +
> +	return 0;
> +
> +err_host_deinit:
> +	qcom_pcie_host_deinit(pp);
> +
> +	return ret;
> +}
> +
>   static int qcom_pcie_link_transition_count(struct seq_file *s, void *data)
>   {
>   	struct qcom_pcie *pcie = (struct qcom_pcie *)dev_get_drvdata(s->private);
> @@ -1559,11 +1643,20 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>   	struct qcom_pcie *pcie = data;
>   	struct dw_pcie_rp *pp = &pcie->pci->pp;
>   	struct device *dev = pcie->pci->dev;
> -	u32 status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
> +	unsigned long status = readl_relaxed(pcie->parf + PARF_INT_ALL_STATUS);
>   
>   	writel_relaxed(status, pcie->parf + PARF_INT_ALL_CLEAR);
>   
> -	if (FIELD_GET(PARF_INT_ALL_LINK_UP, status)) {
> +	/*
> +	 * It is possible that both Link Up and Link Down events might have
> +	 * happended. So always handle Link Down first.
> +	 */
> +	if (test_and_clear_bit(INT_ALL_LINK_DOWN, &status)) {
> +		dev_dbg(dev, "Received Link down event\n");
> +		pci_host_handle_link_down(pp->bridge);
> +	}
> +
> +	if (test_and_clear_bit(INT_ALL_LINK_UP, &status)) {
>   		dev_dbg(dev, "Received Link up event. Starting enumeration!\n");
>   		/* Rescan the bus to enumerate endpoint devices */
>   		pci_lock_rescan_remove();
> @@ -1571,11 +1664,12 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
>   		pci_unlock_rescan_remove();
>   
>   		qcom_pcie_icc_opp_update(pcie);
> -	} else {
> -		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
> -			      status);
>   	}
>   
> +	if (status)
> +		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
> +			      (u32) status);
> +
>   	return IRQ_HANDLED;
>   }
>   
> @@ -1732,8 +1826,10 @@ static int qcom_pcie_probe(struct platform_device *pdev)
>   			goto err_host_deinit;
>   		}
>   
> -		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_MSI_DEV_0_7,
> -			       pcie->parf + PARF_INT_ALL_MASK);
> +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
> +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
> +
> +		pcie->global_irq = irq;
>   	}
>   
>   	qcom_pcie_icc_opp_update(pcie);
> 

