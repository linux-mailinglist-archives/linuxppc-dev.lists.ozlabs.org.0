Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8002D221990
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 03:39:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6cPd33LRzDqsH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 11:39:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6cMw6DN4zDq9b
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 11:38:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B6cMw2yMrz8tNy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 11:38:20 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B6cMw2T1Cz9sT6; Thu, 16 Jul 2020 11:38:20 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B6cMv6Wh5z9sSt
 for <linuxppc-dev@ozlabs.org>; Thu, 16 Jul 2020 11:38:19 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G1WGFN145846; Wed, 15 Jul 2020 21:38:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32792wr5tt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 21:38:11 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G1X3K5151252;
 Wed, 15 Jul 2020 21:38:10 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32792wr5th-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Jul 2020 21:38:10 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G1a79C027895;
 Thu, 16 Jul 2020 01:38:09 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02dal.us.ibm.com with ESMTP id 327529ped3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 01:38:09 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G1c5rb58720706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 01:38:05 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 813F27805F;
 Thu, 16 Jul 2020 01:38:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E89847805C;
 Thu, 16 Jul 2020 01:38:03 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.163.73.114])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Thu, 16 Jul 2020 01:38:03 +0000 (GMT)
References: <159466074408.24747.10036072269371204890.stgit@hbathini.in.ibm.com>
 <159466096898.24747.16701009925943468066.stgit@hbathini.in.ibm.com>
User-agent: mu4e 1.2.0; emacs 26.3
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v3 09/12] ppc64/kexec_file: setup backup region for kdump
 kernel
In-reply-to: <159466096898.24747.16701009925943468066.stgit@hbathini.in.ibm.com>
Date: Wed, 15 Jul 2020 22:38:01 -0300
Message-ID: <87y2nk8cjq.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160005
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
Cc: kernel test robot <lkp@intel.com>, Pingfan Liu <piliu@redhat.com>,
 Nayna Jain <nayna@linux.ibm.com>, Kexec-ml <kexec@lists.infradead.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Sourabh Jain <sourabhjain@linux.ibm.com>, Petr Tesarik <ptesarik@suse.cz>,
 Andrew Morton <akpm@linux-foundation.org>, Dave Young <dyoung@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Eric Biederman <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hari Bathini <hbathini@linux.ibm.com> writes:

> @@ -968,7 +1040,7 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>
>  	/*
>  	 * Restrict memory usage for kdump kernel by setting up
> -	 * usable memory ranges.
> +	 * usable memory ranges and memory reserve map.
>  	 */
>  	if (image->type == KEXEC_TYPE_CRASH) {
>  		ret = get_usable_memory_ranges(&umem);
> @@ -980,6 +1052,24 @@ int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>  			pr_err("Error setting up usable-memory property for kdump kernel\n");
>  			goto out;
>  		}
> +
> +		ret = fdt_add_mem_rsv(fdt, BACKUP_SRC_START + BACKUP_SRC_SIZE,
> +				      crashk_res.start - BACKUP_SRC_SIZE);

I believe this answers my question from the other email about how the
crashkernel is prevented from stomping in the crashed kernel's memory,
right? I needed to think for a bit to understand what the above
reservation was protecting. I think it's worth adding a comment.

> +		if (ret) {
> +			pr_err("Error reserving crash memory: %s\n",
> +			       fdt_strerror(ret));
> +			goto out;
> +		}
> +	}
> +
> +	if (image->arch.backup_start) {
> +		ret = fdt_add_mem_rsv(fdt, image->arch.backup_start,
> +				      BACKUP_SRC_SIZE);
> +		if (ret) {
> +			pr_err("Error reserving memory for backup: %s\n",
> +			       fdt_strerror(ret));
> +			goto out;
> +		}
>  	}

This is only true for KEXEC_TYPE_CRASH, if I'm following the code
correctly. I think it would be clearer to put the if above inside the if
for KEXEC_TYPE_CRASH to make it clearer.

>
>  	ret = setup_new_fdt(image, fdt, initrd_load_addr, initrd_len,

<snip>

> diff --git a/arch/powerpc/purgatory/purgatory_64.c b/arch/powerpc/purgatory/purgatory_64.c
> new file mode 100644
> index 0000000..1eca74c
> --- /dev/null
> +++ b/arch/powerpc/purgatory/purgatory_64.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * purgatory: Runs between two kernels
> + *
> + * Copyright 2020, Hari Bathini, IBM Corporation.
> + */
> +
> +#include <asm/purgatory.h>
> +#include <asm/crashdump-ppc64.h>
> +
> +extern unsigned long backup_start;
> +
> +static void *__memcpy(void *dest, const void *src, unsigned long n)
> +{
> +	unsigned long i;
> +	unsigned char *d;
> +	const unsigned char *s;
> +
> +	d = dest;
> +	s = src;
> +	for (i = 0; i < n; i++)
> +		d[i] = s[i];
> +
> +	return dest;
> +}
> +
> +void purgatory(void)
> +{
> +	void *dest, *src;
> +
> +	src = (void *)BACKUP_SRC_START;
> +	if (backup_start) {
> +		dest = (void *)backup_start;
> +		__memcpy(dest, src, BACKUP_SRC_SIZE);
> +	}
> +}

In general I'm in favor of using C code over assembly, but having to
bring in that relocation support just for the above makes me wonder if
it's worth it in this case.

--
Thiago Jung Bauermann
IBM Linux Technology Center
