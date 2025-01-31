Return-Path: <linuxppc-dev+bounces-5741-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB4AA23D36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 12:39:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ykv731FwZz30W4;
	Fri, 31 Jan 2025 22:39:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738323551;
	cv=none; b=kwcGDSqLyWQEWRI4g6QClyj9tiGMc2Yqx6fRHPbfAK+PLE7KHf73lfxBu0EBiiLFmC0mDc/wAe7IIAR+z3S/cFLYC11ipX6sr5WAYjGfMoKfn0C2BBZpU+PxyEVNPgFTxmx2dIRTRmuXdeqLpLxaa41HdJqJrN6n6Ty0Nb+Xp3Qkqm3GvsyaYJ2H4qT64+q+/Eq6yiJ9imI07cScld9AF4mdnc7GS/Aw8hABDMyjENhattiSThB5Zw0BRA04aAMFT0slsPGh3KY9K5HbIvWz4ArlpHipoYESHZUCs5PduY+12Pd7krUqj1+dmwWUiTBoak58iQnZSpj5hrOslllqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738323551; c=relaxed/relaxed;
	bh=clpl7xQ0yaQp9TfGzpaWmiLCwaf5fcSluD2eOBnQoEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dTR+vyk5tuw40MBdLc7gftX4AY5nQVZ22ooSXTVu2sp8z59edhJfQ4Qy9EjMpy8rOzHjJzpqIA+HiiI+pKzHw+9Ru8u/iDZ4ZTPY957vOumhbPbx7DqIRk0jW1nlMKkZfoJhGdlUX9mL3u/4pZM3CBSsp0ebz+TbS5rJU5VFFEzeeO9yLyRIOJOIRt0pQcHv3nbbbCYDpLB3D2Z9aE1QiFAIDgI+3R8wAcXr3BVktR/4k9N4w1OuYIpVOuzHM44xOKvvky4+/S4axJ04PlxwLeVOORLxtdupgTCZmo2143qQPbBCv4XaJ+K/HIaKAgw01pFgUrURADFnIexOseKPaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hDgdvC4p; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hDgdvC4p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykv721jmkz30MM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 22:39:10 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50V2OJgT016476;
	Fri, 31 Jan 2025 11:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=clpl7xQ0yaQp9TfGz
	paWmiLCwaf5fcSluD2eOBnQoEE=; b=hDgdvC4ptpcATZHhqEiH1t2MFv5AD+wVC
	awMl6mS4Ji3t1YvczK4G9j+VbGUzrQOQpjXETZDRgz12LRiaCfhbbl7uXDeaOues
	osCrhHZusorCEqZtL4KmdVmTrns+FQ+keq/lSYwO8nvNTUCkU/5VTk1FcfSspM13
	t66SMVrNP124dvyTR5cPcXbou7QXL14FiFDnA6T/QRMIekR0WdP8Y/QqRwIx8Sw3
	0FmzozmLkfDK09yeLJeiE2TfO/FYxVZWv1Xa+/MqoFGqAC3M6lrh451Q7O8d1POk
	uIRpmeTJ183fON33oCjMvcpyc8BY4BYm4QLiMre8guJIBwqFzAe6A==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44gmk925r7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:39:00 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50V88j0p013883;
	Fri, 31 Jan 2025 11:38:59 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 44gf93bb39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 Jan 2025 11:38:59 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50VBctvr10551742
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 31 Jan 2025 11:38:55 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C81720101;
	Fri, 31 Jan 2025 11:38:55 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BD22200FD;
	Fri, 31 Jan 2025 11:38:52 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.16.21])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 31 Jan 2025 11:38:52 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, kexec@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/7] crash: Let arch decide usable memory range in reserved area
Date: Fri, 31 Jan 2025 17:08:26 +0530
Message-ID: <20250131113830.925179-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
References: <20250131113830.925179-1-sourabhjain@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4ZqbfbbS3Q6GLbeMVSSS6aul_oN0FR2N
X-Proofpoint-ORIG-GUID: 4ZqbfbbS3Q6GLbeMVSSS6aul_oN0FR2N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-31_04,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 adultscore=0 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=912
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501310087
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Although the crashkernel area is reserved, on architectures like
PowerPC, it is possible for the crashkernel reserved area to contain
components like RTAS, TCE, OPAL, etc. To avoid placing kexec segments
over these components, PowerPC has its own set of APIs to locate holes
in the crashkernel reserved area.

Add an arch hook in the generic locate mem hole APIs so that
architectures can handle such special regions in the crashkernel area
while locating memory holes for kexec segments using generic APIs.
With this, a lot of redundant arch-specific code can be removed, as it
performs the exact same job as the generic APIs.

To keep the generic and arch-specific changes separate, the changes
related to moving PowerPC to use the generic APIs and the removal of
PowerPC-specific APIs for memory hole allocation are done in a
subsequent patch titled "powerpc/crash: Use generic APIs to locate
memory hole for kdump.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: kexec@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 include/linux/kexec.h |  9 +++++++++
 kernel/kexec_file.c   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index f0e9f8eda7a3..407f8b0346aa 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -205,6 +205,15 @@ static inline int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 #endif
 
+#ifndef arch_check_excluded_range
+static inline int arch_check_excluded_range(struct kimage *image,
+					    unsigned long start,
+					    unsigned long end)
+{
+	return 0;
+}
+#endif
+
 #ifdef CONFIG_KEXEC_SIG
 #ifdef CONFIG_SIGNED_PE_FILE_VERIFICATION
 int kexec_kernel_verify_pe_sig(const char *kernel, unsigned long kernel_len);
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 3eedb8c226ad..fba686487e3b 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -464,6 +464,12 @@ static int locate_mem_hole_top_down(unsigned long start, unsigned long end,
 			continue;
 		}
 
+		/* Make sure this does not conflict with exclude range */
+		if (arch_check_excluded_range(image, temp_start, temp_end)) {
+			temp_start = temp_start - PAGE_SIZE;
+			continue;
+		}
+
 		/* We found a suitable memory range */
 		break;
 	} while (1);
@@ -498,6 +504,12 @@ static int locate_mem_hole_bottom_up(unsigned long start, unsigned long end,
 			continue;
 		}
 
+		/* Make sure this does not conflict with exclude range */
+		if (arch_check_excluded_range(image, temp_start, temp_end)) {
+			temp_start = temp_start + PAGE_SIZE;
+			continue;
+		}
+
 		/* We found a suitable memory range */
 		break;
 	} while (1);
-- 
2.48.1


