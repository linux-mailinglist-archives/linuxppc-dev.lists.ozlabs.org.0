Return-Path: <linuxppc-dev+bounces-6249-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A567A37B6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 07:34:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxCYC6MtHz304C;
	Mon, 17 Feb 2025 17:34:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739774047;
	cv=none; b=TM2sF1uPa5BwqvJkUYhLn7nIQZle2KmY2bgpfWtHvu5vc30d/GISRUCZJWArB8rAYMWRy3iB2JotngQgRvJVDBzXF9wsOfhokBIw0cVZ6JBZcEFRLiD6eCfeLRiBTHuminW8Y73//0JjiJTUvJzf6TrkQgQEU+CIUry9F22o7bs99ryi7AzGgDHuwebZ5dCMjaiighMQdgdnSsEHDhoQvxe3DAhoUbUQHKkjtlwI143s3yqn1iSza49tKfxXpGWYZ+2ngxVIJKjxf0ZU9QONAOuJYe2Mm5p/+uJnudmwmBAwHDuXCH4sc4gFeYbVai0rq+9G9dfxzJj0JFYcGTchGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739774047; c=relaxed/relaxed;
	bh=g9ZfDVkEEuf1aRGYN144YHnhhbbI+nE5N2rBN6hHadY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dqXZiMpGfsfuLdpRR5bAIUI4DOGZi8nGEV0Ef66+UQFLZF/WYZDTidNTZeXRqSD2IgH3l4rXJP/UhKXYYX5aI1kpbZInlfLf1WmveNhbYyNIxYLlbH6pC5tFsaI3AbblXHgolWRXwbUusXLqc+RalqhWiZAcqLj3mpiQsKhpaitK4Yh9fNnRdVxBUO3s95x4ZikXQH98jrz6iDbP4X3XztEPaYPeiZWjmD1eW2nd80kU0XwWXdC7izq91R48NX7VbJyRniee9vAPE6lHxJ9QTi5bUkd8UWktlj8iVyPQ50fZoO8Xk0SmLj1C2j3Z9/dl6MVeAMsoMnfG9+fiQuX+wQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9zUnwnJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a9zUnwnJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxCYB5NW0z302c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 17:34:06 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51GFe49X032099;
	Mon, 17 Feb 2025 06:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=g9ZfDV
	kEEuf1aRGYN144YHnhhbbI+nE5N2rBN6hHadY=; b=a9zUnwnJHRA2mPk0GHxCiN
	/CgNg9CfERIa73NR85cw/GftETSyhE7eHdkCiDLBJ1i4zhlIQ6mGBaZZ7Mjg1khV
	/lAWP22QjWBrgKzxgcjynquYRlMv5fjiw2JBfYs1BpK3CrtKcbM0nOYgN23Zh0ea
	oesIoaYzTulAd6+PLcbEZdeIJO7W5ZdFBKwGYDGmYD5QaBZFra5QlG4AFbv2S90e
	GhWXbi9iz0figuBrl8KZvLsnAfny0aMyFaUlEOo1rCZAzACxe586IlWGRt0SF/i4
	wKigrp7vKToPKHupgWaogQEfeUhud+R9UufL/FQBjhFVBbZfqYp2HcepCRzRawmA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutjgbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 06:33:53 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51H6VDei021133;
	Mon, 17 Feb 2025 06:33:53 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutjgbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 06:33:53 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H6174U024883;
	Mon, 17 Feb 2025 06:33:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u7y1cga8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 06:33:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51H6XmXo32047424
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 06:33:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F8162004B;
	Mon, 17 Feb 2025 06:33:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BC3E20040;
	Mon, 17 Feb 2025 06:33:47 +0000 (GMT)
Received: from [9.109.222.45] (unknown [9.109.222.45])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 06:33:46 +0000 (GMT)
Message-ID: <76aa0eb7-3e74-4087-ab70-6fde4646b008@linux.ibm.com>
Date: Mon, 17 Feb 2025 12:03:46 +0530
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
Subject: Re: [PATCH v2] powerpc/crash: Fix non-smp kexec preparation
To: Eddie James <eajames@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org
References: <20250211162054.857762-1-eajames@linux.ibm.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20250211162054.857762-1-eajames@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eZDTlZCCdDog1xfCf8Z355We5Vrpz2G4
X-Proofpoint-GUID: UMpIcNCjS2-qYolvM4OYOtWQ9fM1zvYJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_03,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=972
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170055
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Eddie,

On 11/02/25 9:50 pm, Eddie James wrote:
> In non-smp configurations, crash_kexec_prepare is never called in
> the crash shutdown path. One result of this is that the crashing_cpu
> variable is never set, preventing crash_save_cpu from storing the
> NT_PRSTATUS elf note in the core dump.
> 

Thanks for fixing this.
Looks good to me.

Reviewed-by: Hari Bathini <hbathini@linux.ibm.com>

> Fixes: c7255058b543 ("powerpc/crash: save cpu register data in crash_smp_send_stop()")
> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> ---
> Changes since v1:
>   - Use if (IS_ENABLED(CONFIG_SMP)) instead of #ifdef CONFIG_SMP
> 
>   arch/powerpc/kexec/crash.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index 9ac3266e49652..a325c1c02f96d 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -359,7 +359,10 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
>   	if (TRAP(regs) == INTERRUPT_SYSTEM_RESET)
>   		is_via_system_reset = 1;
>   
> -	crash_smp_send_stop();
> +	if (IS_ENABLED(CONFIG_SMP))
> +		crash_smp_send_stop();
> +	else
> +		crash_kexec_prepare();
>   
>   	crash_save_cpu(regs, crashing_cpu);
>   


