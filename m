Return-Path: <linuxppc-dev+bounces-8280-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2125BAA8D83
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 09:54:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYh80sYcz2ykX;
	Mon,  5 May 2025 17:54:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746431656;
	cv=none; b=PKsJ3Zda2mK2Lx+BdJ1G331jZHLuHuy480183C2iymcXnYI2jPFz1zCMig/+8sfsITZdDPhhFDtf6gj6ryRguydrtxPz04T+acpONS/ueq0DwYNKHVlbCpK1a12hEIkTXwCxbgPLvoDs/4N1V2iu+j5Vb//8h2MUa81t+8ppPrBPan8MC6DEgIbR8NoP4KVbj/9g3YdjrMNRbARfSdwRj/58iIde9eETDXLYHov06hYt8VsQFhN5q2gGdJigpyCOzBoz7Jl3b6LtU4T6vAKI35D9jQtuBZ8m8p5LlLf1YbtljCGxnkVYAvsbcnlH4H0i+IwLPToG78k8rqbxkMNk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746431656; c=relaxed/relaxed;
	bh=cq4PpaxegiAjIYJoq9QwKajFWbqtgkCOCILPIYappAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q1faIebyt2LL42/as94XBYQhyw23PPbYpclhGpaoUJAKGLJQEOmJ7+B8lmimwA7l5NMs0U0RDkIfSHMwPVAG/tofCJ6HrBo1dhG6l947RCsBONLHCxoi3Ha2wFoNeYF3/36wK4XHAp7g4yZc833Pg5OF1ErgpUPWKPOyVZaduaLhlDO4GB9R2iA96vGymkIlPLKo55Dy3xx+aoLqc7kCeqaB+UCq1vizZj2v7LFmPwq5fCJEIHb1Hp9eNiuUV2EoSqZD2BzilkrfXQd9tkLMLIgGuv+M3DB/hEUpTZjcqLcwPiyUYB3cVEEn5OzQxn/WllPP8zwA2c1yE/6gtxAF6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rzZnNnF0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rzZnNnF0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYh725VGz2ySV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 17:54:14 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5451k6YI023736;
	Mon, 5 May 2025 07:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cq4PpaxegiAjIYJoq
	9QwKajFWbqtgkCOCILPIYappAM=; b=rzZnNnF0jPIDd2FiRCEO00fdDmq6xG3n9
	lc2750xwrEa/nMKeqOyNCaBl97QIKQNsyCp1Glrc2WVNKMSSvqGJGKYJA1+5st2f
	L88H6fwEAfD27Cc/jgY/kqmEm7D8z8+SKZsuvjVHRVbuMOp+LgocrE/Pvj97Mss9
	zdCHEAYA0WsxBiFxvtaVBkpy+pdR6ikWxgSH4l2R9ObhxUzQz+/nXVeiKryez4Ro
	2PAooWt2+VjFk3f1FqIWH+UA/yc+KLRJAsS2Tg0yyS5QTE/Nhj9GZSJd+MEf9yow
	5uakAqraQ7aajhKW3NdkTcrciW6E/KMpDw4eVunZha5BnANCyZ9ug==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e6prb46v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:00 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457rxIT010742;
	Mon, 5 May 2025 07:53:59 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e6prb46q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453socB032018;
	Mon, 5 May 2025 07:53:59 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymd4ej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:58 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457rtnJ18940240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:53:55 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 27DD22004B;
	Mon,  5 May 2025 07:53:55 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F018920040;
	Mon,  5 May 2025 07:53:52 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:53:52 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 1/6] powerpc: eeh: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:28 +0530
Message-ID: <20250505075333.184463-2-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Cu2/cm4D c=1 sm=1 tr=0 ts=68186e98 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=oskV64a5kfCWcXsAF3cA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: MfZq2jFJ-1EdAi3oXzvxqHAEJ0sY75Sq
X-Proofpoint-ORIG-GUID: YXee3x0qhlrP4qT24js7DGfSO_cudXxI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfXzUIvQGz295cs kw/YnTkZGLA9Q3u7EaXFY2lpP3KPtW5O7S6Y/IlRSbWcLb726/vGrKbgGCXY0z6NA1Kt6DVFkbR vBYxoGeU764oBy8I6wqdc+ZOs2BSS5Q71xVJ71SqXerCD+AlYKkDQmgKCqo6PLOh0tWs++HXPiu
 wQmQCvbrSbceZsGXjHXhfk2Egsh+5jJ7ObekX2mnMJUU8468SsWXJxYJCFnfXyfwdM/O/w/3oyn TFsvcveBBujGD9hhpQKVWROOtTruwxuRT63lAMGkK0/PGh0XqUVye/9v0klSY4EbTolm1xQ2yGf 6IdI2h/M/onbUiLXGIN3RuACvAEzgkTWu5noumJo6S2yUi/eJSNqfzep5PjhTv8fop1dA46iREi
 dU23AgBts+Cqg2RVUvw6VlUZyoZ0UGuRfeHkJGofrrnu3k/cqDY2Aa00NtKcVpFpHxF9FVHb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=857 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..929474c0ec77 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1208,16 +1208,16 @@ int eeh_dev_open(struct pci_dev *pdev)
 	struct eeh_dev *edev;
 	int ret = -ENODEV;
 
-	mutex_lock(&eeh_dev_mutex);
+	guard(mutex)(&eeh_dev_mutex);
 
 	/* No PCI device ? */
 	if (!pdev)
-		goto out;
+		return ret;
 
 	/* No EEH device or PE ? */
 	edev = pci_dev_to_eeh_dev(pdev);
 	if (!edev || !edev->pe)
-		goto out;
+		return ret;
 
 	/*
 	 * The PE might have been put into frozen state, but we
@@ -1227,16 +1227,12 @@ int eeh_dev_open(struct pci_dev *pdev)
 	 */
 	ret = eeh_pe_change_owner(edev->pe);
 	if (ret)
-		goto out;
+		return ret;
 
 	/* Increase PE's pass through count */
 	atomic_inc(&edev->pe->pass_dev_cnt);
-	mutex_unlock(&eeh_dev_mutex);
 
 	return 0;
-out:
-	mutex_unlock(&eeh_dev_mutex);
-	return ret;
 }
 EXPORT_SYMBOL_GPL(eeh_dev_open);
 
@@ -1252,22 +1248,20 @@ void eeh_dev_release(struct pci_dev *pdev)
 {
 	struct eeh_dev *edev;
 
-	mutex_lock(&eeh_dev_mutex);
+	guard(mutex)(&eeh_dev_mutex);
 
 	/* No PCI device ? */
 	if (!pdev)
-		goto out;
+		return;
 
 	/* No EEH device ? */
 	edev = pci_dev_to_eeh_dev(pdev);
 	if (!edev || !edev->pe || !eeh_pe_passed(edev->pe))
-		goto out;
+		return;
 
 	/* Decrease PE's pass through count */
 	WARN_ON(atomic_dec_if_positive(&edev->pe->pass_dev_cnt) < 0);
 	eeh_pe_change_owner(edev->pe);
-out:
-	mutex_unlock(&eeh_dev_mutex);
 }
 EXPORT_SYMBOL(eeh_dev_release);
 
-- 
2.39.3


