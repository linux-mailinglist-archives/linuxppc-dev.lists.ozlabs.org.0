Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A388688EAD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 05:55:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Ncm143Gz3f82
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 15:55:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KFrzymvn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KFrzymvn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Nbq2FL4z2yHc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 15:54:14 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3134g9ue019445;
	Fri, 3 Feb 2023 04:54:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=W8rYU7i2MsqiUPujyD0cbiERh7DumgP4TFgHuz+pnqk=;
 b=KFrzymvn9YAwNCZXROOil4AZlG6wfNgtH/3uWGPCzLEk/lpv0P6fUKw/e0RHtAsyMca5
 p3vqFElEUO1Mj3xcNrG00PLVeSfddf1+vgoK9h0ZwDSGZYlfTv/CdsBdBZN/g7a0/XDm
 Peug3HNHwTdi+wTujQqSVwErqOQBeffcThPv2BQFly/qIp6Ty29wgY13Pc/Z3dbyhMyF
 +2e7pX4iD25B19AIRay9yTw90h9vFz9V1kjkvldSb9gb1GHZ84IeV33xK6dn3gUQMIPn
 B+EbtQwDmG2GVIvzeqCtDZdNRmiLrL9reykjt0eb0slu1Byov19/6wsr8Qo6kDhUQp7L PA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngstghrpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 04:54:07 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 312HkAEp009107;
	Fri, 3 Feb 2023 04:54:05 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3ncvshcy83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Feb 2023 04:54:05 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3134s2KC44630486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 3 Feb 2023 04:54:02 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2392F20043;
	Fri,  3 Feb 2023 04:54:02 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 766AE20040;
	Fri,  3 Feb 2023 04:54:00 +0000 (GMT)
Received: from [9.43.51.223] (unknown [9.43.51.223])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  3 Feb 2023 04:54:00 +0000 (GMT)
Message-ID: <8d033512-6a36-c8b0-44fe-51f4067ea282@linux.ibm.com>
Date: Fri, 3 Feb 2023 10:23:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] powerpc/hv-24x7: Fix pvr check when setting interface
 version
Content-Language: en-US
To: Sachin Sant <sachinp@linux.ibm.com>
References: <20230131184804.220756-1-kjain@linux.ibm.com>
 <AEDF0612-3814-4FF2-A0CD-5688E496078A@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <AEDF0612-3814-4FF2-A0CD-5688E496078A@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UkdftkFVPuylhhlBGm8z7mL91KKERBC-
X-Proofpoint-GUID: UkdftkFVPuylhhlBGm8z7mL91KKERBC-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-03_02,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302030040
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/1/23 19:41, Sachin Sant wrote:
> 
> 
>> On 01-Feb-2023, at 12:18 AM, Kajol Jain <kjain@linux.ibm.com> wrote:
>>
>> Commit ec3eb9d941a9 ("powerpc/perf: Use PVR rather than
>> oprofile field to determine CPU version") added usage
>> of pvr value instead of oprofile field to determine the
>> platform. In hv-24x7 pmu driver code, pvr check uses PVR_POWER8
>> when assigning the interface version for power8 platform.
>> But power8 can also have other pvr values like PVR_POWER8E and
>> PVR_POWER8NVL. Hence the interface version won't be set
>> properly incase of PVR_POWER8E and PVR_POWER8NVL.
>> Fix this issue by adding the checks for PVR_POWER8E and
>> PVR_POWER8NVL as well.
>>
>> Fixes: ec3eb9d941a9 ("powerpc/perf: Use PVR rather than oprofile field to determine CPU version")
>> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
> 
> Thanks for the fix. Tested on Power8 successfully.
> Tested-by: Sachin Sant <sachinp@linux.ibm.com>
> 
>> arch/powerpc/perf/hv-24x7.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index 33c23225fd54..8c3253df133d 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -1727,7 +1727,8 @@ static int hv_24x7_init(void)
>> }
>>
>> /* POWER8 only supports v1, while POWER9 only supports v2. */
>> - if (PVR_VER(pvr) == PVR_POWER8)
>> + if (PVR_VER(pvr) == PVR_POWER8 || PVR_VER(pvr) == PVR_POWER8E ||
>> + PVR_VER(pvr) == PVR_POWER8NVL)
> 
> Do we really need the check for Power8NV?

Hi Sachin,
    Thanks for testing the patch. Here the NVL in POWER8NVL corresponds
to "NVLink" and its not related to PowerNV. PVR value used to specify
processor version which might be in used in any of  pseries/powernv,
hence I added this check.

Thanks,
Kajol Jain
