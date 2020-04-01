Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6D319A4BD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 07:35:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sZdw4jxVzDqVp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 16:35:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sZYz5NvFzDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 16:31:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03152r9Y028183; Wed, 1 Apr 2020 01:31:31 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3022qywdyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 01:31:31 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0315VF5a003501;
 Wed, 1 Apr 2020 05:31:30 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01wdc.us.ibm.com with ESMTP id 301x766fb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Apr 2020 05:31:30 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0315VSO054526310
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Apr 2020 05:31:28 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9B5BEAE05F;
 Wed,  1 Apr 2020 05:31:28 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3271AE05C;
 Wed,  1 Apr 2020 05:31:26 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.70.197])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  1 Apr 2020 05:31:26 +0000 (GMT)
X-Mailer: emacs 27.0.90 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org
Subject: Re: [PATCH v5 2/4] ndctl/uapi: Introduce NVDIMM_FAMILY_PAPR_SCM as
 a new NVDIMM DSM family
In-Reply-To: <20200331143229.306718-3-vaibhav@linux.ibm.com>
References: <20200331143229.306718-1-vaibhav@linux.ibm.com>
 <20200331143229.306718-3-vaibhav@linux.ibm.com>
Date: Wed, 01 Apr 2020 11:01:24 +0530
Message-ID: <87tv23lqkz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_07:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=2 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004010044
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
 Michael Ellerman <ellerman@au1.ibm.com>,
 Alastair D'Silva <alastair@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Add PAPR-scm family of DSM command-set to the white list of NVDIMM
> command sets.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> v4..v5 : None
>
> v3..v4 : None
>
> v2..v3 : Updated the patch prefix to 'ndctl/uapi' [Aneesh]
>
> v1..v2 : None
> ---
>  include/uapi/linux/ndctl.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/uapi/linux/ndctl.h b/include/uapi/linux/ndctl.h
> index de5d90212409..99fb60600ef8 100644
> --- a/include/uapi/linux/ndctl.h
> +++ b/include/uapi/linux/ndctl.h
> @@ -244,6 +244,7 @@ struct nd_cmd_pkg {
>  #define NVDIMM_FAMILY_HPE2 2
>  #define NVDIMM_FAMILY_MSFT 3
>  #define NVDIMM_FAMILY_HYPERV 4
> +#define NVDIMM_FAMILY_PAPR_SCM 5
>  
>  #define ND_IOCTL_CALL			_IOWR(ND_IOCTL, ND_CMD_CALL,\
>  					struct nd_cmd_pkg)
> -- 
> 2.25.1
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
