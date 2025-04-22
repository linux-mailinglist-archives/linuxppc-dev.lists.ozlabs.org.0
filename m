Return-Path: <linuxppc-dev+bounces-7879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86971A95D89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 07:51:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZhWYw5fPJz3bqs;
	Tue, 22 Apr 2025 15:51:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745301060;
	cv=none; b=Slvvo3HUO/TYfokyBTGeD/MNIXvZYYc41cbcp/8PNaRbb0KczpJYDcvHmAi9moHzDEccjr5sA8AvrkWw3/yFuvxeZXBgugP00dmbqWSdRUz8qth6035ATI1hUsn1v9xn7yC6OwUHS84HM5suBZmqyTJbpNJwNfoTR2F4YpTyAF2dvzxewtDjVUkZrq8PavP+mPs/YQqYhTuOMq4r8Q5l1ZllY8n3R3IFmoTcnRtztEwYJiKAxYLIcdta2k9rDKkCGvxkO3jb5SnkD+WzWw70bfrunMRHOCJKC1r5aETqg2kRsPaiFaoiuJMyqPxm0qVsehVWfozO5rOF8nMldLbudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745301060; c=relaxed/relaxed;
	bh=enDXShNfnEmJVkGX61Z+kj65b/uMcCnQ7YFwYBBahVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gg8hNUZZCeIBRXFCgVCAVdax8G/yMt9VzaBp9eZCZXlQPwZ7CpFGUKpsBZWYf3KFv4sk7MMljQsSC4JavF/2w8Bzco+S5advNdNrnHkMnVK4XSBB+VAfRvxRvaZcEASHSiYLUunJMeFqAThPjMnGGY6QWzpDhCqsHNlKRHK2dTiIgh/JGTcAkuKqOCiuFnfDA+oPI1W9fht4aiuo7Wwap0Jrv9r1VwDsazWr2ugoO7mxdP7zMi+qFAyzPF/yaa61xflp8tHtOX7fLjnZq2s1MBYXrK3SXC4DyN8UF6SzvcekxpFqhOORtOEyyEaa3awJjKYTj8iGvnlBs2klspw3fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jSszM141; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jSszM141;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZhWYv48Ffz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 15:50:58 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53M3c96M012729;
	Tue, 22 Apr 2025 05:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=enDXSh
	NfnEmJVkGX61Z+kj65b/uMcCnQ7YFwYBBahVg=; b=jSszM141aPJt1B263R5h+j
	N8lfXRFxVU48/J+JuyYgMxmdgstTNbvEwWARAYUrafiCOIh58BNpcsykZKtwue+2
	XmaH+8oJ/Ta9OZIZMbopfVhZ/apjKedjovBJYs0llJ51Hj3OHuIa3euazPfsyrpG
	LlGdE21k0Lr7o49t20Z2sbFProvTGizvrNV7eKdLik95YEfXwnL9c5oUF+f1tQv0
	qL4eStRg/DNJbxx4oAOigMWYK4Pg6SV7ywlAmAbTI6udtVm+0l74WBwek+lqBW0s
	O6EpyPc4g9sbqD9kxmG0qeEJ36b/KyuTjnrJa3rAMD/DvCIeRQVLwW1j8fFQIqug
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4663c40dyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 05:50:46 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53M4CeSY027827;
	Tue, 22 Apr 2025 05:50:45 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rv2153b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 05:50:45 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53M5oi8U31130218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 05:50:45 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CBC7C5805C;
	Tue, 22 Apr 2025 05:50:44 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55C9E5805A;
	Tue, 22 Apr 2025 05:50:41 +0000 (GMT)
Received: from [9.43.89.251] (unknown [9.43.89.251])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 05:50:40 +0000 (GMT)
Message-ID: <157256be-d77d-427e-8feb-77d1373b0c00@linux.ibm.com>
Date: Tue, 22 Apr 2025 11:20:38 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build warnings after merge of the powerpc-fixes tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20250422114720.480cea29@canb.auug.org.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250422114720.480cea29@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x8ti_XGGpedLplUvLhkXPCn81AHLR7MB
X-Proofpoint-ORIG-GUID: x8ti_XGGpedLplUvLhkXPCn81AHLR7MB
X-Authority-Analysis: v=2.4 cv=HeEUTjE8 c=1 sm=1 tr=0 ts=68072e36 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=UQvLyEPbrtOJaqGAD5MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_03,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1011 adultscore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220041
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/22/25 7:17 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc-fixes tree, today's linux-next build
> (powerpc_ppc64_defconfig) produced these warnings:
> 
> arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
> arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
> arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
> ld: warning: arch/powerpc/boot/zImage.pmac has a LOAD segment with RWX permissions
> arch/powerpc/boot/wrapper: 237: [: 0: unexpected operator
> ld: warning: arch/powerpc/boot/dtbImage.ps3 has a LOAD segment with RWX permissions
> 

I cant recreate this in both my x86_64 cross build and ppc64 build with dash.
I tried both ppc64_defconfig and pseries_le_defconfig compilation.

x86_64 dash version : dash-0.5.12-3.fc40.x86_64
powerpc dash version : dash-0.5.12-4.fc41.ppc64le

Can you share the dash version 

Maddy

> Introduced by commit
> 
>   b2accfe7ca5b ("powerpc/boot: Check for ld-option support")
> 
> POSIX shell (in particular dash) does not recognise "&>" - you need to
> use ">/dev/null 2>&1".  (My /bin/sh is /bin/dash)
> 


