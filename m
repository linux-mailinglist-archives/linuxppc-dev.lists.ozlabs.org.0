Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FB5788DEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 19:44:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LdIJGv4S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXS4X02WZz3c4R
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 03:44:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LdIJGv4S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXS3g32N7z2yZX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 03:43:27 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37PHOms8010218;
	Fri, 25 Aug 2023 17:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zt6pL7o20Yixc3NyiECNrphOeta0tiESWhSHl/XnpCA=;
 b=LdIJGv4SWGdJIasFYubik2xK8Nwe11QR89489e+9bgbddqk3nSd/i39WA9M2f+CVvHER
 P99LcgDp8Szig1Gb21r63Jd2sb/5yK/4FbzGCORmgGQJIZ8Ntz7efmXzNmheyd8J1QdV
 iawTeen6gPtuxoleYjoxogZHzu3WTsx5oJ81mmOYZx+isZPexuf+gydQ5WKFlJjAqcFq
 0uCbKLsreF4AGhKZy02ix3Fx/0r6SKvtNG7xs9i8LQw7VfHF8kAJxX1B9oUhVT8Y0eVc
 ZJPH+10HWJW7mD1iWNnH2kgILUszTZPfumoRdvNy348Qy02AqU4wQlE2h1uiqIx689aE IQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sq0p7gcht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 17:43:06 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37PFLhEg004055;
	Fri, 25 Aug 2023 17:43:05 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3sn21s1bhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 17:43:05 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37PHh3K759834692
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Aug 2023 17:43:03 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D8882004D;
	Fri, 25 Aug 2023 17:43:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56FE220040;
	Fri, 25 Aug 2023 17:43:01 +0000 (GMT)
Received: from [9.43.126.199] (unknown [9.43.126.199])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 25 Aug 2023 17:43:01 +0000 (GMT)
Message-ID: <62ca8ed7-8ae6-19ed-44a4-e8eec453d35f@linux.ibm.com>
Date: Fri, 25 Aug 2023 23:13:00 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 5/5] powerpc/bpf: use patch_instructions()
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "bpf@vger.kernel.org" <bpf@vger.kernel.org>
References: <20230825151810.164418-1-hbathini@linux.ibm.com>
 <20230825151810.164418-6-hbathini@linux.ibm.com>
 <5f41d2e4-878b-1c0b-f888-96b977065207@csgroup.eu>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <5f41d2e4-878b-1c0b-f888-96b977065207@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZcDAMdc2fLHQB8zvALiwyC0uzYkgWFdk
X-Proofpoint-ORIG-GUID: ZcDAMdc2fLHQB8zvALiwyC0uzYkgWFdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_16,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=604 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250157
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 25/08/23 9:16 pm, Christophe Leroy wrote:
> 
> 
> Le 25/08/2023 à 17:18, Hari Bathini a écrit :
>> Use the newly introduced patch_instructions() that handles patching
>> multiple instructions with one call. This improves speed of exectution
>> for JIT'ing bpf programs.
>>
>> Without this patch (on a POWER9 lpar):
>>
>>     # time modprobe test_bpf
>>     real    2m59.681s
>>     user    0m0.000s
>>     sys     1m44.160s
>>     #
>>
>> With this patch (on a POWER9 lpar):
>>
>>     # time modprobe test_bpf
>>     real    0m5.013s
>>     user    0m0.000s
>>     sys     0m4.216s
>>     #
> 
> Right, significant improvement. Forget by comment to patch 1, I should
> have read the series up to the end. Just wondering why you don't just
> put patch 4 up front ?

I wanted to remove the dependency for bpf_prog_pack enablement
patches with this improvement, just in case..

- Hari
