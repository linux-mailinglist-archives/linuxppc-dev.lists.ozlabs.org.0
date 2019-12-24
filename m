Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470912A32A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2019 17:24:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47j1lC69F1zDqCY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 03:24:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47j1jK4xgdzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2019 03:23:01 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBOGGvUH061246
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 11:22:58 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2x21wcke7y-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2019 11:22:58 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Tue, 24 Dec 2019 16:22:56 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 24 Dec 2019 16:22:53 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBOGMqP353805150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Dec 2019 16:22:52 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4F6911C050;
 Tue, 24 Dec 2019 16:22:52 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7232111C058;
 Tue, 24 Dec 2019 16:22:51 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 24 Dec 2019 16:22:51 +0000 (GMT)
Date: Tue, 24 Dec 2019 21:52:50 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH] powerpc/shared: include correct header for static key
References: <xagsmtp2.20191223133223.8837@vmsdvm3.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <xagsmtp2.20191223133223.8837@vmsdvm3.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19122416-0016-0000-0000-000002D7DCCF
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19122416-0017-0000-0000-0000333A328F
Message-Id: <20191224162250.GA1781@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-24_04:2019-12-24,2019-12-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912240142
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: longman@redhat.com, pauld@redhat.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Jason A. Donenfeld <Jason@zx2c4.com> [2019-12-23 14:31:47]:

> Recently, the spinlock implementation grew a static key optimization,
> but the jump_label.h header include was left out, leading to build
> errors:
> 
> linux/arch/powerpc/include/asm/spinlock.h:44:7: error: implicit declaration of function ???static_branch_unlikely??? [-Werror=implicit-function-declaration]
>    44 |  if (!static_branch_unlikely(&shared_processor))
> 
> This commit adds the missing header.

Right, This was in v4 version of the patchset
(http://lkml.kernel.org/r/20191212085344.17357-1-srikar@linux.vnet.ibm.com)
but we missed it in the final v5 version.

Thanks for noticing and fixing it.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

> 
> Fixes: 656c21d6af5d ("powerpc/shared: Use static key to detect shared processor")
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/powerpc/include/asm/spinlock.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index 1b55fc08f853..860228e917dc 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -15,6 +15,7 @@
>   *
>   * (the type definitions are in asm/spinlock_types.h)
>   */
> +#include <linux/jump_label.h>
>  #include <linux/irqflags.h>
>  #ifdef CONFIG_PPC64
>  #include <asm/paca.h>
> -- 
> 2.24.1
> 

-- 
Thanks and Regards
Srikar Dronamraju

