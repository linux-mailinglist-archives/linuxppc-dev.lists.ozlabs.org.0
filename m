Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E052734605
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 13:56:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jxiEUau/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QkWZq1Rw3z30h2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Jun 2023 21:56:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jxiEUau/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QkWYr16KLz300n
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Jun 2023 21:55:43 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35IBkReq028258;
	Sun, 18 Jun 2023 11:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=2WXh4w64Lv8mltEuD3jJMBBsm9fTJg70V/r7wviudCM=;
 b=jxiEUau/TlaYhvl7UpsK+zX+y7O6Fzx0OPy28juabu/Mj8Bba15izseO4R+bywGgdGSy
 TEwHYY8kNiq2x8/aJ3wdxymi1jk1yX2g2IPcLmg6syFcWQC02eaLrzly66P/N8lWE2UT
 iqjqLE3TgXHbdES8gKHu/67bfWRdz8lrfjIhoGfGSSyfFi2gEvgl89i7jZFk8OcmbkTt
 fjA8ZTZlqdYT9dmiyx226Lh6tMrJy0dMbq2YOo912xTEcbu+1VPJLM2EQNsm9CfVfP7W
 RaMbYtrOcVrHhPFZ1U1o39X7bFt0kLzv1y6KqjF36kjRglV0neZmN8MDI6tS6ZfDNUmG Og== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ra1bm02au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 Jun 2023 11:55:09 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35IBqgr6009618;
	Sun, 18 Jun 2023 11:55:09 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ra1bm02aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 Jun 2023 11:55:09 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35IBbFU8005259;
	Sun, 18 Jun 2023 11:55:06 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r94f50j99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 Jun 2023 11:55:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35IBt3C427263620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 Jun 2023 11:55:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CAF620049;
	Sun, 18 Jun 2023 11:55:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10FFA20040;
	Sun, 18 Jun 2023 11:55:01 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.72.246])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 Jun 2023 11:55:00 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v2 00/16] Add support for DAX vmemmap optimization for
 ppc64
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
Date: Sun, 18 Jun 2023 17:24:49 +0530
Message-Id: <CCFBB9B1-9B2E-4FF1-8025-6B40E01960DF@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9Ym_WmZhEU-XS7AWkf4ltraHl5BImMLP
X-Proofpoint-GUID: rBazhGExN_bo1tVzTPkynVUjkAHljWwd
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-18_08,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1011
 mlxscore=0 impostorscore=0 suspectscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306180110
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
Cc: Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, Nicholas Piggin <npiggin@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 16-Jun-2023, at 4:38 PM, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>=
 wrote:
>=20
> This patch series implements changes required to support DAX vmemmap
> optimization for ppc64. The vmemmap optimization is only enabled with rad=
ix MMU
> translation and 1GB PUD mapping with 64K page size. The patch series also=
 split
> hugetlb vmemmap optimization as a separate Kconfig variable so that
> architectures can enable DAX vmemmap optimization without enabling hugetlb
> vmemmap optimization. This should enable architectures like arm64 to enab=
le DAX
> vmemmap optimization while they can't enable hugetlb vmemmap optimization=
. More
> details of the same are in patch "mm/vmemmap optimization: Split hugetlb =
and
> devdax vmemmap optimization"
>=20
> Changes from V1:
> * Fix make htmldocs warning
> * Fix vmemmap allocation bugs with different alignment values.
> * Correctly check for section validity to before we free vmemmap area

Thanks for the updated series.

The previously reported WARN_ON is not seen with this series.
I also ran few regression tests against this series and did not
see any problems.

Based on the test results

Tested-by: Sachin Sant <sachinp@linux.ibm.com <mailto:sachinp@linux.ibm.com=
>>

-Sachin=
