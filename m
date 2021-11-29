Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33189461D67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 19:14:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2tlz0jl4z3bXc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 05:14:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SdeyPNZN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SdeyPNZN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2tl86dv5z2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 05:13:40 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHr7aM006859; 
 Mon, 29 Nov 2021 18:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=XjqjjPaXkvhbwGa9Lvnx0QTLkfytAxwZWyIl20Rf+rY=;
 b=SdeyPNZNd19UcCWVBFCX6bY95yPQ5L+KGyqn12Hr/CzeNITC2hh9ofrrJwdYMBc4mKLi
 twItaiEfYUXxusmWXWTuyLc9Om+g2Kxz59+w6jOBBVrlXI1K5Y1QWnTwXivfGgxjgqIc
 ukhYyntd3zXa3t1V816Nohsjiu/dmg9n1hG9d67aas3WQ8VKiW5610k/kclBTrOyWgnQ
 4lhlJ1xBEM9rNdsa79ICrZtq7yMh+Y3B4DSFkHGokf0bMiZdraECPGnj4t5sZ/DSDM7p
 1HSNm7vafzfh2u+P4W8eNZeguLsZwWyP5PXcKRe1utOZ00LahnfLTcabP77i2hPGWGnX 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3nfrde8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 18:13:34 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATICdq5025099;
 Mon, 29 Nov 2021 18:13:34 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn3nfrddt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 18:13:34 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHs62V032380;
 Mon, 29 Nov 2021 18:13:32 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3ckcaa8suy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 18:13:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATIDWVl54395276
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 18:13:32 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FF9678070;
 Mon, 29 Nov 2021 18:13:32 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4946378076;
 Mon, 29 Nov 2021 18:13:31 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.210.85])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 18:13:31 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/vas: Don't print an error when VAS is
 unavailable
To: Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
References: <20211126052133.1664375-1-npiggin@gmail.com>
 <43d21c1a-9122-d698-2229-e56c77a91313@kaod.org>
 <1637922573.8ofrolskkj.astroid@bobo.none>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <fd7bc1d6-c036-efbe-71a4-b6db5bf2294c@linux.ibm.com>
Date: Mon, 29 Nov 2021 10:13:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1637922573.8ofrolskkj.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 79_0B1yLlBFumxN32RYxnAnNxCAt-MTk
X-Proofpoint-GUID: -kf3u6iGpBCINWhHVSqdeUAtVW_kRcXq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 mlxscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111290084
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
Cc: Haren Myneni <haren@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/26/21 2:31 AM, Nicholas Piggin wrote:
> Excerpts from Cédric Le Goater's message of November 26, 2021 5:13 pm:
>> On 11/26/21 06:21, Nicholas Piggin wrote:
>>> KVM does not support VAS so guests always print a useless error on boot
>>>
>>>      vas: HCALL(398) error -2, query_type 0, result buffer 0x57f2000
>>>
>>> Change this to only print the message if the error is not H_FUNCTION.
>>
>>
>> Just being curious, why is it even called since "ibm,compression" should
>> not be exposed in the DT ?
> 
> It looks like vas does not test for it. I guess in theory there can be 
> other functions than compression implemented as an accelerator. Maybe
> that's why?
> 
> Thanks,
> Nick
> 
Looks like pseries_vas_init() simply calls h_query_vas_capabilities() to test
for VAS coprocessor support. I would assume KVM doesn't expose hcall-vas or
hcall-nx in /rtas/ibm,hypertas-functions? Doesn't look like hcall-vas or
hcall-nx have been added to the hypertas_fw_feature matching, but maybe they
should and we can gate VAS initialization on those, or at the minimum
FW_FEATURE_VAS?

-Tyrel
