Return-Path: <linuxppc-dev+bounces-5513-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23E7A1A3CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2025 13:08:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yf08D64Gwz306x;
	Thu, 23 Jan 2025 23:08:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737634092;
	cv=none; b=TGIxFkyBZGrlNVcBkWKU8ZBD9BQJ3UGljsdkMoOns1JvsM0vBQ9mljTqvcUE8qxVHrcGdpA9OWJwV8IkB67BHOx9libao1Bz5pEtQPxVDRTAjlQPs4X/3e0Dkxw8OH3qY80jFC0UueFee/h5RgE2P7NhwKyxNhlkNuAz3hva4phMbEI0JQ5J2DR6or4aZq6IsDkWRzzsowTKXFRum08wihMHx1A0AGjw1eSk1Q/TU7CfoU/gVDYVkOa9/kpK3551ZRpWle4nNn4p6b+okyzvgSLdiTn1SF3Ni32svgC6L9ESVGSHloXGoeLGnprZsCXquo2c7jM6nA4TZDBmBxZ5gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737634092; c=relaxed/relaxed;
	bh=eB2d8UwXiM75C9nkP1Kh8FSnSKuONacmYkSgiuZhFZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbKl5yGctSwjTxPRLyAmCGZyhjkWqvHcJPOK/MjP/GU5pzPT+pGSQ3+5Ba4BKE29nEWKvkeWHsbPLYOgoq5v62KLxiJdLh7VFIKLsqxon0gjcVRTa359e7KUZUbNQfjt4kkdChAQbF50MZgHxDq7Sr3hLn+LE2QcQNxoqBnv2SaDDmxI3Rkcv9IEcM1kAxK+2KfWXhYmMlBAuVWAk7qOnMr7Lp1WF5W33hXJLjBif8NWsXbLrC3SelwfOngnaL68coscYi53/5SMjf1CD7CyJDfOmU5XHsIBSCARNrqatbvPvRRmfDa72MoZRG19GViWZaSg9NdnyqwJ9a4HLZWSjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jcnme8Pt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jcnme8Pt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yf08D0dc8z305G
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2025 23:08:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N5NpqH026409;
	Thu, 23 Jan 2025 12:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=eB2d8UwXiM75C9nkP
	1Kh8FSnSKuONacmYkSgiuZhFZg=; b=Jcnme8Pt9fgrNId4lAdljm3C4XPcwkBf/
	qeKJRrOB4ot0XpTwb34LtROcJy8AjX5Gpe0RBFtCzrp1ugdlX7x4dBoVaNplxnLz
	uZ/KQihg/36QAY4GsMm75qbd5yUckXnBlRMqpAPJC3cTJPTk4NShEI/czj2hmlVO
	Bbv/1QTyyeveEqChBPpWluXsZOrMAFYnINK+a0Ev2iU4sWEmVpdED6W5vRjIrkjP
	ZUcD92CB9Gt0J6Yw4Q4JC/SBoZ/n+1lEqz1eO7FoIjbKrr55l3tCu5ItH1D1Eb/w
	GFsaduoqePCd8pQ6UVCIcv7gL6RQPdFdf5Jbpa1NFEDowLRpYFHXw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bfk7stgs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:04 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50NC84If030031;
	Thu, 23 Jan 2025 12:08:04 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44bfk7stgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50N8pJKS020997;
	Thu, 23 Jan 2025 12:08:03 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 448sb1n2f8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jan 2025 12:08:03 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50NC7xBv54264304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 12:07:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 876C020043;
	Thu, 23 Jan 2025 12:07:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B04B220040;
	Thu, 23 Jan 2025 12:07:55 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.124.210.34])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Thu, 23 Jan 2025 12:07:55 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Thu, 23 Jan 2025 17:37:54 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, linux-doc@vger.kernel.org
Subject: [PATCH v3 1/6] powerpc: Document APIv2 KVM hcall spec for Hostwide counters
Date: Thu, 23 Jan 2025 17:37:43 +0530
Message-ID: <20250123120749.90505-2-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250123120749.90505-1-vaibhav@linux.ibm.com>
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
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
X-Proofpoint-GUID: w-wo8LXZQVCBTxRNgAfp5B2iiCpiQFbc
X-Proofpoint-ORIG-GUID: UNqm8mUAVyKNo5mY5TOamezM6VDHIjjt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-23_05,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501230091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Update kvm-nested APIv2 documentation to include five new
Guest-State-Elements to fetch the hostwide counters. These counters are
per L1-Lpar and indicate the amount of Heap/Page-table memory allocated,
available and Page-table memory reclaimed for all L2-Guests active
instances

Cc: linux-doc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

---
Changelog
v2->v3:
* Minor reword for the cumulative reclaim counter [ Gautam ]

v1->v2:
* Reworded section on GSID [Gautam]
---
 Documentation/arch/powerpc/kvm-nested.rst | 40 +++++++++++++++++------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/Documentation/arch/powerpc/kvm-nested.rst b/Documentation/arch/powerpc/kvm-nested.rst
index 5defd13cc6c1..574592505604 100644
--- a/Documentation/arch/powerpc/kvm-nested.rst
+++ b/Documentation/arch/powerpc/kvm-nested.rst
@@ -208,13 +208,9 @@ associated values for each ID in the GSB::
       flags:
          Bit 0: getGuestWideState: Request state of the Guest instead
            of an individual VCPU.
-         Bit 1: takeOwnershipOfVcpuState Indicate the L1 is taking
-           over ownership of the VCPU state and that the L0 can free
-           the storage holding the state. The VCPU state will need to
-           be returned to the Hypervisor via H_GUEST_SET_STATE prior
-           to H_GUEST_RUN_VCPU being called for this VCPU. The data
-           returned in the dataBuffer is in a Hypervisor internal
-           format.
+         Bit 1: getHostWideState: Request stats of the Host. This causes
+           the guestId and vcpuId parameters to be ignored and attempting
+           to get the VCPU/Guest state will cause an error.
          Bits 2-63: Reserved
       guestId: ID obtained from H_GUEST_CREATE
       vcpuId: ID of the vCPU pass to H_GUEST_CREATE_VCPU
@@ -406,9 +402,10 @@ the partition like the timebase offset and partition scoped page
 table information.
 
 +--------+-------+----+--------+----------------------------------+
-|   ID   | Size  | RW | Thread | Details                          |
-|        | Bytes |    | Guest  |                                  |
-|        |       |    | Scope  |                                  |
+|   ID   | Size  | RW |(H)ost  | Details                          |
+|        | Bytes |    |(G)uest |                                  |
+|        |       |    |(T)hread|                                  |
+|        |       |    |Scope   |                                  |
 +========+=======+====+========+==================================+
 | 0x0000 |       | RW |   TG   | NOP element                      |
 +--------+-------+----+--------+----------------------------------+
@@ -434,6 +431,29 @@ table information.
 |        |       |    |        |- 0x8 Table size.                 |
 +--------+-------+----+--------+----------------------------------+
 | 0x0007-|       |    |        | Reserved                         |
+| 0x07FF |       |    |        |                                  |
++--------+-------+----+--------+----------------------------------+
+| 0x0800 | 0x08  | R  |   H    | Current usage in bytes of the    |
+|        |       |    |        | L0's Guest Management Space      |
+|        |       |    |        | for an L1-Lpar.                  |
++--------+-------+----+--------+----------------------------------+
+| 0x0801 | 0x08  | R  |   H    | Max bytes available in the       |
+|        |       |    |        | L0's Guest Management Space for  |
+|        |       |    |        | an L1-Lpar                       |
++--------+-------+----+--------+----------------------------------+
+| 0x0802 | 0x08  | R  |   H    | Current usage in bytes of the    |
+|        |       |    |        | L0's Guest Page Table Management |
+|        |       |    |        | Space for an L1-Lpar             |
++--------+-------+----+--------+----------------------------------+
+| 0x0803 | 0x08  | R  |   H    | Max bytes available in the L0's  |
+|        |       |    |        | Guest Page Table Management      |
+|        |       |    |        | Space for an L1-Lpar             |
++--------+-------+----+--------+----------------------------------+
+| 0x0804 | 0x08  | R  |   H    | Cumulative Reclaimed bytes from  |
+|        |       |    |        | L0 Guest's Page Table Management |
+|        |       |    |        | Space due to overcommit          |
++--------+-------+----+--------+----------------------------------+
+| 0x0805-|       |    |        | Reserved                         |
 | 0x0BFF |       |    |        |                                  |
 +--------+-------+----+--------+----------------------------------+
 | 0x0C00 | 0x10  | RW |   T    |Run vCPU Input Buffer:            |
-- 
2.48.1


