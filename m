Return-Path: <linuxppc-dev+bounces-10314-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9788DB09A79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 06:17:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjxN65WS1z30RK;
	Fri, 18 Jul 2025 14:17:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752812262;
	cv=none; b=azmIjS5ViDw++1kWc7+M0O6/rhrObKWX73cA1vNj5VRo49qwqGzwxdpWmmAr63Ay8qR0Ro8fnUUUQR/1q75iTFHygCXObJutznBwv45zmVrIPCSTn2gH+QWFocSMglytetyR3wT5kGJk9Ohx4Sjin5O9bMHrh+Xr3+gFEuhmrsJ9A7Z5tm7yA/8wnrYi7hxQJ4mOkZlUY6OlD72YTlJAaTaVvBg67i+9M1+1ZbCF7Ur27Zs9WeftLtTS8Pxzpdx0tqiXL6mym7qX/qUgWHU7az/eezv2cHPu7eyx2O5Gl5nHAjdKZadrdRj2GYiOtAN13Y75m9DGP/To2bxXMHI0RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752812262; c=relaxed/relaxed;
	bh=NcFADHJWzB581dh8lwli3gFNI4IvnV9oOCXkZgldaGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ke+sXnVFwXp3Z2IpCDDJn01zSvBfGsvOdx1WjKZH46PdM685JAgkojpXew63tzoNVTwa5yPdfQ8gzs8uQQRyvtI2jFJTDj1Z+AlqvVS4a/kQbEaXqk90AdzSn0xlQWNGPl3Cj9G+KdErF2T45slUsOoUYdLDBpBstUMd/xJPC2CHbXvtMZm4y74qUKosWdXQzYngaJw/PAT0xQ7WNNz9D9IIn4sm+FFlKsujvMoyHFXbKsutb65gXky8ggJDfinm0bFzPiGG3v0pW9xTFICHrYhM+h5LDnluXFb6c41zKJ6pJPG7X/YPoSls7xv/UA1mB+SlAVIhMYqUbKK0rgnVpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzb3E4JE; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dzb3E4JE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1160 seconds by postgrey-1.37 at boromir; Fri, 18 Jul 2025 14:17:41 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjxN5404Cz2yMt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 14:17:40 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HJlE1B021536
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 03:58:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NcFADHJWzB581dh8lwli3gFNI4IvnV9oOCXkZgldaGM=; b=dzb3E4JEm2fSjErJ
	SDM/OAoLmVVepywEJLhoRxEWaQh8/wshfZmR6DBfTiD4rv9PX6yWmMTZ1pu4mxA2
	6h9GFaM4lszHT/Ynd7EeZxM3fv3FHW6thYKbpcD+lboRWolfGZvmQxwdi8TJqYdH
	pGPjKQ5wJWDOkEKFloViBha4ndDGidP/VqryASpHnPPtWRBGrqKOhqWl49NJ/Ryx
	1n9+3i/GhD8S88H1K4gfIDc9lXzuB28wtN27uJKaku23MWCcOSM4/Mw1/meg5XLj
	PDAQNcjLay1jjYViys+C2NQIuylm+CYrDJvEqj924rdXVCHqwHArQpmeVW9rymV6
	qyeGPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpn4wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 03:58:17 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23536f7c2d7so28443375ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jul 2025 20:58:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752811094; x=1753415894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NcFADHJWzB581dh8lwli3gFNI4IvnV9oOCXkZgldaGM=;
        b=dGL85GYMR3Rh65LAwkqIf+y17hA+CbzGeg5qIqEchms7G3B/iTX+FwlPjYY4NDCu7i
         qgWuwji/VIhjmY2rs1gajdGZBRYwa0JPBPZYCP7H2A7D1DVBEzsiFkiGpbKAe6RF68Um
         +fNgJfwtxqtVNbXKpLUmfmgpCJrDf+cNa0Tj17dmrCD4SMYHJ0OQdluitcp5Q1f8VKqS
         hKXzbEkG3soybgdrYoA8YIRMtuCanOXhJ6CNl6oU4uI4udvgjsUsA40iDB0umPPVzz0L
         nIjJD1+a/HsFyO/qHrigc/LfN6iqamZVTVzSjmLTasCeODMaZ1Ir5arC+ofPBblHUKXl
         r1Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVH88tR38QmBVLXMKZhmBWoqZZIdJP4UDjkE/mgaXvYOD6+D9d5ec25I/OSOdxtq9Iay/s8PNIj7kJPdD4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx5xtJgfnptA6PboFJ1LlWEnGVmQZCORUCT2JqI0XpIfnno+h0+
	QnypyOC0KVSaR07QVrUnTWn17ukk7dIgtrsBBds0Ir5plXRAh+qEVuf2puoZEta8gLLyWyxJegY
	tNdrrlo+tu/D6gNBTbxKgd/waFNFuim9pYPMQhUhgJEm8H/5T2P8GY8C6d+fyhyCEhJkY
X-Gm-Gg: ASbGncuxcIuJnJxAuPzep1zrmFwg/Yt28sFAcq/WVGc93p0V1yh7ZhpUcMeYKj/gPBt
	Tzo4/tyB+/WD8JOkECnauTsJQ/8L4jwmMuKDC4IBHOQhe7sHZ6mYFqsFrcVXFskv2vNf7m+g6cg
	AI4XLWEMEnDl+yQc3nkN0VsTvnJi9DPhoKW23FEZkdNzu7l8No1csk3XLKwt8r89/WEjQYsgUQg
	v0L7pW5Mmq2UAWCQzi8vn9Uil2T/MyGBLtGhZ/N46pDrCuC1UeWfMz7COASOVTEv2VWWgmPSnGv
	iZFB/vX7qfoGW4iOhNRTo6oBal1NRwfw4hMj437oqH9+ioq9E5huV7T9k2hmjuDukI51Vw==
X-Received: by 2002:a17:902:f68a:b0:234:ba75:836 with SMTP id d9443c01a7336-23e25693676mr111436065ad.7.1752811094384;
        Thu, 17 Jul 2025 20:58:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpJu0g9KYlPsWpo+xmLRTgKz+e8QQUO94ua3L9oR8C4BqJw408SODGzFFKZ0NCX4WD20R5fw==
X-Received: by 2002:a17:902:f68a:b0:234:ba75:836 with SMTP id d9443c01a7336-23e25693676mr111435915ad.7.1752811093906;
        Thu, 17 Jul 2025 20:58:13 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.226.29])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b6ef9aesm4165815ad.211.2025.07.17.20.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 20:58:13 -0700 (PDT)
Message-ID: <b6883420-96aa-432b-9d33-5e7c0e4fb8a7@oss.qualcomm.com>
Date: Fri, 18 Jul 2025 09:28:06 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in a
 platform specific way
To: manivannan.sadhasivam@oss.qualcomm.com,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Niklas Cassel <cassel@kernel.org>,
        Wilfred Mallawa
 <wilfred.mallawa@wdc.com>,
        Lukas Wunner <lukas@wunner.de>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDAyOCBTYWx0ZWRfXzBB3/6WerdRG
 phBdXDIoPrbDFu4rebCx81PP5Zh+Okou7cXZ4YaVSceFaM9cai9t5S7c4LBtjmSzQKhBJsOcWly
 rHpbkWARYFiyzBxmP/vuUBAia7pDlOyLohoOpE5UXQMtKs1Ar+X76OQJ9iyN5zEtV43ovarNNgD
 EEv/fzIugO6GNLvwO/uHFqhF+qBLGL3jp2hn2TNi0US9FKRmyxs82kpbMyvilfKygnIbX6LbiWL
 1pZRxqfCVoI5dinRpqEVDUCTJJEHce1GhKpPAPNB5bQ8Jq4B6uDzek7lk4xYIjGnUDbFJchmCad
 zm+EAxfqCIdxgMUz5DJ4+Tx/KbUlh0nJAuwYSEsvzHGpvoIQ46liebpUdaBIbW6HC3ww9Zi6Vnc
 fsZVzj/Jaq8/uXmkW+zDqaqP47g9mOt3x/xjrc+4VLqWFOnslstx9+J+hDcGhs5xr04BqAsu
X-Proofpoint-GUID: hWKCzuCgJEO06d7lTfqohkB0956kKXsg
X-Proofpoint-ORIG-GUID: hWKCzuCgJEO06d7lTfqohkB0956kKXsg
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6879c659 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=lM2dtDSGyl0QT0dfkTfTzg==:17
 a=lJ8DZ0MjVbnDIa4D:21 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ImqNvw3yTObJCdT6Mg8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180028
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 7/15/2025 7:51 PM, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
> Port) and its subordinate devices by invoking bridge control reset and FLR. But
> in some cases like AER Fatal error, it might be necessary to reset the Root
> Ports using the PCI host bridge drivers in a platform specific way (as indicated
> by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
> Otherwise, the PCI link won't be recovered successfully.
> 
> So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
> host bridge drivers to reset the Root Port when a fatal error happens.
> 
> Also, this series allows the host bridge drivers to handle PCI link down event
> by resetting the Root Ports and recovering the bus. This is accomplished by the
> help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
> expected to call this API (preferrably from a threaded IRQ handler) with
> relevant Root Port 'pci_dev' when a link down event is detected for the port.
> The API will reuse the pcie_do_recovery() function to recover the link if AER
> support is enabled, otherwise it will directly call the reset_root_port()
> callback of the host bridge driver (if exists).
> 
> For reference, I've modified the pcie-qcom driver to call
> pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
> LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
> callback to reset the Root Port. Since the Qcom PCIe controllers support only
> a single Root Port (slot) per controller instance, the API is going to be
> invoked only once. For multi Root Port controllers, the controller driver is
> expected to detect the Root Port that received the link down event and call
> the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.
> 
> Testing
> -------
> 
> I've lost access to my test setup now. So Krishna (Cced) will help with testing
> on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
> platform. For the moment, this series is compile tested only.
Tested on QCOM platform rb3gen2.
> 
> Changes in v6:
> - Incorporated the patch: https://lore.kernel.org/all/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/
> - Link to v5: https://lore.kernel.org/r/20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com
> 
> Changes in v5:
> * Reworked the pci_host_handle_link_down() to accept Root Port instead of
>    resetting all Root Ports in the event of link down.
> * Renamed 'reset_slot' to 'reset_root_port' to avoid confusion as both terms
>    were used interchangibly and the series is intended to reset Root Port only.
> * Added the Rockchip driver change to this series.
> * Dropped the applied patches and review/tested tags due to rework.
> * Rebased on top of v6.16-rc1.
> 
> Changes in v4:
> - Handled link down first in the irq handler
> - Updated ICC & OPP bandwidth after link up in reset_slot() callback
> - Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org
> 
> Changes in v3:
> - Made the pci-host-common driver as a common library for host controller
>    drivers
> - Moved the reset slot code to pci-host-common library
> - Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org
> 
> Changes in v2:
> - Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
> - Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
> Manivannan Sadhasivam (3):
>        PCI/ERR: Add support for resetting the Root Ports in a platform specific way
>        PCI: host-common: Add link down handling for Root Ports
>        PCI: qcom: Add support for resetting the Root Port due to link down event
> 
> Wilfred Mallawa (1):
>        PCI: dw-rockchip: Add support to reset Root Port upon link down event
> 
>   drivers/pci/controller/dwc/Kconfig            |   2 +
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c |  91 ++++++++++++++++++-
>   drivers/pci/controller/dwc/pcie-qcom.c        | 120 ++++++++++++++++++++++++--
>   drivers/pci/controller/pci-host-common.c      |  33 +++++++
>   drivers/pci/controller/pci-host-common.h      |   1 +
>   drivers/pci/pci.c                             |  21 +++++
>   drivers/pci/pcie/err.c                        |   6 +-
>   include/linux/pci.h                           |   1 +
>   8 files changed, 260 insertions(+), 15 deletions(-)
> ---
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> change-id: 20250715-pci-port-reset-4d9519570123
> 
> Best regards,

