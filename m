Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A35924F5692
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 08:44:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYFP43XnTz3bbp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 16:44:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bxMWHMLy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bxMWHMLy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYFNJ0Hsrz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 16:43:59 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23633LSr016210; 
 Wed, 6 Apr 2022 06:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qCYyAHYd3qcSSdh6JKTxv2idV/wS9yHsQC0N8moZXfI=;
 b=bxMWHMLyXufXsKm/clv75+L3yXYVmjso+Md1X7sVo2lMU3hFi9F0xD6MmrTgadgHEEzU
 ZReHjS7iXvba5y8/pZWSwePQMgr929S8yg+AuwHEdV7uz9A8dSPz2juJ+wanCYPF/8PZ
 r41ewhMin+bS3J67tZtQvR83ZIvafwH5pYv+miNQQJHHkbAMBYlPzqHrOiUUwN056EL5
 nm6yDh0aXbUkF5EwqP+MMC18GBGVyBu0N4Tifr6yQm4uK0tQewIYUMRgJ6JD6n4xZBn2
 stdGDF6tDFcc5mp7G1FNz6UtLy0WDAPjTrJF6hj/Xq6ujQl0P924RAa2HagYZOwcDx46 ew== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f8ut8j6da-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 06:43:50 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2366h6Y8000879;
 Wed, 6 Apr 2022 06:43:49 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 3f6e48y7b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 06:43:48 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2366VV7u46137770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 06:31:31 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7823EAE045;
 Wed,  6 Apr 2022 06:43:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CCB5AAE04D;
 Wed,  6 Apr 2022 06:43:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Apr 2022 06:43:45 +0000 (GMT)
Received: from [9.43.195.169] (unknown [9.43.195.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9A915600A7;
 Wed,  6 Apr 2022 16:43:41 +1000 (AEST)
Message-ID: <d6cb3408-49a4-3c35-6ce0-3b35fd88bb9e@linux.ibm.com>
Date: Wed, 6 Apr 2022 16:43:30 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] cxl/ocxl: Prepare cleanup of powerpc's asm/prom.h
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <a2bae89b280e7a7cb87889635d9911d6a245e780.1648833388.git.christophe.leroy@csgroup.eu>
From: Andrew Donnellan <ajd@linux.ibm.com>
In-Reply-To: <a2bae89b280e7a7cb87889635d9911d6a245e780.1648833388.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EKurYAJO1W4zDCRPbPte46L-hT8YgAC9
X-Proofpoint-ORIG-GUID: EKurYAJO1W4zDCRPbPte46L-hT8YgAC9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_02,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1011
 bulkscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=970
 suspectscore=0 spamscore=0 impostorscore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204060028
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/4/22 20:52, Christophe Leroy wrote:
> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.
> 
> In order to clean it up, first add missing headers in
> users of asm/prom.h
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Untested because I don't have your actual patch to change prom.h, but 
nothing here looks concerning.

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   drivers/misc/cxl/api.c      | 1 +
>   drivers/misc/cxl/cxl.h      | 2 ++
>   drivers/misc/cxl/cxllib.c   | 1 +
>   drivers/misc/cxl/flash.c    | 1 +
>   drivers/misc/cxl/guest.c    | 2 ++
>   drivers/misc/cxl/irq.c      | 1 +
>   drivers/misc/cxl/main.c     | 1 +
>   drivers/misc/cxl/native.c   | 1 +
>   drivers/misc/ocxl/afu_irq.c | 1 +
>   drivers/misc/ocxl/link.c    | 1 +
>   10 files changed, 12 insertions(+)
> 
> diff --git a/drivers/misc/cxl/api.c b/drivers/misc/cxl/api.c
> index b493de962153..d85c56530863 100644
> --- a/drivers/misc/cxl/api.c
> +++ b/drivers/misc/cxl/api.c
> @@ -12,6 +12,7 @@
>   #include <linux/pseudo_fs.h>
>   #include <linux/sched/mm.h>
>   #include <linux/mmu_context.h>
> +#include <linux/irqdomain.h>
>   
>   #include "cxl.h"
>   
> diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
> index 5dc0f6093f9d..7a6dd91987fd 100644
> --- a/drivers/misc/cxl/cxl.h
> +++ b/drivers/misc/cxl/cxl.h
> @@ -25,6 +25,8 @@
>   
>   extern uint cxl_verbose;
>   
> +struct property;
> +
>   #define CXL_TIMEOUT 5
>   
>   /*
> diff --git a/drivers/misc/cxl/cxllib.c b/drivers/misc/cxl/cxllib.c
> index 53b919856426..e5fe0a171472 100644
> --- a/drivers/misc/cxl/cxllib.c
> +++ b/drivers/misc/cxl/cxllib.c
> @@ -5,6 +5,7 @@
>   
>   #include <linux/hugetlb.h>
>   #include <linux/sched/mm.h>
> +#include <asm/opal-api.h>
>   #include <asm/pnv-pci.h>
>   #include <misc/cxllib.h>
>   
> diff --git a/drivers/misc/cxl/flash.c b/drivers/misc/cxl/flash.c
> index 5b93ff51d82a..eee9decc121e 100644
> --- a/drivers/misc/cxl/flash.c
> +++ b/drivers/misc/cxl/flash.c
> @@ -4,6 +4,7 @@
>   #include <linux/semaphore.h>
>   #include <linux/slab.h>
>   #include <linux/uaccess.h>
> +#include <linux/of.h>
>   #include <asm/rtas.h>
>   
>   #include "cxl.h"
> diff --git a/drivers/misc/cxl/guest.c b/drivers/misc/cxl/guest.c
> index 9d485c9e3fff..3321c014913c 100644
> --- a/drivers/misc/cxl/guest.c
> +++ b/drivers/misc/cxl/guest.c
> @@ -6,6 +6,8 @@
>   #include <linux/spinlock.h>
>   #include <linux/uaccess.h>
>   #include <linux/delay.h>
> +#include <linux/irqdomain.h>
> +#include <linux/platform_device.h>
>   
>   #include "cxl.h"
>   #include "hcalls.h"
> diff --git a/drivers/misc/cxl/irq.c b/drivers/misc/cxl/irq.c
> index 4cb829d5d873..5f0e2dcebb34 100644
> --- a/drivers/misc/cxl/irq.c
> +++ b/drivers/misc/cxl/irq.c
> @@ -4,6 +4,7 @@
>    */
>   
>   #include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
>   #include <linux/workqueue.h>
>   #include <linux/sched.h>
>   #include <linux/wait.h>
> diff --git a/drivers/misc/cxl/main.c b/drivers/misc/cxl/main.c
> index 43b312d06e3e..c1fbf6f588f7 100644
> --- a/drivers/misc/cxl/main.c
> +++ b/drivers/misc/cxl/main.c
> @@ -15,6 +15,7 @@
>   #include <linux/slab.h>
>   #include <linux/idr.h>
>   #include <linux/pci.h>
> +#include <linux/platform_device.h>
>   #include <linux/sched/task.h>
>   
>   #include <asm/cputable.h>
> diff --git a/drivers/misc/cxl/native.c b/drivers/misc/cxl/native.c
> index 1a7f22836041..50b0c44bb8d7 100644
> --- a/drivers/misc/cxl/native.c
> +++ b/drivers/misc/cxl/native.c
> @@ -11,6 +11,7 @@
>   #include <linux/mm.h>
>   #include <linux/uaccess.h>
>   #include <linux/delay.h>
> +#include <linux/irqdomain.h>
>   #include <asm/synch.h>
>   #include <asm/switch_to.h>
>   #include <misc/cxl-base.h>
> diff --git a/drivers/misc/ocxl/afu_irq.c b/drivers/misc/ocxl/afu_irq.c
> index ecdcfae025b7..a06920b7e049 100644
> --- a/drivers/misc/ocxl/afu_irq.c
> +++ b/drivers/misc/ocxl/afu_irq.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0+
>   // Copyright 2017 IBM Corp.
>   #include <linux/interrupt.h>
> +#include <linux/irqdomain.h>
>   #include <asm/pnv-ocxl.h>
>   #include <asm/xive.h>
>   #include "ocxl_internal.h"
> diff --git a/drivers/misc/ocxl/link.c b/drivers/misc/ocxl/link.c
> index 9670d02c927f..4cf4c55a5f00 100644
> --- a/drivers/misc/ocxl/link.c
> +++ b/drivers/misc/ocxl/link.c
> @@ -6,6 +6,7 @@
>   #include <linux/mm_types.h>
>   #include <linux/mmu_context.h>
>   #include <linux/mmu_notifier.h>
> +#include <linux/irqdomain.h>
>   #include <asm/copro.h>
>   #include <asm/pnv-ocxl.h>
>   #include <asm/xive.h>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
