Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A22671BD001
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 00:32:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bbwy13C9zDqvt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 08:32:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=julietk@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BbtZ2h8szDqSN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 08:29:57 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03SLYP5o079475; Tue, 28 Apr 2020 18:29:54 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30pu89bf2r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 18:29:54 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03SMPPHu013332;
 Tue, 28 Apr 2020 22:29:53 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 30mcu6fq5k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Apr 2020 22:29:53 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03SMTrL549611156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Apr 2020 22:29:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 13E1E124053;
 Tue, 28 Apr 2020 22:29:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15FB1124052;
 Tue, 28 Apr 2020 22:29:50 +0000 (GMT)
Received: from Juliets-MacBook-Pro.local (unknown [9.85.139.36])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue, 28 Apr 2020 22:29:49 +0000 (GMT)
Subject: Re: [PATCH net] ibmvnic: Fall back to 16 H_SEND_SUB_CRQ_INDIRECT
 entries with old FW
To: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org
References: <20200427173343.16626-1-julietk@linux.vnet.ibm.com>
 <8617ba73-8a05-51c4-e52b-164687cecf07@linux.ibm.com>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Message-ID: <4b58a9ab-99f1-2a58-9d15-00f700a4fbbd@linux.vnet.ibm.com>
Date: Tue, 28 Apr 2020 17:29:47 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <8617ba73-8a05-51c4-e52b-164687cecf07@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-28_14:2020-04-28,
 2020-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 adultscore=0 spamscore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2004280166
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/28/20 10:35 AM, Thomas Falcon wrote:
> On 4/27/20 12:33 PM, Juliet Kim wrote:
>> The maximum entries for H_SEND_SUB_CRQ_INDIRECT has increased on
>> some platforms from 16 to 128. If Live Partition Mobility is used
>> to migrate a running OS image from a newer source platform to an
>> older target platform, then H_SEND_SUB_CRQ_INDIRECT will fail with
>> H_PARAMETER if 128 entries are queued.
>>
>> Fix this by falling back to 16 entries if H_PARAMETER is returned
>> from the hcall().
>
> Thanks for the submission, but I am having a hard time believing that this is what is happening since the driver does not support sending multiple frames per hypervisor call at this time. Even if it were the case, this approach would omit frame data needed by the VF, so the second attempt may still fail. Are there system logs available that show the driver is attempting to send transmissions with greater than 16 descriptors?
>
> Thanks,
>
> Tom
>
>
I am trying to confirm.

Juliet

>>
>> Signed-off-by: Juliet Kim <julietk@linux.vnet.ibm.com>
>> ---
>>   drivers/net/ethernet/ibm/ibmvnic.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
>> index 4bd33245bad6..b66c2f26a427 100644
>> --- a/drivers/net/ethernet/ibm/ibmvnic.c
>> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
>> @@ -1656,6 +1656,17 @@ static netdev_tx_t ibmvnic_xmit(struct sk_buff *skb, struct net_device *netdev)
>>           lpar_rc = send_subcrq_indirect(adapter, handle_array[queue_num],
>>                              (u64)tx_buff->indir_dma,
>>                              (u64)num_entries);
>> +
>> +        /* Old firmware accepts max 16 num_entries */
>> +        if (lpar_rc == H_PARAMETER && num_entries > 16) {
>> +            tx_crq.v1.n_crq_elem = 16;
>> +            tx_buff->num_entries = 16;
>> +            lpar_rc = send_subcrq_indirect(adapter,
>> +                               handle_array[queue_num],
>> +                               (u64)tx_buff->indir_dma,
>> +                               16);
>> +        }
>> +
>>           dma_unmap_single(dev, tx_buff->indir_dma,
>>                    sizeof(tx_buff->indir_arr), DMA_TO_DEVICE);
>>       } else {
