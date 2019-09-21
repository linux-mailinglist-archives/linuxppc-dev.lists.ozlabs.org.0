Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 415A7B9FEC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2019 01:06:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46bR6m5Kf8zDqVD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2019 09:06:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46bR4v1s1yzDqDm
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Sep 2019 09:05:18 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8LN2kmR130470
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 19:05:14 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v5g0wnryj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Sep 2019 19:05:14 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Sun, 22 Sep 2019 00:05:11 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 22 Sep 2019 00:05:08 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8LN57N552625546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 21 Sep 2019 23:05:07 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10C625204F;
 Sat, 21 Sep 2019 23:05:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id B5A0152063;
 Sat, 21 Sep 2019 23:05:06 +0000 (GMT)
Received: from [9.102.46.143] (unknown [9.102.46.143])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DE1E4A00E7;
 Sun, 22 Sep 2019 09:04:56 +1000 (AEST)
Subject: Re: [PATCH] ocxl: Use the correct style for SPDX License Identifier
To: Nishad Kamdar <nishadkamdar@gmail.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Steven Royer <seroyer@linux.ibm.com>, Joe Perches <joe@perches.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <20190920161826.GA6894@nishad>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Sun, 22 Sep 2019 01:04:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920161826.GA6894@nishad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19092123-0020-0000-0000-000003700735
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19092123-0021-0000-0000-000021C5BD99
Message-Id: <e9b811b5-9def-1ad4-8958-591383b0bc96@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-21_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909210256
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

On 20/9/19 6:18 pm, Nishad Kamdar wrote:
> This patch corrects the SPDX License Identifier style
> in header files for Open Coherent Accelerator (OCXL) compatible device
> drivers. For C header files Documentation/process/license-rules.rst
> mandates C-like comments (opposed to C source files where
> C++ style should be used)
> 
> Changes made by using a script provided by Joe Perches here:
> https://lkml.org/lkml/2019/2/7/46.
> 
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Nishad Kamdar <nishadkamdar@gmail.com>

Thanks.

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   drivers/misc/ocxl/ocxl_internal.h | 2 +-
>   drivers/misc/ocxl/trace.h         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/ocxl_internal.h b/drivers/misc/ocxl/ocxl_internal.h
> index 97415afd79f3..345bf843a38e 100644
> --- a/drivers/misc/ocxl/ocxl_internal.h
> +++ b/drivers/misc/ocxl/ocxl_internal.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: GPL-2.0+ */
>   // Copyright 2017 IBM Corp.
>   #ifndef _OCXL_INTERNAL_H_
>   #define _OCXL_INTERNAL_H_
> diff --git a/drivers/misc/ocxl/trace.h b/drivers/misc/ocxl/trace.h
> index 024f417e7e01..17e21cb2addd 100644
> --- a/drivers/misc/ocxl/trace.h
> +++ b/drivers/misc/ocxl/trace.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0+
> +/* SPDX-License-Identifier: GPL-2.0+ */
>   // Copyright 2017 IBM Corp.
>   #undef TRACE_SYSTEM
>   #define TRACE_SYSTEM ocxl
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

