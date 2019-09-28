Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB3C1142
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 18:02:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46gYMw1z1fzDr4C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Sep 2019 02:02:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46gYKy0H94zDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Sep 2019 02:00:53 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8SFukNX103971
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 12:00:50 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2va35qfhan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 12:00:49 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8SFurFs104133
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 12:00:49 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2va35qfhag-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 Sep 2019 12:00:49 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8SG0Kv1020614;
 Sat, 28 Sep 2019 16:00:48 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 2v9y58d2xs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 28 Sep 2019 16:00:48 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8SG0kfM47382814
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 28 Sep 2019 16:00:46 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DE3313604F;
 Sat, 28 Sep 2019 16:00:46 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB91F13605D;
 Sat, 28 Sep 2019 16:00:44 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.47.160])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 28 Sep 2019 16:00:44 +0000 (GMT)
X-Mailer: emacs 26.2 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/papr_scm: Fix an off-by-one check in
 papr_scm_meta_{get, set}
In-Reply-To: <20190927062002.3169-1-vaibhav@linux.ibm.com>
References: <20190927062002.3169-1-vaibhav@linux.ibm.com>
Date: Sat, 28 Sep 2019 21:30:42 +0530
Message-ID: <87zhiocswl.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-28_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909280167
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> A validation check to prevent out of bounds read/write inside
> functions papr_scm_meta_{get,set}() is off-by-one that prevent reads
> and writes to the last byte of the label area.
>
> This bug manifests as a failure to probe a dimm when libnvdimm is
> unable to read the entire config-area as advertised by
> ND_CMD_GET_CONFIG_SIZE. This usually happens when there are large
> number of namespaces created in the region backed by the dimm and the
> label-index spans max possible config-area. An error of the form below
> usually reported in the kernel logs:
>
> [  255.293912] nvdimm: probe of nmem0 failed with error -22
>
> The patch fixes these validation checks there by letting libnvdimm
> access the entire config-area.
>
Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Fixes: 53e80bd042773('powerpc/nvdimm: Add support for multibyte read/write for metadata')
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr_scm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index a5ac371a3f06..0d0f4974a301 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -124,7 +124,7 @@ static int papr_scm_meta_get(struct papr_scm_priv *p,
>  	int len, read;
>  	int64_t ret;
>  
> -	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
> +	if ((hdr->in_offset + hdr->in_length) > p->metadata_size)
>  		return -EINVAL;
>  
>  	for (len = hdr->in_length; len; len -= read) {
> @@ -178,7 +178,7 @@ static int papr_scm_meta_set(struct papr_scm_priv *p,
>  	__be64 data_be;
>  	int64_t ret;
>  
> -	if ((hdr->in_offset + hdr->in_length) >= p->metadata_size)
> +	if ((hdr->in_offset + hdr->in_length) > p->metadata_size)
>  		return -EINVAL;
>  
>  	for (len = hdr->in_length; len; len -= wrote) {
> -- 
> 2.21.0
