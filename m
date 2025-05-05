Return-Path: <linuxppc-dev+bounces-8284-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 681AAAA8D89
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 09:54:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYhM1L7tz2yrK;
	Mon,  5 May 2025 17:54:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746431667;
	cv=none; b=VcYjPgWEMdz6jyISuGO+3IqQXvN5he8bvMjG3OO2so/+c1N0k1yb1AWAKuosHE71cTTC2gLp81TqD4q0zrjirJ/xnc1w0PBSQ7W4x7yQACh/8W5o0GZ6e4/QVApTS7vsRhtkfI72dDv3drjjzzsTTYX8wFFBWY6DiwzQUmpphO8LtONtBx7Qk5d/hYukJqCHDzEwlozPHVHq4tmqwEPd1/pxdzVnqnvjsP8TOnbkRutY/P2YVa2sz/tGBgkJX+o3OVfTJLptIJaWYH6TJoJmiaZEn2pRlFbwu5k1aFAJND2pNZTLnmllds1ZS47wl/vT/eZ3J0VPS617fd8LeEqxIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746431667; c=relaxed/relaxed;
	bh=g18/V1GPRXjmw65jYDlbKsnidaE5pfNS8dR6suKV/iU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jubiUAE3pcf7JUKSbmORCxYgxiBWBvteHv3JrZ23V1/Pda8ThXyhIxsZJgqZmOmtqqqBoOn+6P5WkiRJ8IOTKmFgM8bQ64eIqKWUU9nvfnMw5F4I3zn1ZGZJE50z23Ky1EX+JrhrdwRy8yLSOM6CVGZP5m4pXQlJXi4XDPVjNpDnhihq8sobMkZxefuu3/2a4HHgjSl6Y270mpGtfEOaIoNRVGo4u3/tZjJ3l9x7h9h+YZDzphoZirlg8yRdFTpgV9k5IvtLyYaNWiz8iyE6qRkutPsB2kitPjhrdLyDsvqkxuWYyQ0zgilJG0XNtQUW7+NBSWfCMcUDCV9YskvD7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hLYZwtdw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hLYZwtdw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYhL3gnyz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 17:54:26 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Lh9VZ008512;
	Mon, 5 May 2025 07:54:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=g18/V1GPRXjmw65jY
	DlbKsnidaE5pfNS8dR6suKV/iU=; b=hLYZwtdwA1aIJKSvYFEBjM4s1HPaAbbMC
	JwQVqXoeCMy3Nvo1AVatEAKextvF8vX1CVb1LF+ku5pWVCDPKzlSf1XvqCdnP4ZO
	eimhqZaTbi1SrxGJ533ZK9OcnU5c1vI7YZcZ7JBs7FbXxcXDbkmgWoOelZ9M/Dpz
	sEuv0wDDwxP20xCUe9AWJsTrS2tJKO5aF8MtwNGtgya+og1z03Jwzm/rxNRoFkqp
	yz1xY8PkNohnuzXUzFq7RMoFAXzmoe/fYrwNXPNR5+7fcNgFM/ZNzQSd2Mvnm3XY
	4xQNbAdDke5bzxOJEq46FcZ2uUr9/Vw2Mop/HyjU8mtfQqtv1Oq0A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1pp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:13 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457sCwm009686;
	Mon, 5 May 2025 07:54:12 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1pp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:12 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5455LKUg013765;
	Mon, 5 May 2025 07:54:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46e0624v9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:11 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457s8rY53412264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:54:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45A1120043;
	Mon,  5 May 2025 07:54:08 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1985A20040;
	Mon,  5 May 2025 07:54:06 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:54:05 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 5/6] powerpc: powernv: ocxl: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:32 +0530
Message-ID: <20250505075333.184463-6-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: nzPlUvyNWAh3fWyh8rGkE3urckNKzglF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX+XCRoWtFRCXP tMggtIN2qkZfJwJOuG+MMjobjoN+6lCVaLNrKluDYhylrb920YyydpYFKKNYfpuiyrzFPjMFxA5 +IvXaOWVe87WaBHp1aqvO9oVSjnA+oL+GN/QBce7AKBhGzufXZp1mYTWWQ9mFzrLby0sPKz22w+
 UCdgiJHHAZ5cdUqB2QDS9BStST5x5D64xt0tpKgttWszsVa+sYlRohou//zNtXT6qJAtET6x8cY AcLUvIteSGBejxGdLWCqdh5YsxtkXikO4bzdsd+NjS8H6Tnw2dPf41TLHFflp1D8GOLGiMBp6f6 Vzo2/RAKr0p7e832J/KQC8CxjwpdqoUnOS/O3JJUYSz7J9w+Z/+MDDje2/lOgUqk37FoW6WeXNM
 nl035uv8wgKS1C4CfNYIrj5ks992O2+K96sw5PLX52Gryqqv8octXjVHj8or94hNSzMhert7
X-Authority-Analysis: v=2.4 cv=O7k5vA9W c=1 sm=1 tr=0 ts=68186ea5 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=Gcc4__3hugxbekPXFGEA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 81p-2ThKUZcSUOoQVy-dUOe7zEz6sZjK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=893
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

use guard(mutex) for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
Acked-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/ocxl.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
index 64a9c7125c29..f8139948348e 100644
--- a/arch/powerpc/platforms/powernv/ocxl.c
+++ b/arch/powerpc/platforms/powernv/ocxl.c
@@ -172,12 +172,11 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
 	if (phb->type != PNV_PHB_NPU_OCAPI)
 		return;
 
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_warn(&dev->dev, "couldn't update actag information\n");
-		mutex_unlock(&links_list_lock);
 		return;
 	}
 
@@ -206,7 +205,6 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
 	dev_dbg(&dev->dev, "total actags for function: %d\n",
 		link->fn_desired_actags[PCI_FUNC(dev->devfn)]);
 
-	mutex_unlock(&links_list_lock);
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_ocxl_fixup_actag);
 
@@ -253,12 +251,11 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
 {
 	struct npu_link *link;
 
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_err(&dev->dev, "actag information not found\n");
-		mutex_unlock(&links_list_lock);
 		return -ENODEV;
 	}
 	/*
@@ -274,7 +271,6 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
 	*enabled   = link->fn_actags[PCI_FUNC(dev->devfn)].count;
 	*supported = link->fn_desired_actags[PCI_FUNC(dev->devfn)];
 
-	mutex_unlock(&links_list_lock);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pnv_ocxl_get_actag);
@@ -293,12 +289,11 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
 	 *
 	 * We only support one AFU-carrying function for now.
 	 */
-	mutex_lock(&links_list_lock);
+	guard(mutex)(&links_list_lock);
 
 	link = find_link(dev);
 	if (!link) {
 		dev_err(&dev->dev, "actag information not found\n");
-		mutex_unlock(&links_list_lock);
 		return -ENODEV;
 	}
 
@@ -309,7 +304,6 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
 			break;
 		}
 
-	mutex_unlock(&links_list_lock);
 	dev_dbg(&dev->dev, "%d PASIDs available for function\n",
 		rc ? 0 : *count);
 	return rc;
-- 
2.39.3


