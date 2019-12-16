Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F72B120EAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 17:00:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47c5ZP2lBXzDqGk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 02:59:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47c5X84JvLzDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 02:58:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47c5X83PkTz8t7b
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 02:58:00 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47c5X82jfhz9sRM; Tue, 17 Dec 2019 02:58:00 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47c5X75z0qz9sR1
 for <linuxppc-dev@ozlabs.org>; Tue, 17 Dec 2019 02:57:59 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBGFqH6j050223; Mon, 16 Dec 2019 10:57:56 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wwe609gjd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 10:57:56 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xBGFsqLS003508;
 Mon, 16 Dec 2019 15:57:55 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 2wvqc64bsc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Dec 2019 15:57:55 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBGFvsFT42795392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Dec 2019 15:57:54 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D174AC05F;
 Mon, 16 Dec 2019 15:57:54 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3223EAC05E;
 Mon, 16 Dec 2019 15:57:54 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.41.178.211])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 16 Dec 2019 15:57:54 +0000 (GMT)
Subject: Re: [PATCH net v2] net/ibmvnic: Fix typo in retry check
To: Jakub Kicinski <jakub.kicinski@netronome.com>
References: <1576078719-9604-1-git-send-email-tlfalcon@linux.ibm.com>
 <20191213172747.5e5310c9@cakuba.netronome.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <1d4d0ef6-2115-84d6-fcca-e058dca18457@linux.ibm.com>
Date: Mon, 16 Dec 2019 09:57:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191213172747.5e5310c9@cakuba.netronome.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-16_06:2019-12-16,2019-12-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912160139
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
Cc: julietk@linux.vnet.ibm.com, netdev@vger.kernel.org, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 12/13/19 7:27 PM, Jakub Kicinski wrote:
> On Wed, 11 Dec 2019 09:38:39 -0600, Thomas Falcon wrote:
>> This conditional is missing a bang, with the intent
>> being to break when the retry count reaches zero.
>>
>> Fixes: 476d96ca9c ("ibmvnic: Bound waits for device queries")
>> Suggested-by: Juliet Kim <julietk@linux.vnet.ibm.com>
>> Signed-off-by: Thomas Falcon <tlfalcon@linux.ibm.com>
> Ah damn, looks like this originates from my pseudo code.
>
> I had to fix the fixes tag:
>
> Commit: 847496ccfa22 ("net/ibmvnic: Fix typo in retry check")
> 	Fixes tag: Fixes: 476d96ca9c ("ibmvnic: Bound waits for device queries")
> 	Has these problem(s):
> 		- SHA1 should be at least 12 digits long
> 		  Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
> 		  or later) just making sure it is not set (or set to "auto").

Thanks, I'll keep that in mind next time.  IIRC I was making some last 
minute cosmetic changes before sending, and it might have slipped in 
that way.  In any case, I should have been more thorough in testing it.

Thanks,

Tom



>
> Applied to net, thanks!
>
>> diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
>> index efb0f10..2d84523 100644
>> --- a/drivers/net/ethernet/ibm/ibmvnic.c
>> +++ b/drivers/net/ethernet/ibm/ibmvnic.c
>> @@ -184,7 +184,7 @@ static int ibmvnic_wait_for_completion(struct ibmvnic_adapter *adapter,
>>   			netdev_err(netdev, "Device down!\n");
>>   			return -ENODEV;
>>   		}
>> -		if (retry--)
>> +		if (!retry--)
>>   			break;
>>   		if (wait_for_completion_timeout(comp_done, div_timeout))
>>   			return 0;
