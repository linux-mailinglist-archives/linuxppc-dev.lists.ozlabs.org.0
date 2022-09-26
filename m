Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D685E9B53
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 09:59:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbZs11DB9z2yph
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 17:59:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Au998qhB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nicholas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Au998qhB;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbZqd08hbz2xmw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 17:57:48 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q7oANP026849;
	Mon, 26 Sep 2022 07:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4UhhpDlbLiuPghapKpJLruLUpcamZRhrdG0W7HtSKu8=;
 b=Au998qhBMuDOg+Nd3mURojm0tWZ4hQDk2oGha41ssXptN7MEeCw0ysZAevCqIlXQYMSM
 iJiUbsA5Bh8pQL+tAMq1JyrohtpEWYPKnJXdbbhEFrzJMRv7tUp8evGg6gGDFFhd4BTb
 EiHEkjv4PgRWf0jdD5sD/ba5MEyJeGARMQaVWJiS65atbcjY89W2RE5R+fLltd6hhGCt
 dMi0q8PoW5NFY+OI8q50l0mTagd1EoSeTvcJNjWWwh/MYAdTnker2O7x1L99A5IIjMBa
 suwkKOkSKMqUERlrcBGAVCcbvLcEGAueR+MhERTigp0uzarADq0JKTNq2LjzU1aDwbON jw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ju81p86vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 07:57:43 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q7phXg027098;
	Mon, 26 Sep 2022 07:57:42 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04fra.de.ibm.com with ESMTP id 3jssh91jje-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 07:57:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q7rSEt31457790
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 07:53:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A318111C05C;
	Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E60311C052;
	Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 07:57:39 +0000 (GMT)
Received: from nicholasmvm.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B69A56058C;
	Mon, 26 Sep 2022 17:57:36 +1000 (AEST)
From: Nicholas Miehlbradt <nicholas@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/4] powerpc/64s: Allow double call of kernel_[un]map_linear_page()
Date: Mon, 26 Sep 2022 07:57:25 +0000
Message-Id: <20220926075726.2846-3-nicholas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926075726.2846-1-nicholas@linux.ibm.com>
References: <20220926075726.2846-1-nicholas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0DuXNMeiK4sqNP8d86pZfWbZBf0AGaqK
X-Proofpoint-GUID: 0DuXNMeiK4sqNP8d86pZfWbZBf0AGaqK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_05,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260046
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
Cc: Nicholas Miehlbradt <nicholas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

If the page is already mapped resp. already unmapped, bail out.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index e63ff401a6ea..b37412fe5930 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -2000,6 +2000,9 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 	if (!vsid)
 		return;
 
+	if (linear_map_hash_slots[lmi] & 0x80)
+		return;
+
 	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
 				    HPTE_V_BOLTED,
 				    mmu_linear_psize, mmu_kernel_ssize);
@@ -2019,7 +2022,10 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 
 	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
 	spin_lock(&linear_map_hash_lock);
-	BUG_ON(!(linear_map_hash_slots[lmi] & 0x80));
+	if (!(linear_map_hash_slots[lmi] & 0x80)) {
+		spin_unlock(&linear_map_hash_lock);
+		return;
+	}
 	hidx = linear_map_hash_slots[lmi] & 0x7f;
 	linear_map_hash_slots[lmi] = 0;
 	spin_unlock(&linear_map_hash_lock);
-- 
2.34.1

