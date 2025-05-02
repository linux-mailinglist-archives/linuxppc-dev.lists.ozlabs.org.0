Return-Path: <linuxppc-dev+bounces-8237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E538AA69BB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 May 2025 06:17:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zpd1w5bh0z2ynf;
	Fri,  2 May 2025 14:17:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746159476;
	cv=none; b=YWANWFDOdz9TgkCvr/LsclQuPtQVJhUoH/c43uVBArv1W/eeFu9KdkVbp25zvroX+DjlrVUoPOuwZQG0RHB9NOJCgXi311bVNq6r2xmwY+032+hsVW/17m6iTZZu+CoFskYX4hCx7AA7YdVt1sa2Mj25UR5sFNj93Kd9Nx/qC0Dv6UDWsh1J++4cSf2VzVgOoh8pEiDbqncYLRDtWqWn6MQM/lOeei/P/I4k23RvNtmTWiOeaPpqhFVXndz6ZR5Z2h0fLtjbQL2Mlimrijy87ZaekY7vU2n/GAQV2qXIWXNoZcbNfhPEWHDR3fARdkKHVSKn/xQA5/d16hIu4Xpl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746159476; c=relaxed/relaxed;
	bh=isCUPUG+DOlTwd6VSaFxqnr+rQtHVSotTEv3hcorZVY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BxLsOM1p5Eah252c9I7FJbYa1uJxFeKtrJBPWyzIeVDFzktqxo+uLrZpGUSk5UoiRp3F7MF7yG1k+3EX47mJQWTXJijNX09xgnuDuKz0wHJKTfD7B48U3z4y4ihEdFL2GbZqs8pJkBmZH800SPAToYBg3USQ3ON1gs9zGLQBNu8W7frpKjf2JE2ZERU3iID2WPJFON+ttMfGUDCHB3ndM3ipgz1UYzKNvlKIDvVw5ZqFS2Mqx4XjsF6QqCPXgB9SuGGk8RRe6qCa7qr21/OrDjrf4FBdRcBgoExYhoZIsQ7vfU1ccfa8FbXCH+5KLIV3WMy5q4byOovJAUv7xzs3IQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=amZMSXGZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=amZMSXGZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zpd1v6ngDz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 May 2025 14:17:55 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541MK7CC022529;
	Fri, 2 May 2025 04:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=isCUPU
	G+DOlTwd6VSaFxqnr+rQtHVSotTEv3hcorZVY=; b=amZMSXGZx61NXUkyGnuSG1
	mw6ou/Nc0eD9uAjj/JVSfz9gtBXMyJyYEmM5m4Vz3TywMWeqB/Wyp3qqt2U5t9be
	Bm4OZCcmO0e75x5OSS3WFvlT28xHSpteq/PKbqYxSns2wk7sBXfvzi38Q5+4lz/X
	jhGLC4XjKmlHMGansa4nfgirdq/G0vRsCozoqH0k36t2PcfszT+Lsn77DFDopnyx
	gNhytt3xV5zhD8usivFPPPNjUoJevNS9FSo1+ka3De5wtyhxO2UURlPNjZBxZfMM
	zIEpL7yVr1MuDLJgotqCjq8O6Pd9b7GYSnVt/s2tUG6loM1mdhTm7hY2IoFdwZng
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46c6vjm43d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:17:48 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5423Fa9r008528;
	Fri, 2 May 2025 04:17:47 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 469ch3fx9p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 May 2025 04:17:47 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5424HiT09830988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 2 May 2025 04:17:44 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD1C658050;
	Fri,  2 May 2025 04:17:44 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CEB558045;
	Fri,  2 May 2025 04:17:40 +0000 (GMT)
Received: from [9.43.91.235] (unknown [9.43.91.235])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  2 May 2025 04:17:40 +0000 (GMT)
Message-ID: <96ff4b45-221a-4057-9a59-cf30f780824a@linux.ibm.com>
Date: Fri, 2 May 2025 09:47:37 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Include linux/types.h in
 papr-platform-dump.h
To: Stephen Rothwell <sfr@canb.auug.org.au>,
        Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, tyreld@linux.ibm.com,
        linux-next@vger.kernel.org, hbabu@us.ibm.com
References: <20250429211419.1081354-1-haren@linux.ibm.com>
 <20250430080709.01e21091@canb.auug.org.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250430080709.01e21091@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAyOSBTYWx0ZWRfX4RjREC/fLx1V sBkm4jfeEuofz2XoykhqMH3JhdHtEdrXnDCPY9RoSmP3JH9NkGIHA8Wsj77xKwVwDj6imRyhIqP RR2/IfBi1JdJvg7VMN7ETa3nVDoaASf0LywT8IXvubQfXDW7F1pMXwkB6wr987xt/wI4csdBsmp
 six8YwBjQcZkaJh0IV3B4mgSa+8VSnlSDISaDxYWs710Ogy7DvkU/MQJdoYL0yY7X3opjWldqHD cjvCssSCZDdfHlDlduFaWNHf40Ed58QVxKvKzM79uyLoNNIFGDe/vBxu52cb5Jpd0v8//TGfOyl 5MfLeN+P5gDwLv2N1zoP+Va8/zQfzljO66wVbA5Kh+FHiuhADsS1TjtTucuIM0NCt4z07cPFsIN
 iMIGBgPKEvnUrcYLTBArOQ4GHgNmTGEjNDkQNkkmkWAvsc5/K689uvpXScBG2dkzgKLtXqGW
X-Authority-Analysis: v=2.4 cv=GI8IEvNK c=1 sm=1 tr=0 ts=6814476c cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=VnNF1IyMAAAA:8 a=IJ5uNYSzlZeX1pgoDwQA:9
 a=QEXdDO2ut3YA:10 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: dNp0wH3RWEdQCraxIExFv-nv_ja-nbK2
X-Proofpoint-ORIG-GUID: dNp0wH3RWEdQCraxIExFv-nv_ja-nbK2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020029
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/30/25 3:37 AM, Stephen Rothwell wrote:
> Hi Haren,
> 
> Thanks for this.  I have a small nitpick below.
> 
> On Tue, 29 Apr 2025 14:14:18 -0700 Haren Myneni <haren@linux.ibm.com> wrote:
>>
>> Fix the following build warning:
>> usr/include/asm/papr-platform-dump.h:12: found __[us]{8,16,32,64} type without #include <linux/types.h>
>>
>> Fixes: 8aa9efc0be66 ("powerpc/pseries: Add papr-platform-dump character driver for dump retrieval")
>> Closes: https://lore.kernel.org/linux-next/20250429185735.034ba678@canb.auug.org.au/
>>
>> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
>> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> 


For now, when pulling this in , i will fix it,
but in future kindly have all tags together at
the end as suggested.

Maddy


> Please keep all the commit message tags together at the end of the
> commit message.
> 


