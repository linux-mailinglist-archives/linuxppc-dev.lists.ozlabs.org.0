Return-Path: <linuxppc-dev+bounces-2524-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C00F9AD453
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 20:58:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYdby2r07z2xfR;
	Thu, 24 Oct 2024 05:58:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729709902;
	cv=none; b=jGwA/Gz3HOqrDwfBLo2DPU9NC/rDWtvaapR8qXKxLD2H6jF6CjI8BbTGBO43Yz4QAF7GIxfl04j977BnCAFB18qzZE826wrGBmZZ0Q4pTkXRTKTzqea8eE8n4e5LgyPrIyQ5Mj6fYPVGQijV3utmaTOE6YPrZJHUHYyDUUdJmjZ6COm3RicYDxIzDtDH39ScLgFs5OXUYUFOSCV7XIsaehCFnZgDsc5RZJE637i3kh3R/3AlUdtpq+d9HCIh/lTQVJwGrxqlsCrpGOrfAaLKn5LG4XSuzp5pepRMx4pgHqzAQiF675KSnqPs8iss/2vZ9NBCpbhTlloozdh5Ym1nKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729709902; c=relaxed/relaxed;
	bh=r/QqxjblBJWojKe0KlwoCvmdu8op31yPwNG0aKoFEKM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f0rk3+0b1zZ6XvT77cF3eDpkhfrb9eeycrit0x9QBZjRfOd8V2Sn38BAEb9FCGr8LngyP6mbLuEffv7WNmezzz02ZAUN9+as9tgWqKDsQ2uKJz3uqFunSoIp05koWmFmWyW9UEPKUbQ3HoqjFI8LuugiFhpeYMO5Zj9ON4/AuztvM37hiCOOjHUgMGQgQSjsI/XDi6b9ewgTEJYXWVg0zLJKD9Mq4B1u/lIZprRiXAP+8OTnouMI0hUdkf/ypfLFOXFYqnu5YmGHcNeA1vqXcZF96ZvCGHWSMB8d4+tvR8fejWHtbv2ZQXuNaJFmdd8+ZQmeINVcDBFLV7iS/K7A0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A2wP0WMx; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=A2wP0WMx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYdbw4YBKz2xWS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 05:58:19 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NDI0xP025218;
	Wed, 23 Oct 2024 18:58:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=r/Qqxj
	blBJWojKe0KlwoCvmdu8op31yPwNG0aKoFEKM=; b=A2wP0WMxKhHp0Qkmd0CXrt
	VrdCBQ8cUfDBneCXbm7mC5C5j5DtFqp0KyIYyrjAlS+04ZrE/mHscCNlWUwYlml6
	x7y+da3H8HNDTvRhS8XMswxejY5iNHFCVLKNtvUjycW9iVOnfLFv7+GBxYxK4Zc3
	KLpp9q8lA5IJ0NdxK6ql6uKt9JtbZPHfh0EpMgg0kjCHsLKncY7Vrw++hjqoCrOp
	U4wUvi1b30XXWqQL1blLbYhoN99Or7NomEfgOydrH0lNcwbhYuivpf3iVsZfuKEo
	QgOU/WgGuS78UzRcgbYLwpYJ2rFiLT49AG1SHNe/93ny1n/bdbNmBHzjjyH1D+/w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emaevm0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:58:05 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49NIw40G002651;
	Wed, 23 Oct 2024 18:58:04 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emaevm0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:58:04 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49NIjrp0014303;
	Wed, 23 Oct 2024 18:58:04 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42emhfmdk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 18:58:04 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49NIw25739846204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Oct 2024 18:58:03 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACF3458053;
	Wed, 23 Oct 2024 18:58:02 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D75958043;
	Wed, 23 Oct 2024 18:58:01 +0000 (GMT)
Received: from [9.24.4.192] (unknown [9.24.4.192])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Oct 2024 18:58:01 +0000 (GMT)
Message-ID: <bbeede5b-3568-4ae6-a844-88ff1e06359d@linux.ibm.com>
Date: Wed, 23 Oct 2024 13:58:00 -0500
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] ibmvnic: use ethtool string helpers
To: Rosen Penev <rosenp@gmail.com>, netdev@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Haren Myneni <haren@linux.ibm.com>,
        Rick Lindsley <ricklind@linux.ibm.com>,
        Thomas Falcon <tlfalcon@linux.ibm.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20241022203240.391648-1-rosenp@gmail.com>
Content-Language: en-US
From: Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <20241022203240.391648-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TnOPjsNF8DYuwR0ea2GOoCIlEgMtLL2p
X-Proofpoint-ORIG-GUID: 8lJsUry5mbrxGGcbZMFRg1Ou9DSyY6bJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 mlxscore=0 mlxlogscore=668
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230120
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 10/22/24 15:32, Rosen Penev wrote:
> They are the prefered way to copy ethtool strings.
> 
> Avoids manually incrementing the data pointer.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>   drivers/net/ethernet/ibm/ibmvnic.c | 30 +++++++++---------------------
>   1 file changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> index cca2ed6ad289..e95ae0d39948 100644
> --- a/drivers/net/ethernet/ibm/ibmvnic.c
> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> @@ -3808,32 +3808,20 @@ static void ibmvnic_get_strings(struct net_device *dev, u32 stringset, u8 *data)
>   	if (stringset != ETH_SS_STATS)
>   		return;
>   
> -	for (i = 0; i < ARRAY_SIZE(ibmvnic_stats); i++, data += ETH_GSTRING_LEN)
> -		memcpy(data, ibmvnic_stats[i].name, ETH_GSTRING_LEN);
> +	for (i = 0; i < ARRAY_SIZE(ibmvnic_stats); i++)
> +		ethtool_puts(&data, ibmvnic_stats[i].name);
>   
>   	for (i = 0; i < adapter->req_tx_queues; i++) {
> -		snprintf(data, ETH_GSTRING_LEN, "tx%d_batched_packets", i);
> -		data += ETH_GSTRING_LEN;
> -
> -		snprintf(data, ETH_GSTRING_LEN, "tx%d_direct_packets", i);
> -		data += ETH_GSTRING_LEN;
> -
> -		snprintf(data, ETH_GSTRING_LEN, "tx%d_bytes", i);
> -		data += ETH_GSTRING_LEN;
> -
> -		snprintf(data, ETH_GSTRING_LEN, "tx%d_dropped_packets", i);
> -		data += ETH_GSTRING_LEN;
> +		ethtool_sprintf(&data, "tx%d_batched_packets", i);
> +		ethtool_sprintf(&data, "tx%d_direct_packets", i);
> +		ethtool_sprintf(&data, "tx%d_bytes", i);
> +		ethtool_sprintf(&data, "tx%d_dropped_packets", i);
>   	}
>   
>   	for (i = 0; i < adapter->req_rx_queues; i++) {
> -		snprintf(data, ETH_GSTRING_LEN, "rx%d_packets", i);
> -		data += ETH_GSTRING_LEN;
> -
> -		snprintf(data, ETH_GSTRING_LEN, "rx%d_bytes", i);
> -		data += ETH_GSTRING_LEN;
> -
> -		snprintf(data, ETH_GSTRING_LEN, "rx%d_interrupts", i);
> -		data += ETH_GSTRING_LEN;
> +		ethtool_sprintf(&data, "rx%d_packets", i);
> +		ethtool_sprintf(&data, "rx%d_bytes", i);
> +		ethtool_sprintf(&data, "rx%d_interrupts", i);
>   	}
>   }
>   

Tested-by: Nick Child <nnac123@linux.ibm.com>

