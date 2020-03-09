Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1DD17DE17
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 12:00:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bZxw5xLszDqcG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Mar 2020 22:00:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bZw93p0TzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Mar 2020 21:58:46 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 029As42x130845
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 06:58:40 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym6tmkrj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Mar 2020 06:58:39 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 029AsDWF131550
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 9 Mar 2020 06:58:39 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ym6tmkrhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 06:58:39 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 029AspZD013514;
 Mon, 9 Mar 2020 10:58:38 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03wdc.us.ibm.com with ESMTP id 2ym3861qav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Mar 2020 10:58:38 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 029AwaBv42991924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Mar 2020 10:58:37 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBF03112064;
 Mon,  9 Mar 2020 10:58:36 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 923A7112061;
 Mon,  9 Mar 2020 10:58:34 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.204.201.20])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  9 Mar 2020 10:58:34 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 8/8] powerpc/papr_scm: Implement support for
 DSM_PAPR_SCM_HEALTH
In-Reply-To: <20200220095805.197229-9-vaibhav@linux.ibm.com>
References: <20200220095805.197229-1-vaibhav@linux.ibm.com>
 <20200220095805.197229-9-vaibhav@linux.ibm.com>
Date: Mon, 09 Mar 2020 16:28:32 +0530
Message-ID: <87y2s9yeuf.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-09_02:2020-03-08,
 2020-03-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003090077
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
 Michael Ellerman <ellerman@au1.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 Alastair D'Silva <alastair@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> The DSM 'DSM_PAPR_SCM_HEALTH' should return a 'struct
> nd_papr_scm_dimm_health_stat' containing information in dimm health back
> to user space in response to ND_CMD_CALL. We implement this DSM by
> implementing a new function papr_scm_get_health() that queries the
> DIMM health information and then copies these bitmaps to the package
> payload whose layout is defined by 'struct papr_scm_ndctl_health'.
>
> The patch also handle cases where in future versions of 'struct
> papr_scm_ndctl_health' may want to return more health
> information. Such payload envelops will contain appropriate version
> information in 'struct nd_papr_scm_cmd_pkg.payload_version'. The patch
> takes care of only returning the sub-data corresponding to the payload
> version requested. Please see the comments in papr_scm_get_health()
> for how this is done.
>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 73 +++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 29f38246c59f..bf81acb0bf3f 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -415,6 +415,74 @@ static int cmd_to_func(struct nvdimm *nvdimm, unsigned int cmd, void *buf,
>  	return pkg->hdr.nd_command;
>  }
>  
> +/*
> + * Fetch the DIMM health info and populate it in provided papr_scm package.
> + * Since the caller can request a different version of payload and each new
> + * version of struct nd_papr_scm_dimm_health_stat is a proper-subset of
> + * previous version hence we return a subset of the cached 'struct
> + * nd_papr_scm_dimm_health_stat' depending on the payload version requested.
> + */
> +static int papr_scm_get_health(struct papr_scm_priv *p,
> +			       struct nd_papr_scm_cmd_pkg *pkg)
> +{
> +	int rc;
> +	size_t copysize;
> +	/* Map version to number of bytes to be copied to payload */
> +	const size_t copysizes[] = {
> +		[1] =
> +		sizeof(struct nd_papr_scm_dimm_health_stat_v1),
> +
> +		/*  This should always be preset */
> +		[ND_PAPR_SCM_DIMM_HEALTH_VERSION] =
> +		sizeof(struct nd_papr_scm_dimm_health_stat),
> +	};


We will not be able to determine that during build. For performance
hcall to run LPAR should be privileged. ie, even if the kernel supports v2
version of the health information, it may only be able to
return v1 version of the health because LPAR performance stat hcall
failed.

-aneesh
