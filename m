Return-Path: <linuxppc-dev+bounces-6722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E62BA4F83C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 08:48:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z74S83d2wz2xS4;
	Wed,  5 Mar 2025 18:48:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741160936;
	cv=none; b=aqAN5tbsDIg3lpsj/Flww41wa/OEgr9GEmQtjKEUaTJnOiyyx+Eygz5d8706Hu4chiTh8zqZkQ9MXUsnI5CKrnTDBOUow6mRf5k4ASNSzbv/N+ay3r3hnBnSs1b4vUMlrKJigN8kAC355ugH63/2rPCavdJeRX4+CTpgDa3NI2NYIpp1S+srmqzmZvhgpoBgKiCJffLm4w/PwBZflY0G8KaROGW6zs5jxOOg5UUEPQSYmc2fUkj/SmqNRoBchHU2FgQ4rXUUCwS9wUv+LeBYDY0j/xByh6Elrt8RneMf/dvGmrsaLoGdlzy5/a6zwylIRv/yHs45mWnlEmwVpXjvSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741160936; c=relaxed/relaxed;
	bh=wB4LafNqsXtDATgetkb8CCZCA8/qwJ21LtjokMEuDZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=DOm5gAl08Q4aFr3g3kqurLpzjm6KeqZhlyCyDNbPL5zo2n/mNVFo+MXABDm0XN+5ZiwQ4w1W/ffEy1E6YqVl/OZzbVjkJalyWJYus23Sl8BrKbSzmVDE5mfZnPUP+wXnpVezmSiQfh9nJsnarEYp8XAieHi/gYSSkYrquUJ9APdPysR35qHjZeXxae5SzlPUiXubZQPdF+YudqNuvAMsuWmmb7d87g5eoONdgZe3Zwhdi+vVU86Bu9j7jgZg6y1mLZX96EDHifwyLYqyiunsuJ1HWLyBMrpjDERJcys1UQZTlne9pH850cVV8bBzoVGI29Yb/J0/4JD353VYx+9CIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q33wyLL7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q33wyLL7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z74S757cRz2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 18:48:55 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5253kcXd017542
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Mar 2025 07:48:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=wB4Laf
	NqsXtDATgetkb8CCZCA8/qwJ21LtjokMEuDZ4=; b=q33wyLL7+8WA+8hJX9rC6E
	MTLg/w/ySizBT3rRKCmd2dolIMQBm4x/B09HN/g3eX4reYawjA07exitQ63Qn8m2
	lWFVszJLTlJDLD2tpEAwMF3+lgA61n6w8ejkKIN779+J5txRcGUsWgV9A0AQy1eG
	GLHBa6OvrN7oPnIdjCjB3VeQhbLireAptNZOWxVSD96E+poRkiipqu4sC++3hDlL
	IhLzD8Y8h/E4P9TwhK2XmR6OY0A2Pqi3TOqHg0TZ+Q5OMZKZIVYrlO+fyTvk8stv
	imHAcVFFwFMbrNka1l/Bpp+HdOGo3106quvt8rBhiVuvC6wMQS7TixFxb8WOMGTw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 456f08rvfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 07:48:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5257629I020845
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Mar 2025 07:48:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454djnhq6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 07:48:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5257mo9b57606414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Mar 2025 07:48:50 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E750720043
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 07:48:49 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6933820040
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 07:48:49 +0000 (GMT)
Received: from [9.124.216.252] (unknown [9.124.216.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 07:48:49 +0000 (GMT)
Message-ID: <73e0d933-7824-4e7a-a700-9425f66fa717@linux.ibm.com>
Date: Wed, 5 Mar 2025 13:18:48 +0530
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
Subject: Re: [PATCH] crypto: powerpc: Mark ghashp8-ppc.o as an
 OBJECT_FILES_NON_STANDARD
To: linuxppc-dev@lists.ozlabs.org
References: <7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <7aa7eb73fe6bc95ac210510e22394ca0ae227b69.1741128786.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HJifvxoDdhuxzCelVvB4XEwOxAshAD-v
X-Proofpoint-GUID: HJifvxoDdhuxzCelVvB4XEwOxAshAD-v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503050058
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 3/5/25 4:32 AM, Christophe Leroy wrote:
> The following build warning has been reported:
>
>    arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
>
> This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
> for decoding all types of uncond branches")
>
> Disassembly of arch/powerpc/crypto/ghashp8-ppc.o shows:
>
>   arch/powerpc/crypto/ghashp8-ppc.o:     file format elf64-powerpcle
>
>   Disassembly of section .text:
>
>   0000000000000140 <gcm_ghash_p8>:
>     140:    f8 ff 00 3c     lis     r0,-8
>   ...
>     20c:    20 00 80 4e     blr
>     210:    00 00 00 00     .long 0x0
>     214:    00 0c 14 00     .long 0x140c00
>     218:    00 00 04 00     .long 0x40000
>     21c:    00 00 00 00     .long 0x0
>     220:    47 48 41 53     rlwimi. r1,r26,9,1,3
>     224:    48 20 66 6f     xoris   r6,r27,8264
>     228:    72 20 50 6f     xoris   r16,r26,8306
>     22c:    77 65 72 49     bla     1726574 <gcm_ghash_p8+0x1726434>      <==
>   ...
>
> It corresponds to the following code in ghashp8-ppc.o :
>
>   _GLOBAL(gcm_ghash_p8)
>      lis    0,0xfff8
>   ...
>      blr
>   .long    0
>   .byte    0,12,0x14,0,0,0,4,0
>   .long    0
>   .size    gcm_ghash_p8,.-gcm_ghash_p8
>
>   .byte 71,72,65,83,72,32,102,111,114,32,80,111,119,101,114,73,83,65,32,50,46,48,55,44,32,67,82,89,80,84,79,71,65,77,83,32,98,121,32,60,97,112,112,114,111,64,111,112,101,110,115,115,108,46,111,114,103,62,0
>   .align    2
>   .align    2
>
> In fact this is raw data that is after the function end and that is
> not text so shouldn't be disassembled as text. But ghashp8-ppc.S is
> generated by a perl script and should have been marked as
> OBJECT_FILES_NON_STANDARD.
>
> Now that 'bla' is understood as a call instruction, that raw data
> is mis-interpreted as an infra-function call.
>
> Mark ghashp8-ppc.o as a OBJECT_FILES_NON_STANDARD to avoid this
> warning.
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com
> Cc: Danny Tsen <dtsen@linux.ibm.com>
> Fixes: 109303336a0c ("crypto: vmx - Move to arch/powerpc/crypto")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/crypto/Makefile | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/crypto/Makefile b/arch/powerpc/crypto/Makefile
> index 9b38f4a7bc15..2f00b22b0823 100644
> --- a/arch/powerpc/crypto/Makefile
> +++ b/arch/powerpc/crypto/Makefile
> @@ -51,3 +51,4 @@ $(obj)/aesp8-ppc.S $(obj)/ghashp8-ppc.S: $(obj)/%.S: $(src)/%.pl FORCE
>   OBJECT_FILES_NON_STANDARD_aesp10-ppc.o := y
>   OBJECT_FILES_NON_STANDARD_ghashp10-ppc.o := y
>   OBJECT_FILES_NON_STANDARD_aesp8-ppc.o := y
> +OBJECT_FILES_NON_STANDARD_ghashp8-ppc.o := y

Objtool is not invoked on this file anymore, and the warning is no 
longer seen with this patch.

Patch looks good to me.

Reviewed-by: Sathvika Vasireddy <sv@linux.ibm.com>

Thanks,
Sathvika



