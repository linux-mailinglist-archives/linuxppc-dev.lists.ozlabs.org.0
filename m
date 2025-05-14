Return-Path: <linuxppc-dev+bounces-8565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00DFAB6334
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 08:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zy3Sp2CzTz2yrg;
	Wed, 14 May 2025 16:33:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747204410;
	cv=none; b=SOedRHVOgTx6inRxTeZUupbJty6kPXluy7e2OzZzIqoeM+NgBAYQ4f+Z+R43o1uWVSU3c/VcrSqPGD/DJFSremnMhPYCn3rFIjwglxbhXjAEDYqsskADROO43jdIq0g/z/eHNIiffb9bdM/x0kDbLQIXuBEzbf4yTL0bjQO8MBLcQdMDGaiq6KkyXeRLslKHl+DGpRaehR94ReCcmQjMiDvTgXUo2EFy4VqUy4IsPbih0J9OjWBKd4C1GMEZdgWFjmJaR9ZXKJfRTU9N9ghLD6ngF5y2k3KYExY1A9ZIgCxhJ3SzjzlmrHDodGXpZ4hNHbwo4pblCZznFhhC3chErA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747204410; c=relaxed/relaxed;
	bh=B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4+aUW37QiwZfvUeTgiiQlTi8Gq++DwjmQwaL9aRd95s05zDuHFj0yk3/tSf75WwOkWVq+ZM1zzAuajFDGXdS+x5tyHehPdOB1ehnIe5L1XzjO5rsrNlxk7ThUkoc/YCA/p06pRdtpmVKN99GIByqykC0EljDtmXK4E/P2Sx8V+oeFlnA5yH99gBKJzk1FxU1UKRWqhs/KiN53WGWWMcnrw0krP+o5Qc5rEHkwxr9NIK/MF4buYxmB/6IRX961a+X10xdJZW26NI4J1Gsd0fm0LhWdCeuAJxn+FxlD1F9VV9kIUJBNy7yy0uWwI45gCsjxaMFwG98KgPt7qCWhxi/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qgum9RVd; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qgum9RVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zy3Sn3HQSz2yrC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 16:33:28 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54E1TvbS030842
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:33:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=; b=Qgum9RVdjs2zkR+i
	e+oEfIDzCrFRwrJwHknja+NnTYGUe0kfBGaxE/kcH1zG/HAgklYoRDOwP9WbKIer
	JsempM+UrVFDW0Ca2k6zuHTR3YlTCCeGehDU8P880C6sn9rTz1C17HS1IJkgknwl
	EMbX0ZmrTikpz8hny2XKCvYV2IUuFi4JSMIobRfrCD3HsIhMxv+A8kMvaRSj+3sm
	NVCUWEEkQnKoEsoLsdpf/TVzw03pnSRTjgfeQYWsb/Jxv+yi9STPWZqzAuqpBffr
	1ffX7foKv+FP8pLkITytCg+xFIiiSi+DWt90BfNQaIFiFVrYDKj7i2ZQI/HkSZ1O
	o/x1lg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnsnen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 May 2025 06:33:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-740774348f6so5483001b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 23:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747204406; x=1747809206;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B5/9vS4FRS/VQGDmtMWL7u/M6hqf8gvfjYWZW3i0Gc8=;
        b=aernYO40KpWiiQ/Cd17DILXVZ8vPzfpV70fimYlRqgkxdryNPxTkcgBG/GlwsT5DtC
         +uYdRDHZLVYeLydnI2vNdkB7/pHgxXGXEkDEfIepNXPWkrDD+eiyJxJZrntPHbP6amdF
         ugWGzg5Hr/H2tFTU3R9gftRtnBL3ad8LUKgdmzB9l3TqTYFNrYODZ9CHILy32+5gkSLO
         P7Db5EyxGKxFrQ4TGxg4TI94wGHDTWx/KFmnu1acOpzX50PhtIbpzpMc1nrBB6ReRP6U
         daiDXOrYdL0BuNny2S4+wFa45575i1VZWt8XeA+3Dadat1v4yvZMmjv1/fjw7UWhWV/i
         aYZw==
X-Forwarded-Encrypted: i=1; AJvYcCXvh5AR7zQg9wA0rFK4h6eVM4CUlE2/ADpfweg4Cv1f0L0x66ZfLvlw/2Dxk12NBIx2W/rTKfAQUVyarz4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxpcFsxKWQvBDsi54kXXalP4CS91LRH7GvSkk4riHkBtcgGOFYM
	aMyeDE1l0VOex1I3XmukHA8kXodVuf/T4XyrUd8W5Xyi2AF1dKqzQQyoutlyj49oJxGOoNDk+Ui
	9kFY5gJk/79H34QzzTqafSn+uum6X81iZhr2ba6J/nJYMaxzuR0SRCD5Q2Vp3X3gJ
X-Gm-Gg: ASbGncstOc2cOWCD1C2QsnSW0dnJj5B536f5yytt1UM8E0ISG+vpYDaKgEaGUOKOgl3
	RgIyD6ZeoeMyK+O59AA9qUBQH9M8vjtbKw3ZXt3sEgATUqGFWCdzl1EU6grSQqLxqlOiG84Zgoj
	56W+Jv3jIgWXoYyus8ElwNhXu4ZuQIChpfhlNvMBtTZY/cwdxkMWwt45uZSMMhhmUNKERkK/5pE
	T18H1JKSPojH7kuGnwJQ2YgIQ71EPAApS+egyO341VYZXj9YNaEiicb8k4W0DldyZ+9cLL88K21
	17nzmEFu5VEvUkBK2uFnKZbPNIjggkqQNNWt8gRo4g==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261463637.24.1747204405595;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETSoI9iwfk9eb2Ld/QSv1BSUXn0GR0U4QVFH399Z38VQi+OSfnyJ8EGrjE5OEBrun47fcpcg==
X-Received: by 2002:a05:6a20:2d2c:b0:1f5:72eb:8b3f with SMTP id adf61e73a8af0-215ff11a590mr3261433637.24.1747204405177;
        Tue, 13 May 2025 23:33:25 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234941baacsm8298049a12.14.2025.05.13.23.33.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 23:33:24 -0700 (PDT)
Message-ID: <8899a562-2efd-9a63-5fc2-2972f47a9296@oss.qualcomm.com>
Date: Wed, 14 May 2025 12:03:16 +0530
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
Subject: Re: [PATCH v4 2/5] PCI/ERR: Add support for resetting the slots in a
 platform specific way
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
 <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250508-pcie-reset-slot-v4-2-7050093e2b50@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0qp3q5KoaHv-IstQr7tE59jnKQDJdkHW
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68243936 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=ljfrh_M9o-RCrfJy5NoA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDA1NSBTYWx0ZWRfX9wQjkYPi+mkh
 yFHNXtdwALOEG4c1As7vOMJlcfePQrzgd+LwnIYnYJkOw9kiNKrcLhOrMmiEvmp7o+063pgsmea
 xgYhd2E3VG71rTkrn7/nA2goFexFfR1LTk/K4oOqvfBUICp5rPVnlTFFY49QcYEJ6MQSA7NOZGE
 bGN1yDRlH7CAlAFzWVHdilJRGB9yuc3Smzb9+oleCVcHEgwL4pWzsGepTDSITZMecq7FhSIKlL+
 fV8qSDRYyqvwRKJkZwfFIeRVAgZz7loTH1PeEKkspqZWW6dWu9QfxPZRjbbgP4dpO46NVL2RZB7
 ia45PtLtSF6q7clf/0ICMYpZPcjuZgZys0BC6Thd9j4bCyBloH/eM6gQnkyyoyfl0wIFxm+/kls
 f5eUkQxPsgwecU3hP3df8/pUGzmeJwLNPLdKYWJLjGXoOxF9XztMKKmbf+wHpToNao+fqD1R
X-Proofpoint-GUID: 0qp3q5KoaHv-IstQr7tE59jnKQDJdkHW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_02,2025-05-14_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140055
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 5/8/2025 12:40 PM, Manivannan Sadhasivam wrote:
> Some host bridge devices require resetting the slots in a platform specific
> way to recover them from error conditions such as Fatal AER errors, Link
> Down etc... So introduce pci_host_bridge::reset_slot callback and call it
> from pcibios_reset_secondary_bus() if available.
> 
> The 'reset_slot' callback is responsible for resetting the given slot
> referenced by the 'pci_dev' pointer in a platform specific way and bring it
> back to the working state if possible. If any error occurs during the slot
> reset operation, relevant errno should be returned.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
>   drivers/pci/pci.c      | 12 ++++++++++++
>   drivers/pci/pcie/err.c |  5 -----
>   include/linux/pci.h    |  1 +
>   3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 4d7c9f64ea24ec754a135a2585c99489cfa641a9..13709bb898a967968540826a2b7ee8ade6b7e082 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4982,7 +4982,19 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>   
>   void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
>   {
> +	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
> +	int ret;
> +
> +	if (host->reset_slot) {
> +		ret = host->reset_slot(host, dev);
> +		if (ret)
> +			pci_err(dev, "failed to reset slot: %d\n", ret);
> +
> +		return;
> +	}
> +
>   	pci_reset_secondary_bus(dev);
> +
>   }
>   
>   /**
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index de6381c690f5c21f00021cdc7bde8d93a5c7db52..b834fc0d705938540d3d7d3d8739770c09fe7cf1 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -234,11 +234,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>   	}
>   
>   	if (status == PCI_ERS_RESULT_NEED_RESET) {
> -		/*
> -		 * TODO: Should call platform-specific
> -		 * functions to reset slot before calling
> -		 * drivers' slot_reset callbacks?
> -		 */
>   		status = PCI_ERS_RESULT_RECOVERED;
>   		pci_dbg(bridge, "broadcast slot_reset message\n");
>   		pci_walk_bridge(bridge, report_slot_reset, &status);
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 0e8e3fd77e96713054388bdc82f439e51023c1bf..8d7d2a49b76cf64b4218b179cec495e0d69ddf6f 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -599,6 +599,7 @@ struct pci_host_bridge {
>   	void (*release_fn)(struct pci_host_bridge *);
>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	int (*reset_slot)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>   	void		*release_data;
>   	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>   	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 

