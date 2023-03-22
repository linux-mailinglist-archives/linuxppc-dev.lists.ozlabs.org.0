Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730A96C5318
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 18:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhbkK1PBQz3chs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 04:56:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MROidBYE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MROidBYE;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhbjM1gN3z30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Mar 2023 04:55:18 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32MHsuO5033668;
	Wed, 22 Mar 2023 17:55:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=gfC0z9F5EeG8mzQKSfB5cas3CbGhnxdksdcE8CAPS3M=;
 b=MROidBYEqArqxyWD2tlMQ15Nc/TjlKcGK4RwXNtktWxdNUCcT1o0DDvqPZP1d3zSgvaz
 Re6m6o5NAhCu7ldYk2XwYZVUftOOvrCE7zo48Rn/EWvXOzZPTUZghdi0Ug0AsALFa6au
 5NxZ8++vEc87paHdGCjMIZzN1aKOfWs7p7nvCfm6AsnDzX29dbUQqzmQCZCB6cUJe7Pm
 mnikb4C8PcJ9QWAEyEVeE7oApI+SVThdFlK7ceTXMZm/sPM+mDpdWed4qk3VNDPTIiRa
 IuywlJjSgyvZPDSjS/56MWzO5Fcl4EN8gQZNcyvCMiuYgdgVmghT4k4Te3i3gujc88mF CQ== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pg6g1g048-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 17:55:07 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32MH4arj018405;
	Wed, 22 Mar 2023 17:54:23 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7qvsh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Mar 2023 17:54:23 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32MHsM0q16646748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Mar 2023 17:54:22 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20BA05805A;
	Wed, 22 Mar 2023 17:54:22 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEAC758066;
	Wed, 22 Mar 2023 17:54:19 +0000 (GMT)
Received: from [9.43.89.247] (unknown [9.43.89.247])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 22 Mar 2023 17:54:19 +0000 (GMT)
Message-ID: <15173797-c28b-f1d9-9488-9cd4cebdaad4@linux.vnet.ibm.com>
Date: Wed, 22 Mar 2023 23:24:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [next-20230317][PPC/MLX5][bisected 4d5ab0a] Boot WARNING: CPU: 0
 PID: 9 at net/core/dev.c:1928 call_netdevice_notifiers_info
To: Lorenzo Bianconi <lorenzo@kernel.org>
References: <7fe9d0b0-7d77-79cc-405d-3ca38b552782@linux.vnet.ibm.com>
 <ZBheva8pJ3VJq/pO@lore-desk>
Content-Language: en-US
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
In-Reply-To: <ZBheva8pJ3VJq/pO@lore-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4j3xZ1vfW6pw_gjz4qkqYSUxH1ULMYRU
X-Proofpoint-GUID: 4j3xZ1vfW6pw_gjz4qkqYSUxH1ULMYRU
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-22_14,2023-03-22_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220121
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
Cc: Brian King <brking@linux.vnet.ibm.com>, netdev <netdev@vger.kernel.org>, linux-next <linux-next@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/20/23 6:55 PM, Lorenzo Bianconi wrote:
>> Greeting's
>>
>> Warning is seen while booting kernels from 6.3.0-rc3-next-20230317 on my
>> powerpc Power 10 LPAR
>>
>> Boots fine without warnings when below patch is reverted
>>
>> commit 4d5ab0ad964df178beba031b89429a601893ff61
>> Author: Lorenzo Bianconi <lorenzo@kernel.org>
>> Date:   Thu Mar 9 13:25:31 2023 +0100
>>
>>      net/mlx5e: take into account device reconfiguration for xdp_features
>> flag
>>
>>      Take into account LRO and GRO configuration setting device xdp_features
>>      flag. Consider channel rq_wq_type enabling rx scatter-gatter support in
>>      xdp_features flag and disable NETDEV_XDP_ACT_NDO_XMIT_SG since it is not
>>      supported yet by the driver.
>>      Moreover always enable NETDEV_XDP_ACT_NDO_XMIT as the ndo_xdp_xmit
>>
>> 4d5ab0ad got introduced in next-20230314
>>
>> @Lorenzo Could you please look into this
> 
> I would say this issue has been already fixed by Jakub here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/commit/net/core/xdp.c?id=769639c1fe8a98129aa97c8ee981639db1e8955c


Thanks Lorenzo,

Verified the patch and it fixes the problem and next-20230321 kernel 
boots fine on my powerpc lpar

Tested-by: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
-- 
Regard's

Abdul Haleem
IBM Linux Technology Center
