Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 025F41BE057
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 16:11:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49C0mz2rBLzDr9L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 00:11:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49C0fh2CpHzDr7B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 00:06:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49C0fg3zJdz8sny
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 00:06:03 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49C0fg1M9Hz9sSy; Thu, 30 Apr 2020 00:06:03 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49C0ff3gWwz9sT1
 for <linuxppc-dev@ozlabs.org>; Thu, 30 Apr 2020 00:06:02 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03TE2M0R087844; Wed, 29 Apr 2020 10:05:52 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30me469ts9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 10:05:52 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03TE2it7090253;
 Wed, 29 Apr 2020 10:05:52 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30me469tm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 10:05:51 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03TE3Vdh010400;
 Wed, 29 Apr 2020 14:05:41 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 30mcu7wsqv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 14:05:41 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03TE5cCm65732862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 14:05:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC4034C04E;
 Wed, 29 Apr 2020 14:05:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 851594C040;
 Wed, 29 Apr 2020 14:05:36 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.83.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 29 Apr 2020 14:05:36 +0000 (GMT)
Date: Wed, 29 Apr 2020 19:35:33 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH v8 2/3] API to verify the STOP API and image compatibility
Message-ID: <20200429140533.GC4852@drishya.in.ibm.com>
References: <20200423105438.29034-1-psampat@linux.ibm.com>
 <20200423105438.29034-3-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200423105438.29034-3-psampat@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_05:2020-04-29,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 suspectscore=2 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290115
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
Reply-To: svaidy@linux.ibm.com
Cc: ego@linux.vnet.ibm.com, pratik.r.sampat@gmail.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, oohall@gmail.com,
 skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Pratik Rajesh Sampat <psampat@linux.ibm.com> [2020-04-23 16:24:37]:

> From: Prem Shanker Jha <premjha2@in.ibm.com>
> 
> Commit defines a new API primarily intended for OPAL to determine
> cpu register save API's compatibility with HOMER layout and
> self save restore. It can help OPAL determine if version of
> API integrated with OPAL is different from hostboot.
> 
> Change-Id: Ic0de45a336cfb8b6b6096a10ac1cd3ffbaa44fc0
> Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/77612
> Tested-by: FSP CI Jenkins <fsp-CI-jenkins+hostboot@us.ibm.com>
> Tested-by: Jenkins Server <pfd-jenkins+hostboot@us.ibm.com>
> Tested-by: Hostboot CI <hostboot-ci+hostboot@us.ibm.com>
> Reviewed-by: RANGANATHPRASAD G. BRAHMASAMUDRA <prasadbgr@in.ibm.com>
> Reviewed-by: Gregory S Still <stillgs@us.ibm.com>
> Reviewed-by: Jennifer A Stofer <stofer@us.ibm.com>
> Reviewed-on: http://rchgit01.rchland.ibm.com/gerrit1/77614
> Tested-by: Jenkins OP Build CI <op-jenkins+hostboot@us.ibm.com>
> Tested-by: Jenkins OP HW <op-hw-jenkins+hostboot@us.ibm.com>
> Reviewed-by: Daniel M Crowell <dcrowell@us.ibm.com>
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

> ---
>  include/p9_stop_api.H                    | 25 ++++++++++
>  libpore/p9_cpu_reg_restore_instruction.H |  7 ++-
>  libpore/p9_hcd_memmap_base.H             |  7 +++
>  libpore/p9_stop_api.C                    | 58 +++++++++++++++++++++++-
>  libpore/p9_stop_api.H                    | 26 ++++++++++-
>  libpore/p9_stop_util.H                   | 20 ++++----
>  6 files changed, 130 insertions(+), 13 deletions(-)

This stop-api code will help OPAL check and use self-save functions so
that different versions of OPAL can be loaded and run with different
versions of low level firmware stack.

--Vaidy
