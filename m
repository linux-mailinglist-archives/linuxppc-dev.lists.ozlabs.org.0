Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A11D91B3793
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 08:37:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496W1t0pcczDqyn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 16:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496W043vQJzDqd9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 16:35:32 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03M6WWvR069795; Wed, 22 Apr 2020 02:35:24 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30ghmd27tq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 02:35:24 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03M6V61Y005021;
 Wed, 22 Apr 2020 06:35:23 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03dal.us.ibm.com with ESMTP id 30fs66xxha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Apr 2020 06:35:23 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03M6ZMnB61342080
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Apr 2020 06:35:22 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73835BE05D;
 Wed, 22 Apr 2020 06:35:22 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58240BE051;
 Wed, 22 Apr 2020 06:35:21 +0000 (GMT)
Received: from Harens-MacBook-Pro.local (unknown [9.160.75.2])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Wed, 22 Apr 2020 06:35:21 +0000 (GMT)
Subject: Re: linux-next: build failure after merge of the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20200422154129.11f988fd@canb.auug.org.au>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <d88c34d2-9b35-b4f9-be35-754830057b1d@linux.ibm.com>
Date: Tue, 21 Apr 2020 23:35:19 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200422154129.11f988fd@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_10:2020-04-21,
 2020-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004220050
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen, Sorry missed it. Thanks for fixing it.

Acked-by: Haren Myneni <haren@linux.ibm.com>

On 4/21/20 10:41 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the powerpc tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> In file included from <command-line>:32:
> ./usr/include/asm/vas-api.h:15:2: error: unknown type name '__u32'
>    15 |  __u32 version;
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:16:2: error: unknown type name '__s16'
>    16 |  __s16 vas_id; /* specific instance of vas or -1 for default */
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:17:2: error: unknown type name '__u16'
>    17 |  __u16 reserved1;
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:18:2: error: unknown type name '__u64'
>    18 |  __u64 flags; /* Future use */
>       |  ^~~~~
> ./usr/include/asm/vas-api.h:19:2: error: unknown type name '__u64'
>    19 |  __u64 reserved2[6];
>       |  ^~~~~
> 
> Caused by commit
> 
>   45f25a79fe50 ("powerpc/vas: Define VAS_TX_WIN_OPEN ioctl API")
> 
> uapi headers should be self contained.  I have added the following patch
> for today:
> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 22 Apr 2020 15:28:26 +1000
> Subject: [PATCH] powerpc/vas: uapi headers should be self contained
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>> ---
>  arch/powerpc/include/uapi/asm/vas-api.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/include/uapi/asm/vas-api.h b/arch/powerpc/include/uapi/asm/vas-api.h
> index fe95d67e3bab..ebd4b2424785 100644
> --- a/arch/powerpc/include/uapi/asm/vas-api.h
> +++ b/arch/powerpc/include/uapi/asm/vas-api.h
> @@ -6,6 +6,8 @@
>  #ifndef _UAPI_MISC_VAS_H
>  #define _UAPI_MISC_VAS_H
>  
> +#include <linux/types.h>
> +
>  #include <asm/ioctl.h>
>  
>  #define VAS_MAGIC	'v'
> 
