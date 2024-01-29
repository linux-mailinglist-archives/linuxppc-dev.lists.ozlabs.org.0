Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F56A84023B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 10:53:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j0jzkhSf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNkC40p41z3bxZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 20:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j0jzkhSf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNk9h3sDtz3c1J
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 20:52:24 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40T9oqJi031833;
	Mon, 29 Jan 2024 09:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Ap8EPVjZkAWdncWJ2w24sLlk1zfoL/4eaEKlszJB7MY=;
 b=j0jzkhSfd70tYJQgEb3EzbTHO/+pjx9yqvxlGLZ3GoCbmJN+UbMofZ6GMTaKS29RHv5j
 ASuCRdNtgXvU/ahIRpcBJ/JP+lk5hflJCFszNgTP2jb/DE9Gp7N0IGfdwWp+9A+KG5i4
 /R4CdsYUxBKtniTEJNl+NnCUdT5jemDqRqcLhkRv1tGEH0H9GZmEjYspMnyZGcgHLW4+
 W+eqvM+BTep1Shcxl2cIknPDbp6Qa640iynxXZ5jvy95rrbM7Dfy2R+1V2CcZFk/zhHx
 6NOe0F+gZ2CyIjd8KQ87ZXaVJb5zpc05+frZ7oeWHq00H/hbsFdVd8uDBndk2BIWoHW3 Gw== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vw20acq1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:52:17 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40T923eL007964;
	Mon, 29 Jan 2024 09:51:51 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vwdnkqa1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 09:51:51 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40T9pkcg32309508
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jan 2024 09:51:48 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD0F520043;
	Mon, 29 Jan 2024 09:51:46 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D7DC2004D;
	Mon, 29 Jan 2024 09:51:46 +0000 (GMT)
Received: from osiris (unknown [9.171.85.65])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 29 Jan 2024 09:51:46 +0000 (GMT)
Date: Mon, 29 Jan 2024 10:51:44 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>
Subject: Re: [PATCH 4/5] s390/irq,nmi: do not include <linux/vtime.h> header
Message-ID: <20240129095144.6722-A-hca@linux.ibm.com>
References: <cover.1706470223.git.agordeev@linux.ibm.com>
 <966148629217b56139f40c38ffbb45ca229bd489.1706470223.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <966148629217b56139f40c38ffbb45ca229bd489.1706470223.git.agordeev@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ddu0zDMunve_4609_7EK0mJRNnHf44_K
X-Proofpoint-ORIG-GUID: Ddu0zDMunve_4609_7EK0mJRNnHf44_K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_06,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=37 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=37 mlxlogscore=23
 phishscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=37
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401290071
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 28, 2024 at 08:58:53PM +0100, Alexander Gordeev wrote:
> update_timer_sys() and update_timer_mcck() are inlines used for
> CPU time accounting from the interrupt and machine-check handlers.
> These routines are specific to s390 architecture, but declared
> via <linux/vtime.h> header, which in turn inludes <asm/vtime.h>.
> Avoid the extra loop and include <asm/vtime.h> header directly.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/s390/kernel/irq.c | 1 +
>  arch/s390/kernel/nmi.c | 1 +
>  2 files changed, 2 insertions(+)
...
> +++ b/arch/s390/kernel/irq.c
> +#include <asm/vtime.h>
...
> +++ b/arch/s390/kernel/nmi.c
> +#include <asm/vtime.h>

It is confusing when the patch subject is "do not include.." and all
what this patch is doing is to add two includes. I see what this is
doing: getting rid of the implicit include of asm/vtime.h most likely
via linux/hardirq.h, but that's not very obvious.

Anyway:
Acked-by: Heiko Carstens <hca@linux.ibm.com>
