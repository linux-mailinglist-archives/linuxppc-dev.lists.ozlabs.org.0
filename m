Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECE08DA90
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 19:18:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467xBh6lvPzDqw4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 03:18:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467x6c2YPWzDqtS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 03:15:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467x6b74jqz8wW6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 03:15:19 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467x6b5rWRz9sR7; Thu, 15 Aug 2019 03:15:19 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 467x6b1fbBz9sSY
 for <linuxppc-dev@ozlabs.org>; Thu, 15 Aug 2019 03:15:18 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EGsAkD164209
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 13:15:15 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ucmg6cuuy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 13:15:15 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Wed, 14 Aug 2019 18:15:13 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 18:15:09 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7EHF8Na42664148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 17:15:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BF1C52054;
 Wed, 14 Aug 2019 17:15:08 +0000 (GMT)
Received: from in.ibm.com (unknown [9.199.55.108])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 4081652057;
 Wed, 14 Aug 2019 17:15:06 +0000 (GMT)
Date: Wed, 14 Aug 2019 22:45:03 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 18/25] powernv/fadump: process architected register
 state data provided by firmware
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327684839.27462.10598087583845179638.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327684839.27462.10598087583845179638.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081417-0012-0000-0000-0000033ECCF4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081417-0013-0000-0000-00002178E153
Message-Id: <20190814171503.6mpm2r63ildemyyz@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140158
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

On 2019-07-16 17:04:08 Tue, Hari Bathini wrote:
> From: Hari Bathini <hbathini@linux.vnet.ibm.com>
> 
> Firmware provides architected register state data at the time of crash.
> Process this data and build CPU notes to append to ELF core.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.vnet.ibm.com>
> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/fadump-common.h          |    4 +
>  arch/powerpc/platforms/powernv/opal-fadump.c |  197 ++++++++++++++++++++++++--
>  arch/powerpc/platforms/powernv/opal-fadump.h |   39 +++++
>  3 files changed, 228 insertions(+), 12 deletions(-)
> 
[...]
> @@ -430,6 +577,32 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
>  			return 1;
>  		}
>  
> +		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_CPU, &addr);
> +		if ((ret != OPAL_SUCCESS) || !addr) {
> +			pr_err("Failed to get CPU metadata (%lld)\n", ret);
> +			return 1;
> +		}
> +
> +		addr = be64_to_cpu(addr);
> +		pr_debug("CPU metadata addr: %llx\n", addr);
> +
> +		opal_cpu_metadata = __va(addr);
> +		r_opal_cpu_metadata = (void *)addr;
> +		fadump_conf->cpu_state_data_version =
> +			be32_to_cpu(r_opal_cpu_metadata->cpu_data_version);
> +		if (fadump_conf->cpu_state_data_version !=
> +		    HDAT_FADUMP_CPU_DATA_VERSION) {
> +			pr_err("CPU data format version (%lu) mismatch!\n",
> +			       fadump_conf->cpu_state_data_version);
> +			return 1;
> +		}
> +		fadump_conf->cpu_state_entry_size =
> +			be32_to_cpu(r_opal_cpu_metadata->cpu_data_size);
> +		fadump_conf->cpu_state_destination_addr =
> +			be64_to_cpu(r_opal_cpu_metadata->region[0].dest);
> +		fadump_conf->cpu_state_data_size =
> +			be64_to_cpu(r_opal_cpu_metadata->region[0].size);
> +

opal_fadump_dt_scan isn't the right place to do this. Can you please move above
cpu related data processing to opal_fadump_build_cpu_notes() ?

Thanks,
-Mahesh.

>  		pr_info("Firmware-assisted dump is active.\n");
>  		fadump_conf->dump_active = 1;
>  		opal_fadump_get_config(fadump_conf, r_opal_fdm_active);

