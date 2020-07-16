Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33276221A07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 04:30:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6dXX20FFzDqcW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 12:30:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6dT23XPvzDqf0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 12:27:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6dT04112z8tFw
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 12:27:48 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6dT023VRz9sT6; Thu, 16 Jul 2020 12:27:48 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bauerman@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B6dSz4jfYz9sRN
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 12:27:47 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G21fjI038567; Wed, 15 Jul 2020 22:27:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329uej2pfb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 22:27:41 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G22SBt045227;
 Wed, 15 Jul 2020 22:27:40 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 329uej2pf3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 22:27:40 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G2PgDn011514;
 Thu, 16 Jul 2020 02:27:39 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 327529ppqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:27:39 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G2RcCj56033684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 02:27:39 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1D8F112062;
 Thu, 16 Jul 2020 02:27:38 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CCF5112061;
 Thu, 16 Jul 2020 02:27:34 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.73.114])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 02:27:34 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466100206.24747.3782313430191321863.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 11/12] ppc64/kexec_file: add appropriate regions for
 memory reserve map
In-reply-to: <159466100206.24747.3782313430191321863.stgit@hbathini.in.ibm.com>
Date: Wed, 15 Jul 2020 23:27:30 -0300
Message-ID: <87sgds8a99.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 clxscore=1015 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160009
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
Cc: Pingfan Liu <piliu@redhat.com>, Nayna Jain <nayna@linux.ibm.com>,
 Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

> While initrd, elfcorehdr and backup regions are already added to the
> reserve map, there are a few missing regions that need to be added to
> the memory reserve map. Add them here. And now that all the changes
> to load panic kernel are in place, claim likewise.
>
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> Tested-by: Pingfan Liu <piliu@redhat.com>

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>

Just one oinor nit below.

> ---
>
> v2 -> v3:
> * Unchanged. Added Tested-by tag from Pingfan.
>
> v1 -> v2:
> * Updated add_rtas_mem_range() & add_opal_mem_range() callsites based on
>   the new prototype for these functions.
>
>
>  arch/powerpc/kexec/file_load_64.c |   58 ++++++++++++++++++++++++++++++++++---
>  1 file changed, 53 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index 2531bb5..29e5d11 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -193,6 +193,34 @@ static int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>  }
>  
>  /**
> + * get_reserved_memory_ranges - Get reserve memory ranges. This list includes
> + *                              memory regions that should be added to the
> + *                              memory reserve map to ensure the region is
> + *                              protected from any mischeif.

s/mischeif/mischief/

> + * @mem_ranges:                 Range list to add the memory ranges to.
> + *
> + * Returns 0 on success, negative errno on error.
> + */
> +static int get_reserved_memory_ranges(struct crash_mem **mem_ranges)
> +{
> +	int ret;
> +
> +	ret = add_rtas_mem_range(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_tce_mem_ranges(mem_ranges);
> +	if (ret)
> +		goto out;
> +
> +	ret = add_reserved_ranges(mem_ranges);
> +out:
> +	if (ret)
> +		pr_err("Failed to setup reserved memory ranges\n");
> +	return ret;
> +}

-- 
Thiago Jung Bauermann
IBM Linux Technology Center
