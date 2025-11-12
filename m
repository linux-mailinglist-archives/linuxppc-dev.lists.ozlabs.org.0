Return-Path: <linuxppc-dev+bounces-14130-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F45C539BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 18:13:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d693k0bs0z2yvN;
	Thu, 13 Nov 2025 04:13:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762967633;
	cv=none; b=it9QrF38HiDZBQsOewz5InZ+46Uraaq2LsvnihLJwBx7uk3zCGwhFl6vSdWl4r5fUKMMEu57KgAGctwAgIrwaI8dICuvb+hYs7hXd+wIA+8AhWt9Tr05mqxI4NqYkRHBLBdj3fSN8xo2CRb90P8EEPKd2qHrLaOVxllEAK55tjlFIL0t6sJbMhnnGa9cVLI5NuDJlyo5zE+KfhuzPN/GrgqXGFiifa46RPpJlaJhQr6/TGAwc+ERaxMCrOCJsB5EJsLaVwuFoBQ94/xYzKJC4lYDYkQrGRVhrrvfXxT5ZeOQSn49LJFHus+BSbrjdPUWSkS73sBKyp0Gcq+R7HT5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762967633; c=relaxed/relaxed;
	bh=SblB2KAmTuwKP3qBb4spBPUSKpxGRH6EYqk/7ae5JNI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y7jkx+NxBWbeKOvpWSzM19w6pVcahqffVy5i4TKz2xEaulG70T/BuyPVdqyR2656YhbYjmYY89fVijsXZ37exXfP6f1/mHgCBQYVSxGiluqWpEBeQK7WjZKuv7uVVyz7cv+AkB7n24NXJaI+AktC3Cbc992GIefFDnmaNndNOHYen6wXooN/sf8vToU0xHPusbUmzz+Gtmn3ZeS79mvj2q88f+QP0ppHsocTIpatSUrb1F88YG0ptiiNUOQ574ll08fZU9KyE9rvD+KYK46fn5WBIRRmskJ0Vq97CIlGK2puU1Gd4rfZILsLs4uUpMmhy6nRb1WuRCRJH+RZs39oeA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rLUewenB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rLUewenB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d693j0gdnz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 04:13:52 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACFrTc2025879;
	Wed, 12 Nov 2025 17:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SblB2KAmTuwKP3qBb4spBPUSKpxGRH6EYqk/7ae5J
	NI=; b=rLUewenBZQMZmNiKlPXede/IPGRlkh5Woy95RzjGmVmLrWYMHrQOVvHpD
	7E9EjkbU1mzJ3ZmEU8qrpxmrv0ICGQsU5PLYFQfXaCAFmTShCWf+UOrqJ8fr6ntK
	IPsRZBE3UWKNSno+iKDjF42+KH4HeLxJGtZlU06yFVBpTKgfn478WxbMjIBruneI
	KCvaOCTnXH6ubWceWIbKmLT8p37+9WhDLezD5qqX6tPHhi+iT2xZ+G2byDeyhAl/
	25b162dQmlipXJAXY7XL+unyzQiaFIT1aYVlCKcAQUwt78jBOPuPEL6+3MCrfgPp
	/ytNXE4rqtg2pX+nLlpk/tMR0a0gQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wk8bsev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 17:13:39 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5ACHBcJu014716;
	Wed, 12 Nov 2025 17:13:39 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a9wk8bsen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 17:13:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5ACGqs0F007325;
	Wed, 12 Nov 2025 17:13:38 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aajdjh88t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Nov 2025 17:13:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5ACHDYVR41746812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Nov 2025 17:13:34 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 92AFD20043;
	Wed, 12 Nov 2025 17:13:34 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 39E5720040;
	Wed, 12 Nov 2025 17:13:32 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.124.218.11])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 12 Nov 2025 17:13:31 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: [PATCH 1/2] powerpc/fadump: remove old sysfs symlink
Date: Wed, 12 Nov 2025 22:43:27 +0530
Message-ID: <20251112171328.298109-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDAyMiBTYWx0ZWRfX3VZOPQg7DoL8
 VMYiW/AJqoemTVP/PObzQ7Je8pCTe6Y14hViRhjf9ElOJwMhvU7iIUg8TlNYVHGWo+GFO8j7Uxq
 ys7C/y/TInzbdRTTgbskEFokUVxaTmlnwKabONn0mue1CB10J5nqtwY6LofIGTEZtcQloFhUW4I
 Nd+psar9wQMPBm1IcyCBK0VonbenaOXTCTtGdLfmQ/UUqYw0kJmEr460jNXBYxMmzwWLwJ8py/x
 AUlRGOhLzll8TOOZo/iBgouJaCkhFE6TM63V9J/AqYPXCnJuSP3mI87X2ss1rRccJcribQhedUi
 9Pyw3rVZFFnZTohDvlxNLKf6P2A72OFrNaKwgGawk+Uyft5c4oz8seaaHOA0oMNrCwnEwZDVlUt
 DRN9+MpnwXf5PgTfHcbzwHwS+DW3xQ==
X-Authority-Analysis: v=2.4 cv=ZK3aWH7b c=1 sm=1 tr=0 ts=6914c043 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=JfrnYn6hAAAA:8 a=MMG_BdGZt7urRIUxIQMA:9
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 1zoa3h6ASXA9saSPNw_mRyZPk3Jxupyo
X-Proofpoint-GUID: hZeQqP-AEBpOiMNDMrplkHmj8YnqOuiJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_05,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511080022
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit d418b19f34ed ("powerpc/fadump: Reorganize /sys/kernel/fadump_*
sysfs files") and commit 3f5f1f22ef10 ("Documentation/ABI: Mark
/sys/kernel/fadump_* sysfs files deprecated") moved the
/sys/kernel/fadump_* sysfs files to /sys/kernel/fadump/ and deprecated
the old files in 2019.

To maintain backward compatibility, symlinks were added at the old
locations so existing tools could still work. References [1][2] now use
the new sysfs interface, so we can safely remove the old symlinks.

Link: https://github.com/rhkdump/kdump-utils/commit/fc7c65312a5bef115ce40818bf43ddd3b01b8958 [1]
Link: https://github.com/openSUSE/kdump/commit/c274a22ff5f326c8afaa7bba60bd1b86abfc4fab [2]

Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4ebc333dd786..4348466260cf 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1604,43 +1604,7 @@ static void __init fadump_init_files(void)
 		pr_err("sysfs group creation failed (%d), unregistering FADump",
 		       rc);
 		unregister_fadump();
-		return;
-	}
-
-	/*
-	 * The FADump sysfs are moved from kernel_kobj to fadump_kobj need to
-	 * create symlink at old location to maintain backward compatibility.
-	 *
-	 *      - fadump_enabled -> fadump/enabled
-	 *      - fadump_registered -> fadump/registered
-	 *      - fadump_release_mem -> fadump/release_mem
-	 */
-	rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, fadump_kobj,
-						  "enabled", "fadump_enabled");
-	if (rc) {
-		pr_err("unable to create fadump_enabled symlink (%d)", rc);
-		return;
-	}
-
-	rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, fadump_kobj,
-						  "registered",
-						  "fadump_registered");
-	if (rc) {
-		pr_err("unable to create fadump_registered symlink (%d)", rc);
-		sysfs_remove_link(kernel_kobj, "fadump_enabled");
-		return;
 	}
-
-	if (fw_dump.dump_active) {
-		rc = compat_only_sysfs_link_entry_to_kobj(kernel_kobj,
-							  fadump_kobj,
-							  "release_mem",
-							  "fadump_release_mem");
-		if (rc)
-			pr_err("unable to create fadump_release_mem symlink (%d)",
-			       rc);
-	}
-	return;
 }
 
 static int __init fadump_setup_elfcorehdr_buf(void)
-- 
2.51.1


