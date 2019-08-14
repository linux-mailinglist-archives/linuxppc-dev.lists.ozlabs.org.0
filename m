Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E04D18D0A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 12:20:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467lwS5P2HzDqMh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 20:20:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467ltX4sNnzDqJt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:19:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 467ltW6NzNz8tVb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 20:19:15 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 467ltW66wqz9sNp; Wed, 14 Aug 2019 20:19:15 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 467ltW0QYVz9sN1
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 20:19:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7EAJ5fh120797
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 06:19:12 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ucd5fyvv6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 14 Aug 2019 06:19:08 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Wed, 14 Aug 2019 11:18:13 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 14 Aug 2019 11:18:10 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7EAI8OQ31129798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Aug 2019 10:18:08 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A0C242052;
 Wed, 14 Aug 2019 10:18:08 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D442242041;
 Wed, 14 Aug 2019 10:18:04 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.198.140])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 14 Aug 2019 10:18:04 +0000 (GMT)
Date: Wed, 14 Aug 2019 15:48:01 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 14/25] powernv/fadump: process the crashdump by
 exporting it as /proc/vmcore
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327681824.27462.1314030665685342118.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327681824.27462.1314030665685342118.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081410-0016-0000-0000-0000029EADBB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081410-0017-0000-0000-000032FEC713
Message-Id: <20190814101801.tbzqbds3n4qf5wey@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-14_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908140106
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

On 2019-07-16 17:03:38 Tue, Hari Bathini wrote:
> Add support in the kernel to process the crash'ed kernel's memory
> preserved during MPIPL and export it as /proc/vmcore file for the
> userland scripts to filter and analyze it later.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-fadump.c |  190 ++++++++++++++++++++++++++
>  1 file changed, 187 insertions(+), 3 deletions(-)
> 
[...]
> +		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
> +		if ((ret != OPAL_SUCCESS) || !addr) {
> +			pr_err("Failed to get Kernel metadata (%lld)\n", ret);
> +			return 1;
> +		}
> +
> +		addr = be64_to_cpu(addr);
> +		pr_debug("Kernel metadata addr: %llx\n", addr);
> +
> +		opal_fdm_active = __va(addr);
> +		r_opal_fdm_active = (void *)addr;
> +		if (r_opal_fdm_active->version != OPAL_FADUMP_VERSION) {
> +			pr_err("FADump active but version (%u) unsupported!\n",
> +			       r_opal_fdm_active->version);
> +			return 1;
> +		}
> +
> +		/* Kernel regions not registered with f/w  for MPIPL */
> +		if (r_opal_fdm_active->registered_regions == 0) {
> +			opal_fdm_active = NULL;

What about partial dump capture scenario ? What if opal crashes while
kernel was in middle of registering ranges ? We may have partial dump
captured which won't be useful.
e,g. If we have total of 4 ranges to be registered and opal crashes
after successful registration of only 2 ranges with 2 pending, we will get a
partial dump which needs to be ignored.

I think check shuold be comparing registered_regions against total number of
regions. What do you think ?

Thanks,
-Mahesh.

> +			return 1;
> +		}
> +
> +		pr_info("Firmware-assisted dump is active.\n");
> +		fadump_conf->dump_active = 1;
> +		opal_fadump_get_config(fadump_conf, r_opal_fdm_active);
> +	}
> +
>  	return 1;
>  }
> 

-- 
Mahesh J Salgaonkar

