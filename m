Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA41B686996
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 16:10:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6QMK5MzWz3f5C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Feb 2023 02:10:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YfKxcmYw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YfKxcmYw;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6QLK5rBTz3bM7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Feb 2023 02:09:12 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 311Eit7c028226;
	Wed, 1 Feb 2023 15:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wAtFof79zkkNiA96Fc2DmA9O88HMyv84m73Qka1x9lQ=;
 b=YfKxcmYw2okZr28VFFiSbkNd5ICryUePSRtEUdE/uUNVmuZyAejQZPen1FVUgYHgMm+G
 ofS5ozy5vLnOZfUQQ+B0gIMB95zF7o1DdHTeEPJdLWDTEJqlWaxI5GF7QXFiXu3Aridb
 3Fy2bpd7ODSWmgHrk0LKvYLeIqD72T0CrbrsdQgb/TljM1CZ5L/vSpWEpnrRnc7dpQVa
 I9tRlxQThv2xsQnYcnqqk5bcF2UWif/VgqAcpcriapHKasbDZv9a4xc45GdpQqdU4Iym
 P8uBcDsEtDvJRkDCn5kJesr5UV9SluNlwf557fauDcV0rXrY6SJbdaHgyftJLXwE5wzw LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nft48gr6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 15:09:06 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 311EpG67024897;
	Wed, 1 Feb 2023 15:09:05 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nft48gr5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 15:09:05 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 311E1H9W007792;
	Wed, 1 Feb 2023 15:09:04 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([9.208.129.119])
	by ppma03wdc.us.ibm.com (PPS) with ESMTPS id 3ncvtexc99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 15:09:04 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 311F924P36307544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 15:09:03 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD55A58056;
	Wed,  1 Feb 2023 15:09:02 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7020358069;
	Wed,  1 Feb 2023 15:09:02 +0000 (GMT)
Received: from [9.211.132.88] (unknown [9.211.132.88])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 15:09:02 +0000 (GMT)
Message-ID: <08ee49f9-5ac7-b7ac-7bdd-a658af1f9a1a@linux.vnet.ibm.com>
Date: Wed, 1 Feb 2023 09:09:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 0/7] hvcs: Various hvcs device hotplug fixes
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20230130224321.164843-1-brking@linux.vnet.ibm.com>
 <e705381b-392c-5429-96fa-2543b6f341a1@csgroup.eu>
Content-Language: en-US
From: Brian King <brking@linux.vnet.ibm.com>
In-Reply-To: <e705381b-392c-5429-96fa-2543b6f341a1@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0gZbne_9z4eTySY54nWU_DsKWMqOe32Z
X-Proofpoint-ORIG-GUID: kords4UznCJEc4h9SoilC_XbhRhcg_VZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_04,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010130
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "mmc@linux.vnet.ibm.com" <mmc@linux.vnet.ibm.com>, "brking@pobox.com" <brking@pobox.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/1/23 4:32 AM, Christophe Leroy wrote:
> 
> 
> Le 30/01/2023 à 23:43, Brian King a écrit :
>> This patch series fixes a number of issues with hotplugging
>> hvcs devices including memory leaks as well as, the inability
>> to reconnect to a console device after it has been hot added
>> back, since it was not getting cleaned up properly on the
>> hotplug remove path.
>>
>> Brian King (7):
>>    hvcs: Fix hvcs port reference counting
>>    hvcs: Remove sysfs file prior to vio unregister
>>    hvcs: Remove sysfs group earlier
>>    hvcs: Get reference to tty in remove
>>    hvcs: Use vhangup in hotplug remove
>>    hvcs: Synchronize hotplug remove with port free
>>    powerpc: Fix device node refcounting
>>
>>   arch/powerpc/platforms/pseries/reconfig.c |  1 +
>>   drivers/tty/hvc/hvcs.c                    | 61 +++++++++--------------
>>   2 files changed, 25 insertions(+), 37 deletions(-)
>>
> 
> As far as I can see, most recent patches in drivers/tty/hvc/ are taken 
> by Greg Kroah-Hartman <gregkh@linuxfoundation.org> so I'd suggest you 
> send you series to Greg as he maintains the tty tree.

Sure. I just followed what was in the maintainers file, but I can resend
and cc Greg and linux-serial if that makes sense.


> By the way, does last patch require the 6 previous ones or can it be 
> applied independently ?

Yes. It is independent, so I'll pull this out of the series and can send
it separately to this list only.

Thanks,

Brian

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center


