Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BAE8FA96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 08:02:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468t5S2kBMzDr0C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 16:02:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468t2g6lR3zDqth
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 16:00:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 468t2f5HJdz8x3S
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 16:00:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 468t2f4p96z9sND; Fri, 16 Aug 2019 16:00:10 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 468t2f1Fjrz9sDB
 for <linuxppc-dev@ozlabs.org>; Fri, 16 Aug 2019 16:00:09 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7G5uTHY008252
 for <linuxppc-dev@ozlabs.org>; Fri, 16 Aug 2019 02:00:07 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2udj7nruxk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 16 Aug 2019 02:00:06 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Fri, 16 Aug 2019 07:00:05 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 16 Aug 2019 07:00:03 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7G601vn52297826
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Aug 2019 06:00:01 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A52B111C066;
 Fri, 16 Aug 2019 06:00:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEBC111C052;
 Fri, 16 Aug 2019 05:59:58 +0000 (GMT)
Received: from in.ibm.com (unknown [9.109.198.234])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 16 Aug 2019 05:59:58 +0000 (GMT)
Date: Fri, 16 Aug 2019 11:29:56 +0530
From: Mahesh J Salgaonkar <mahesh@linux.vnet.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v4 22/25] powernv/fadump: Warn before processing partial
 crashdump
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
 <156327687873.27462.9042420686385726788.stgit@hbathini.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <156327687873.27462.9042420686385726788.stgit@hbathini.in.ibm.com>
User-Agent: NeoMutt/20180716
X-TM-AS-GCONF: 00
x-cbid: 19081606-0028-0000-0000-0000039046FC
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081606-0029-0000-0000-000024525F9B
Message-Id: <20190816055956.c4w3lo7te4ntfh44@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=990 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908160065
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

On 2019-07-16 17:04:38 Tue, Hari Bathini wrote:
> If not all kernel boot memory regions are registered for MPIPL before
> system crashes, try processing the partial crashdump but warn the user
> before proceeding.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-fadump.c |   21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
> index b55f25c..3ef212d 100644
> --- a/arch/powerpc/platforms/powernv/opal-fadump.c
> +++ b/arch/powerpc/platforms/powernv/opal-fadump.c
> @@ -136,6 +136,27 @@ static void opal_fadump_get_config(struct fw_dump *fadump_conf,
>  		last_end = base + size;
>  	}
>  
> +	/*
> +	 * Rarely, but it can so happen that system crashes before all
> +	 * boot memory regions are registered for MPIPL. In such
> +	 * cases, warn that the vmcore may not be accurate and proceed
> +	 * anyway as that is the best bet considering free pages, cache
> +	 * pages, user pages, etc are usually filtered out.
> +	 *
> +	 * Hope the memory that could not be preserved only has pages
> +	 * that are usually filtered out while saving the vmcore.
> +	 */
> +	if (fdm->region_cnt < fdm->registered_regions) {
> +		pr_warn("The crashdump may not be accurate as the below boot memory regions could not be preserved:\n");

This would be opal crashing while kernel is middle of gearing itself for
fadump. If you decide to still go ahead with partial dump then you will need to
have nice warning message about dump capture (makedmpfile capture) may
fail, but we will still have full opal core that can help in analysis.

Thanks,
-Mahesh.

