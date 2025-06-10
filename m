Return-Path: <linuxppc-dev+bounces-9232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D85AD2BD3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 04:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGXPZ1x5qz2xHT;
	Tue, 10 Jun 2025 12:12:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749521570;
	cv=none; b=YTDrauV2bBAu3TU5BeLsvZgyEygsTfGCc2V2uUICKKey2XEKDVR9AMUVtRhs03hKspJ9PwulQuUBX/ya1ZUBrpSELhZQE9EHLa2vyHXcuQy7u5OXbUdGeOcfSWN0GHhuOiXp4qT9fS/zHs13QAdhIFx3UzB0w7PMkRIcFltUJAeufPBDVK13+a04G/pGrHBgWnuKDasgh6uO5C3nIxITe4P1KMgjzeFAyExe1Pn6N/HFD4vBXONV1qbJZM6m9oQHxUUMri14mpkxFbQar3+F5Bn54Ov8B3z389mFDLHwoWoJUaN34iafWaipIvZmiceCBkRyf6GIZJVj6efSEYDsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749521570; c=relaxed/relaxed;
	bh=ddPd6zD4uwOjio8JI/UTJ8dqvKPUoNyzlpOiuHvbj5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=J8+rNmECu3yM2cnDM/42UjRaFpvaCESlGhjmoKRMH6LKDLwbYddjhNZKI6RlPXhQ6M584eg2kRS70QYF7Rf6UJufDataejKmV0CAcMn4aKFOJTZnAKPMp4PK2RjjZwtbAfOlq0pGfoWmjid55WLSe3VtQa52afnSaFe3d+r+Z2XHMd93MeLLsopiUXBEtq8XoBHV2f8os0hQejjxAO/Zmr0JdbpKP8gstIDiufukkyJ02w6blYxCUzV5j6ZqORCbr4GFmkut9SohVSBMrsDyqEDlLxJojOXDh1EwABsv5lfF3y8hQjLNCtICodqI1JeeOJ0DAolVowiRaDdZ7RWRcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hZU+epjS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hZU+epjS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGXPY2FpTz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 12:12:48 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A0AlM9001755;
	Tue, 10 Jun 2025 02:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=ddPd6zD4uwOjio8JI/UTJ8dqvKPU
	oNyzlpOiuHvbj5Q=; b=hZU+epjSAcQzZJQ4JNO0hTvcYyxH2ib9qSSEDV7o+TxE
	qDbiX1JjWdxrd5sLd5YJhuAOf7s0Duk+2ptc6oh+5wh7uEa6Djzv85SmfVMA4Lw8
	uDIMXg2EMd1wD2ffhHhNt8pzIuDkrVBjKKhDXN/Kp1XSo/unSfV+TnOSNPZ+oFit
	ASXKb5SU42Wnr63vofKyDAqt+tIe8m+22TDhlOJbqJE26M5bzRhR7uTylxE1+RZR
	qOd4m6ruNU/BiyHKyXMNIThTmDLCEkdIKBa69ZV8OniexxuBnlH+/ZGkLY/3krhy
	sIPLoUui3ZWXhB3lOzWdNXn73gAnawVV8Sto9Bv5zQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wygbfe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:12:39 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55A2CcEf029909;
	Tue, 10 Jun 2025 02:12:38 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wygbfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:12:38 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A13GSh003329;
	Tue, 10 Jun 2025 02:12:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4751ykg4kp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 02:12:37 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A2CaVv50528682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 02:12:36 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E63422004B;
	Tue, 10 Jun 2025 02:12:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77BA020043;
	Tue, 10 Jun 2025 02:12:32 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.59.164])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 02:12:32 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Jonathan Greental <yonatan02greental@gmail.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 1/2] powerpc/powernv/memtrace: Fix out of bounds issue in memtrace mmap
Date: Tue, 10 Jun 2025 07:42:26 +0530
Message-ID: <20250610021227.361980-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 7W-g5CcCZy8t6X48cYFSrrwZxPgc7IIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDAxMiBTYWx0ZWRfXzt5E16n3SgFm 6VTHdyBfg0dfQG7tPDC8mYTMptww011CSrVLhss0pYRq54NOfTgOuB7wHs8agwUPchM9sEJhvjb B0BSLq2PI0vhUkiOX9sk2d1GnhV3SCef1db7A9bI94nX3o0sACVFhR5IVzDWvvSXYDPuBvgyLZL
 eY2cNsS8CVbjC44Wlio4lpOgcWYhaXGs2lLKhB3E03XqXpo+pE9J3/xHoTUI6wnMJ58TrBCqmQZ B6a86jkZB1PSbm28RYcIG/G/Eyvquk+yjvi/jOoP1lg+g6JK5Vz04LjFkmofJc7o1SkyvwpgWli d1kZABu9PT09adGWn1Ucdy+pmQXKgjwgfHrT7hQG2xTUVtNeNESnm3HilUJaBebJXM3C6QcWG4J
 zOVBj87PZzJ09Ku8XZJqBy222ydr3LvrtE0PTlK0wYToGyR6xeSbe7xpCjgFuLYQeqB2miIL
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=68479497 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=yWasuCwG_PDcfSmRewwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zUgJYuAJS2rzsqH_K76RBVS7y2zTFF4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_01,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=740
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100012
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>

memtrace mmap issue has an out of bounds issue. This patch fixes the by
checking that the requested mapping region size should stay within the
allocated region size.

Reported-by: Jonathan Greental <yonatan02greental@gmail.com>
Fixes: 08a022ad3dfa ("powerpc/powernv/memtrace: Allow mmaping trace buffers")
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/memtrace.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
index 4ac9808e55a4..2ea30b343354 100644
--- a/arch/powerpc/platforms/powernv/memtrace.c
+++ b/arch/powerpc/platforms/powernv/memtrace.c
@@ -48,11 +48,15 @@ static ssize_t memtrace_read(struct file *filp, char __user *ubuf,
 static int memtrace_mmap(struct file *filp, struct vm_area_struct *vma)
 {
 	struct memtrace_entry *ent = filp->private_data;
+	unsigned long ent_nrpages = ent->size >> PAGE_SHIFT;
+	unsigned long vma_nrpages = vma_pages(vma);
 
-	if (ent->size < vma->vm_end - vma->vm_start)
+	/* The requested page offset should be within object's page count */
+	if (vma->vm_pgoff >= ent_nrpages)
 		return -EINVAL;
 
-	if (vma->vm_pgoff << PAGE_SHIFT >= ent->size)
+	/* The requested mapping range should remain within the bounds */
+	if (vma_nrpages > ent_nrpages - vma->vm_pgoff)
 		return -EINVAL;
 
 	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
-- 
2.46.0


