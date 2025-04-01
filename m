Return-Path: <linuxppc-dev+bounces-7409-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9B6A775C5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Apr 2025 09:57:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRgMz5SH5z2xpn;
	Tue,  1 Apr 2025 18:57:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743494271;
	cv=none; b=OJmBam7Zc8aMDdaFiuuVEDg85jilg3LaNmeZ3jiwdeSlBbsfyWVw34RG5aC9At3ygPamvlNokzFH4cfMoy7sM70b1NyzF2z7dEiqNZAhwfoHM2gaEA2UuYBfhB1S6RuLQB5z/WN38YO4OC1egxPpJ2QNhoZUqEYMN9dMLpImCPnkQgrUgRBt4CnorjTWKSd4JYpDLO2tGohKwncxSO7cyYrXZD9TCSnBubycjmkliQAXJqkd23oL64i/IH6UqgwT1GYLFdnGSjvB+Iyit/OIC31VUEEseanBlQAw317EP1lBdIHOrtJ7L5xxEUOeYJHZIDRCCnKMl2MiHOlsY+38iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743494271; c=relaxed/relaxed;
	bh=1jvTkw8K9dflfIJRkR7stOj1dwSV0tNY/0nqdlZ0GKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eoR15kvO9ufmgO4AP/uBye+twwokO99KxXF2/cBX5akstOw6UGoDYkhYVbTo7iPpV24uMqdFfZ5lfmuwtkqnA/9H6DctJ8ZktST3UHZeSZJ74c/IdNpcHMQ5Q0NamVg4IxyY5B4wVACd+9Dr720bKSSckIpesBetNajTsIvbXKI5r2Vjj3QyE4oqkkC5ak9d26AtgRRaGKilufA6uBGXuss6KeBcagM4zi4McTbcZZbWiOtZdTWws5FybIRqkJ9JvwQwFXnuW9/7SekBxfBRWWe7MuLJaTBF+vP9WZMdV031OtIlTcUQ0NW3UYKAnQdhyVJOq2DsKQpGWtZGK2PzYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Efwxa8pn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Efwxa8pn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRgMy3Lqpz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 18:57:49 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VKZnsd030189
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Apr 2025 07:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=1jvTkw
	8K9dflfIJRkR7stOj1dwSV0tNY/0nqdlZ0GKs=; b=Efwxa8pnsYQbaPQiBoSVk3
	1+NHq3BPWpJAAqzJ/EJEUOAYKDNqPgLAgnhAwDbyy7G4CIcYaOKwOn8mhPozNf68
	SG+WdszoNI4cvz5//BPM9LekUNAWYnpCVmp4HpCVRn4Qb4BNLWZivx7bPsjqRNLt
	Nte6X/WfS8akoKOpyNmXn92omhKKQeHL5CrX1MQotpvXvmIjK516QPEaOx7ItxFl
	CBXmbpCBK4DlHPSQoOPrbrsbrkai4l4ig3p3IhXbv5/R+SsCRdRkW2Z63DrpXxgE
	8PHhlyFmjVEqlkk65uXbclZ4DWIeZqUSpokc+vTIWW1lxqRdENodNfT7scOQ5Pwg
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45r27q2a35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Apr 2025 07:57:45 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 531526RB006615
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Apr 2025 07:57:24 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45pwdk9a3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Apr 2025 07:57:24 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5317vNOW29622920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 1 Apr 2025 07:57:23 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D0C65805D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 07:57:23 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FB8758065
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 07:57:22 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 07:57:22 +0000 (GMT)
Message-ID: <ad01e3c2-a8cc-44e6-8b02-dd31ea32a903@linux.ibm.com>
Date: Tue, 1 Apr 2025 13:27:21 +0530
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
Subject: Re: [PATCH] powerpc/boot: Check for ld-option support
Content-Language: en-GB
To: linuxppc-dev@lists.ozlabs.org
References: <20250401004218.24869-1-maddy@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20250401004218.24869-1-maddy@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: G9_UmYRZw86s2hsyMRZMOaBCqt6Ckahs
X-Proofpoint-GUID: G9_UmYRZw86s2hsyMRZMOaBCqt6Ckahs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502280000 definitions=main-2504010051
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 01/04/25 6:12 am, Madhavan Srinivasan wrote:
> Commit 579aee9fc594 ("powerpc: suppress some linker warnings in recent linker versions")
> enabled support to add linker option "--no-warn-rwx-segments",
> if the version is greater than 2.39. Similar build warning were
> reported recently from linker version 2.35.2.
>
> ld: warning: arch/powerpc/boot/zImage.epapr has a LOAD segment with RWX permissions
> ld: warning: arch/powerpc/boot/zImage.pseries has a LOAD segment with RWX permissions
>
> Fix the warning by checking for "--no-warn-rwx-segments"
> option support in linker to enable it, instead of checking
> for the version range.
>
> Fixes: Commit 579aee9fc594 ("powerpc: suppress some linker warnings in recent linker versions")
> Closes: https://lore.kernel.org/linuxppc-dev/61cf556c-4947-4bd6-af63-892fc0966dad@linux.ibm.com/
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>   arch/powerpc/boot/wrapper | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
> index 1db60fe13802..267ca6d4d9b3 100755
> --- a/arch/powerpc/boot/wrapper
> +++ b/arch/powerpc/boot/wrapper
> @@ -234,10 +234,8 @@ fi
>   
>   # suppress some warnings in recent ld versions
>   nowarn="-z noexecstack"
> -if ! ld_is_lld; then
> -	if [ "$LD_VERSION" -ge "$(echo 2.39 | ld_version)" ]; then
> -		nowarn="$nowarn --no-warn-rwx-segments"
> -	fi
> +if [ $(${CROSS}ld -v --no-warn-rwx-segments &>/dev/null; echo $?) -eq 0 ]; then
> +	nowarn="$nowarn --no-warn-rwx-segments"
>   fi
>   
>   platformo=$object/"$platform".o

Tested this patch, by applying on main-line kernel with commit HEAD: 
1a9239bb4253f9076b5b4b2a1a4e8d7defd77a95, and no build warnings are 
observed.


Please add below tag:

Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.


