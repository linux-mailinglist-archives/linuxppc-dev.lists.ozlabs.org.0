Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CABFA2B9C26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 21:39:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcWkh0QB6zDqsG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Nov 2020 07:39:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dPnV+mle; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcWhx4qXfzDqpC;
 Fri, 20 Nov 2020 07:38:09 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJKXYXh117961; Thu, 19 Nov 2020 15:38:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=J8JOzrBszYo1HYQhBcjmXPwwN8xdh7+UYUtraPgogWA=;
 b=dPnV+mleC6DBFvejh1ShOgSDCHFJcSfRXbXw6d4xnaEuY3aa8e0RJw6nST0IJDAy2MQV
 GH55+x2hrRNiI4gJjHxfWZMWsCk6phETiwFQ/hZz+P+ETyIbI2XFFAHncN1wxGU6IQG2
 hl+yHayR78Jz06wAHtPWrFCny5++nuxKat9D5bCK+fditJ9s/lVsPphWmKMOxj0HTVUZ
 12EmgA5dNhZTBGgNhpAsJJJdHc9yLPRP1XPqFppRM14EQWob46RomZcc5shCUDTSJoYv
 J8a+crdm1XfZOyk3g++BJHQdNfD44Vn9Pwo8vmMZURlQwPy1DmYSiS/p7B1DmOUapXgU jQ== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wy6bs8em-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 15:38:05 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJKOLfl016076;
 Thu, 19 Nov 2020 20:38:04 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 34uyn1qrvg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 20:38:04 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJKc3TK328354
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 20:38:03 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B76AF28059;
 Thu, 19 Nov 2020 20:38:03 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B831C28058;
 Thu, 19 Nov 2020 20:38:02 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 20:38:02 +0000 (GMT)
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 14:38:02 -0600
From: ljp <ljp@linux.vnet.ibm.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net-next v2 9/9] ibmvnic: Do not replenish RX buffers
 after every polling loop
In-Reply-To: <83ca37f3-07be-4179-8414-88c8c83bfe56@linux.ibm.com>
References: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
 <1605748345-32062-10-git-send-email-tlfalcon@linux.ibm.com>
 <1a4e7b1ef1fb101cbb26fb9d5867ee46@linux.vnet.ibm.com>
 <83ca37f3-07be-4179-8414-88c8c83bfe56@linux.ibm.com>
Message-ID: <7853649c6c1f2f4ce6d8bf9643cd1a43@linux.vnet.ibm.com>
X-Sender: ljp@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_10:2020-11-19,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=413 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190138
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com,
 Linuxppc-dev <linuxppc-dev-bounces+ljp=linux.ibm.com@lists.ozlabs.org>,
 drt@linux.vnet.ibm.com, brking@linux.vnet.ibm.com, kuba@kernel.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-11-19 14:26, Thomas Falcon wrote:
> On 11/19/20 3:43 AM, ljp wrote:
> 
>> On 2020-11-18 19:12, Thomas Falcon wrote:
>> 
>>> From: "Dwip N. Banerjee" <dnbanerg@us.ibm.com>
>>> 
>>> Reduce the amount of time spent replenishing RX buffers by
>>> only doing so once available buffers has fallen under a certain
>>> threshold, in this case half of the total number of buffers, or
>>> if the polling loop exits before the packets processed is less
>>> than its budget.
>>> 
>>> Signed-off-by: Dwip N. Banerjee <dnbanerg@us.ibm.com>
>>> ---
>>> drivers/net/ethernet/ibm/ibmvnic.c | 5 ++++-
>>> 1 file changed, 4 insertions(+), 1 deletion(-)
>>> 
>>> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c
>>> b/drivers/net/ethernet/ibm/ibmvnic.c
>>> index 96df6d8fa277..9fe43ab0496d 100644
>>> --- a/drivers/net/ethernet/ibm/ibmvnic.c
>>> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
>>> @@ -2537,7 +2537,10 @@ static int ibmvnic_poll(struct napi_struct
>>> 
>>> *napi, int budget)
>>> frames_processed++;
>>> }
>>> 
>>> - if (adapter->state != VNIC_CLOSING)
>>> + if (adapter->state != VNIC_CLOSING &&
>>> + ((atomic_read(&adapter->rx_pool[scrq_num].available) <
>>> + adapter->req_rx_add_entries_per_subcrq / 2) ||
>>> + frames_processed < budget))
>> 
>> 1/2 seems a simple and good algorithm.
>> Explaining why "frames_process < budget" is necessary in the commit
>> message
>> or source code also helps.
> 
> Hello, Lijun. The patch author, Dwip Banerjee, suggested the modified
> commit message below:
> 
> Reduce the amount of time spent replenishing RX buffers by
>  only doing so once available buffers has fallen under a certain
>  threshold, in this case half of the total number of buffers, or
>  if the polling loop exits before the packets processed is less
>  than its budget. Non-exhaustion of NAPI budget implies lower
>  incoming packet pressure, allowing the leeway to refill the buffers
>  in preparation for any impending burst.

It looks good to me.

> 
> Would such an update require a v3?

I assume you ask Jakub, right?


>>> replenish_rx_pool(adapter, &adapter->rx_pool[scrq_num]);
>>> if (frames_processed < budget) {
>>> if (napi_complete_done(napi, frames_processed)) {
