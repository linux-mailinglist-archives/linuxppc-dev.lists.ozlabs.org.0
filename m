Return-Path: <linuxppc-dev+bounces-7952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6206DA9A059
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Apr 2025 07:11:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zjkbc6zmVz3bmC;
	Thu, 24 Apr 2025 15:11:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745471500;
	cv=none; b=UQTQYcdgDTQ9FKJDWpF88ScmMk5OIIADBlg9UZdHszEYjCsWPzU0mQal/HLsTUAp0cQZGm85n4dFSiGYxeYukyhMUmuIZrtDmkTPQQbUqzhBz7sG0F1i7W0k7icBZaGz/uIqMSGxowOPPjcSdkltrofwpVpSdYYV/ZJVZOr05jsTHDtco144ABK9Tb1g9TSTWk5lx7IIFxWqvElwuH7u2ZBwxXZfNKKY6MuYa+Z9GUl3ZTZsfSH1iiyXGgiwhke6dcHjLX71/cjrdst0zgV6pQMxMtoC9BriJEZXjpXK0lhmbM9UjYFLby9LepRagT4AiIux1UPurWr73rEnu052SA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745471500; c=relaxed/relaxed;
	bh=1g/H3A2mjEOxfLNFKxbSpvE+IXNCVSXHyxhD/lc8Qpo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RCvRw2Fgp5Iw3N/DxmbsDQDqe4txwMmGA8gWlDQ1tvrbr4xqNbeigJEh7gWrWuRCu9ED6lxS/I9vlbcjY4vxkGQVSkio/iUuSAsMN7IlIuXSmad/HhbmUZWeEmBjJIR3o0SY35HVjXYIflbW7nMXXbps5UaQFXNAupf3wiSJhApBt1aYJ3LPgHYz8J04hVofPiFxpDnYB9YUvnqkdhoJyaFqJOYDTdwFx1kLJhF/8+7AU6bUmxRaYDJHPoUHjwIpyqhHgFSot1qZpgh+P1KSUX4Zfi96J8BeeQyOsSjVW/DJF3ECrsyhtPZDdR5pZDciXdH2Pf7Isn9ZvjrnAan9ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hht326GN; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hht326GN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zjkbb3mBWz3blc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 15:11:38 +1000 (AEST)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F6Db003397
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 05:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1g/H3A2mjEOxfLNFKxbSpvE+IXNCVSXHyxhD/lc8Qpo=; b=Hht326GNTGeNIhfc
	0bf6tRk7BA8fhuYrp8hqO63xWhHH3qGlL16PFWaRNiRkFlWnsuFgmMYT+DsPyKXf
	RNJ3+0GKm+plbaYw/hnAbuGA0DkDtcdWLS7PVXl2imeqlXKWz5rAl4Gh0PZeMPh8
	2AeSCzyI7O8XbOib+gLfE+NFRw02kARZEb4HGjTxj4sybrmZAo/F0iACblYP+YD1
	BacGfbstmaMabLkAJJ+uKx1NJz8PhDYyk0bSC6iAG7+nC4JG0cTJ9g7dMyv0rVBm
	p8fY3M2jWkrebL0+YqJ5+sw64ILJYq9qjF4OcwwDyOSqgYVnOmZMOShUAVNAisiS
	N5+UjA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0m8g6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 05:11:34 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3032f4eca83so613695a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Apr 2025 22:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745471493; x=1746076293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1g/H3A2mjEOxfLNFKxbSpvE+IXNCVSXHyxhD/lc8Qpo=;
        b=CeXwGkbaLNuFE9bjvslVj6RNkKb2Tj0CktCGMkIBZvCV4p53g9QbgeIzAXEe34gL5V
         tuUM7fRodZBXoMo1XauSDHlEMHGSikjaQQKOoolcJLInMzSm6cTi6qE6dKnSho2aTc61
         2bmLZrwHj51NHp16rJKNlc2CNOxnGdbLqGL0bxsQFLqeCfO9QjF9qJf2BvNv6dl0dX+a
         IU5n2ttGraDxzJG3IYElOAO4d3GS8slGq8jeLsDJIKrKa0zpVkWDtFl0aFKpD+do4xwQ
         KB4Mp20UHLeQNd7DguUUp7uvBKujS0I/5o0+MZUDyWZ7QMc4tnPrAbg2avTLwhNxzr7U
         Ixpg==
X-Forwarded-Encrypted: i=1; AJvYcCWfJtOv3pf6nSJdVqrILAEiHh8DD04lCsiuKr+WPiquK6g9CuAZweqfaXu+wkkWUvUgFktLH5lgtGtEYjY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwXkv6/9JvI8xzUgn+qVaD5BPohDt8jLXFigqiZR0OSh4XfcZC
	FyNCSboeSsL5wWVOTnCcCAE4zGVvbIhlGDbWgJzUXjJhrp5BHOvloBFeDmFTGCEIhHzjlOj6ilZ
	ff/ppJxuk4Od9gNhoVAjJgxVSuFhnn5tm9p6zru9oLeq1o6NxZJUm3JRQkjGj6NKr
X-Gm-Gg: ASbGncs33P0imq3T0QSTZACcO1soeKKuOL0LCBQWE3D4qdXqWhcNvrKwuLWOY/bOIee
	9rZUUpXeK4vf/wcpy+jRvsLMDsjoKnAwTvKsbGEmcKYSNXGBhdo4lXYPTYK6MquTL8c+eAgi7uz
	oM59vZR9QqRRjJw3vN8t1i96lI8dyQeEcWiVJi7OQdY6bH5TcCgyq9R7RlMnLVhq38qHeA/Qh4H
	11zutHWnt+ATi6hd4jfEa6i2Db+h5UB/AQDYsBr957mBKhUEfCPtLxmdCmYx7bNf9rFA42VXxu7
	YO/yNZjeie3ZOrLKkwgme+SfBupXXZ7XdW4sp24Wrg==
X-Received: by 2002:a17:90b:2741:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-309ed24bd2cmr1791968a91.5.1745471493255;
        Wed, 23 Apr 2025 22:11:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5SApp51kUWo79y5fXsGYF6r+exe1bnqAhOk9GnTlMlKAb5gSFGBzPaTpNXkU2mQHZEv7Q9g==
X-Received: by 2002:a17:90b:2741:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-309ed24bd2cmr1791931a91.5.1745471492726;
        Wed, 23 Apr 2025 22:11:32 -0700 (PDT)
Received: from [10.92.199.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef097d56sm320932a91.29.2025.04.23.22.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 22:11:32 -0700 (PDT)
Message-ID: <31f071d7-db56-f032-749e-92bc387238b8@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 10:41:24 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
        Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Marc Zyngier <maz@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
        cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <f32b2ece-f7ed-45ab-2867-9d276b88cf62@oss.qualcomm.com>
 <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <hmyeha6ygi6mxzsdivo2z5ccpvl5l2xietr3axxpl4zwojiavo@wuli4qazg446>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P379LTisDLTjxcmSC9i18v9o9dCHSMeP
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=6809c806 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=HZEN96OWHqwnsOiu:21 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=lE8Iksk3R2_BZhG9ioYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: P379LTisDLTjxcmSC9i18v9o9dCHSMeP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAzMCBTYWx0ZWRfXxoGg8EA3VcXf yTFatt9dr5kNxx1vdM/a4G699Pi7rSwrQptlTa6xQ4UZ62ak3IFanIUiDQ0DA0YUEqrW94Jy9CN /nxpyvKBiz5bBcGlD9Ca16DIaittKFPFHOHUwd9ySXa+3zSwuicNZeDQPf/fQI+VTAQ4kpe+r/l
 mfYrXfZ//Fm+mkCn4DnPa23VyUN0q4fPmm6xHj2gYI6wwTsaunqJaSGFC47nqTRnrdxxZttOFzg cUI4gsKB5ZJglbbTo6vQ3S/cVfjG4dtU2CXP/hkYF5xTE9281Biz7jV1/t2+kbgHOO/BwMxg+Y6 UrTGIW1kGU3BdmNZDzDJnlb0JunNpyApiV8kqTQCwCqMqGZDFpTsw1+C50qKCS0YGIrj8P7xUn2
 Pv8B++tKPtYBPDTq8ZyrQ9F4XHDAJ9eRVMnpo+S1cuYmOBcOPppxPD2j0Jo8Z4ETSQe6F7Co
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240030
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/24/2025 10:30 AM, Manivannan Sadhasivam wrote:
> On Fri, Apr 18, 2025 at 08:11:47AM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 4/17/2025 10:46 PM, Manivannan Sadhasivam via B4 Relay wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> The PCIe link can go down under circumstances such as the device firmware
>>> crash, link instability, etc... When that happens, the PCIe slot needs to
>>> be reset to make it operational again. Currently, the driver is not
>>> handling the link down event, due to which the users have to restart the
>>> machine to make PCIe link operational again. So fix it by detecting the
>>> link down event and resetting the slot.
>>>
>>> Since the Qcom PCIe controllers report the link down event through the
>>> 'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
>>> bit in PARF_INT_ALL_MASK register.
>>>
>>> Then in the case of the event, call pci_host_handle_link_down() API
>>> in the handler to let the PCI core handle the link down condition.
>>>
>>> The API will internally call, 'pci_host_bridge::reset_slot()' callback to
>>> reset the slot in a platform specific way. So implement the callback to
>>> reset the slot by first resetting the PCIe core, followed by reinitializing
>>> the resources and then finally starting the link again.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>    drivers/pci/controller/dwc/Kconfig     |  1 +
>>>    drivers/pci/controller/dwc/pcie-qcom.c | 90 +++++++++++++++++++++++++++++++++-
>>>    2 files changed, 89 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
>>> index d9f0386396edf66ad0e514a0f545ed24d89fcb6c..ce04ee6fbd99cbcce5d2f3a75ebd72a17070b7b7 100644
>>> --- a/drivers/pci/controller/dwc/Kconfig
>>> +++ b/drivers/pci/controller/dwc/Kconfig
>>> @@ -296,6 +296,7 @@ config PCIE_QCOM
>>>    	select PCIE_DW_HOST
>>>    	select CRC8
>>>    	select PCIE_QCOM_COMMON
>>> +	select PCI_HOST_COMMON
>>>    	help
>>>    	  Say Y here to enable PCIe controller support on Qualcomm SoCs. The
>>>    	  PCIe controller uses the DesignWare core plus Qualcomm-specific
>>> diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
>>> index dc98ae63362db0422384b1879a2b9a7dc564d091..6b18a2775e7fcde1d634b3f58327ecc7d028e4ec 100644
>>> --- a/drivers/pci/controller/dwc/pcie-qcom.c
>>> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
>>> @@ -34,6 +34,7 @@
>>>    #include <linux/units.h>
>>>    #include "../../pci.h"
>>> +#include "../pci-host-common.h"
>>>    #include "pcie-designware.h"
>>>    #include "pcie-qcom-common.h"
>>> @@ -55,6 +56,7 @@
>>>    #define PARF_INT_ALL_STATUS			0x224
>>>    #define PARF_INT_ALL_CLEAR			0x228
>>>    #define PARF_INT_ALL_MASK			0x22c
>>> +#define PARF_STATUS				0x230
>>>    #define PARF_SID_OFFSET				0x234
>>>    #define PARF_BDF_TRANSLATE_CFG			0x24c
>>>    #define PARF_DBI_BASE_ADDR_V2			0x350
>>> @@ -130,8 +132,11 @@
>>>    /* PARF_LTSSM register fields */
>>>    #define LTSSM_EN				BIT(8)
>>> +#define SW_CLEAR_FLUSH_MODE			BIT(10)
>>> +#define FLUSH_MODE				BIT(11)
>>>    /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
>>> +#define PARF_INT_ALL_LINK_DOWN			BIT(1)
>>>    #define PARF_INT_ALL_LINK_UP			BIT(13)
>>>    #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
>>> @@ -145,6 +150,9 @@
>>>    /* PARF_BDF_TO_SID_CFG fields */
>>>    #define BDF_TO_SID_BYPASS			BIT(0)
>>> +/* PARF_STATUS fields */
>>> +#define FLUSH_COMPLETED				BIT(8)
>>> +
>>>    /* ELBI_SYS_CTRL register fields */
>>>    #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
>>> @@ -169,6 +177,7 @@
>>>    						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
>>>    #define PERST_DELAY_US				1000
>>> +#define FLUSH_TIMEOUT_US			100
>>>    #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
>>> @@ -274,11 +283,14 @@ struct qcom_pcie {
>>>    	struct icc_path *icc_cpu;
>>>    	const struct qcom_pcie_cfg *cfg;
>>>    	struct dentry *debugfs;
>>> +	int global_irq;
>>>    	bool suspended;
>>>    	bool use_pm_opp;
>>>    };
>>>    #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
>>> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
>>> +				  struct pci_dev *pdev);
>>>    static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
>>>    {
>>> @@ -1263,6 +1275,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
>>>    			goto err_assert_reset;
>>>    	}
>>> +	pp->bridge->reset_slot = qcom_pcie_reset_slot;
>>> +
>>>    	return 0;
>>>    err_assert_reset:
>>> @@ -1300,6 +1314,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
>>>    	.post_init	= qcom_pcie_host_post_init,
>>>    };
>>> +static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
>>> +				  struct pci_dev *pdev)
>>> +{
>>> +	struct pci_bus *bus = bridge->bus;
>>> +	struct dw_pcie_rp *pp = bus->sysdata;
>>> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>>> +	struct qcom_pcie *pcie = to_qcom_pcie(pci);
>>> +	struct device *dev = pcie->pci->dev;
>>> +	u32 val;
>>> +	int ret;
>>> +
>>> +	/* Wait for the pending transactions to be completed */
>>> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
>>> +					 val & FLUSH_COMPLETED, 10,
>>> +					 FLUSH_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(dev, "Flush completion failed: %d\n", ret);
>>> +		goto err_host_deinit;
>>> +	}
>>> +
>>> +	/* Clear the FLUSH_MODE to allow the core to be reset */
>>> +	val = readl(pcie->parf + PARF_LTSSM);
>>> +	val |= SW_CLEAR_FLUSH_MODE;
>>> +	writel(val, pcie->parf + PARF_LTSSM);
>>> +
>>> +	/* Wait for the FLUSH_MODE to clear */
>>> +	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
>>> +					 !(val & FLUSH_MODE), 10,
>>> +					 FLUSH_TIMEOUT_US);
>>> +	if (ret) {
>>> +		dev_err(dev, "Flush mode clear failed: %d\n", ret);
>>> +		goto err_host_deinit;
>>> +	}
>>> +
>>> +	qcom_pcie_host_deinit(pp);
>>> +
>>> +	ret = qcom_pcie_host_init(pp);
>>> +	if (ret) {
>>> +		dev_err(dev, "Host init failed\n");
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = dw_pcie_setup_rc(pp);
>>> +	if (ret)
>>> +		goto err_host_deinit;
>>> +
>>> +	/*
>>> +	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
>>> +	 * non-sticky.
>>> +	 */
>>> +	if (pcie->global_irq)
>>> +		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
>>> +			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
>> do we need to enable linkup again here, since all the devices are
>> enumerated previously, the linkup irq will do a rescan again which is
>> not needed.
> 
> Right. I was trying to keep the irq enablement on par with probe(), but LINK_UP
> is strictly not needed. I will drop it.
> 
>> Instead of linkup we update icc & opp bandwidths after
>> dw_pcie_wait_for_link() in the below.
>>
> 
> Why do we need to update ICC and OPP?
After link retrain, if the link data rate has reduced due to some
electrical issue or some other reason we may need to update the icc and
opp votings here.

- Krishna Chaitanya.
> 
> - Mani
> 

