Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BC4195087
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 06:26:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pVh96FqSzDr6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 16:26:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pVfL1LLQzDr3t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 16:24:41 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02R54OHB120666
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 01:24:39 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3017jtw89v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 01:24:39 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.ibm.com>;
 Fri, 27 Mar 2020 05:24:30 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 27 Mar 2020 05:24:28 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02R5OXvJ40108290
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 05:24:33 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9EEBA4204B;
 Fri, 27 Mar 2020 05:24:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCE5842049;
 Fri, 27 Mar 2020 05:24:32 +0000 (GMT)
Received: from in.ibm.com (unknown [9.79.178.41])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 27 Mar 2020 05:24:32 +0000 (GMT)
Date: Fri, 27 Mar 2020 10:54:30 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 08/12] powerpc/pseries: limit machine check stack to 4GB
References: <20200325103410.157573-1-npiggin@gmail.com>
 <20200325103410.157573-9-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325103410.157573-9-npiggin@gmail.com>
X-TM-AS-GCONF: 00
x-cbid: 20032705-4275-0000-0000-000003B42CCE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032705-4276-0000-0000-000038C972EB
Message-Id: <20200327052430.r3id43ptr6ffwtoq@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-26_14:2020-03-26,
 2020-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 mlxscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270040
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
Reply-To: mahesh@linux.ibm.com
Cc: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-25 20:34:06 Wed, Nicholas Piggin wrote:
> This allows rtas_args to be put on the machine check stack, which
> avoids a lot of complications with re-entrancy deadlocks.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/setup_64.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index 3bf03666ee09..ca1041f8a578 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -695,6 +695,9 @@ void __init exc_lvl_early_init(void)
>  void __init emergency_stack_init(void)
>  {
>  	u64 limit;
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	u64 mce_limit;
> +#endif
>  	unsigned int i;
> 
>  	/*
> @@ -713,6 +716,16 @@ void __init emergency_stack_init(void)
>  	 */
>  	limit = min(ppc64_bolted_size(), ppc64_rma_size);
> 
> +	/*
> +	 * Machine check on pseries calls rtas, but can't use the static
> +	 * rtas_args due to a machine check hitting while the lock is held.
> +	 * rtas args have to be under 4GB, so the machine check stack is
> +	 * limited to 4GB so args can be put on stack.
> +	 */
> +	mce_limit = limit;
> +	if (firmware_has_feature(FW_FEATURE_LPAR) && mce_limit > 4UL*1024*1024*1024)
> +		mce_limit = 4UL*1024*1024*1024;
> +

Don't you need this as well under CONFIG_PPC_BOOK3S_64 #ifdef ??

Rest looks good.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

