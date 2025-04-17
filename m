Return-Path: <linuxppc-dev+bounces-7736-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E092A91BB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 14:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdcGs0b7rz2ygk;
	Thu, 17 Apr 2025 22:12:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744883310;
	cv=none; b=ofgvaZtrYQoZJBWviu5KeeXwcDPhPF60n9zG8dRZPux+p/g+iPLVOXEx1lVK6ytNbVYu3leivE/iCHiLjE8zwHNtjuf7HNzgBTYOubu3inyvdcIVo7B7kjOvFUkHo4kTlVtT1k7gdaz3EqvCK3SDydqM7xw3PEjXU9jf1LH/8aW7vedH78a8tNE+h5Y3ltnfDddUHT9/hleyPD+milV96//x1aEcodKusc7VL7k3wX29jqrAlkyOtF0aW3Vqn2zny1ooTnpU76zEubkQqhGVIcXzJdp0xNNXE9uHZmSMXZKNFYumNWBrdQWrEs0Ty5rl2NyGA5OrcWf6gQ/OBKvI5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744883310; c=relaxed/relaxed;
	bh=ib44xKBj/Ro+Xh08yJf1yGF0ql4Q7w+22UKEcuxyUGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dIrm7SnTcEO+j8QS0S5WIxYXFYFiWqY3nEHb4t4XE3WGcuJqKotFf2ePVKOAmg+IdNIMRytOeaE1H27EDBU1u6GcisM+xiV6ip4nEsp+/4DYmCzM8BPc56L3kbG9SpQwRHKoEBiLQmYfNcbgTYtPR2xkXulM2MAVyItiTNyb5Gq9Yh2XFgQjJwarPQMGonRltImn011wBLGJ2r9R6xMyxbz/xhGnAAyYpxY8hDE8AJgnsS4vV/itt5Ypv6T/wnNGzbgQ6F+3ijydePDgPwhq8rzHpYhk2+P54VChu3EiS2UO96Ib2EQyv086JJTdNBNafxop2ly9mcOnZLH+iN4Vzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uv0qjN97; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uv0qjN97;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=krishna.chundru@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2183 seconds by postgrey-1.37 at boromir; Thu, 17 Apr 2025 19:48:28 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdY4D6W9Hz305P
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 19:48:26 +1000 (AEST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53H5l6bR027212
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 09:12:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ib44xKBj/Ro+Xh08yJf1yGF0ql4Q7w+22UKEcuxyUGk=; b=Uv0qjN97adMvtefz
	EGm8EizDkZw6NWJUroUIg6Re6QCO0cnRWiLoMQNnp0n9A7OfwDB6MlrjPUQjFVN2
	RhoKU+OiCE2gx/QGfen8TjmLgivVvd9lIgod8tXQf7735RuZ0vp/tcwdCN2Z16MO
	XYIWC2IRhfWgdM3X++Rrc4/QY7WWQQXx3MJQoTTZPLQBgI3ZGoGq9q7jOTSoRXKQ
	UZFdl6N3FCwaq9rfb6fsDD6cAhCnpLKZXf7UdPkAxitmc7Qr8jWIr0nUKRUuEfXh
	hDuEc/z7La/wDE1Lk3wNjgNLWxPQ1+fCLOrvo5gm/s8b5WM/E+GxwU8MIoKj/dJT
	M4MYCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvjej1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 09:12:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22c31b55ac6so10569215ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:12:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744881121; x=1745485921;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ib44xKBj/Ro+Xh08yJf1yGF0ql4Q7w+22UKEcuxyUGk=;
        b=LNSTuGsglectCZO2YeEo99YZCJDc/pjLnuApgYR89TXPZ2uXYEUXCOZN0SNvcpx/pS
         rAmMzrc43Or1kdaysfs0mezcybZO66JTWkg8Cn252M/jEXy55G4ESMrfDmGy/deiNIfm
         OzzFPCVj8r/yHDgv+TMhYIyVsctWon/e74W8mZtVdsfZJi3S/xHC7WjpzIifuDa8Mixb
         M0+ZAszqlAwItBc+Wos5Dxox7b3HEl84ycHYXmOO2KrVtMZNQJEcuL4bAvCrAO/JWzhl
         0JrxZmQXlWWphE6YHoLZFZmxFKXiu2lNYpHPPs+oivZlcB9hVdfBzxmI0UrpfU+yJ2bl
         zI3w==
X-Forwarded-Encrypted: i=1; AJvYcCW1eYk4rNxEGu/b/EoTlppI1AwtBWMAGnH8HWp3lVtdkKEUTgtSalQKY7Qemfk19sdm0TmFLPnBl+eeaOU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpR2FR4FEPsPcKMXCDDw0btfAjUbkQQTWW24+xuVPvvbXdRVV2
	56aJ9IYG/jNjctIKM7WEIykS/mJ8W/bOSk9IEN6XCaM9Y1u8y8ixCS0+iH2FLulzjaFAbvDt1UK
	cvgGc8MAcDu+UZVifoyXJlOKv14eLfzmqbIq911Df7h3pwGOrI5WxP5zYS7AO6arV
X-Gm-Gg: ASbGnctiFtvo/NsnKkQrPZFAfihDewkn/cR4fEc31O/hcP+Ls2Yid4nk2fY+ytBCoHr
	JFxBmNwteDovpV6/ajRj1ooqvgFgO3Wl3o0cxkwm+UCHZ+5vWjtuo3SSXq1vo/Ge1qRLSKz04My
	PJekicKK5dEZzmkbRiMObVmQLDT2yGhu98Toiwc6/a+wi5TrEqrgzbsN7KImM3fe+hmAjkiZclM
	VqtC9PS0qjDl8n2cioS+8t9Y187eiJPaeNz/eKcgliJmFB7Q67JJiizGgjd78WpR4aMScet6wUF
	1x1Jw2Ard9uc7hj68W7ppMt67/hM3jDDX8NSIg9HwQ==
X-Received: by 2002:a17:903:2f85:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22c35973405mr86070435ad.41.1744881121017;
        Thu, 17 Apr 2025 02:12:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQyKNgE0DokKtvPIYouYE1uOOI7So2YqEjxzqZuyFFiQfJrMgw7yOOs6D0q9vCJ2ghjk5ZDA==
X-Received: by 2002:a17:903:2f85:b0:223:6744:bfb9 with SMTP id d9443c01a7336-22c35973405mr86070015ad.41.1744881120660;
        Thu, 17 Apr 2025 02:12:00 -0700 (PDT)
Received: from [10.92.199.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe9810sm28564065ad.249.2025.04.17.02.11.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 02:12:00 -0700 (PDT)
Message-ID: <2c0b0929-0610-3e99-03be-a50e9f5f323b@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 14:41:55 +0530
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
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Content-Language: en-US
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Oliver O'Halloran <oohall@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=c5=84ski?= <kw@linux.com>,
        Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org,
        Lukas Wunner <lukas@wunner.de>, linuxppc-dev@lists.ozlabs.org,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
 <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=6800c5e1 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=om0y8n2fdRonrlNA1WoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: xP0TPir5Qnt8H9VHoT5HPs-H0ySWYIYd
X-Proofpoint-ORIG-GUID: xP0TPir5Qnt8H9VHoT5HPs-H0ySWYIYd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170071
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/17/2025 1:24 PM, Manivannan Sadhasivam wrote:
> On Wed, Apr 16, 2025 at 11:21:49PM +0530, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 4/16/2025 9:59 PM, Manivannan Sadhasivam via B4 Relay wrote:
>>> From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>>
>>> The PCI link, when down, needs to be recovered to bring it back. But that
>>> cannot be done in a generic way as link recovery procedure is specific to
>>> host bridges. So add a new API pci_host_handle_link_down() that could be
>>> called by the host bridge drivers when the link goes down.
>>>
>>> The API will iterate through all the slots and calls the pcie_do_recovery()
>>> function with 'pci_channel_io_frozen' as the state. This will result in the
>>> execution of the AER Fatal error handling code. Since the link down
>>> recovery is pretty much the same as AER Fatal error handling,
>>> pcie_do_recovery() helper is reused here. First the AER error_detected
>>> callback will be triggered for the bridge and the downstream devices. Then,
>>> pcie_do_slot_reset() will be called for each slots, which will reset the
>>> slots using 'reset_slot' callback to recover the link. Once that's done,
>>> resume message will be broadcasted to the bridge and the downstream devices
>>> indicating successful link recovery.
>>>
>>> In case if the AER support is not enabled in the kernel, only
>>> pci_bus_error_reset() will be called for each slots as there is no way we
>>> could inform the drivers about link recovery.
>>>
>> The PCIe endpoint drivers are registering with err_handlers and they
>> will be invoked only from pcie_do_recovery, but there are getting built
>> by default irrespective of AER is enabled or not.
>>
> 
> AER is *one* of the functionalities of an endpoint. And the endpoint could
> mostly work without AER reporting (except for AER fatal/non-fatal where recovery
> need to be performed by the host). So it wouldn't make sense to add AER
> dependency for them.
> 
>> Does it make sense to built err.c irrespective of AER is enabled or not
>> to use common logic without the need of having dependency on AER.
>>
> 
> Well, yes and no. Right now, only DPC reuses the err handlers except AER. But
> DPC driver itself is functional dependent on AER. So I don't think it is really
> required to build err.c independent of AER. But I will try to rework the code in
> the future for fixing things like 'AER' prefix added to logs and such.
>
Right now we have DPC & AER to use this pcie_do_recovery(), now we are
adding supporting for controller reported error (Link down) not sure if
there will be newer ways to report errors in future.

May be not in this series, in future better to de-couple err.c from
AER as err.c. As the sources of error reporting is not limited to AER
or DPC alone now.

>> Also since err.c is tied with AER, DPC also had a hard requirement
>> to enable AER which is not needed technically.
>>
> 
> DPC driver is functional dependent on AER.
I got a impression by seeing below statement that DPC can work
independently.
As per spec 6 sec 6.2.11.2, DPC error signaling "A DPC-capable
Downstream Port must support ERR_COR signaling, independent of whether
it supports Advanced Error Reporting (AER) or not".

In fact it can work if AER is not enabled also, but will not have full
functionality of DPC.

- Krishna Chaitanya.
> 
> - Mani
> 

