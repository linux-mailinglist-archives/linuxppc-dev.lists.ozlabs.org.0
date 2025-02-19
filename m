Return-Path: <linuxppc-dev+bounces-6343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04706A3B2F7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 09:00:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyTMv49wkz30CN;
	Wed, 19 Feb 2025 19:00:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739952027;
	cv=none; b=DClbPlQ1zWG5uuIZrlVZzSR6mFregeFzz9wXC6teSs+EjKEzVh49bDFgut/Y8lx46F/DiI+4tkK68tHdl5r+lIW9JuVJx2S6SY3yAm4O+PEb6dTI/y0OTeTAeUBnRrC/qYun/yq/s+kw4pj/34aaduH6wE0N08UbZF2noj0uOV4wYF/m6QvXbtOs3StUvYnW4nXhqrpVzp6go6ZJEHprOYz4FWpGnD5HVrQw6zvk2TaeFkBP9jOv1BGpnKIoVvsBQkSEbWbQ1KgMdZqJTkVEZ9JT719aUN7RK+qZuuz8o/s7QIoewwBKY+GI43adpplY6MPDWJ0iciXIJ6OSmtGxhg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739952027; c=relaxed/relaxed;
	bh=ejfOtpj+exSth/ZFyiK/cHQMe5GVKIP/KuhULowI8is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XnzcYHVFSGBgTUIStICdstZ/zAyYu/98ef/TBHFVpshqJBsUTva8IN/cxUpKuYRmaUAS61AbyCbGqqpQjZ2HrqEMtO/0+pHftsfJbRIPRWmOdzaee4VWBSVpqRqcyrt6excjQS8vQLU3mJPJC2wHpOXlNNQz1bSDyEdBFi9ILGo8Xd6n93J/aQo/jj3IeBKNUNtU71ZG9Yvb6FAxQYy9ggbjjzkRGJPDf/DSmEoM9/Xt4OriN8ryP89BG6rFb2nspEzputfCqnTGOSiBZkshoGfJsAGeS4Ij4KTILtCZIQVqMgIRaFVoIcHXrcGduvmOFZhLn4+G1SJ2OLveOkpLdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sdJT9w06; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sdJT9w06;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyTMt46j4z2yGk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 19:00:25 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J75B8a005303;
	Wed, 19 Feb 2025 08:00:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ejfOtp
	j+exSth/ZFyiK/cHQMe5GVKIP/KuhULowI8is=; b=sdJT9w06RiKt4fmZ42IqQA
	WxfdIf4gqVL0gj5JRjOmOpR4+Wi/cqRqEL1E6s94BR1nv+jckIUYngTEDQXpB7te
	geIpMoTdPpe7hcQSkeY0MbsnU0QUGCUDA6rpdemO+JxdnhrXbJ97E/KSDN5Q2C3X
	m55ThXuS+QFWcEKi4hCBUgITcwaNGejGVFwYCyqBrO4eJVsbFqcJNi5rlkqjKx+l
	4Pso89RclLPbiPzcDEu2L7o2UNdX0lzJ6DWv7gcIEH/GP9Y2S0/vaqYomjXXAy6Z
	wK0jYc7VbuzsgT/KbAZKg+JtvN9onOhWmVi2NIZgrss2mrilTIncw95BLSATV7YQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w65097yk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 08:00:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51J7xE3b006847;
	Wed, 19 Feb 2025 08:00:14 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w65097ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 08:00:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51J704B3005826;
	Wed, 19 Feb 2025 08:00:13 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44w02xawrg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 08:00:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51J80CuQ64029038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 08:00:12 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEFD95806F;
	Wed, 19 Feb 2025 08:00:11 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51F3358056;
	Wed, 19 Feb 2025 08:00:05 +0000 (GMT)
Received: from [9.43.108.86] (unknown [9.43.108.86])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 08:00:04 +0000 (GMT)
Message-ID: <d5734fe3-813f-4c8b-9ead-3089d3af6274@linux.ibm.com>
Date: Wed, 19 Feb 2025 13:30:01 +0530
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
Subject: Re: [PATCH] cxl: Fix cross-reference in documentation and add
 deprecation warning
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: fbarrat@linux.ibm.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org,
        mchehab+huawei@kernel.org, corbet@lwn.net, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
References: <20250219064807.175107-1-ajd@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20250219064807.175107-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZpWv9r_k4_BcWUijIIygROr8keycnyVP
X-Proofpoint-GUID: 9iddCGeetMERc6TtA9Qm1KYvDJrgEslg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_03,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=695 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190062
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/19/25 12:18 PM, Andrew Donnellan wrote:
> commit 5731d41af924 ("cxl: Deprecate driver") labelled the cxl driver as
> deprecated and moved the ABI documentation to the obsolete/ subdirectory,
> but didn't update cxl.rst, causing a warning once ff7ff6eb4f809 ("docs:
> media: Allow creating cross-references for RC ABI") was merged.
> 
> Fix the cross-reference, and also add a deprecation warning.
> 
> Fixes: 5731d41af924 ("cxl: Deprecate driver")
> Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> 
> ---
> 
> Maddy: can we take this by powerpc-fixes?

Yes. Will take this via powerpc-fixes

Maddy

> ---
>  Documentation/arch/powerpc/cxl.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/arch/powerpc/cxl.rst b/Documentation/arch/powerpc/cxl.rst
> index d2d77057610e..778adda740d2 100644
> --- a/Documentation/arch/powerpc/cxl.rst
> +++ b/Documentation/arch/powerpc/cxl.rst
> @@ -18,6 +18,7 @@ Introduction
>      both access system memory directly and with the same effective
>      addresses.
>  
> +    **This driver is deprecated and will be removed in a future release.**
>  
>  Hardware overview
>  =================
> @@ -453,7 +454,7 @@ Sysfs Class
>  
>      A cxl sysfs class is added under /sys/class/cxl to facilitate
>      enumeration and tuning of the accelerators. Its layout is
> -    described in Documentation/ABI/testing/sysfs-class-cxl
> +    described in Documentation/ABI/obsolete/sysfs-class-cxl
>  
>  
>  Udev rules


