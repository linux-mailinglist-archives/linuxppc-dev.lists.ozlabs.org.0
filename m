Return-Path: <linuxppc-dev+bounces-7647-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A96EA8818D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Apr 2025 15:18:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbnsN1v5sz2yqc;
	Mon, 14 Apr 2025 23:18:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744636680;
	cv=none; b=gwEDmjThNrcTE8xj/Vcb4vJXfTCV/qSLs1+GB4tdHGWzLOIlucnEcX3aTPE1BFPS6A3CLxmY521vsLOLqC2MWVH5B5BUvQ44mpDpdOK3we6Pe0iOnQflX3mE43Q0heiFci/sqXE9q5rOzk387RBGR32aIxpI4Ax597opdYM44707W6M3dMXFduQRTUIjf0r+GGLIAHKJBOnSeqUYtlaD+8qQDkA3tL0IjtwIunVl7rx3Mc9yplBE+9IkbOY6XiZTU3NTHls70/PaHoYsr1DwOglD8O11v3EGEC+xdvBv4Ghzqsz6HB7mgH5qe2fBl5YyR8N3lZn9FNA9olABejxO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744636680; c=relaxed/relaxed;
	bh=8VE57CFYuSWnpfedeptxs8N1kct+AUFt+N8bO011XO4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hGrZB3o/xPlJx/bfGphg6cSUOLv9HCYH1weFiPzBctNVVtWTeNyWFeB7JILneSAGDH4+F7D0Rjrnu9Nv8OA5lreAL4XVgccyYKwa9j/5wJel1zgwomlCqJG4ovTPBRA2DCQ7LMT3dcm8KnIvSTN8goLmdCM/ONnp9nxHsGKe1/r6sMtvnhECojt1gOPDZ50HKq696zSttPU/Uzktxy+O+jrjyRTnked0R4APyxnTYCDGB4/NHsKHy+VJwa242W4P7EU8OtLt43KSqhwbKExSEEf74l8v7ZIHj0vcRiRCgsdTh4qulSszvUW0dPKp3Cd5xIfBlLW4vHVbyKSepnwKsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wu687hea; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Wu687hea;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbnsL42Krz2ygD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 23:17:57 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53EAej3p012665;
	Mon, 14 Apr 2025 13:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=8VE57CFYuSWnpfedeptxs8N1kct+AU
	Ft+N8bO011XO4=; b=Wu687heaFzkO1n45JIgh//CUD9GtU97lXkw+PgC5KWpYSA
	7iVKbKJ8+ICYs1EimM/k8qqCs/4LxGY8E3UNqEkfTYoZozYD63hYaaPliCl1yj14
	OKwc8/XvTJVVNLmg6zyqpVBCixVJXfqokMNxfAfzkDclYQjWbFqtD9Orx0iZayob
	WeJ2wMYX4sMS9gbbc+yua0ir8CtipUl9zXu/hDnWdcMPf67AUNWNXV6RxYZCDNWM
	vVIqdicqOMGV537l55+otgWUc9lHuF6ktevu4DCzN+bxOFD1DuO3k3W5AQKBTZT5
	dJhxC/RSpUzb1hr+aIryAWYEbu2AiRTU7uv2l11g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4610tp8q70-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:17:51 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53EAxas6024914;
	Mon, 14 Apr 2025 13:17:50 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4602gt6njv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 13:17:50 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53EDHlcJ31392442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Apr 2025 13:17:47 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BC7858055;
	Mon, 14 Apr 2025 13:17:50 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF2835804B;
	Mon, 14 Apr 2025 13:17:49 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.3.79])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 14 Apr 2025 13:17:49 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Michal Swiatkowski <michal.swiatkowski@linux.intel.com>
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] ibmveth: Use WARN_ON with error handling
 rather than BUG_ON
In-Reply-To: <Z/iwd8qonlrfOkO5@mev-dev.igk.intel.com> (Michal Swiatkowski's
	message of "Fri, 11 Apr 2025 08:02:31 +0200")
References: <20250410183918.422936-1-davemarq@linux.ibm.com>
	<Z/iwd8qonlrfOkO5@mev-dev.igk.intel.com>
Date: Mon, 14 Apr 2025 08:17:49 -0500
Message-ID: <87o6wyhog2.fsf@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4I7gNUnM2h20g9MDMZfyoQQWrFIHVeLR
X-Proofpoint-ORIG-GUID: 4I7gNUnM2h20g9MDMZfyoQQWrFIHVeLR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 clxscore=1011 mlxlogscore=999 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504140095
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Michal Swiatkowski <michal.swiatkowski@linux.intel.com> writes:

> On Thu, Apr 10, 2025 at 01:39:18PM -0500, Dave Marquardt wrote:
>> - Replaced BUG_ON calls with WARN_ON calls with error handling,
>>   with calls to a new ibmveth_reset routine, which resets the device.
>> - Added KUnit tests for ibmveth_remove_buffer_from_pool and
>>   ibmveth_rxq_get_buffer under new IBMVETH_KUNIT_TEST config option.
>> - Removed unneeded forward declaration of ibmveth_rxq_harvest_buffer.
>
> It will be great if you split this patch into 3 patches according to
> your description.

Thanks. I debated the right approach here. Thanks for the guidance.

>>  static struct kobj_type ktype_veth_pool;
>> @@ -231,7 +230,10 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
>>  		index = pool->free_map[free_index];
>>  		skb = NULL;
>>  
>> -		BUG_ON(index == IBM_VETH_INVALID_MAP);
>> +		if (WARN_ON(index == IBM_VETH_INVALID_MAP)) {
>> +			(void)schedule_work(&adapter->work);
>
> What is the purpose of void casting here (and in other places in this
> patch)?

I'm indicating that I'm ignoring the bool returned by schedule_work().
Since this seemed odd to you, I take it the convention in Linux code is
not doing this.

>> +			goto failure2;
>
> Maybe increment_buffer_failure, or sth that is telling what happen after
> goto.

Okay, I can change that.

>> +		}
>>  
>>  		/* are we allocating a new buffer or recycling an old one */
>>  		if (pool->skbuff[index])
>> @@ -300,6 +302,7 @@ static void ibmveth_replenish_buffer_pool(struct ibmveth_adapter *adapter,
>>  		                 DMA_FROM_DEVICE);
>>  	dev_kfree_skb_any(pool->skbuff[index]);
>>  	pool->skbuff[index] = NULL;
>> +failure2:
>>  	adapter->replenish_add_buff_failure++;
>>  
>>  	mb();
>> @@ -370,20 +373,36 @@ static void ibmveth_free_buffer_pool(struct ibmveth_adapter *adapter,
>>  	}
>>  }
>>  
>
> [...]

Thanks for your review!

-Dave

