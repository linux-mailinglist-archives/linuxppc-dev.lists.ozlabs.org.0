Return-Path: <linuxppc-dev+bounces-8265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A90CBAA7ED2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 May 2025 09:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZqJdM0K91z2yTK;
	Sat,  3 May 2025 17:02:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746255751;
	cv=none; b=DDvSEX3y6L45a61su11obVUPXjYNlTLDrJx+PCuoqRzyIVIMwfMJDF2/lmymy7oAn8ScsRiLp3LS83mR7qXxejFyTRH9lYpdoGXBauisXMpeQy+K6LMMUg1uwgrpOiVYztrJPpOrDawJkyRuAffcmW+L4rsALMmd1EasbTuwXMLt2TFTx9W3IssvW10fdteIS0NOF3P3G0h1MNbd2OCb9ax0S+IKMRaj4pvUe2IRspqJxF0Ey3cc6sq7if7V11yjE00Ksk7QI7KZWSDgMHA3tGYMEeU+og/CKqwS10GmWJ7R7CvIulXm1Zgzd/jPCTQovhfj3xUA8vgii4CWoxPlTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746255751; c=relaxed/relaxed;
	bh=QuKtjBt3hT/GfrHBkJJJ41nGji5reGHD8O/7cHUZKlA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UnD4jjYqGDXRgCMpzWnOVTSTY2MlyypTp8mQtjOFOOrxGR1OBLdQb/WdtY1UZN5zL3Cd/s8DDOchYnTR/eHJMitLzA5N2qezYpdV6wZlJd3guz/V4luUBC9M3rwYFKdS5oPlE2ORAFfZzaoG0Pcns8DqDSnHdbJsx0JI3vEwSs/Woa7ia4FXvSVzBSF9frxOWgCXyBDXCNdyRIFG2ZZyO/shrkNElujC3/ZHgBQzoYqp8A0vmoLRPIMCHdyyGHeNStxsRks5CMK1xBXN6o5wzv7dciVw7Ixz9tTHDOw53j3cGWHUou0PWmd+3IqMdexAXnL+K6U8G2VwsclSzPQJSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fmfEXPG+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fmfEXPG+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZqJdL2N06z2yFJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 May 2025 17:02:29 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5436xTqb026587;
	Sat, 3 May 2025 07:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QuKtjBt3hT/GfrHBk
	JJJ41nGji5reGHD8O/7cHUZKlA=; b=fmfEXPG+/qtqIvm3HRPDT/5sxdNNnYUaq
	SkpkE7GYedJghsQHOEu60ThLZISzoqMLuNNAaABEaOFaa/psvFAt/vvq23keTojc
	LAdFPKzqH+4wutMeus+YUWC2jzRNYYCZquw6oOuTtnm+WPRTrLLzD3TrGz2/LbgU
	+xjDhJtGS5c2wm4XrEBHiAIQlMAhUQGn59qYUoYdpH+InUzuzqdy/VaNyLqiAg52
	ILjN+Mu8NmQb/1JgI/49lrIppsX+/dCXSqckBQYY+JSkrPoIccLs+RLp6poLZ+UR
	anJYmqOTRSp00GKDT+S3EY7bWozwvZZqjBELIL3nP7O1dFhB43MRA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46daty0fbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 07:02:19 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54372IXT031691;
	Sat, 3 May 2025 07:02:19 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46daty0fbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 07:02:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5434hXQl016174;
	Sat, 3 May 2025 07:02:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a70wc76-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 03 May 2025 07:02:17 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54372DFG41025980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 3 May 2025 07:02:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6882320040;
	Sat,  3 May 2025 07:02:13 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26F2320043;
	Sat,  3 May 2025 07:02:11 +0000 (GMT)
Received: from li-06431bcc-2712-11b2-a85c-a6fe68df28f9.ibm.com.com (unknown [9.124.222.98])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat,  3 May 2025 07:02:10 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org (open list),
        Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH for-next 2/2] book3s64/radix : Optimize vmemmap start alignment
Date: Sat,  3 May 2025 12:31:59 +0530
Message-ID: <14f9b6ef72fa689f3a4d44dfa67d2279bdfd28a6.1746255312.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com>
References: <e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=fKc53Yae c=1 sm=1 tr=0 ts=6815bf7b cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=KK6s22nVDRcosj11uTcA:9
X-Proofpoint-GUID: xNaP3NYbQrqxDkPDIRiItaBNb2GLijEE
X-Proofpoint-ORIG-GUID: rhBcWMEZYFc00FXg1j6mhep_MfLSgS-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDA1NSBTYWx0ZWRfX3AZuql/O7AaW iFIp7veZyiSYnrRssZnL2I3Qpq5LxAl4TPgIDpZzIGhrbjkVrCblN26XTMitMbwH/lZ5IbAxpW1 3IQXAO/c2rN8KjgYBJH8JfMd305CXMobvtTELbsQzQVKpTlQtEFoclI7YoZPsDXgK7md3VYbr9p
 m8c3EgFbIQwFvBuuMa+FcnBk70AvqbQOzpv8hTZTaiN/yA6H5WIkI3bcROmE/YFkGwEbKHBjuwR z2rSMbJ1mUcqsq3vcIou6t6Kb2q+SKkK+GE2oFClVJQjWk6vU3tB2PpEAYCNNgcbV/0NsCIRnSN j0K6Upok/Q9wgm9vNYaFkecG00dl7+qiDZdbV9HDHaoVSqQH/pS5M6PwG7LWgsF2OAnzf9coYlR
 n8i+oZQIu6lJ2/LV3oZ2rg78m+vPWCripsjpkWf9KMIBtclXn+DneeIzDmpNxWMxPzEACdDZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505030055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If we always align the vmemmap start to PAGE_SIZE, there is a
chance that we may end up allocating page-sized vmemmap backing
pages in RAM in the altmap not present case, because a PAGE_SIZE
aligned address is not PMD_SIZE-aligned.

In this patch, we are aligning the vmemmap start address to
PMD_SIZE if altmap is not present. This ensures that a PMD_SIZE
page is always allocated for the vmemmap mapping if altmap is
not present.

If altmap is present, Make sure we align the start vmemmap addr to
PAGE_SIZE so that we calculate the correct start_pfn in altmap
boundary check to decide whether we should use altmap or RAM based
backing memory allocation. Also the address need to be aligned for
set_pte operation. If the start addr is already PMD_SIZE aligned
and with in the altmap boundary then we will try to use a pmd size
altmap mapping else we go for page size  mapping.

So if altmap is present, we try to use the maximum number of
altmap pages; otherwise, we allocate a PMD_SIZE RAM page.

Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 29 +++++++++++++++---------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 3d67aee8c8ca..c630cece8ed4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1122,18 +1122,25 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	pte_t *pte;
 
 	/*
-	 * Make sure we align the start vmemmap addr so that we calculate
-	 * the correct start_pfn in altmap boundary check to decided whether
-	 * we should use altmap or RAM based backing memory allocation. Also
-	 * the address need to be aligned for set_pte operation.
-
-	 * If the start addr is already PMD_SIZE aligned we will try to use
-	 * a pmd mapping. We don't want to be too aggressive here beacause
-	 * that will cause more allocations in RAM. So only if the namespace
-	 * vmemmap start addr is PMD_SIZE aligned we will use PMD mapping.
+	 * If altmap is present, Make sure we align the start vmemmap addr
+	 * to PAGE_SIZE so that we calculate the correct start_pfn in
+	 * altmap boundary check to decide whether we should use altmap or
+	 * RAM based backing memory allocation. Also the address need to be
+	 * aligned for set_pte operation. If the start addr is already
+	 * PMD_SIZE aligned and with in the altmap boundary then we will
+	 * try to use a pmd size altmap mapping else we go for page size
+	 * mapping.
+	 *
+	 * If altmap is not present, align the vmemmap addr to PMD_SIZE and
+	 * always allocate a PMD size page for vmemmap backing.
+	 *
 	 */
 
-	start = ALIGN_DOWN(start, PAGE_SIZE);
+	if (altmap)
+		start = ALIGN_DOWN(start, PAGE_SIZE);
+	else
+		start = ALIGN_DOWN(start, PMD_SIZE);
+
 	for (addr = start; addr < end; addr = next) {
 		next = pmd_addr_end(addr, end);
 
@@ -1159,7 +1166,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 			 * in altmap block allocation failures, in which case
 			 * we fallback to RAM for vmemmap allocation.
 			 */
-			if (!IS_ALIGNED(addr, PMD_SIZE) || (altmap &&
+			if (altmap && (!IS_ALIGNED(addr, PMD_SIZE) ||
 			    altmap_cross_boundary(altmap, addr, PMD_SIZE))) {
 				/*
 				 * make sure we don't create altmap mappings
-- 
2.48.1


