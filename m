Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5BA8FA44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 07:15:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468s316ZxxzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 15:15:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468rkv5hXXzDqMh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 15:01:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 468rkt34wDz8tRv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 15:01:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 468rkt1nlbz9sNp; Fri, 16 Aug 2019 15:01:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 468rks2mNTz9sML
 for <linuxppc-dev@ozlabs.org>; Fri, 16 Aug 2019 15:01:25 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G4vM4d015136
 for <linuxppc-dev@ozlabs.org>; Fri, 16 Aug 2019 01:01:23 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2udngbrv0q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 16 Aug 2019 01:01:22 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Fri, 16 Aug 2019 06:01:20 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 06:01:19 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G51H3N45744220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 05:01:17 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99BF24C052;
 Fri, 16 Aug 2019 05:01:17 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0AE64C059;
 Fri, 16 Aug 2019 05:01:14 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.198.234])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Aug 2019 05:01:14 +0000 (GMT)
Date: Fri, 16 Aug 2019 10:31:11 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 19/25] powernv/fadump: add support to preserve crash
 data on FADUMP disabled kernel
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327685595.27462.18212106248170156950.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327685595.27462.18212106248170156950.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081605-0028-0000-0000-00000390417E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081605-0029-0000-0000-000024525A03
Message-Id: <20190816050111.b5ll5i7io2mkyurt@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160053
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

On 2019-07-16 17:04:16 Tue, Hari Bathini wrote:
> Add a new kernel config option, CONFIG_PRESERVE_FA_DUMP that ensures
> that crash data, from previously crash'ed kernel, is preserved. This
> helps in cases where FADump is not enabled but the subsequent memory
> preserving kernel boot is likely to process this crash data. One
> typical usecase for this config option is petitboot kernel.
> 
> As OPAL allows registering address with it in the first kernel and
> retrieving it after MPIPL, use it to store the top of boot memory.
> A kernel that intends to preserve crash data retrieves it and avoids
> using memory beyond this address.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig                         |    9 ++
>  arch/powerpc/include/asm/fadump.h            |    9 +-
>  arch/powerpc/kernel/Makefile                 |    6 +
>  arch/powerpc/kernel/fadump-common.h          |   13 ++-
>  arch/powerpc/kernel/fadump.c                 |  128 ++++++++++++++++----------
>  arch/powerpc/kernel/prom.c                   |    4 -
>  arch/powerpc/platforms/powernv/Makefile      |    1 
>  arch/powerpc/platforms/powernv/opal-fadump.c |   59 ++++++++++++
>  arch/powerpc/platforms/powernv/opal-fadump.h |    3 +
>  9 files changed, 176 insertions(+), 56 deletions(-)
> 
[...]
>  #include "../../kernel/fadump-common.h"
>  #include "opal-fadump.h"
>  
> +
> +#ifdef CONFIG_PRESERVE_FA_DUMP
> +/*
> + * When dump is active but PRESERVE_FA_DUMP is enabled on the kernel,
> + * ensure crash data is preserved in hope that the subsequent memory
> + * preserving kernel boot is going to process this crash data.
> + */
> +int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
> +{
> +	unsigned long dn;
> +	const __be32 *prop;
> +
> +	dn = of_get_flat_dt_subnode_by_name(node, "dump");
> +	if (dn == -FDT_ERR_NOTFOUND)
> +		return 1;
> +
> +	/*
> +	 * Check if dump has been initiated on last reboot.
> +	 */
> +	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
> +	if (prop) {
> +		u64 addr = 0;
> +		s64 ret;
> +
> +		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_BOOT_MEM, &addr);
> +		if ((ret != OPAL_SUCCESS) || !addr) {
> +			pr_err("Failed to get boot memory tag (%lld)\n", ret);
> +			return 1;
> +		}
> +
> +		/*
> +		 * Anything below this address can be used for booting a
> +		 * capture kernel or petitboot kernel. Preserve everything
> +		 * above this address for processing crashdump.
> +		 */
> +		fadump_conf->boot_mem_top = be64_to_cpu(addr);
> +		pr_debug("Preserve everything above %lx\n",
> +			 fadump_conf->boot_mem_top);
> +
> +		pr_info("Firmware-assisted dump is active.\n");
> +		fadump_conf->dump_active = 1;
> +	}
> +
> +	return 1;
> +}
> +
> +#else /* CONFIG_PRESERVE_FA_DUMP */
>  static const struct opal_fadump_mem_struct *opal_fdm_active;
>  static const struct opal_mpipl_fadump *opal_cpu_metadata;
>  static struct opal_fadump_mem_struct *opal_fdm;
> @@ -155,6 +202,17 @@ static int opal_fadump_setup_kernel_metadata(struct fw_dump *fadump_conf)
>  		err = -EPERM;
>  	}
>  
> +	/*
> +	 * Register boot memory top address with f/w. Should be retrieved
> +	 * by a kernel that intends to preserve crash'ed kernel's memory.
> +	 */
> +	ret = opal_mpipl_register_tag(OPAL_MPIPL_TAG_BOOT_MEM,
> +				      fadump_conf->boot_mem_top);

Looks like we only register tag but never de-register ot set them to
NULL when we don't need it. Same for kernel TAG. i.e if we kexec into
new kernel which may not do fadump and if opal crashes it will present
stale tags to next kernel. I think we should set bootmem/kernel tag to
NULL in fadump_cleanup() path so that kexec path can be taken care of.

Thanks,
-Mahesh.

