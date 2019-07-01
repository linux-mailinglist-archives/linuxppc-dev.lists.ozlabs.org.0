Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF73E5B2B4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 03:23:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cV4n56sjzDqTb
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 11:23:37 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cV3H3Q8CzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 11:22:17 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x611Ljhi003890
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 21:22:13 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2texjwq0fb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 21:22:13 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ajd@linux.ibm.com>;
 Mon, 1 Jul 2019 02:22:11 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 02:22:08 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x611M7fK56492262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 01:22:07 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C580B4203F;
 Mon,  1 Jul 2019 01:22:07 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7190D42049;
 Mon,  1 Jul 2019 01:22:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 01:22:07 +0000 (GMT)
Received: from [10.61.2.125] (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2FDB1A0194;
 Mon,  1 Jul 2019 11:22:06 +1000 (AEST)
Subject: Re: [PATCH 22/39] docs: ocxl.rst: add it to the uAPI book
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>
References: <cover.1561724493.git.mchehab+samsung@kernel.org>
 <ee63ec4412f2f8c87da877f67f693f2cd85c1a37.1561724493.git.mchehab+samsung@kernel.org>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Mon, 1 Jul 2019 11:21:58 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <ee63ec4412f2f8c87da877f67f693f2cd85c1a37.1561724493.git.mchehab+samsung@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-AU
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070101-0028-0000-0000-0000037F25DE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070101-0029-0000-0000-0000243F590A
Message-Id: <7ac03678-3395-cdcf-6401-7856da4287c7@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-30_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010016
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>, Jonathan Corbet <corbet@lwn.net>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28/6/19 10:30 pm, Mauro Carvalho Chehab wrote:
> The content of this file is user-faced.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>   Documentation/{ => userspace-api}/accelerators/ocxl.rst | 2 --
>   Documentation/userspace-api/index.rst                   | 1 +
>   MAINTAINERS                                             | 2 +-
>   3 files changed, 2 insertions(+), 3 deletions(-)
>   rename Documentation/{ => userspace-api}/accelerators/ocxl.rst (99%)
> 
> diff --git a/Documentation/accelerators/ocxl.rst b/Documentation/userspace-api/accelerators/ocxl.rst
> similarity index 99%
> rename from Documentation/accelerators/ocxl.rst
> rename to Documentation/userspace-api/accelerators/ocxl.rst
> index b1cea19a90f5..14cefc020e2d 100644
> --- a/Documentation/accelerators/ocxl.rst
> +++ b/Documentation/userspace-api/accelerators/ocxl.rst
> @@ -1,5 +1,3 @@
> -:orphan:
> -
>   ========================================================
>   OpenCAPI (Open Coherent Accelerator Processor Interface)
>   ========================================================
> diff --git a/Documentation/userspace-api/index.rst b/Documentation/userspace-api/index.rst
> index a3233da7fa88..ad494da40009 100644
> --- a/Documentation/userspace-api/index.rst
> +++ b/Documentation/userspace-api/index.rst
> @@ -20,6 +20,7 @@ place where this information is gathered.
>      seccomp_filter
>      unshare
>      spec_ctrl
> +   accelerators/ocxl
>   
>   .. only::  subproject and html
>   
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 29d1498ad39d..f723371dccd0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11483,7 +11483,7 @@ F:	arch/powerpc/include/asm/pnv-ocxl.h
>   F:	drivers/misc/ocxl/
>   F:	include/misc/ocxl*
>   F:	include/uapi/misc/ocxl.h
> -F:	Documentation/accelerators/ocxl.rst
> +F:	Documentation/userspace-api/accelerators/ocxl.rst
>   
>   OMAP AUDIO SUPPORT
>   M:	Peter Ujfalusi <peter.ujfalusi@ti.com>
> 

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

