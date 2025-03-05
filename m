Return-Path: <linuxppc-dev+bounces-6721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CFF6A4F828
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Mar 2025 08:43:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z74L16KM5z2yt0;
	Wed,  5 Mar 2025 18:43:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741160617;
	cv=none; b=e2WCVWQmGmaLKVnTc0WurtwEZ1tSMWL7i8Tk2QAZr9bGhigP+UPh+qo1/OECgJItbp9V1VCy/8y1p7SaZ16mndSTC9ahS/6lYtvQDsm3bP/7EUDlTlGHZgz+UzWpFD2IP0mYEhu37zsdn2lmg5u9QOK7iNRnoVb17E3SsfLSBB3jcn5qqhAz1HAON+4Fqlyd+Yu7LmOY0lQtWQ/bZdayXxgLLse6eMh8REfL6Ux//nU3qT5UYdahX2/qUCDAGZgi93yDKUoPEA0mfmk2oUueKhltTRLCTsGzaGQT1CYHhBJw4b3VW3EWCa8p84FuLkOex5Q3cjIBoWB0jZkymoamqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741160617; c=relaxed/relaxed;
	bh=juDfJz/6pljG4PeZ1fYbCe9dzmYxjOe7nO+xr6RgsXk=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:References:
	 From:In-Reply-To; b=R5iyV4Eic/IwbuI+fTFp5c7X9G3lcxzsOXQl8SbMSwlZ+xUp2bw8wFocExmWb7tPFfCA1YarOxnz51UkezYkeXUV0C/k5uu7ytnJu2yACh5Qd4GPjDWPV6mGB89yjRNJMgOUhCpcyzO3BYLD/P0sbCrG+L/t08sDQgpI09oQTrUYup+u0oe+zlZatSWgxDmxks4RIiUmxyv9lkTNWDi3Yhin96YU04Vp/7saX/aJh5MziNtsaf8l70w+dOvT/n5mlRPiCcEiEN1Spfte7RgJj4E0yAViU6h89Eb2tOHwTZAkfHsJyitFcvBiQjSlQIdPurlgev33mFH0l/RuqDjlAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NYA5vAaO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NYA5vAaO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z74Kz6X07z2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 18:43:35 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5253kseC017800
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Mar 2025 07:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=juDfJz/6pljG4PeZ1fYbCe9dzmYxjO
	e7nO+xr6RgsXk=; b=NYA5vAaOWTGhmiIw/iqhSLDWXEwlCG9w5HeJ+uJsGVdbir
	Y7MC006h5zJOLVD8ar1W9jFbq77ZuTB6uY5bhyv7l0IRlLqSqPt0Gf9noVi79SxN
	p9anZbtANN2VqG3y4HFxxaB6EHrX4dt22MK2jSHUQXHN2Mfk4hGQGSnV8hL2UuSX
	1LZ6Xh6yWRwyhpzSZ/uJ97R/SbLF5ZkUfkJoePmFhBlpEwmCL2ihsoT5d1QLcjZ7
	uOjEy/caeyUOVwL72YHUvA3RQcG43Y2LhVTuLc2N7OdK6gbHOU98ttAdPCu1diP/
	OG7K77WIGyhXb6Aw8QU2CeEltPa1IJ2KcSRsBw4Q==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 456f08ruup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 07:43:32 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5256MhuU031946
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Mar 2025 07:43:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 454cjt1w0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Mar 2025 07:43:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5257hTVT31982144
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Mar 2025 07:43:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 694F22004B
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 07:43:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DED2D20040
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 07:43:28 +0000 (GMT)
Received: from [9.124.216.252] (unknown [9.124.216.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 07:43:28 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------jL50YMaLO7aT0nTYzht0o23n"
Message-ID: <7594035e-20b4-4c8d-910b-9b0a2ab34ee8@linux.ibm.com>
Date: Wed, 5 Mar 2025 13:13:27 +0530
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
Subject: Re: [PATCH] powerpc: Fix 'intra_function_call not a direct call'
 warning
To: linuxppc-dev@lists.ozlabs.org
References: <88876fb4e412203452e57d1037a1341cf15ccc7b.1741128981.git.christophe.leroy@csgroup.eu>
Content-Language: en-US
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <88876fb4e412203452e57d1037a1341cf15ccc7b.1741128981.git.christophe.leroy@csgroup.eu>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0_YejnNA45QRjSRuJ8gCQImbfX6IorZE
X-Proofpoint-GUID: 0_YejnNA45QRjSRuJ8gCQImbfX6IorZE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-05_03,2025-03-05_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=635 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503050058
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------jL50YMaLO7aT0nTYzht0o23n
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/5/25 4:30 AM, Christophe Leroy wrote:
> The following build warning have been reported:
>
>    arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
>    arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
>
> This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
> for decoding all types of uncond branches") because that commit decodes
> 'bl .+4' as a normal instruction because that instruction is used by
> clang instead of 'bcl 20,31,+.4' for relocatable code.
>
> The solution is simply to remove the ANNOTATE_INTRA_FUNCTION_CALL
> annotation now that the instruction is not seen as a function call
> anymore.
>
> Reported-by: Venkat Rao Bagalkote<venkat88@linux.ibm.com>
> Closes:https://lore.kernel.org/all/8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com
> Fixes: bb7f054f4de2 ("objtool/powerpc: Add support for decoding all types of uncond branches")
> Signed-off-by: Christophe Leroy<christophe.leroy@csgroup.eu>
> ---
>   arch/powerpc/kernel/switch.S            | 1 -
>   arch/powerpc/kvm/book3s_hv_rmhandlers.S | 2 --
>   2 files changed, 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/switch.S b/arch/powerpc/kernel/switch.S
> index 608c0ce7cec6..59e3ee99db0e 100644
> --- a/arch/powerpc/kernel/switch.S
> +++ b/arch/powerpc/kernel/switch.S
> @@ -39,7 +39,6 @@ flush_branch_caches:
>   
>   	// Flush the link stack
>   	.rept 64
> -	ANNOTATE_INTRA_FUNCTION_CALL
>   	bl	.+4
>   	.endr
>   	b	1f
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index ea7ad200b330..83f7504349d2 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1524,14 +1524,12 @@ kvm_flush_link_stack:
>   
>   	/* Flush the link stack. On Power8 it's up to 32 entries in size. */
>   	.rept 32
> -	ANNOTATE_INTRA_FUNCTION_CALL
>   	bl	.+4
>   	.endr
>   
>   	/* And on Power9 it's up to 64. */
>   BEGIN_FTR_SECTION
>   	.rept 32
> -	ANNOTATE_INTRA_FUNCTION_CALL
>   	bl	.+4
>   	.endr
>   END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)
The warnings are now fixed and the patch looks good to me.

Reviewed-by: Sathvika Vasireddy <sv@linux.ibm.com>

Thanks,
Sathvika
--------------jL50YMaLO7aT0nTYzht0o23n
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix"><font face="monospace">On 3/5/25 4:30
        AM, Christophe Leroy wrote:</font><br>
    </div>
    <blockquote type="cite"
cite="mid:88876fb4e412203452e57d1037a1341cf15ccc7b.1741128981.git.christophe.leroy@csgroup.eu">
      <pre class="moz-quote-pre" wrap="">The following build warning have been reported:

  arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
  arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call

This happens due to commit bb7f054f4de2 ("objtool/powerpc: Add support
for decoding all types of uncond branches") because that commit decodes
'bl .+4' as a normal instruction because that instruction is used by
clang instead of 'bcl 20,31,+.4' for relocatable code.

The solution is simply to remove the ANNOTATE_INTRA_FUNCTION_CALL
annotation now that the instruction is not seen as a function call
anymore.

Reported-by: Venkat Rao Bagalkote <a class="moz-txt-link-rfc2396E" href="mailto:venkat88@linux.ibm.com">&lt;venkat88@linux.ibm.com&gt;</a>
Closes: <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com">https://lore.kernel.org/all/8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com</a>
Fixes: bb7f054f4de2 ("objtool/powerpc: Add support for decoding all types of uncond branches")
Signed-off-by: Christophe Leroy <a class="moz-txt-link-rfc2396E" href="mailto:christophe.leroy@csgroup.eu">&lt;christophe.leroy@csgroup.eu&gt;</a>
---
 arch/powerpc/kernel/switch.S            | 1 -
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 2 --
 2 files changed, 3 deletions(-)

diff --git a/arch/powerpc/kernel/switch.S b/arch/powerpc/kernel/switch.S
index 608c0ce7cec6..59e3ee99db0e 100644
--- a/arch/powerpc/kernel/switch.S
+++ b/arch/powerpc/kernel/switch.S
@@ -39,7 +39,6 @@ flush_branch_caches:
 
 	// Flush the link stack
 	.rept 64
-	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 	b	1f
diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
index ea7ad200b330..83f7504349d2 100644
--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
@@ -1524,14 +1524,12 @@ kvm_flush_link_stack:
 
 	/* Flush the link stack. On Power8 it's up to 32 entries in size. */
 	.rept 32
-	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 
 	/* And on Power9 it's up to 64. */
 BEGIN_FTR_SECTION
 	.rept 32
-	ANNOTATE_INTRA_FUNCTION_CALL
 	bl	.+4
 	.endr
 END_FTR_SECTION_IFSET(CPU_FTR_ARCH_300)</pre>
    </blockquote>
    <font face="monospace">The warnings are now fixed and the patch
      looks good to me.<br>
      <br>
      Reviewed-by: Sathvika Vasireddy <a class="moz-txt-link-rfc2396E" href="mailto:sv@linux.ibm.com">&lt;sv@linux.ibm.com&gt;</a><br>
      <br>
      Thanks,<br>
      Sathvika</font><span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------jL50YMaLO7aT0nTYzht0o23n--


