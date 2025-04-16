Return-Path: <linuxppc-dev+bounces-7688-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12179A905CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 16:13:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd3103LtTz2yf9;
	Thu, 17 Apr 2025 00:13:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744812836;
	cv=none; b=jJXkvWvDqtK2rNDIMgnu4FI+U2NgNas2sWc5nTu/5XsLyzzJwTSfE1p7daUsdHMsMvkeBET64pbW5QtCVviS7hw2YPBVcWx4RrosKKZCmj+2rlw+PTLCvVu1w29tMFqlNjV8GTlPcx0QGL0npScTCFce+QVvU6DeQ9s4gccUP0jATLll248iTs1L4qfi6zReC+aoMM8PpuCUy4G8DpB0ZeiOj+loZGJrbfMPJDCMyC0QSQw/Xd3GwIL01XdHY2IHBkZEH5E5dy+8QR0hQWItDRdy31YmAY1boc7SG8xX3pqWs5KbkXv4NxQepuTzQkKwJNv2FJqWX4lOIQ37LDuwlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744812836; c=relaxed/relaxed;
	bh=Kg7g99BYB8SaEZHORP0dZSRe0tlnjVtMmCUo1y3MJV4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UL45yT3ywVwSd92i6c5IsPaGyIkQeqkK0v8t4T0zDWOETzHjFu5A6W7VoDE/WJPV6BhOaoNA7P+RmV7gBBtvfLF4Pq5UXmoS1m5XqvjRBJEH8Ux+z3oREjC1UdebqiUZMX88aGXlyKTXGBjhCXmb6EOaVRWnnCukeheKUlx2MDc4tEc+YMI6Or1lckipNs68j07/LnTNN/epq76kes39ChZX5OcSGNWMdiUdrEtEP0N0yxU8FQoTp4kHg/m/TWgKwLkMVBPU6VFB35ZOQdkeXqlDIi+nrOhb29EAzN8IcB2T1vqNCxpWVDIq1YBEtNEHAQ0Wm9EfROSiQoeBPByCtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EPtVOq3m; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EPtVOq3m;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd30z0tG4z2yS7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 00:13:54 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAea7i019797;
	Wed, 16 Apr 2025 14:13:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=Kg7g99BYB8SaEZHORP0dZSRe0tlnjV
	tMmCUo1y3MJV4=; b=EPtVOq3mhLU1kvvzny31SiRZHfua7ot2YVzjgJcNJh+g8d
	uAt8nYFtCGgp4Ko9KxV/LCQ8sFdb4FsV6WKsnt0AWKy1eiA6dnvPaK6DaeyivjTI
	/iGzGD/0bZDhWXwzr7RayWIyYBxcuO7Vv7Paiw4DS1542VsuTsG2QtBii4MJ+fPy
	1CJSYzrslCT1KWWMkSYSVuBtYNZzX5PzsWHgfkTcEos5jKveJE25w8MlYBkXX5iI
	1PxuLY3CuLr0Mu1jRqQ+OVbxvfrmqqCrrt+Ed/iS1DXYwDdTsADEMoeyG6j+dsB9
	0BCdCDSVqReyGADTzBQtnyPiN/navqzrDDELXiXg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 462b0q13fk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:13:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53GAQmTE030919;
	Wed, 16 Apr 2025 14:13:43 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4603gnrqpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 14:13:43 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53GEDg4F22741658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 16 Apr 2025 14:13:42 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AE8758061;
	Wed, 16 Apr 2025 14:13:42 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C01EA5805D;
	Wed, 16 Apr 2025 14:13:41 +0000 (GMT)
Received: from d.ibm.com (unknown [9.61.55.205])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 16 Apr 2025 14:13:41 +0000 (GMT)
From: Dave Marquardt <davemarq@linux.ibm.com>
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, michal.swiatkowski@linux.intel.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next v2 1/2] net: ibmveth: make ibmveth use WARN_ON
 instead of BUG_ON
In-Reply-To: <20250416123449.GQ395307@horms.kernel.org> (Simon Horman's
	message of "Wed, 16 Apr 2025 13:34:49 +0100")
References: <20250414194016.437838-1-davemarq@linux.ibm.com>
	<20250414194016.437838-2-davemarq@linux.ibm.com>
	<20250416123449.GQ395307@horms.kernel.org>
Date: Wed, 16 Apr 2025 09:13:40 -0500
Message-ID: <877c3kdwiz.fsf@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 4HOrPrJVLIXs7Ie9wzPM09t9FYmVhU00
X-Proofpoint-GUID: 4HOrPrJVLIXs7Ie9wzPM09t9FYmVhU00
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_04,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504160115
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Simon Horman <horms@kernel.org> writes:

> On Mon, Apr 14, 2025 at 02:40:15PM -0500, Dave Marquardt wrote:
>> Replaced BUG_ON calls with WARN_ON calls with error handling, with
>> calls to a new ibmveth_reset routine, which resets the device. Removed
>> conflicting and unneeded forward declaration.
>
> To me the most important change here is adding the ibmveth_reset.
> So I would report that in the subject (rather than the WARN_ON) change.
> But perhaps that is just me.

Thanks, I'll consider that.

>> 
>> Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
>> ---
>>  drivers/net/ethernet/ibm/ibmveth.c | 116 ++++++++++++++++++++++++-----
>>  drivers/net/ethernet/ibm/ibmveth.h |  65 ++++++++--------
>>  2 files changed, 130 insertions(+), 51 deletions(-)
>> 
>> diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
>
> ...
>
>> @@ -370,20 +372,36 @@ static void ibmveth_free_buffer_pool(struct ibmveth_adapter *adapter,
>>  	}
>>  }
>>  
>> -/* remove a buffer from a pool */
>> -static void ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
>> -					    u64 correlator, bool reuse)
>> +/**
>> + * ibmveth_remove_buffer_from_pool - remove a buffer from a pool
>> + * @adapter: adapter instance
>> + * @correlator: identifies pool and index
>> + * @reuse: whether to reuse buffer
>
> The above is the correct way to document function parameters in a Kernel doc.
>
>> + *
>> + * Return:
>> + * * %0       - success
>> + * * %-EINVAL - correlator maps to pool or index out of range
>> + * * %-EFAULT - pool and index map to null skb
>> + */
>> +static int ibmveth_remove_buffer_from_pool(struct ibmveth_adapter *adapter,
>> +					   u64 correlator, bool reuse)
>
> ...
>
>> +/**
>> + * ibmveth_rxq_harvest_buffer - Harvest buffer from pool
>> + *
>> + * @adapter - pointer to adapter
>> + * @reuse   - whether to reuse buffer
>
> But this is not correct. IOW, tooling expects
> f.e. @adapter: ...  rather than @adapter - ...
>
> Flagged by W=1 builds and ./scripts/kernel-doc -none

Thanks, I'll start using this in my work.

>> + *
>> + * Context: called from ibmveth_poll
>> + *
>> + * Return:
>> + * * %0    - success
>> + * * other - non-zero return from ibmveth_remove_buffer_from_pool
>> + */
>> +static int ibmveth_rxq_harvest_buffer(struct ibmveth_adapter *adapter,
>> +				      bool reuse)
>
> ...
>
>> diff --git a/drivers/net/ethernet/ibm/ibmveth.h b/drivers/net/ethernet/ibm/ibmveth.h
>> index 8468e2c59d7a..b0a2460ec9f9 100644
>> --- a/drivers/net/ethernet/ibm/ibmveth.h
>> +++ b/drivers/net/ethernet/ibm/ibmveth.h
>> @@ -134,38 +134,39 @@ struct ibmveth_rx_q {
>>  };
>>  
>>  struct ibmveth_adapter {
>> -    struct vio_dev *vdev;
>> -    struct net_device *netdev;
>> -    struct napi_struct napi;
>> -    unsigned int mcastFilterSize;
>> -    void * buffer_list_addr;
>> -    void * filter_list_addr;
>> -    void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
>> -    unsigned int tx_ltb_size;
>> -    dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
>> -    dma_addr_t buffer_list_dma;
>> -    dma_addr_t filter_list_dma;
>> -    struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
>> -    struct ibmveth_rx_q rx_queue;
>> -    int rx_csum;
>> -    int large_send;
>> -    bool is_active_trunk;
>> -
>> -    u64 fw_ipv6_csum_support;
>> -    u64 fw_ipv4_csum_support;
>> -    u64 fw_large_send_support;
>> -    /* adapter specific stats */
>> -    u64 replenish_task_cycles;
>> -    u64 replenish_no_mem;
>> -    u64 replenish_add_buff_failure;
>> -    u64 replenish_add_buff_success;
>> -    u64 rx_invalid_buffer;
>> -    u64 rx_no_buffer;
>> -    u64 tx_map_failed;
>> -    u64 tx_send_failed;
>> -    u64 tx_large_packets;
>> -    u64 rx_large_packets;
>> -    /* Ethtool settings */
>> +	struct vio_dev *vdev;
>> +	struct net_device *netdev;
>> +	struct napi_struct napi;
>> +	struct work_struct work;
>> +	unsigned int mcastFilterSize;
>> +	void *buffer_list_addr;
>> +	void *filter_list_addr;
>> +	void *tx_ltb_ptr[IBMVETH_MAX_QUEUES];
>> +	unsigned int tx_ltb_size;
>> +	dma_addr_t tx_ltb_dma[IBMVETH_MAX_QUEUES];
>> +	dma_addr_t buffer_list_dma;
>> +	dma_addr_t filter_list_dma;
>> +	struct ibmveth_buff_pool rx_buff_pool[IBMVETH_NUM_BUFF_POOLS];
>> +	struct ibmveth_rx_q rx_queue;
>> +	int rx_csum;
>> +	int large_send;
>> +	bool is_active_trunk;
>> +
>> +	u64 fw_ipv6_csum_support;
>> +	u64 fw_ipv4_csum_support;
>> +	u64 fw_large_send_support;
>> +	/* adapter specific stats */
>> +	u64 replenish_task_cycles;
>> +	u64 replenish_no_mem;
>> +	u64 replenish_add_buff_failure;
>> +	u64 replenish_add_buff_success;
>> +	u64 rx_invalid_buffer;
>> +	u64 rx_no_buffer;
>> +	u64 tx_map_failed;
>> +	u64 tx_send_failed;
>> +	u64 tx_large_packets;
>> +	u64 rx_large_packets;
>> +	/* Ethtool settings */
>>  	u8 duplex;
>>  	u32 speed;
>>  };
>
> If you would like to update the indentation of this structure
> then please do so in a separate patch which precedes
> adding/removing/chainging fields of the structure.
>
> As it, it's very hard to see the non-formatting changes in this hunk.

I agree. Thanks for the suggestion.

-Dave

