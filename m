Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06764135BDF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 15:56:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tq261Hd1zDqVk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2020 01:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tq0C6JhHzDqJC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2020 01:54:50 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 009Eq0uj091498
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 9 Jan 2020 09:54:48 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xdx6k1wbh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2020 09:54:48 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <fbarrat@linux.ibm.com>;
 Thu, 9 Jan 2020 14:54:45 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 9 Jan 2020 14:54:38 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 009EsaDt56557640
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jan 2020 14:54:36 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B693BA4055;
 Thu,  9 Jan 2020 14:54:36 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99DAAA404D;
 Thu,  9 Jan 2020 14:54:35 +0000 (GMT)
Received: from bali.tlslab.ibm.com (unknown [9.101.4.17])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jan 2020 14:54:35 +0000 (GMT)
Subject: Re: [PATCH v2 09/27] ocxl: Free detached contexts in
 ocxl_context_detach_all()
To: "Alastair D'Silva" <alastair@au1.ibm.com>, alastair@d-silva.org
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203034655.51561-10-alastair@au1.ibm.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Date: Thu, 9 Jan 2020 15:54:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191203034655.51561-10-alastair@au1.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20010914-0012-0000-0000-0000037BF30D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010914-0013-0000-0000-000021B814C0
Message-Id: <4c9da9a0-55f4-6cf4-53b8-e8a69744bf98@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-09_02:2020-01-09,
 2020-01-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 suspectscore=2 spamscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-2001090130
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/12/2019 à 04:46, Alastair D'Silva a écrit :
> From: Alastair D'Silva <alastair@d-silva.org>
> 
> ocxl_context_detach_all() is called from ocxl_function_close(), so
> there is no reason to leave the contexts allocated, as the caller
> can do nothing useful with them at that point.
> 
> This also has the side-effect of freeing any allocated IRQs
> within the context.
> 
> Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
> ---


I think this is wrong and probably unneeded. In ocxl (and I would assume 
most drivers), we separate pretty clearly what is setup by the driver 
framework when a device is probed, and what is allocated by the users 
(userland or scm). Contexts are allocated by the users. So they should 
be freed by them only. That separation is also why we have some 
reference counting on the afu and function structs, to make sure the 
core data remains valid for as long as required.
Though it's a bit asking for troubles, it can be seen when unbinding a 
function from the driver through sysfs. That will end up calling 
ocxl_function_close() and therefore ocxl_context_detach_all(). However 
it's possible for a user process to still have a file descriptor opened. 
The context is detached and marked as CLOSED, so any interaction with it 
from the user will fail, but it should still be allocated so that it is 
valid if the user process makes a system call to the driver. The context 
will be freed when the file descriptor is closed.
I don't think this is needed for scm either, since you've now added the 
context detach and free call in free_scm()
I would just drop this patch.

   Fred



>   drivers/misc/ocxl/context.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/context.c b/drivers/misc/ocxl/context.c
> index 994563a078eb..6cb36ef96e09 100644
> --- a/drivers/misc/ocxl/context.c
> +++ b/drivers/misc/ocxl/context.c
> @@ -259,10 +259,11 @@ void ocxl_context_detach_all(struct ocxl_afu *afu)
>   {
>   	struct ocxl_context *ctx;
>   	int tmp;
> +	int rc;
>   
>   	mutex_lock(&afu->contexts_lock);
>   	idr_for_each_entry(&afu->contexts_idr, ctx, tmp) {
> -		ocxl_context_detach(ctx);
> +		rc = ocxl_context_detach(ctx);
>   		/*
>   		 * We are force detaching - remove any active mmio
>   		 * mappings so userspace cannot interfere with the
> @@ -274,6 +275,9 @@ void ocxl_context_detach_all(struct ocxl_afu *afu)
>   		if (ctx->mapping)
>   			unmap_mapping_range(ctx->mapping, 0, 0, 1);
>   		mutex_unlock(&ctx->mapping_lock);
> +
> +		if (rc != -EBUSY)
> +			ocxl_context_free(ctx);
>   	}
>   	mutex_unlock(&afu->contexts_lock);
>   }
> 

