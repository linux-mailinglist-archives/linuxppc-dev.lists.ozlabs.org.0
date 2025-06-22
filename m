Return-Path: <linuxppc-dev+bounces-9612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA7AE2FB8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 14:01:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQ8vd3zvCz30VZ;
	Sun, 22 Jun 2025 22:01:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750593709;
	cv=none; b=SJ6XvJhT5+mzlCiURndwgjbQ7AQByUjzBVB+S65bw7EVYyFkxF6PaL/rAPCKkhuQbFzG4jZz1eep+zC9BnKgBCon4GsTThW3TOtWOXM1Wu4tB2Xh8KNNEAT+Vahr6CgFeWtfWQ/VPYX57lonXEHe/oouM0RuVpvh526GMetzAtrR6r5KAS8FeWu+XA8sRyVY6hBs4H6d0Av/jHz8dIGGuBOrVYOdDEd0n+9gnTIAsB1bnfLLkiIAxod4d2jGXhhzccxdAvZIAda7U1XSwsgZiji8RXTxCNWp24jvIPbCglHDl/6En8GXJqZLRrNmbM3BvwXJC/WKoZCuPPUq6W7a/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750593709; c=relaxed/relaxed;
	bh=ef0VbalxgvFFroWpQ1CXd3B27NS/ujuqE1tR87+85m4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5HzmO8eBetQPlwR6CPD+EEcF2HLcka9jR2dzuLy0nmEKjRfgQe3RKsinjp2BbRLgzgYOdueiDCnuYbNlPEH+ebWTNMo+CWdEBjSAUNSAoqD88Jnch4pr+oiXdxCYix3Vm1ae0FvvKaX409At2uDfkfeNDDGHWdBvbNjG/YylNcVvVJrPm/vU4wCzDfjEvrEjXdLTzRh8J+eah6AdiyO0uoXoQlD53ZmCYNr6QIKM9fL+smis2KrxkB2O7c7Hzx+zLAGRC2w77D3loeJ0Y9DhdHem4cR0X4C/hbEuIguM9h/A5c9jLyfVlCw63XifgUUEGFOMWpp+gTW/F3MrLBWcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QYq2GBVZ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QYq2GBVZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQ8vc3Fbbz30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 22:01:47 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M9maoS010062;
	Sun, 22 Jun 2025 12:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=ef0VbalxgvFFroWpQ1CXd3B27NS/ujuqE1tR87+85
	m4=; b=QYq2GBVZk+4/oF4Bwp1Ng5dh4pxa0jtPIYx3cNO68Es/ftXOE5681ALlp
	YZVthtLjos2yOJCaiIhsWNcqkc678B8LnD0TsSPhKcirxU9mci/GnwKi7k62LQnC
	WsD/oF1cUWiMHwhRrJaGSrWC/5FcEQhEnULEq2PH0Za022o2+7krn3vPFf3uwrwW
	o75GojY7p1jk/6cPdOyDlAHxD3/ltEemLc4sQxkhLMk/7MRWSkXnitlhjTZnGGK9
	lhRyIBfK8nzcrf7fsnSDpSVZf2t/C3Uvz8nNZ8H5TFcZ+jKtXiPVqxP0WNdm+NCZ
	xiXL59TNeFZkoGp65F76ytT0be61A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfdvkn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:35 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55MC05sC007533;
	Sun, 22 Jun 2025 12:01:34 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dmfdvkmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55M7gNqq002908;
	Sun, 22 Jun 2025 12:01:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e8jksjb5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 12:01:33 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55MC1Tvs32899770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 12:01:29 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5008820049;
	Sun, 22 Jun 2025 12:01:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE20920040;
	Sun, 22 Jun 2025 12:01:27 +0000 (GMT)
Received: from ltczz402-lp1.aus.stglabs.ibm.com (unknown [9.40.194.31])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Jun 2025 12:01:27 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Ritesh Harjani <ritesh.list@gmail.com>,
        Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, Donet Tom <donettom@linux.ibm.com>
Subject: [PATCH v2 1/2] book3s64/radix : Handle error conditions properly in radix_vmemmap_populate
Date: Sun, 22 Jun 2025 07:01:24 -0500
Message-ID: <7f95fe91c827a2fb76367a58dbea724e811fb152.1750593372.git.donettom@linux.ibm.com>
X-Mailer: git-send-email 2.47.1
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
X-Proofpoint-ORIG-GUID: Ko-1ZNUOnmS_lZIXjpwNo6inw7KsRJHM
X-Proofpoint-GUID: bIjkYh3LCsCiCwK1X0Xbl0EkN5pl16-Y
X-Authority-Analysis: v=2.4 cv=BpqdwZX5 c=1 sm=1 tr=0 ts=6857f09f cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=ttLXqP_FGL-iw6hVZZ4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA3MiBTYWx0ZWRfX3C+tcKRn30zn 99Tqk3xu9v5yicEvgMQ6QLqrH4K8V8iVD6l9yXZAAd9jt6ykBS78WBmHXDnYy0RFnQmYmV+Kizj NL2Q86qcyGJOc/e/utWpIiCVwd5xxEf0+JNs2K1nnIjTW3rVuCv2WeVs+yJXKi3QGSBNazd/tb5
 LPjvEOYt8llhVOG3HCVzFqvT+S0AgrqOcIOKbMzeRKZzqZ+lstnP00DJZWvhk3U6VoRUaOvz7dy 6bajVi8HnLzxHywYlp0pU9v1pAnqGGTV74r97yYkKH9b7J2o0BPUEo27IJGCOCyTu7xIsLsPAtj tlx46YO4vgRf9E8a0OLPhJLBT4vjhCWjrzygajjnnvY+HLZQoCc6+c8e/3xN9eNwewlHuk2qatM
 SuNOJCjIDF5MmHbpt1B9ERxMokY+sw8D03MK7bQaIlBaFV2pPNcFct1nOHb8Glob5q5UEulg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxlogscore=720
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220072
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Error conditions are not handled properly if altmap is not present
and PMD_SIZE vmemmap_alloc_block_buf fails.

In this patch, if vmemmap_alloc_block_buf fails in the non-altmap
case, we will fall back to the base mapping.

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Donet Tom <donettom@linux.ibm.com>
---
v1 -> v2 - rebased to v6.16-rc2
v1 - https://lore.kernel.org/all/e876a700a4caa5610e994b946b84f71d0fe6f919.1746255312.git.donettom@linux.ibm.com/
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 9f764bc42b8c..3d67aee8c8ca 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1173,7 +1173,7 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 				vmemmap_set_pmd(pmd, p, node, addr, next);
 				pr_debug("PMD_SIZE vmemmap mapping\n");
 				continue;
-			} else if (altmap) {
+			} else {
 				/*
 				 * A vmemmap block allocation can fail due to
 				 * alignment requirements and we trying to align
-- 
2.47.1


