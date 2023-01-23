Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF06774EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 06:28:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0dtY6z9Jz3bcs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 16:28:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mnHOxmmo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mnHOxmmo;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P0dsg03zmz3bSn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 16:27:50 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30N2wKZq032154
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=sXKYhxPru/EGuSvJnaR/cKxjGau04TV0u8QZvoUI8Vk=;
 b=mnHOxmmoMiYlre9GUcm3zF8/2xwMBtx27UNy+Q1veNaO7EE8J51ttk0PdmGU8RfQS01V
 3jT9IbdF+ULKw/axKs79w/xt0vuFoC4K03tLFL1ypKpJcuVdu1mnu/l1d1ux01BynCgG
 bmvtdKEXL1u8aNYwfLw85tDSxiNWGhWBKN0isIkhZ8R2ORpM/hpYc458idg6gCmFJYL+
 2gX/kc21KWqZtoWGKZ/qw+V+nFDyXwWUdXY96bxczBF9x6HvoLTIsgQ48NqBmvIFesr0
 GJIimL0PTncBcWGXg/vrebjDxL03Ik8mrEwaBwPMbf6bNlsPCgUOhffhbZUq0mDyU6e4 cw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n8smqp5n6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:46 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30MLrOpw009119
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n87p69bm5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30N5RgP045744506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:42 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1E04A20040
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:42 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ACF632004B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:41 +0000 (GMT)
Received: from [9.43.92.90] (unknown [9.43.92.90])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 05:27:41 +0000 (GMT)
Message-ID: <9d0ded8b-2844-c64e-3fd0-560fc68f0ba0@linux.ibm.com>
Date: Mon, 23 Jan 2023 10:57:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v7 4/8] crash: add phdr for possible CPUs in elfcorehdr
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
 <20230115150206.431528-5-sourabhjain@linux.ibm.com>
 <51fa22e4-efab-a931-fb8f-48180baaac61@linux.ibm.com>
 <e12d2441-576a-d049-3cd8-523b7c41b15e@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <e12d2441-576a-d049-3cd8-523b7c41b15e@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rbX7uaj30kw5QOoMMXsehYpWdj4HSQTx
X-Proofpoint-GUID: rbX7uaj30kw5QOoMMXsehYpWdj4HSQTx
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_02,2023-01-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301230047
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 20/01/23 17:09, Laurent Dufour wrote:
> On 19/01/2023 19:29:52, Laurent Dufour wrote:
>> On 15/01/2023 16:02:02, Sourabh Jain wrote:
>>> On architectures like PowerPC the crash notes are available for all
>>> possible CPUs. So let's populate the elfcorehdr for all possible
>>> CPUs having crash notes to avoid updating elfcorehdr during in-kernel
>>> crash update on CPU hotplug events.
>>>
>>> The similar technique is used in kexec-tool for kexec_load case.
>>>
>>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> ---
>>>   kernel/crash_core.c | 9 ++++++---
>>>   1 file changed, 6 insertions(+), 3 deletions(-)
>> This patch is not applying on ppc/next (53ab112a9508).
>>
>> As far as I could see, crash_prepare_elf64_headers() is defined in the file
>> kernel/kexec_file.c and that's not recent, see babac4a84a88 (kexec_file,
>> x86: move re-factored code to generic side, 2018-04-13)
>>
>> Am I missing something?
> My mistake, sounds that your series is based on top of the Eric's one (not yet upstream):
>
> https://lore.kernel.org/lkml/20230118213544.2128-1-eric.devolder@oracle.com/

Yes this patch series is dependent on the above patch series. In the 
next version I will
share a git repo link that will have this patch series applied along 
with dependent
patch series for easy try.

- Sourabh

