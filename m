Return-Path: <linuxppc-dev+bounces-7242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BE3A6AC87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 18:55:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJYBY691Tz301B;
	Fri, 21 Mar 2025 04:55:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742493301;
	cv=none; b=KisBhc1PnyhnhG58Z73ZvOkW/kx58ODsNSyEjqYnPv1qcmL1x/jK0VjjJYMPa4cj5YjE0sYdoJ8MxCvXS/qFcTrGKlNu4X7jsQ7R2XQMM5D3hzhkWbGVXDq5d7VblX3PKnaD3jZxmPbkZ07FO8b57cc0rO2NmgE5qTC6Qc27nqsnTxqbBDMiBasu2/kAeW2Nwm38CQaAkbuLO4IwDOxUTFjZ8ZAm6jhc0kH44SwdphcOWgYw0rQQdALapKiwLIOUd8ljZDR+FqJ0NrZvowHynrb9RpKwLU8W5daV13+mSa104Fe+6xDbJLEXUnFr8AoZA6bXl3ncmA1WtiEq/jOspQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742493301; c=relaxed/relaxed;
	bh=fdAJmgA8x/DyLgki6UGmCIKVDlIrxAcV/gCy52yibzM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mz26oH2/FH4iV/NcBbKZaM+bL1TvSDcp98Wtxl5bXHKAOtQCIKkM6HZ/ypZNRKAmShB9+WhNlXW6PqZfQYUNFyQ+Y4aiILK3zsgcHK2pKGxCpE1pqM/DEKzCEXLvIzM87kNGxMe8HN9xnr8viHItT3RlPApN11/6Yv5VpO6Yq8NGOXulmvsdnVdcq2QQoFy9NVDhCSKV5P2j2uh3745Fp8jBbdSniWtx2F2kNq/Et1pZiLgJc2RLptja7Z0dmT5Zh7VSVe/smzjwlFpEDLQ/pYmCh9KDp3TtOOMYEP+xV/EvWxRtYGJlwBOsKbyNxewAw+0qqAfremBpBjiH+5M0yA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQz9AiiA; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bQz9AiiA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJYBX63rPz2ySh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 04:55:00 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52KCS0Yt030296;
	Thu, 20 Mar 2025 17:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fdAJmg
	A8x/DyLgki6UGmCIKVDlIrxAcV/gCy52yibzM=; b=bQz9AiiAuGSrKdHEPcEB8f
	IABivnIpupqYJMsPlqaJaShNowYW6bXXdoLS5GH67i0yVgstu9pK/3ZC7B59CNep
	9WsEI37+uJ6BAmpgRf9tMvY+q4fW42QNS8PDjACylARHCB2BwAIjhArJr3P4m7Ah
	QsYxSiRbxhTGM+J2GP8sOrFW3UnY/506ae/dxLDkwfJSbnBw7LTR9WhOjNpkAYjo
	ZQdJGF3DXZ7RIh1uHfBiXuUQRFZWyzBZVcCWNgt3gAcpV/2cKQiV91D6bIQ53JoZ
	TIzzKUG6/hs5GvJHeLeljft3fUSGx+cS2evWOI4vTtDWYMmtHPClCNapKdjjVAFg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gk21sv4a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 17:54:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52KGXH8U020324;
	Thu, 20 Mar 2025 17:54:54 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dncmh81k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 17:54:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52KHsqt441091458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 17:54:52 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37D8020043;
	Thu, 20 Mar 2025 17:54:52 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BD6920040;
	Thu, 20 Mar 2025 17:54:50 +0000 (GMT)
Received: from [9.124.213.75] (unknown [9.124.213.75])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 20 Mar 2025 17:54:50 +0000 (GMT)
Message-ID: <9131d1be-d68e-48d6-afe3-af8949194b21@linux.ibm.com>
Date: Thu, 20 Mar 2025 23:24:49 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vfio: pci: Advertise INTx only if LINE is connected
To: Alex Williamson <alex.williamson@redhat.com>
Cc: jgg@ziepe.ca, kevin.tian@intel.com, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, yi.l.liu@intel.com, Yunxiang.Li@amd.com,
        pstanner@redhat.com, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
References: <174231895238.2295.12586708771396482526.stgit@linux.ibm.com>
 <20250318115832.04abbea7.alex.williamson@redhat.com>
Content-Language: en-US
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
In-Reply-To: <20250318115832.04abbea7.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2ArvXWe6IanlGKcJBSbLAOIKEdIivx5Z
X-Proofpoint-GUID: 2ArvXWe6IanlGKcJBSbLAOIKEdIivx5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_05,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200111
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/18/25 11:28 PM, Alex Williamson wrote:
> On Tue, 18 Mar 2025 17:29:21 +0000
> Shivaprasad G Bhat <sbhat@linux.ibm.com> wrote:
>
>> On POWER systems, when the device is behind the io expander,
>> not all PCI slots would have the PCI_INTERRUPT_LINE connected.
>> The firmware assigns a valid PCI_INTERRUPT_PIN though. In such
>> configuration, the irq_info ioctl currently advertizes the
>> irq count as 1 as the PCI_INTERRUPT_PIN is valid.
>>
>> The patch adds the additional check[1] if the irq is assigned
>> for the PIN which is done iff the LINE is connected.
>>
>> [1]: https://lore.kernel.org/qemu-devel/20250131150201.048aa3bf.alex.williamson@redhat.com/
>>
>> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
>> Suggested-By: Alex Williamson <alex.williamson@redhat.com>
>> ---
>>   drivers/vfio/pci/vfio_pci_core.c |    4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
>> index 586e49efb81b..4ce70f05b4a8 100644
>> --- a/drivers/vfio/pci/vfio_pci_core.c
>> +++ b/drivers/vfio/pci/vfio_pci_core.c
>> @@ -734,6 +734,10 @@ static int vfio_pci_get_irq_count(struct vfio_pci_core_device *vdev, int irq_typ
>>   			return 0;
>>   
>>   		pci_read_config_byte(vdev->pdev, PCI_INTERRUPT_PIN, &pin);
>> +#if IS_ENABLED(CONFIG_PPC64)
>> +		if (!vdev->pdev->irq)
>> +			pin = 0;
>> +#endif
>>   
>>   		return pin ? 1 : 0;
>>   	} else if (irq_type == VFIO_PCI_MSI_IRQ_INDEX) {
>>
>>
> See:
>
> https://lore.kernel.org/all/20250311230623.1264283-1-alex.williamson@redhat.com/
>
> Do we need to expand that to test !vdev->pdev->irq in
> vfio_config_init()?

Yes. Looks to be the better option. I did try this and it works.


I see your patch has already got Reviewed-by. Are you planning

for v2 Or want me to post a separate patch with this new check?


> We don't allow a zero irq to be enabled in
> vfio_intx_enable(), so we might as well not report it as supported.

Yes. I agree.


Thank you!


Regards,

Shivaprasad



