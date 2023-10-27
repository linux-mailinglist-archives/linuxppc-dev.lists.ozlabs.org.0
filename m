Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8150B7D9F0A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 19:52:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YB+bzqWU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SH9Gk2gdPz3cTn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Oct 2023 04:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YB+bzqWU;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SH9Fr6F4Sz3bTQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 04:51:28 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SH9Fq0hSqz4wd5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Oct 2023 04:51:27 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SH9Fq0cc4z4wcd; Sat, 28 Oct 2023 04:51:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YB+bzqWU;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=adityag@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SH9Fp2b0vz4wc2;
	Sat, 28 Oct 2023 04:51:25 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39RHYlDr031570;
	Fri, 27 Oct 2023 17:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=BU+vNL/8IfYOdkotD95tq7b66wUM7xz4dMwnNJ3VFbM=;
 b=YB+bzqWUKniw/gAIfhD1EICQMNCTadcM9ypgOUspLiHN+V9ckAZYtXSm0l8UFTIvgcoB
 P9aHEevJsIsg28mA+ZdLLkYrTzzCe+v7QODubiiwuazVzyfrtR6uzBll9nUXy+sU8nke
 TT5zKqx7ILK2wq6+Y8scSUzwmOCEjariHBYVI0OO/xv2Z2QEQvjUIMmkhrf103Mbu/EJ
 rt5tv3PhUxjO8D/AKey0ysXA7iEzeCw9Hz7RoAew+h3ynPIftJjr71/a9hPbv+HI9h1K
 zC5NIuj4PxQZIUZNOBgTSjjvVoBS2qagzGdXNwxM67lGAmC11Zr7iCzEp9EJh3J/tgNN HA== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3u0hqt8hs1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Oct 2023 17:51:22 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39RG4jGs021697;
	Fri, 27 Oct 2023 17:51:21 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tywqseryg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Oct 2023 17:51:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39RHpIfQ13173458
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Oct 2023 17:51:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B3FB020043;
	Fri, 27 Oct 2023 17:51:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A36C120040;
	Fri, 27 Oct 2023 17:51:16 +0000 (GMT)
Received: from li-3c92a0cc-27cf-11b2-a85c-b804d9ca68fa.ibm.com (unknown [9.171.38.9])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Oct 2023 17:51:16 +0000 (GMT)
Date: Fri, 27 Oct 2023 23:21:11 +0530
From: Aditya Gupta <adityag@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] ppc64: add mmu information to vmcoreinfo
Message-ID: <y6ekg66oa5x3ib5r5yow4ko77nlu2vx4lgxyvqe6g747zicrsq@nb7vjrv4jn5p>
References: <20231023072612.50874-1-adityag@linux.ibm.com>
 <169840079688.2701453.15154354310571529574.b4-ty@ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169840079688.2701453.15154354310571529574.b4-ty@ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1q4FFW5b0ZwJFItEbvMnke1-lPTGjqsG
X-Proofpoint-ORIG-GUID: 1q4FFW5b0ZwJFItEbvMnke1-lPTGjqsG
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-27_16,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 mlxlogscore=252 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310270154
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org, Sachin Sant <sachinp@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 27, 2023 at 08:59:56PM +1100, Michael Ellerman wrote:
> On Mon, 23 Oct 2023 12:56:12 +0530, Aditya Gupta wrote:
> > Since below commit, address mapping for vmemmap has changed for Radix
> > MMU, where address mapping is stored in kernel page table itself,
> > instead of earlier used 'vmemmap_list'.
> > 
> >     commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
> >     a different vmemmap handling function")
> > 
> > [...]
> 
> Applied to powerpc/next.
> 
> [1/1] ppc64: add mmu information to vmcoreinfo
>       https://git.kernel.org/powerpc/c/36e826b568e412f61d68fedc02a67b4d8b7583cc
> 
> cheers

Thank you for the update.

