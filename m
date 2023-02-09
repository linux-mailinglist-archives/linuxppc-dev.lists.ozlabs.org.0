Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA61690CB8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 16:17:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCL8T1n3Jz3f3R
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 02:17:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=odafSZmF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=odafSZmF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCL7S6dDgz3c81
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 02:16:52 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 319F6Hjl010564
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Feb 2023 15:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=/TrvqMT5rLRxGpbwnuYCTVZXoKmg5eZh9CzmCJuWtcQ=;
 b=odafSZmFm0HP7ciOQbngy2EYDK6LhDeLgnJGtuB0kM2K1F6JSGdO0RvH74GI5po5OFBH
 VSEGJMBC87kojFkicDY0BJPvlW3mGEf8CtdxSRni+7X6KbQfiFqj3Z3XJK6/Z8ye93tI
 SgXvu3XgBWdAzWyVp7hxuv+HdVHy5ZYcWobhm9VhACxNOR0odkEdV3ORbQhIKcdLSTIf
 /Y2UxK8ZHZ5rCI4ETeXrQmYDDqTOwxKAJD8fQ+n7roY0nmOgl4kgsJ0Rem8nghoY+Eaj
 6rKNMrs0YI6h4vamL9s2V90DQE1ohDnmeb6uDCrXZdL1ARHHJdoxqyKAd0esx35EUFs8 ng== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn32fgxm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Feb 2023 15:16:49 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 319F6Heu010578
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Feb 2023 15:16:49 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nn32fgxju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 15:16:49 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319EnOax003065;
	Thu, 9 Feb 2023 15:16:46 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3nhf081j4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Feb 2023 15:16:46 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 319FGihI7996084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Feb 2023 15:16:44 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BA395805B;
	Thu,  9 Feb 2023 15:16:44 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EFBC558059;
	Thu,  9 Feb 2023 15:16:43 +0000 (GMT)
Received: from [9.211.67.201] (unknown [9.211.67.201])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Feb 2023 15:16:43 +0000 (GMT)
Message-ID: <c00d492c-2b40-0fb8-b20f-8720903336c2@linux.vnet.ibm.com>
Date: Thu, 9 Feb 2023 09:16:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] powerpc: Fix device node refcounting
Content-Language: en-US
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20230201195856.303385-1-brking@linux.vnet.ibm.com>
 <87zg9po6db.fsf@linux.ibm.com>
From: Brian King <brking@linux.vnet.ibm.com>
In-Reply-To: <87zg9po6db.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qJsBrUSxOqe9wtWR_J61Y9lsai7KaUz-
X-Proofpoint-ORIG-GUID: UCUxBI-PWwGOykyfW0LycJhKsfYimqND
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-09_10,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302090143
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, mmc@linux.vnet.ibm.com, nnac123@linux.ibm.com, brking@pobox.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/7/23 9:14 AM, Nathan Lynch wrote:
> 
> (cc'ing a few possibly interested people)
> 
> Brian King <brking@linux.vnet.ibm.com> writes:
>> While testing fixes to the hvcs hotplug code, kmemleak was reporting
>> potential memory leaks. This was tracked down to the struct device_node
>> object associated with the hvcs device. Looking at the leaked
>> object in crash showed that the kref in the kobject in the device_node
>> had a reference count of 1 still, and the release function was never
>> getting called as a result of this. This adds an of_node_put in
>> pSeries_reconfig_remove_node in order to balance the refcounting
>> so that we actually free the device_node in the case of it being
>> allocated in pSeries_reconfig_add_node.
> 
> My concern here would be whether the additional put is the right thing
> to do in all cases. The questions it raises for me are:
> 
> - Is it safe for nodes that were present at boot, instead of added
>   dynamically?

Yes. of_node_release has a check to see if OF_DYNAMIC is set. If it is not set,
the release function is a noop. 

> - Is it correct for all types of nodes, or is there something specific
>   to hvcs that leaves a dangling refcount?

I would welcome more testing and I shared the same concern. I did do some
DLPARs of a virtual ethernet device with the change along with CONFIG_PAGE_POISONING
enabled and did not run into any issues. However if I do a DLPAR remove of a virtual
ethernet device without the change with kmemleak enabled it does not detect any
leaked memory.

Thanks,

Brian

> 
> Just hoping we're not stepping into a situation where we're preventing
> leaks in some situations but doing use-after-free in others. :-)
> 
>>
>> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/reconfig.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
>> index 599bd2c78514..8cb7309b19a4 100644
>> --- a/arch/powerpc/platforms/pseries/reconfig.c
>> +++ b/arch/powerpc/platforms/pseries/reconfig.c
>> @@ -77,6 +77,7 @@ static int pSeries_reconfig_remove_node(struct device_node *np)
>>  	}
>>  
>>  	of_detach_node(np);
>> +	of_node_put(np);
>>  	of_node_put(parent);
>>  	return 0;
> 
> In a situation like this where the of_node_put() call isn't obviously
> connected to one of the of_ iterator APIs or similar, I would prefer a
> comment indicating which "get" it balances. I suppose it corresponds to
> the node initialization itself, i.e. the of_node_init() call sites in
> pSeries_reconfig_add_node() and drivers/of/fdt.c::populate_node().

-- 
Brian King
Power Linux I/O
IBM Linux Technology Center


