Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 321328B5CD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 12:43:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4678T01X5zzDqjg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 20:43:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4678R85zKnzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 20:41:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4678R83QYkz8tTb
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 20:41:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4678R813D0z9sNF; Tue, 13 Aug 2019 20:41:56 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4678R70p5lz9sN6
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 20:41:53 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7DAfWsV007783
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 06:41:50 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ubtr2t86e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 13 Aug 2019 06:41:50 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Tue, 13 Aug 2019 11:41:48 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 13 Aug 2019 11:41:45 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7DAfPPE38404474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Aug 2019 10:41:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30E774C044;
 Tue, 13 Aug 2019 10:41:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4567E4C046;
 Tue, 13 Aug 2019 10:41:40 +0000 (GMT)
Received: from in.ibm.com (unknown [9.193.100.20])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 13 Aug 2019 10:41:39 +0000 (GMT)
Date: Tue, 13 Aug 2019 16:11:37 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 11/25] powernv/fadump: register kernel metadata
 address with opal
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327679568.27462.14864917663459855788.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327679568.27462.14864917663459855788.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081310-0020-0000-0000-0000035F1CD7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081310-0021-0000-0000-000021B430B6
Message-Id: <20190813104137.xsyommcjdrnpa6u6@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-13_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130116
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

On 2019-07-16 17:03:15 Tue, Hari Bathini wrote:
> OPAL allows registering address with it in the first kernel and
> retrieving it after MPIPL. Setup kernel metadata and register its
> address with OPAL to use it for processing the crash dump.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/fadump-common.h          |    4 +
>  arch/powerpc/kernel/fadump.c                 |   65 ++++++++++++++---------
>  arch/powerpc/platforms/powernv/opal-fadump.c |   73 ++++++++++++++++++++++++++
>  arch/powerpc/platforms/powernv/opal-fadump.h |   37 +++++++++++++
>  arch/powerpc/platforms/pseries/rtas-fadump.c |   32 +++++++++--
>  5 files changed, 177 insertions(+), 34 deletions(-)
>  create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h
> 
[...]
> @@ -346,30 +349,42 @@ int __init fadump_reserve_mem(void)
>  		 * use memblock_find_in_range() here since it doesn't allocate
>  		 * from bottom to top.
>  		 */
> -		for (base = fw_dump.boot_memory_size;
> -		     base <= (memory_boundary - size);
> -		     base += size) {
> +		while (base <= (memory_boundary - size)) {
>  			if (memblock_is_region_memory(base, size) &&
>  			    !memblock_is_region_reserved(base, size))
>  				break;
> +
> +			base += size;
>  		}
> -		if ((base > (memory_boundary - size)) ||
> -		    memblock_reserve(base, size)) {
> +
> +		if (base > (memory_boundary - size)) {
> +			pr_err("Failed to find memory chunk for reservation\n");
> +			goto error_out;
> +		}
> +		fw_dump.reserve_dump_area_start = base;
> +
> +		/*
> +		 * Calculate the kernel metadata address and register it with
> +		 * f/w if the platform supports.
> +		 */
> +		if (fw_dump.ops->setup_kernel_metadata(&fw_dump) < 0)
> +			goto error_out;

I see setup_kernel_metadata() registers the metadata address with opal without
having any minimum data initialized in it. Secondaly, why can't this wait until
registration ? I think we should defer this until fadump registration.
What if kernel crashes before metadata area is initialized ?

> +
> +		if (memblock_reserve(base, size)) {
>  			pr_err("Failed to reserve memory\n");
> -			return 0;
> +			goto error_out;
>  		}
[...]
> -
>  static struct fadump_ops rtas_fadump_ops = {
> -	.init_fadump_mem_struct	= rtas_fadump_init_mem_struct,
> -	.register_fadump	= rtas_fadump_register_fadump,
> -	.unregister_fadump	= rtas_fadump_unregister_fadump,
> -	.invalidate_fadump	= rtas_fadump_invalidate_fadump,
> -	.process_fadump		= rtas_fadump_process_fadump,
> -	.fadump_region_show	= rtas_fadump_region_show,
> -	.fadump_trigger		= rtas_fadump_trigger,
> +	.init_fadump_mem_struct		= rtas_fadump_init_mem_struct,
> +	.get_kernel_metadata_size	= rtas_fadump_get_kernel_metadata_size,
> +	.setup_kernel_metadata		= rtas_fadump_setup_kernel_metadata,
> +	.register_fadump		= rtas_fadump_register_fadump,
> +	.unregister_fadump		= rtas_fadump_unregister_fadump,
> +	.invalidate_fadump		= rtas_fadump_invalidate_fadump,
> +	.process_fadump			= rtas_fadump_process_fadump,
> +	.fadump_region_show		= rtas_fadump_region_show,
> +	.fadump_trigger			= rtas_fadump_trigger,

Can you make the tab space changes in your previous patch where these
were initially introduced ? So that this patch can only show new members
that are added.

Thanks,
-Mahesh.

