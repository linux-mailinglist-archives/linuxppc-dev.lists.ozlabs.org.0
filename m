Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB976AD716
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 07:03:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW4d52MVhz3cKD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 17:03:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZzpIjvvz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZzpIjvvz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW4c80wwvz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 17:02:47 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3273oBES011157;
	Tue, 7 Mar 2023 06:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=T5uB5v8i+aWZCvF8moYfaAkK95Kb0r1FYeo/b9wHPZ4=;
 b=ZzpIjvvzBU34aCRJhYznnN5tWKQAR/d7+Y0rL8j1DP1SpqYYUQLGdGIwOgefJiThIud3
 pMyT8JOYZZKqORZ6xJQZMrgkWUowkTjUAFlv20hRqMgwo0iHzstkrIYKU9KndujMtSZA
 ehjB74Aro21UbrIft6mNT57rnQUgTcQ5DeQ0hMguyn8eQ/j+aHjoeL62AJNjxakn60Yy
 G8E45fpOjMA6Log/Y9N1ZT5JyaNmyyJi4iyQCXXskbhSWdxWeYR6hbIBYBVtSgEmCCUJ
 cKxBNt/S1pAO/0qVOavz1+mtX/VuatFlXP3vHY7K1rHxodh9lp6iwEi81YU/S5AZa6p4 hQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4x1jcsbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 06:02:41 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326L8jxe008178;
	Tue, 7 Mar 2023 06:02:40 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3p419kay8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 06:02:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32762aiE32113166
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Mar 2023 06:02:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8602A2004E;
	Tue,  7 Mar 2023 06:02:36 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 063622004F;
	Tue,  7 Mar 2023 06:02:35 +0000 (GMT)
Received: from [9.43.108.161] (unknown [9.43.108.161])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Mar 2023 06:02:34 +0000 (GMT)
Message-ID: <a4b97fe5-acc8-d198-92c9-cef251ca364c@linux.ibm.com>
Date: Tue, 7 Mar 2023 11:32:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] selftests/powerpc/pmu: fix including of utils.h when
 event.h is included
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Benjamin Gray <bgray@linux.ibm.com>, Kajol Jain <kjain@linux.ibm.com>,
        mpe@ellerman.id.au
References: <20230301170918.69176-1-kjain@linux.ibm.com>
 <20230301170918.69176-2-kjain@linux.ibm.com>
 <5a796d43f45c86d770ee88cffaae78f4ca305103.camel@linux.ibm.com>
 <5dc76d52-6b22-9108-9107-281b1cd386e4@linux.ibm.com>
In-Reply-To: <5dc76d52-6b22-9108-9107-281b1cd386e4@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: v--JIDt7Ll55nlmN4Oz2eLPMTA2JobHZ
X-Proofpoint-ORIG-GUID: v--JIDt7Ll55nlmN4Oz2eLPMTA2JobHZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=992 spamscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303070050
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/2/23 8:49 AM, Madhavan Srinivasan wrote:
>
> On 3/2/23 3:35 AM, Benjamin Gray wrote:
>> On Wed, 2023-03-01 at 22:39 +0530, Kajol Jain wrote:
>>> From: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>
>>> event.h header already includes utlis.h. Avoid including
>>> the same explicitly in the code when event.h included.
>>>
>>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> As I understand, transitive includes should not be depended upon. If
>> you use a thing, and the thing is declared in a header, you should
>> include _that_ header. Anything else is a recipe for weird include
>> dependencies, ordering of the includes, etc.
>>
>> These files all use FAIL_IF, etc., which are declared in utils.h. So
>> utils.h is a legitimate include. The fact that events.h also includes
>> it (for u64) is a coincidence. If the u64 type def gets moved to, e.g.,
>> types.h, and utils.h is removed from events.h, suddenly all these files
>> stop compiling.
>
> thanks for the review. IIUC utils.h also carries the some test harness 
> func declarations, also some of these tests does not use type defs 
> anyway. I should have had a better commit message, my bad. But i will 
> try out the suggested case.
yeah, "utils.h" included in the testcase files are for the tast_harness 
declarations.
So we could get typedef moved from utils.h. Good catch. Thanks.
Kajol, kindly drop this patch.

Maddy
>
> Maddy
