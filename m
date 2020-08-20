Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BC924C6A8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Aug 2020 22:12:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXbRb3jfnzDr1Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 06:12:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UFfqtOF6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXbPn32Q6zDr1G
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 06:11:08 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07KK32Yu122206; Thu, 20 Aug 2020 16:11:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=cVoDFYzsAn9Yvl7u3jwt3IJi9GsqDM58RuWWBolbcOI=;
 b=UFfqtOF6i1BqjEzofUMiXncuDJAnAy8yL5/OXaBL/k3xymC1T3N7fRVOtNYgsbw+oVK7
 +Qve7L2ChBtqhSM/T/zW8RDxWYBgwaRJdwHJqyhsM8UBkGyJPIlFApv4ovQNBx4hBEgU
 Bx+IyhMLsT0LerNcSvJBsBt46oNkyGJMcgUsT/ljnrA2doer6Gwu/qi/D0ixdVMWwMN9
 cfcPHz38+BfL9YIbJ/k4SGHY4RbL3fpIrUdkM1+tdZH3gG+IdbrXdA28c0C9kJHEmRBX
 l7QsNNGsGHMF2kGsEHANM5gElOctn7a7796yb2v527OI25mqny4WQEqPDeWp5E1OiSKQ oA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 331w97vmje-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 16:11:02 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07KK9aSv024701;
 Thu, 20 Aug 2020 20:11:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3304cd4m2j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Aug 2020 20:11:01 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07KKAtUK5636798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Aug 2020 20:10:55 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3846C6055;
 Thu, 20 Aug 2020 20:10:59 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8CF0C6059;
 Thu, 20 Aug 2020 20:10:59 +0000 (GMT)
Received: from localhost (unknown [9.65.248.251])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 20 Aug 2020 20:10:59 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/4] powerpc/drmem: Make lmb_size 64 bit
In-Reply-To: <20200806162329.276534-1-aneesh.kumar@linux.ibm.com>
References: <20200806162329.276534-1-aneesh.kumar@linux.ibm.com>
Date: Thu, 20 Aug 2020 15:10:59 -0500
Message-ID: <87sgchxelo.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-20_06:2020-08-19,
 2020-08-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=1 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008200160
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
Cc: linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> Similar to commit 89c140bbaeee ("pseries: Fix 64 bit logical memory block panic")
> make sure different variables tracking lmb_size are updated to be 64 bit.
>
> This was found by code audit.
>
> Cc: stable@vger.kernel.org
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/drmem.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index 17ccc6474ab6..d719cbac34b2 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -21,7 +21,7 @@ struct drmem_lmb {
>  struct drmem_lmb_info {
>  	struct drmem_lmb        *lmbs;
>  	int                     n_lmbs;
> -	u32                     lmb_size;
> +	u64                     lmb_size;
>  };
>  
>  extern struct drmem_lmb_info *drmem_info;
> @@ -67,7 +67,7 @@ struct of_drconf_cell_v2 {
>  #define DRCONF_MEM_RESERVED	0x00000080
>  #define DRCONF_MEM_HOTREMOVABLE	0x00000100
>  
> -static inline u32 drmem_lmb_size(void)
> +static inline u64 drmem_lmb_size(void)
>  {
>  	return drmem_info->lmb_size;
>  }

Looks fine.
Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
