Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08CD46AC5C3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 16:44:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVjYG5B3Qz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 02:44:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RwF+WS2s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RwF+WS2s;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVjX324Msz3cgx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 02:42:59 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326E4LLY001767;
	Mon, 6 Mar 2023 15:42:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=gRD8JJYANQoaDeDDLwQmfnykMhkvwfwnnj9U9gA27mA=;
 b=RwF+WS2sbs3pY6qpfiH/Mg/AiGkJtDL8Szo/CPP7ILaGTWas7c2TsmUOBH8lsq/xJoLk
 9hMlK1/JvSePnTiOkaPypLnXdW1ylzqjK/9AMyWCkkFpGxrMkIEeU3z+iu5G2CnV1uRw
 ruu5QY5uc9tZ366jnawo0hd5shRT73Ps7Eesp27mOXB1aQ6ZrfHdoceqr29se8/q6H4i
 QQo5Kc5FiH/dmfFKAFaMJuGjLiPTq/hkpkoyFJfzwQYT8YJCgvu4MX9sSAZJMTzU8eT3
 Uh1k+v6Wfko4XGThcQ14+6LL8eyUZNJlVcuSEub/7ND/rFaV5tTJflpY/ofF0ZG8yctt 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p507nyvs5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 15:42:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326Ce6F2002185;
	Mon, 6 Mar 2023 15:42:51 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p507nyvrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 15:42:51 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326ChqkM030497;
	Mon, 6 Mar 2023 15:42:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p418ctwy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 15:42:49 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 326FgjHX60948904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 15:42:45 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B6E5A2004B;
	Mon,  6 Mar 2023 15:42:45 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F73420040;
	Mon,  6 Mar 2023 15:42:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.101.4.33])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  6 Mar 2023 15:42:45 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: [PATCH] powerpc/mm: fix mmap_lock bad unlock
Date: Mon,  6 Mar 2023 16:42:44 +0100
Message-Id: <20230306154244.17560-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230227173632.3292573-32-surenb@google.com>
References: <20230227173632.3292573-32-surenb@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TOFUYNI1VTUM3RFw2H_83gmSy3TZcZN8
X-Proofpoint-ORIG-GUID: mnzNAchC0gIq82GWAbKWIQCKzlMizBE8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 mlxscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303060137
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When page fault is tried holding the per VMA lock, bad_access_pkey() and
bad_access() should not be called because it is assuming the mmap_lock is
held.
In the case a bad access is detected, fall back to the default path,
grabbing the mmap_lock to handle the fault and report the error.

Fixes: 169db3bb4609 ("powerc/mm: try VMA lock-based page fault handling first")
Reported-by: Sachin Sant <sachinp@linux.ibm.com>
Link: https://lore.kernel.org/linux-mm/842502FB-F99C-417C-9648-A37D0ECDC9CE@linux.ibm.com
Cc: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
---
 arch/powerpc/mm/fault.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index c7ae86b04b8a..e191b3ebd8d6 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -479,17 +479,13 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 
 	if (unlikely(access_pkey_error(is_write, is_exec,
 				       (error_code & DSISR_KEYFAULT), vma))) {
-		int rc = bad_access_pkey(regs, address, vma);
-
 		vma_end_read(vma);
-		return rc;
+		goto lock_mmap;
 	}
 
 	if (unlikely(access_error(is_write, is_exec, vma))) {
-		int rc = bad_access(regs, address);
-
 		vma_end_read(vma);
-		return rc;
+		goto lock_mmap;
 	}
 
 	fault = handle_mm_fault(vma, address, flags | FAULT_FLAG_VMA_LOCK, regs);
-- 
2.39.2

