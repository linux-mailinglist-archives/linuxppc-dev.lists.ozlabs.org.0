Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0025B6B78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 12:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRfWF6pMKz3c6B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 20:16:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UCac+MoN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UCac+MoN;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRfVb4LDcz2yPm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 20:15:34 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28D8Nv97027437;
	Tue, 13 Sep 2022 10:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=U4hVrFr8hDr7LfXInVifC1P1ZC6xtvzA0jGY2OiiRJ8=;
 b=UCac+MoN3EcqbOszQz0oyD1qVawRek5xprcgMDm67N2KqsRdsquuB7juz1cyzSHJAPA3
 x40U5NLj+fGkUZ/QLFl9b7JjVLhg+vGu+guS7YAgoC38FqI8coqcQsulCVAhuHE+sxMD
 QShrfFeE+qRq3F25dfxwqC012pZwN8xGODMFizL/r3V+F6XHsvL/eckLOtRrYFiEwrgo
 sUuMSXnDL4o6EJI//F8lRgkGZK9aNjCG6WCeROAgTE7ukprzhtZGvqhFKVJcHY2WXAXF
 Yn7s9DAktl3Q+R8KIQXn5Zz2hsNSVAZxRJByYQns2tWko2s3K+Et0Cgo0+jo3jOFuw/U 5Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jjmxtqhpn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 10:15:27 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28DA6Wro018786;
	Tue, 13 Sep 2022 10:15:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma01fra.de.ibm.com with ESMTP id 3jgj78tnq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Sep 2022 10:15:25 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28DAFMgP38011366
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Sep 2022 10:15:22 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3AC6E4C04A;
	Tue, 13 Sep 2022 10:15:22 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1443F4C040;
	Tue, 13 Sep 2022 10:15:21 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.54])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 13 Sep 2022 10:15:20 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH v2] ppc64/kdump: Limit kdump base to 512MB
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220912065031.57416-1-hbathini@linux.ibm.com>
Date: Tue, 13 Sep 2022 15:45:19 +0530
Content-Transfer-Encoding: 7bit
Message-Id: <932EA2DD-1B2C-4E52-88F5-B3B0811E402B@linux.ibm.com>
References: <20220912065031.57416-1-hbathini@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oTX-xT-lG4z_wr_vqBN0p26-1XqUyQBV
X-Proofpoint-ORIG-GUID: oTX-xT-lG4z_wr_vqBN0p26-1XqUyQBV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-13_03,2022-09-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209130045
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 12-Sep-2022, at 12:20 PM, Hari Bathini <hbathini@linux.ibm.com> wrote:
> 
> Since commit e641eb03ab2b0 ("powerpc: Fix up the kdump base cap to
> 128M") memory for kdump kernel has been reserved at an offset of
> 128MB. This held up well for a long time before running into boot
> failure on LPARs having a lot of cores. Commit 7c5ed82b800d8
> ("powerpc: Set crashkernel offset to mid of RMA region") fixed this
> boot failure by moving the offset to mid of RMA region. This change
> meant the offset is either 256MB or 512MB on LPARs as ppc64_rma_size
> was 512MB or 1024MB owing to commit 103a8542cb35b ("powerpc/book3s64/
> radix: Fix boot failure with large amount of guest memory")
> 
> But ppc64_rma_size can be larger as well with newer f/w. So, limit
> crashkernel reservation offset to 512MB to avoid running into boot
> failures during kdump kernel boot, due to RTAS or other allocation
> restrictions.
> 
> Also, while here, use SZ_128M instead of opening coding it.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---

Tested on a Power10 and Power9 LPAR. Kdump works as expected.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

> 
> Changes in V2:
> * Updated the changelog for clarity.
> * Used SZ_512M instead of open coding as suggested by Christophe.
> * Used SZ_128M instead of open coding 128MB.
> 
> arch/powerpc/kexec/core.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
> index cf84bfe9e27e..de64c7962991 100644
> --- a/arch/powerpc/kexec/core.c
> +++ b/arch/powerpc/kexec/core.c
> @@ -136,7 +136,7 @@ void __init reserve_crashkernel(void)
> #ifdef CONFIG_PPC64
> 		/*
> 		 * On the LPAR platform place the crash kernel to mid of
> -		 * RMA size (512MB or more) to ensure the crash kernel
> +		 * RMA size (max. of 512MB) to ensure the crash kernel
> 		 * gets enough space to place itself and some stack to be
> 		 * in the first segment. At the same time normal kernel
> 		 * also get enough space to allocate memory for essential
> @@ -144,9 +144,9 @@ void __init reserve_crashkernel(void)
> 		 * kernel starts at 128MB offset on other platforms.
> 		 */
> 		if (firmware_has_feature(FW_FEATURE_LPAR))
> -			crashk_res.start = ppc64_rma_size / 2;
> +			crashk_res.start = min_t(u64, ppc64_rma_size / 2, SZ_512M);
> 		else
> -			crashk_res.start = min(0x8000000ULL, (ppc64_rma_size / 2));
> +			crashk_res.start = min_t(u64, ppc64_rma_size / 2, SZ_128M);
> #else
> 		crashk_res.start = KDUMP_KERNELBASE;
> #endif
> -- 
> 2.37.3
> 

