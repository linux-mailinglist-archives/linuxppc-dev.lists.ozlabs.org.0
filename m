Return-Path: <linuxppc-dev+bounces-7909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10ACA96D5C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Apr 2025 15:47:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zhk866Fwdz2xpn;
	Tue, 22 Apr 2025 23:47:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745329670;
	cv=none; b=a1rMbtmxemPK5LNmRgtewYRCs4l6B0MMHOhp9bgLdfoMX11hLtJ4ME8BvZXbCjwFTTbeI9G9ZMvxyzuhrT5L8PhGHPbrmdEpO62YvcMMZvpUFtHZlabU+n09FTu8RoWhPSg05Tq1MI+KceRd9vnsvrLtz0X8iU5PGB2Xnye17gwQw7zBFlrb/qhD5Lvx07OQpLluommu6OgIHLneTGZ7iKsz1GipoBMaVPfrgTnJ+eD+v5Zl4K51cn1+JSSoBVx+SewzEXb8c1OyB+1MqY47YQtFdihWHreN34kg2ebjA0mtLjfn+PGGRx52OZqcSxXIi3fbqgY082gGaLS/SHklyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745329670; c=relaxed/relaxed;
	bh=Rmqwdi6vdVSLJrOThgypVT+VrPv3i0avvQfSj4bFWqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LLgABdsUu/qvZQFhQssJkcKrivfqUgbHzGlpMm7b9WFlIbAjhzl8dOyuKSdhXbsrzTwFArhRQ1aoDkJDSfipjnoKVlz5APUMfzhn5Jtt7xDIyEqPSKH6dBsueOCy9+aaSu4iBpbYQ1X7AYFwQWKFEAVX2qtou2+KLAENjQpL4xhmIsgPWR7fZO3UcLlO2ZnYb3V/ly0ywIOznozeyi/pIystojyaQ9mHmsJIgLToUXmFSskoc00GCzakgxuVpwWwHUgy48i53mmmhftbrqnecFbH2RXfxvW1G3eE3HJiDFG4YYc4Ta3JjLMGegs9Dik3mROUkwm3MhW0RMTnmgqTgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ca1+GVvp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ca1+GVvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zhk856CfYz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Apr 2025 23:47:49 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53MA3rD0025943;
	Tue, 22 Apr 2025 13:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Rmqwdi
	6vdVSLJrOThgypVT+VrPv3i0avvQfSj4bFWqA=; b=Ca1+GVvpCI4TBSld3bsJ2g
	Yir3Fj/+vl/hJLwg1X0nfJJtf7vXrt+ibCeyQ9whT9drRm3Hk3sp9P64HM7bT1UJ
	EWeiFrvd75JLJejO2CS9/vEc0vKYdtWYHu8iKV5m9GimSsWHvcyc2SzfrhPIZ36R
	eG+EArNp4gvGvZ7kBwFrQasCDMej2MSM5ZNqC1oVqTpzMgQZZilLaAvkTlZRmgTR
	BOn5PdVWQExR7FE5V5hSxBlABn+yQiIyYn2zyaz4YrsaVD/o6PtYK6NtWvVTfMB+
	FJJxRX3yxF3w3MGl7iFC9aFecNXLpnKlhcFUPkIFzIXXdIgrg23uqZ4/VyBy+9eg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hh1wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:47:33 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53MDXrGb004251;
	Tue, 22 Apr 2025 13:47:32 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46691hh1wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:47:32 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53MAsk0p002939;
	Tue, 22 Apr 2025 13:47:31 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 464q5nk2uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Apr 2025 13:47:31 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53MDlUNq26018342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 13:47:31 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DD6245803F;
	Tue, 22 Apr 2025 13:47:30 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F23585804E;
	Tue, 22 Apr 2025 13:47:25 +0000 (GMT)
Received: from [9.43.58.77] (unknown [9.43.58.77])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 22 Apr 2025 13:47:25 +0000 (GMT)
Message-ID: <d14eb2c1-05d5-402b-b6b0-71d8bbd32200@linux.ibm.com>
Date: Tue, 22 Apr 2025 19:17:22 +0530
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
Subject: Re: [PATCH] powerpc/boot: Fix dash warning
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20250422113023.356883-1-maddy@linux.ibm.com>
 <20250422230822.12a81c95@canb.auug.org.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250422230822.12a81c95@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=V7h90fni c=1 sm=1 tr=0 ts=68079df5 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=Fdm2WJPEMQzAIOUNTYwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: k99Kd8Brhp5EOCPv6giNnG1Hw7Mu1-Qn
X-Proofpoint-GUID: g-4gEMoWa7dPXWWvkPRZTonVZrCG9t1X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_06,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 clxscore=1015 mlxlogscore=919 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504220102
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 4/22/25 6:38 PM, Stephen Rothwell wrote:
> Hi Madhavan,
> 
> On Tue, 22 Apr 2025 17:00:23 +0530 Madhavan Srinivasan <maddy@linux.ibm.com> wrote:
>>
>>  # suppress some warnings in recent ld versions
>>  nowarn="-z noexecstack"
>> -if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
>> +if [ "$("${CROSS}"ld -v --no-warn-rwx-segments >/dev/null 2>&1; echo $?)" -eq 0 ]; then
>>  	nowarn="$nowarn --no-warn-rwx-segments"
>>  fi
> 
> On the way to bed, it occurred to me that the above "if" line can be
> written as:
> 
> if "${CROSS}ld" -v --no-warn-rwx-segments >/dev/null 2>&1; then

if command; then
  # Commands to execute if the command succeeds (exit status 0)
fi

Yeah nice, Will fix and send a v2

Maddy

> 


