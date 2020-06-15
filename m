Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC96F1F9808
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 15:13:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49lsGV4jYfzDqXg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jun 2020 23:13:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49lrhv5zqdzDqKS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 22:47:59 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05FC1FX3070053; Mon, 15 Jun 2020 08:47:26 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31n42k4mtg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 08:47:25 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05FC1ps4073238;
 Mon, 15 Jun 2020 08:47:25 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31n42k4mt1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 08:47:25 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05FCjaBB019385;
 Mon, 15 Jun 2020 12:47:23 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 31mpe7ukbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Jun 2020 12:47:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05FClLwu35979462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Jun 2020 12:47:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBC0D4C050;
 Mon, 15 Jun 2020 12:47:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 938C14C063;
 Mon, 15 Jun 2020 12:47:17 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.96.47])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 15 Jun 2020 12:47:17 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Mon, 15 Jun 2020 18:17:16 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/6] powerpc: Document details on H_SCM_HEALTH hcall
In-Reply-To: <20200615122644.31887-2-vaibhav@linux.ibm.com>
References: <20200615122644.31887-1-vaibhav@linux.ibm.com>
 <20200615122644.31887-2-vaibhav@linux.ibm.com>
Date: Mon, 15 Jun 2020 18:17:16 +0530
Message-ID: <87eeqgh4x7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-15_02:2020-06-15,
 2020-06-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=1
 cotscore=-2147483648 adultscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006150098
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
Cc: Santosh Sivaraj <santosh@fossix.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Oliver O'Halloran <oohall@gmail.com>,
 Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


This accidently got reposted. Please ignore.

Vaibhav Jain <vaibhav@linux.ibm.com> writes:

> Add documentation to 'papr_hcalls.rst' describing the bitmap flags
> that are returned from H_SCM_HEALTH hcall as per the PAPR-SCM
> specification.
>
> Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ira Weiny <ira.weiny@intel.com>
> Acked-by: Ira Weiny <ira.weiny@intel.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
> Changelog:
>
> v11..v12:
> * None
>
> v10..v11:
> * None
>
> v9..v10:
> * Added ack from Ira.
>
> Resend:
> * None
>
> v8..v9:
> * s/SCM/PMEM device. [ Dan Williams, Aneesh ]
>
> v7..v8:
> * Added a clarification on bit-ordering of Health Bitmap
>
> Resend:
> * None
>
> v6..v7:
> * None
>
> v5..v6:
> * New patch in the series
> ---
>  Documentation/powerpc/papr_hcalls.rst | 46 ++++++++++++++++++++++++---
>  1 file changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
> index 3493631a60f8..48fcf1255a33 100644
> --- a/Documentation/powerpc/papr_hcalls.rst
> +++ b/Documentation/powerpc/papr_hcalls.rst
> @@ -220,13 +220,51 @@ from the LPAR memory.
>  **H_SCM_HEALTH**
>  
>  | Input: drcIndex
> -| Out: *health-bitmap, health-bit-valid-bitmap*
> +| Out: *health-bitmap (r4), health-bit-valid-bitmap (r5)*
>  | Return Value: *H_Success, H_Parameter, H_Hardware*
>  
>  Given a DRC Index return the info on predictive failure and overall health of
> -the NVDIMM. The asserted bits in the health-bitmap indicate a single predictive
> -failure and health-bit-valid-bitmap indicate which bits in health-bitmap are
> -valid.
> +the PMEM device. The asserted bits in the health-bitmap indicate one or more states
> +(described in table below) of the PMEM device and health-bit-valid-bitmap indicate
> +which bits in health-bitmap are valid. The bits are reported in
> +reverse bit ordering for example a value of 0xC400000000000000
> +indicates bits 0, 1, and 5 are valid.
> +
> +Health Bitmap Flags:
> +
> ++------+-----------------------------------------------------------------------+
> +|  Bit |               Definition                                              |
> ++======+=======================================================================+
> +|  00  | PMEM device is unable to persist memory contents.                     |
> +|      | If the system is powered down, nothing will be saved.                 |
> ++------+-----------------------------------------------------------------------+
> +|  01  | PMEM device failed to persist memory contents. Either contents were   |
> +|      | not saved successfully on power down or were not restored properly on |
> +|      | power up.                                                             |
> ++------+-----------------------------------------------------------------------+
> +|  02  | PMEM device contents are persisted from previous IPL. The data from   |
> +|      | the last boot were successfully restored.                             |
> ++------+-----------------------------------------------------------------------+
> +|  03  | PMEM device contents are not persisted from previous IPL. There was no|
> +|      | data to restore from the last boot.                                   |
> ++------+-----------------------------------------------------------------------+
> +|  04  | PMEM device memory life remaining is critically low                   |
> ++------+-----------------------------------------------------------------------+
> +|  05  | PMEM device will be garded off next IPL due to failure                |
> ++------+-----------------------------------------------------------------------+
> +|  06  | PMEM device contents cannot persist due to current platform health    |
> +|      | status. A hardware failure may prevent data from being saved or       |
> +|      | restored.                                                             |
> ++------+-----------------------------------------------------------------------+
> +|  07  | PMEM device is unable to persist memory contents in certain conditions|
> ++------+-----------------------------------------------------------------------+
> +|  08  | PMEM device is encrypted                                              |
> ++------+-----------------------------------------------------------------------+
> +|  09  | PMEM device has successfully completed a requested erase or secure    |
> +|      | erase procedure.                                                      |
> ++------+-----------------------------------------------------------------------+
> +|10:63 | Reserved / Unused                                                     |
> ++------+-----------------------------------------------------------------------+
>  
>  **H_SCM_PERFORMANCE_STATS**
>  
> -- 
> 2.26.2
>

-- 
Cheers
~ Vaibhav
