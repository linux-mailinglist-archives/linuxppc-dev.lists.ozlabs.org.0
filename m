Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A768A2E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 18:05:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466gfy2YdkzDqcl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 02:05:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466gZX5fyyzDqSS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 02:01:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 466gZW5zrbz8tVW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 02:01:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 466gZW4yTWz9sNp; Tue, 13 Aug 2019 02:01:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 466gZV61XTz9sN6
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 02:01:38 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7CFueDB069629
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 12:01:35 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ub9q85a51-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 12 Aug 2019 12:01:35 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Mon, 12 Aug 2019 17:01:33 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 12 Aug 2019 17:01:30 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7CG1TxF49152208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Aug 2019 16:01:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 072C311C04C;
 Mon, 12 Aug 2019 16:01:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B73A11C04A;
 Mon, 12 Aug 2019 16:01:27 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.74.69])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 12 Aug 2019 16:01:27 +0000 (GMT)
Date: Mon, 12 Aug 2019 21:31:24 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 06/25] pseries/fadump: define register/un-register
 callback functions
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327675811.27462.1334913873575448846.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327675811.27462.1334913873575448846.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081216-4275-0000-0000-0000035845DD
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081216-4276-0000-0000-0000386A52AE
Message-Id: <20190812160124.jm47eu5pdhkzj2iz@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908120177
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
Reply-To: mahesh@linux.vnet.ibm.com
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver <oohall@gmail.com>, Vasant Hegde <hegdevasant@linux.ibm.com>,
 Stewart Smith <stewart@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-07-16 17:02:38 Tue, Hari Bathini wrote:
> Make RTAS calls to register and un-register for FADump. Also, update
> how fadump_region contents are diplayed to provide more information.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump-common.h          |    2 
>  arch/powerpc/kernel/fadump.c                 |  164 ++------------------------
>  arch/powerpc/platforms/pseries/rtas-fadump.c |  163 +++++++++++++++++++++++++-
>  3 files changed, 176 insertions(+), 153 deletions(-)
> 
[...]
>  static int rtas_fadump_register_fadump(struct fw_dump *fadump_conf)
>  {
> -	return -EIO;
> +	int rc, err = -EIO;
> +	unsigned int wait_time;
> +
> +	/* TODO: Add upper time limit for the delay */
> +	do {
> +		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
> +				NULL, FADUMP_REGISTER, &fdm,
> +				sizeof(struct rtas_fadump_mem_struct));
> +
> +		wait_time = rtas_busy_delay_time(rc);
> +		if (wait_time)
> +			mdelay(wait_time);
> +
> +	} while (wait_time);
> +
> +	switch (rc) {
> +	case 0:
> +		pr_info("Registration is successful!\n");
> +		fadump_conf->dump_registered = 1;
> +		err = 0;
> +		break;
> +	case -1:
> +		pr_err("Failed to register. Hardware Error(%d).\n", rc);
> +		break;
> +	case -3:
> +		if (!is_fadump_boot_mem_contiguous(fadump_conf))
> +			pr_err("Can't hot-remove boot memory area.\n");
> +		else if (!is_fadump_reserved_mem_contiguous(fadump_conf))
> +			pr_err("Can't hot-remove reserved memory area.\n");

Any reason why we changed the error messages here ? it gives an impression as
if fadump reservation tried to hot remove memory and failed.

Rest looks fine to me..

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>

Thanks,
-Mahesh.

