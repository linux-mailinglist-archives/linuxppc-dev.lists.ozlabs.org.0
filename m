Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEAB412A08
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 02:44:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HD2kR4yH0z2yPK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 10:44:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=baDch4JH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=baDch4JH; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HD2jj48FVz2xtH
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 10:43:53 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18L00vxg015860; 
 Mon, 20 Sep 2021 20:43:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=jwNCJgcdrQgk8OMNn4WPo7qRZ7BAyjSk8kyxQRoNrtY=;
 b=baDch4JHF1sNFPda0frH1cRked0ebHx5xjbem0gwQ7hLVs/U/kISJn3Zsat1iPfUEF/9
 ocm6YinSrLycAVurVvnQJhpGeZxIc6DT/81+r72c9+PDYb/ErJKgPHcVMzFVaTKFyh6V
 gwEojyxX+A8E0c6+sB+dFeqOz7oyLWg9O51wOUR7DdrT5GpLGHioMczqExvM8G74lVdk
 uUPrZs2cnidnFDSEyCc3NLFgtcX5J43ov1B7Wx+mCKOX943vu97e7/13guA6DrqWwHQp
 +QpXvy4S+++Arh8qVINhK3f/UMGwiTHLrc124CF41W51k/8bFnPPJOxDKvxhG7z9KnV3 Yg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b74fsrpby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 20:43:48 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 18L0exGT001200;
 Mon, 20 Sep 2021 20:43:47 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b74fsrpbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Sep 2021 20:43:47 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18L0h78o017255;
 Tue, 21 Sep 2021 00:43:47 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 3b57raewu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 00:43:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18L0hjv242467584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Sep 2021 00:43:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7C3D8AC067;
 Tue, 21 Sep 2021 00:43:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42EF2AC059;
 Tue, 21 Sep 2021 00:43:45 +0000 (GMT)
Received: from localhost (unknown [9.211.63.177])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 21 Sep 2021 00:43:45 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/3] powerpc/pseries/cpuhp: delete add/remove_by_count code
In-Reply-To: <19c1f412-ef08-f1ea-8c6b-45921bd1f627@gmail.com>
References: <20210920135504.1792219-1-nathanl@linux.ibm.com>
 <20210920135504.1792219-4-nathanl@linux.ibm.com>
 <19c1f412-ef08-f1ea-8c6b-45921bd1f627@gmail.com>
Date: Mon, 20 Sep 2021 19:43:44 -0500
Message-ID: <87k0jaoj0f.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LCgIR5D1RIEGORSuRrdwCfmpk516URSx
X-Proofpoint-GUID: R3iznS8qzNSs_W3X2ct6RKBD1VymqyYs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-20_07,2021-09-20_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109210000
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
Cc: tyreld@linux.ibm.com, ldufour@linux.ibm.com, aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Henrique Barboza <danielhb413@gmail.com> writes:

> On 9/20/21 10:55, Nathan Lynch wrote:
>> The core DLPAR code supports two actions (add and remove) and three
>> subtypes of action:
>> 
>> * By DRC index: the action is attempted on a single specified resource.
>>    This is the usual case for processors.
>> * By indexed count: the action is attempted on a range of resources
>>    beginning at the specified index. This is implemented only by the memory
>>    DLPAR code.
>> * By count: the lower layer (CPU or memory) is responsible for locating the
>>    specified number of resources to which the action can be applied.
>> 
>> I cannot find any evidence of the "by count" subtype being used by drmgr or
>> qemu for processors. And when I try to exercise this code, the add case
>> does not work:
>
>
> Just to clarify: did you check both CPU and memory cases and found out that the
> 'by count' subtype isn't used with CPUs, but drmgr has some cases in which
> 'by count' is used with LMBs?

Yes, drmgr uses both the 'by count' and the 'by index' methods for
memory currently on PowerVM.

> I'm asking because I worked with a part of the LMB removal code a few months ago,
> and got stuck in a situation in which the 'by count' and 'by indexed count' are
> similar enough to feel repetitive, but distinct enough to not be easily reduced
> into a single function. If drmgr wasn't using the 'by count' subtypes for LMBs
> that would be a good chance for more code redux.

The 'by count' method is definitely used for memory on PowerVM. I was
under the impression that the 'by indexed count' method was used by qemu
for memory sometimes; I'm pretty sure it's not used on PowerVM.

>> Summary:
>> 
>> * This code has not worked reliably since its introduction.
>> * There is no evidence that it is used.
>> * It contains questionable rollback behaviors in error paths which are
>>    difficult to test.
>> 
>> So let's remove it.
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> Fixes: ac71380071d1 ("powerpc/pseries: Add CPU dlpar remove functionality")
>> Fixes: 90edf184b9b7 ("powerpc/pseries: Add CPU dlpar add functionality")
>> Fixes: b015f6bc9547 ("powerpc/pseries: Add cpu DLPAR support for drc-info property")
>> ---
>
> Tested with a QEMU pseries guest, no issues found.
>
>
> Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> Tested-by: Daniel Henrique Barboza <danielhb413@gmail.com>

Thanks!
