Return-Path: <linuxppc-dev+bounces-14867-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA5FCCCB95
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 17:22:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXGCQ2NKQz2xrk;
	Fri, 19 Dec 2025 03:22:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766074930;
	cv=none; b=PGWNl1LfYIixIKyDvRFjlBZZOWsQCb8mcLRmcJ2Ljcbcnv2XE67+tdr7ivx5BhR0Fj4KVFx71+iFRii/IBzg2rjjkLEfrlKRWyFilqjU6nZPykGjfU+0SuMY/epI0z8Cv/nDTyVQ9m3N8zx8j7HuBBJ5rUn+DT5FoLynobhlIDDPCTUf87/Lwf8DlfusqHSSWv5WBiV+Xy/uI5G3Cz8iNvdzEhkW2Ac4VAsA/ikKRbS4EaVNfOxQVPmR1YkipcoPhKps1/UkUzsgzL3EiwKVeOBIY1qojtEcGGAVPUv9w8qXkqGbqG8JfQe43XiCjI/FdHrDxyP0vghS6McaVft/+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766074930; c=relaxed/relaxed;
	bh=G4CtP4H1VMJ0P7n7fJEEDyi8qInM67QjrH0wof4WfOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZV1hOMGv2PhbgoLm0KAiP4DW5G86P21CNJB3mTIZGDVlCvFI4Tq6xqSe3Pk7JfnE9WbElPLkuQ3yG8WxeGQJ3uIz/J5eExuuq/+jT36THPTVlxOcXtMVNd1qJBQ0QGTGsr4vZi2GUASMx21eReGQJuxGA0VH5/PVhiRp/72037bMCR/THiX/BXJ84ec8kUniDK+vm1wPWrwahcGVUdKA+K9CORDtofXdyRg3DziFrXbuikvV7hZkhcpQh1/XJ63ElzekHjYGFo8SLIeoBoAEk8ZQpHpL99UphSz7R8nSq9cGcH3xkjAzxaoBFn/p2wFAC/Cy9LBwXFSsIjjPE+DBJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KaBPjcQU; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KaBPjcQU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXGCP2N7Hz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Dec 2025 03:22:09 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BICIjcm011903;
	Thu, 18 Dec 2025 16:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=G4CtP4H1VMJ0P7n7fJEEDyi8qInM
	67QjrH0wof4WfOs=; b=KaBPjcQUPiyMsPBv3Iuc+WLeGO/o/2nZzdoDTuUwcW8Y
	l0WR3InyPT3SBYaX1hL61rvPmR7zrw2dEAHYk0/VNcdNuDR7820Pmn7d6fuDynLM
	hR73mbe5hOPJ4Zenj/39ddf6T9g785vTFnnUyiiK1b/m3KQVV8fUktJTrXg/O+oh
	EBjfN764E3YBSIxeaAIZPprdfgo1ZzWYt13GI7FwCbtGNxG17Y8lqstRIkSqREJ1
	gPqmgYSlb2zoIqH522PcNIA32FYkE541IGi3WmNxD4mk7KdLbctChvs7pFwYnxfT
	Jfob79A6WBBnYO204MWAJ9+GGmx01ZArmrq84Yanew==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4b0yn8uqnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 16:22:05 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BIG9Pto026777;
	Thu, 18 Dec 2025 16:22:04 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4b1jfsskcd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Dec 2025 16:22:04 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5BIGM3eP65929656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Dec 2025 16:22:04 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9C85258054;
	Thu, 18 Dec 2025 16:22:03 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E7C35804E;
	Thu, 18 Dec 2025 16:22:02 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.36.16.51])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Dec 2025 16:22:02 +0000 (GMT)
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Fri, 19 Dec 2025 03:21:56 +1100
Subject: [PATCH] powerpc/mm: Use pte_advance_pfn() in set_huge_pte_at()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-set_huge_pte_at_pte_advance_pfn-v1-1-e3378845af7d@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQrDIBRErxL+uoIKJUmvUop8zJj8jQ1qQ0C8e
 yVZPd5bzFTKSIJMr6FSwiFZvrGLeQzkN44rlCzdyWr7NNbMKqO47bfC7QWOy43l4Oh7ClFphpn
 0OAXvmfrKnhDkvB7en9b+2wRVtXEAAAA=
X-Change-ID: 20251219-set_huge_pte_at_pte_advance_pfn-0ae18078fcca
To: linuxppc-dev@lists.ozlabs.org
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
X-Mailer: b4 0.14.2
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEzMDAxOCBTYWx0ZWRfX4nt5JwFrmbTF
 6oPv9/bHQbWYypNVKk9NNV3oh5gs11BWh1UNKo6jTOwr43QRQ1By/yhUG/KeBmYw4YSQNE2ip4n
 IK11yYrh2NEN68Lbf9DCPax0n2k+MBC6iimH23VjNzFUC5bUjCCz+uclhzOX1aDJYvzTaK2K1wK
 o6DHfA1trgJwjgnJsuqZ70uK2FaMLo5BtmxdqdPKpypOuSJQ3gez+UIHk2N7oG8B91U5OfshK4v
 KntgX2iIZRZYnJKzCB1B0kJkz5OW1q2Uqc76bfu12GQJnldzRhDKdY+9zltkCrzLszI2zH3YLG4
 DtrPJBWpkkChtCuBqp+hbmbE4xh335297LFcgjoMRdSM1PDldppUQIrqGCnMc/y80ryPdi5rHfH
 UzAFiMPJKAnBXLIrUvV2Y0Sexwg1cg==
X-Proofpoint-GUID: CYPCyyKsYZyUYJsRRJ8Dsdw4E_cvczpG
X-Proofpoint-ORIG-GUID: CYPCyyKsYZyUYJsRRJ8Dsdw4E_cvczpG
X-Authority-Analysis: v=2.4 cv=LbYxKzfi c=1 sm=1 tr=0 ts=69442a2d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=szuQGY2sWp9FMgvQqn4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_02,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2512130018
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In set_huge_pte_at(), replace the existing open coded pte value
calculation with the new helper pte_advance_pfn().

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/mm/pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 56d7e8960e77d877390d6bcbf0d8a305cc222101..9073e373e1e8a88f904cae592e1e8c34707545e6 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -365,7 +365,7 @@ void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 
 	for (i = 0; i < sz / pdsize; i++, ptep++, addr += pdsize) {
 		__set_pte_at(mm, addr, ptep, pte, 0);
-		pte = __pte(pte_val(pte) + ((unsigned long long)pdsize / PAGE_SIZE << PFN_PTE_SHIFT));
+		pte = pte_advance_pfn(pte, pdsize / PAGE_SIZE);
 	}
 }
 #endif

---
base-commit: ea1013c1539270e372fc99854bc6e4d94eaeff66
change-id: 20251219-set_huge_pte_at_pte_advance_pfn-0ae18078fcca


--
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited


