Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A26FE633484
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 05:46:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGWtP3WqLz3ccl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 15:46:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLGcQP4t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MLGcQP4t;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGWsP56Cmz2xl0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 15:45:29 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM3vnBf006223
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:45:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=K8yM8YYhki3XI88VU2F0OPDvUwejP47ZjbIAZ+Uo2QU=;
 b=MLGcQP4tR/10BUbM6cjO3cG2Ub+gO/7jTLvbvkrb/tVd3QrlMM8xePHyNXh4Pk0ULo4f
 3sV0AaSivTD6OVeOezDvd51it1f7/RwLAXYNhKv0oqBjZEwpp19EFuJSeBl1k6BY2qVz
 738dMAAW9EsFbeK8LZl8i+0gdRiySpYLcCqiaZctCIC9IBm8aWtyN4+q/JHnheqSrazl
 ucCm9oAc8JsPHpxXhSBy5BAK7dDmj1guHJ6aQZYWdNWM2OrniX2eL/HUCZfxYGJNC/8X
 i1bdbD7A/4CPFldpwFmiGI7F8Y/7x5Zr2Nkj6u0VHrFsAK/a0kJB4YyCUu2AI0khDS8Y lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0pyxrx82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:45:26 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AM4Qpas015690
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 04:45:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0pyxrx7g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 04:45:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM4a8V3009605;
	Tue, 22 Nov 2022 04:45:23 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3kxpdj2nat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 04:45:23 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM4d9PH48497000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 04:39:09 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85E81A4057;
	Tue, 22 Nov 2022 04:45:21 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 304EAA4053;
	Tue, 22 Nov 2022 04:45:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 04:45:21 +0000 (GMT)
Received: from [10.61.2.128] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CE73A600F3;
	Tue, 22 Nov 2022 15:45:19 +1100 (AEDT)
Message-ID: <6a811123fcb934363924c179b6d668bbc984be66.camel@linux.ibm.com>
Subject: Re: [PATCH 07/13] powerpc/rtas: clean up includes
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 22 Nov 2022 15:45:19 +1100
In-Reply-To: <20221118150751.469393-8-nathanl@linux.ibm.com>
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
	 <20221118150751.469393-8-nathanl@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KbrMR6embdkR9v_aW9SYd3Tmdlyg1KEE
X-Proofpoint-GUID: 8vicE6yyR0AIyJlpb5Fn9H8wal9UqT7i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_01,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211220032
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2022-11-18 at 09:07 -0600, Nathan Lynch wrote:
> rtas.c used to host complex code related to pseries-specific guest
> migration and suspend, which used atomics, completions, hcalls, and
> CPU hotplug APIs. That's all been deleted or moved, so remove the
> include directives that have been rendered unnecessary. Sort the
> remainder (with linux/ before asm/) to impose some order on where
> future additions go.
>=20
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>

Compiles for me.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
> =C2=A0arch/powerpc/kernel/rtas.c | 42 +++++++++++++++--------------------=
-
> --
> =C2=A01 file changed, 16 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index 3fa84c247415..7a5812624e11 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -7,43 +7,33 @@
> =C2=A0 * Copyright (C) 2001 IBM.
> =C2=A0 */
> =C2=A0
> -#include <linux/stdarg.h>
> -#include <linux/kernel.h>
> -#include <linux/types.h>
> -#include <linux/spinlock.h>
> -#include <linux/export.h>
> -#include <linux/init.h>
> =C2=A0#include <linux/capability.h>
> =C2=A0#include <linux/delay.h>
> -#include <linux/cpu.h>
> -#include <linux/sched.h>
> -#include <linux/smp.h>
> -#include <linux/completion.h>
> -#include <linux/cpumask.h>
> +#include <linux/export.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> =C2=A0#include <linux/memblock.h>
> -#include <linux/slab.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> =C2=A0#include <linux/reboot.h>
> +#include <linux/sched.h>
> =C2=A0#include <linux/security.h>
> +#include <linux/slab.h>
> +#include <linux/spinlock.h>
> +#include <linux/stdarg.h>
> =C2=A0#include <linux/syscalls.h>
> -#include <linux/of.h>
> -#include <linux/of_fdt.h>
> +#include <linux/types.h>
> +#include <linux/uaccess.h>
> =C2=A0
> +#include <asm/delay.h>
> +#include <asm/firmware.h>
> =C2=A0#include <asm/interrupt.h>
> -#include <asm/rtas.h>
> -#include <asm/hvcall.h>
> =C2=A0#include <asm/machdep.h>
> -#include <asm/firmware.h>
> +#include <asm/mmu.h>
> =C2=A0#include <asm/page.h>
> -#include <asm/param.h>
> -#include <asm/delay.h>
> -#include <linux/uaccess.h>
> -#include <asm/udbg.h>
> -#include <asm/syscalls.h>
> -#include <asm/smp.h>
> -#include <linux/atomic.h>
> +#include <asm/rtas.h>
> =C2=A0#include <asm/time.h>
> -#include <asm/mmu.h>
> -#include <asm/topology.h>
> +#include <asm/udbg.h>
> =C2=A0
> =C2=A0/* This is here deliberately so it's only used in this file */
> =C2=A0void enter_rtas(unsigned long);

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited
