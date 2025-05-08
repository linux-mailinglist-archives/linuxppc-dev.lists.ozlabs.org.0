Return-Path: <linuxppc-dev+bounces-8426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56853AAF3BF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 08:30:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtMgd5p9vz2yhV;
	Thu,  8 May 2025 16:30:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746685805;
	cv=none; b=fFvBipUmglHK+n+/a2wZ/i5QQ+a8VB+lSjMAkcagQaJC77TgUoXXAmsexiNpBbxYTAKW/sKtMnzHHYLg7FhEPjKEP1IU67eAsXTmM8jMBdo8Aqkfgq+mpAKFTxbpsLmQTzqrDrPXMwS+WWVYTzTAnyjGg599sm7BsGycqcAV+Usll9kYoAP8xbw/s2mArGduYopewyT4ApiR3sAg27US2TSyuCAXge7sMC05NRS+6yGV9O2Xb34f7iK0CELWa8y877myTgRVV1Yfua89NFwGFoKpV0pzlq3KCWt7idGAQnytxQAAW9DF2DA6rz5sSD+D+4usTKxOA65y8EWUtYwAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746685805; c=relaxed/relaxed;
	bh=kiw00c+FQf9PuZ92J0vgUrj2gmOIz1soi9KXE46SO7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MFbNUQeXiE521L9MDDes59CuwXZQTu94t02AqFp63sTIDX1fCAAietwvHqWZBodj1N1NMnD87XfPaREVfGendxLWO08x2wJpPPx9ACAHphtxtJrmsLVHGxPV5ZdPM+aGI0ecRwP5RQQdcodHcVUB+/aCiZEjzoRHYpJKomL9Q2kLWVArDegbLsvq4E3zaaUHmWPPxd1l0YYR8szmq3H4bK+V6zicRqoKqO1vS6HcblwLmjs2VEwAOrlIRVe0oTZ2GTNNit11cyRDFfZmNfocb433BArromDZb+z3u9gjfZ+DdXCIwmN0jsDcahhnT2ADX2gsTyXK/K0fMJtIo632eA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+a+Df11; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+a+Df11;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nnmlinux@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtMgc2hzDz2yh4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 16:30:03 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 547KKL0r030803;
	Thu, 8 May 2025 06:29:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=kiw00c+FQf9PuZ92J0vgUrj2gmOIz1soi9KXE46SO
	7U=; b=X+a+Df115Luf5l52uz7DKUhDmfQHX/Mxn31plWC9Qw/3zmBDd2unC+R9h
	VCDkxCD1Ezsay+PGEQmQxWuawSrBQXk+HCTx+fVYJpWJO74NoD0u4bgU0mnWuMzY
	SvnDFj+IGiJoYYAI4akiyTNRTEataMKH8+O5Ta9y2wJMjgpoiXD6FXromyqIYIjP
	TX3iGqUh7Lw0iROf1qlJ6FOCFK+yb3J9lix0ZgMMg6p3eJklcwSbVmtRL3AuMv/X
	dYqGVxMCDZrgelpfUqiaHIeaMSOYFspfyWJ91A2SnGDhXj9Nw6DpYQL3A9rEIf70
	QrdnkN/sgt1v1A+f1FThZCg5lxI3Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46g5yrvyhk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 06:29:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5486QnJL001469;
	Thu, 8 May 2025 06:29:46 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46g5yrvyhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 06:29:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5486FW8I014097;
	Thu, 8 May 2025 06:29:45 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46dypkv87s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 06:29:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5486TfhN17563970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 May 2025 06:29:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 659AF20083;
	Thu,  8 May 2025 06:29:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D06F20081;
	Thu,  8 May 2025 06:29:39 +0000 (GMT)
Received: from ltcblue8v9-lp1.aus.stglabs.ibm.com (unknown [9.40.192.91])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  8 May 2025 06:29:39 +0000 (GMT)
From: Narayana Murty N <nnmlinux@linux.ibm.com>
To: mahesh@linux.ibm.com, maddy@linux.ibm.com, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, oohall@gmail.com, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        gwshan@linux.vnet.ibm.com, benh@kernel.crashing.org, agraf@suse.de,
        vaibhav@linux.ibm.com
Subject: [PATCH v1] powerpc/eeh: Fix missing PE bridge reconfiguration during VFIO EEH recovery
Date: Thu,  8 May 2025 02:29:28 -0400
Message-ID: <20250508062928.146043-1-nnmlinux@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
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
X-Authority-Analysis: v=2.4 cv=cuybk04i c=1 sm=1 tr=0 ts=681c4f5a cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=kQooW1NXP8U1ZRCmC6MA:9
X-Proofpoint-GUID: OOn9rtTk_GJjBsPQHlC66v5VrFle9GtV
X-Proofpoint-ORIG-GUID: ULABqiSJb1CND9jVcnFkcBaB5PVJqc3C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA1MSBTYWx0ZWRfX4suI3pv/rKHb GV1A7p6kKUG7iD0/ZTGEDSDqRmW7BQrC3/775faUCGi+HbwPd9ByPl2xe2XlQCg4PV9cKhtHQN4 Ix2smk3qn5JJyS2rYTYhh62w2gFFctvPRp0zxyPbSqmGhawAmMz6tgAszZk050UcSQ3clWh983w
 tq1cmz3TMdPmZ+vVJbJYmFynpMjOP07lKLsetLv8i9KStEv/PEYYfGZ5USGmkQIkO5Pz7UcJJ+h YooW3q4nksNjqwBs6zpCSzqvpb3nVAF+bIdAR+Wl1IyI4E/flfHRtOOh8KyjVfdRB0PLz8mHvfI YEr4JUrwN0PAK0GXky3nFE8i5/vXiWwDDH0dEidSZaX1gjqKZxy62qYOlCmBqLIa0plXBz6wIaC
 KlEuUglwtPNGJvYisqhGeHrGsQUZF+M5+q2g0JKwnbYpO2jpTe9J6v7HGPFARfYMLTSMY+Zv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080051
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

VFIO EEH recovery for PCI passthrough devices fails on PowerNV and pseries
platforms due to missing host-side PE bridge reconfiguration. In the
current implementation, eeh_pe_configure() only performs RTAS or OPAL-based
bridge reconfiguration for native host devices, but skips it entirely for
PEs managed through VFIO in guest passthrough scenarios.

This leads to incomplete EEH recovery when a PCI error affects a
passthrough device assigned to a QEMU/KVM guest. Although VFIO triggers the
EEH recovery flow through VFIO_EEH_PE_ENABLE ioctl, the platform-specific
bridge reconfiguration step is silently bypassed. As a result, the PE's
config space is not fully restored, causing subsequent config space access
failures or EEH freeze-on-access errors inside the guest.

This patch fixes the issue by ensuring that eeh_pe_configure() always
invokes the platform's configure_bridge() callback (e.g.,
pseries_eeh_phb_configure_bridge) even for VFIO-managed PEs. This ensures
that RTAS or OPAL calls to reconfigure the PE bridge are correctly issued
on the host side, restoring the PE's configuration space after an EEH
event.

This fix is essential for reliable EEH recovery in QEMU/KVM guests using
VFIO PCI passthrough on PowerNV and pseries systems.

Tested with:
- QEMU/KVM guest using VFIO passthrough (IBM Power9,(lpar)Power11 host)
- Injected EEH errors with pseries EEH errinjct tool on host, recovery
  verified on qemu guest.
- Verified successful config space access and CAP_EXP DevCtl restoration
  after recovery

Fixes: 212d16cdca2d ("powerpc/eeh: EEH support for VFIO PCI device")
Signed-off-by: Narayana Murty N <nnmlinux@linux.ibm.com>
Reviewed-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 arch/powerpc/kernel/eeh.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
index 83fe99861eb1..ca7f7bb2b478 100644
--- a/arch/powerpc/kernel/eeh.c
+++ b/arch/powerpc/kernel/eeh.c
@@ -1509,6 +1509,8 @@ int eeh_pe_configure(struct eeh_pe *pe)
 	/* Invalid PE ? */
 	if (!pe)
 		return -ENODEV;
+	else
+		ret = eeh_ops->configure_bridge(pe);

 	return ret;
 }
--
2.48.1


