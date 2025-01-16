Return-Path: <linuxppc-dev+bounces-5339-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B70A13822
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 11:41:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYfY903Wlz3cTp;
	Thu, 16 Jan 2025 21:41:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737024076;
	cv=none; b=Iesdl2vvHVLuy4xRe4/6m+Ucu2Q2nJjDLeYTHTqOYsr9g8dXgFTBFxcbEd48btwTdPgDAQhUVeoKzXoeYssEyTr8a6YnlSIM85S6uEDaGmFKpybJK7Y+WAcAOR3/x4zVMGzuduNcVIVNo9AjDhCCtbu93eE6V9AktAx+6MgHERe/112ltC61pkgUWi4iKQEPcG2uWYuCiN8J5hHU4Z6HfKzS+NRYMWc+prmKWzobmH1e0CCvx4MPm01rrDe5cGMdRiB36AtWI16QrauEvs0Uo9MSNC7Dqk1T57L5w1eLfoDbj/LrrCSAUP9cPSrRP0cIs8INbynwqb1sPdMwvWI8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737024076; c=relaxed/relaxed;
	bh=jFhZcHYhyYN41m7TucbDL8T1wPLRWSGcyxYRt2+DSdA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YLh7Jf03XS5J7r1LXaYJAU079DCEiPvAK5AyXKugKEkDK1/lmTuoIL+fPZNWNgyOPg5qDE4iI/HPZ4qpRUnlP8XiBz/y8xSoT9PogkLWyqwjFvNMKVZujBZJezcLFr/GcXOZskXSAeqDR2pgNhkSId1+3t/kAtUJmHIzdVABw9koK4Klf3x089/4erak3zR0nkgUI0hfsY/K3QeRG9rVV+LzG6Zi+dnSiXcjLKMyZ9tPY8pezufhJqn8DN2gZLM/6lZBraUXu8WK08dMQXmlZJE9S5JW4naNsDWCXlCWWzegReL0xUkEuoAtlGzmIIyadLZRZzBQ1hvpdrP8gwnAuQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nFeW31+o; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nFeW31+o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYfY749qKz301n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 21:41:15 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FNaSWk022760;
	Thu, 16 Jan 2025 10:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=jFhZcHYhyYN41m7TucbDL8T1wPLRWSGcyxYRt2+DS
	dA=; b=nFeW31+oBjaKgI7YXNVpxyr1pmt0F+50SFiXh8AoyfT6f5JfjoP5StZmq
	NWB0FsOJ4tuSUJo+JriZj1g70Lmv0qZnDDQp5jEyYgTKcjJ0gwSDvZoxrCUqKNrA
	5qPjGSC1FU6NzdHrnC7Q53rNyfwvs56OXHeWY4VsAvoR+YvC2ldUZdtrnp+018t9
	xbpkfbw6N7KwQefGyWMCTLjRtmn7j8hsdglMgiut8WFUmir/slM+NqGj+7ipVF+r
	VdACDhEMlj+JPiu8K7N9r98zi9f4tDScaXLbHOlRqQKZ5n+SGLebuSogo3LReqPE
	il9pVc/GT/3wrVUOi7+KBX5LvhuNA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446pub2exh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 10:40:55 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50GAesbd018482;
	Thu, 16 Jan 2025 10:40:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 446pub2exd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 10:40:54 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50GAFY99007386;
	Thu, 16 Jan 2025 10:40:54 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443yndaux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 10:40:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50GAeomm13893918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 10:40:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10FCE20043;
	Thu, 16 Jan 2025 10:40:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CEDC20040;
	Thu, 16 Jan 2025 10:40:48 +0000 (GMT)
Received: from ltcrain34-lp2.aus.stglabs.ibm.com (unknown [9.3.101.41])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Jan 2025 10:40:47 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com,
        npiggin@gmail.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        naveen@kernel.org, vaibhav@linux.ibm.com, ganeshgr@linux.ibm.com,
        sbhat@linux.ibm.com, ritesh.list@gmail.com
Subject: [PATCH v4 RESEND] powerpc/pseries/eeh: Fix get PE state translation
Date: Thu, 16 Jan 2025 04:39:54 -0600
Message-ID: <20250116103954.17324-1-nnmlinux@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: K56dcDvyYhXRIc3dxc6r2-AtaUX9LZsV
X-Proofpoint-ORIG-GUID: a8eHIkh39Maiz4QKYnd62ZUOvtwDZwEp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501160077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The PE Reset State "0" returned by RTAS calls
"ibm_read_slot_reset_[state|state2]" indicates that the reset is
deactivated and the PE is in a state where MMIO and DMA are allowed.
However, the current implementation of "pseries_eeh_get_state()" does
not reflect this, causing drivers to incorrectly assume that MMIO and
DMA operations cannot be resumed.

The userspace drivers as a part of EEH recovery using VFIO ioctls fail
to detect when the recovery process is complete. The VFIO_EEH_PE_GET_STATE
ioctl does not report the expected EEH_PE_STATE_NORMAL state, preventing
userspace drivers from functioning properly on pseries systems.

The patch addresses this issue by updating 'pseries_eeh_get_state()'
to include "EEH_STATE_MMIO_ENABLED" and "EEH_STATE_DMA_ENABLED" in
the result mask for PE Reset State "0". This ensures correct state
reporting to the callers, aligning the behavior with the PAPR specification
and fixing the bug in EEH recovery for VFIO user workflows.

Fixes: 00ba05a12b3c ("powerpc/pseries: Cleanup on pseries_eeh_get_state()")
Cc: <stable@vger.kernel.org>
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>

---
Changelog:
V1:https://lore.kernel.org/all/20241107042027.338065-1-nnmlinux@linux.ibm.com/
--added Fixes tag for "powerpc/pseries: Cleanup on
pseries_eeh_get_state()".
V2:https://lore.kernel.org/stable/20241212075044.10563-1-nnmlinux%40linux.ibm.com
--Updated the patch description to include it in the stable kernel tree.
V3:https://lore.kernel.org/all/87v7vm8pwz.fsf@gmail.com/
--Updated commit description.
---
 arch/powerpc/platforms/pseries/eeh_pseries.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
index 1893f66371fa..b12ef382fec7 100644
--- a/arch/powerpc/platforms/pseries/eeh_pseries.c
+++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
@@ -580,8 +580,10 @@ static int pseries_eeh_get_state(struct eeh_pe *pe, int *delay)
 
 	switch(rets[0]) {
 	case 0:
-		result = EEH_STATE_MMIO_ACTIVE |
-			 EEH_STATE_DMA_ACTIVE;
+		result = EEH_STATE_MMIO_ACTIVE	|
+			 EEH_STATE_DMA_ACTIVE	|
+			 EEH_STATE_MMIO_ENABLED	|
+			 EEH_STATE_DMA_ENABLED;
 		break;
 	case 1:
 		result = EEH_STATE_RESET_ACTIVE |
-- 
2.47.1


