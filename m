Return-Path: <linuxppc-dev+bounces-16987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oP0GKWYHmGmh/QIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 08:04:06 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E2C16515A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 08:04:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHLnt39d0z30Lw;
	Fri, 20 Feb 2026 18:04:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771571042;
	cv=none; b=UwKR5WuG873Kz3lPGAIzi+h/I7LGHW/mCaSt/Qw7eYEKKyjL2y7pjMIbP54+3bEPYtTgGv+PV3M8Oauf8bmHzxf69gR9X4CHRKC/q3Be2vRyNEbb7Z0pm3vbIlNF25XyuVNZa/OuY0gH7rTwcSu0MzzzCka4Mpm9irQGO3t6NL3WKkND17sh8g6gIIWPn/Grv/oYvPyqP5J4sHUxXzkc+ZEfAkHMH+SmDENILIpzK/Xpo8TDO6EtEGH+17cRM6unAPmmFRqLQLNC39FgdMTFrGmQCHnxmGoQNLZg4Nz0cqrmr2N0LAD7SKaN1nIOHoSelKxn2IuxUCufG5LNfrXtiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771571042; c=relaxed/relaxed;
	bh=iKj+obBcj1FBHYnJNAOO1iLn3NccnfZfOynfiA7dLH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSS7UeTDM44fiy56IAyqBCFrdz3LaXP6Mkst5Vvm9SuDbgf2sdtRLHmdIR1iFStLXueHkcyHaQZMxBKsKr+ky+yAZB2drhE6J2JF6IEjcgvSAz9aKbMdn8y5LMvxHaLkKi4Cg26aA5H0MqLIVm67XtlofhoYgvvaAiP/ISo/H1QV/XyJxyWJz9NVYcyi+iGbsSRZjbSvibaSI+Nc1D0MPS5UpQF/OnDUt3a4sH1cZ/T+kSgL+AvEpbDuKO+7+o15lV3JqUZ9wNq508fXcyazc1IAZPn8PsOaOqErtVXbmDyrhXgUA29ud3+MasfXm4j0hCV9lthBp3B6sHVD1jih/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AuD196Ul; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AuD196Ul;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHLns4dQWz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 18:04:01 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JMJGTq1600890;
	Fri, 20 Feb 2026 07:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=iKj+obBcj1FBHYnJN
	AOO1iLn3NccnfZfOynfiA7dLH8=; b=AuD196UloAxY2BjN4fdy5+RqWd/MwpGmQ
	tUiFdN7da1owxERDjhwDy1n0N1S1BWCtutco21a+BaIF0SCcozsURF/gbSOA19gx
	gaHXUELVGavQZRIEa2p9CbduwIoEjNTgzQ7PfKMdo5liMFOH4LUog3PBRgxrTIe7
	ahGRTlrkzOS45vFyr2ay4W/RJL1EdOsEK0mGzn3eZbitYUtDM2Go0yxywHp+CVJs
	VcRyGDT+Ml7bfj8FhhV9VW2p1LYCWkhEvKq/oeiNPl04/PBHkkuXcbGUCX1ct8Ac
	/PPRW1UTGV4w/pv4gW6Ske95hSXbS5x/DqU0biQyX9k7zogdnxX9w==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcr9v38-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:03:45 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61K3mCXr017834;
	Fri, 20 Feb 2026 07:03:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb28qe2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:03:43 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61K73ddo15663446
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Feb 2026 07:03:40 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDD872004F;
	Fri, 20 Feb 2026 07:03:39 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD0B820040;
	Fri, 20 Feb 2026 07:03:32 +0000 (GMT)
Received: from li-c9696b4c-3419-11b2-a85c-f9edc3bf8a84.ibm.com.com (unknown [9.111.50.5])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Feb 2026 07:03:32 +0000 (GMT)
From: Nilay Shroff <nilay@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        sparclinux@vger.kernel.org
Cc: wangruikang@iscas.ac.cn, tglx@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        gjoyce@ibm.com, helgaas@kernel.org, davem@davemloft.net,
        andreas@gaisler.com, Nilay Shroff <nilay@linux.ibm.com>
Subject: [PATCHv2 2/2] sparc/pci: Initialize msi_addr_mask for OF-created PCI devices
Date: Fri, 20 Feb 2026 12:32:28 +0530
Message-ID: <20260220070239.1693303-3-nilay@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260220070239.1693303-1-nilay@linux.ibm.com>
References: <20260220070239.1693303-1-nilay@linux.ibm.com>
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
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: riq29OTHkboI9wIhbfwCmRziwb-TL0_A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1NyBTYWx0ZWRfX1AZ9ODp2Xw1U
 ZGg20jL++1MGLUR5Y4+Bni9u5bJ02WJolfT0GuLHCH9nILqYsJTHIzhMbtIlaGPdD7uWnOlPDAc
 IR0xzamtWRm5RK9b5DrwSOvmUadcWZWyzzMfdftWuNA8bKZyMNbMKbPen1XQnr1L/6PEEiUfMDF
 UOeWVaAx5mdgJ9Lk9YLJQ06Anybq83sOXxBBOUfr7lgMjxiaZAMDjOjQ7Ga0wmULBVxW/2+LapC
 1o5Xtl4w5fDmJR3R5zYj3qhvbHzVO3OHJPIajrorQtb7gxBxsD17HP/JjjGg+nkMQA4CoqfREEn
 vQlqtwL8Zno1wjTxx5quKLwjj/Uxmk4k+Yo/KlgXqC1ztwaLGo56zOLOCSou8uWDguoS9qgIgVE
 MPalmYGLg1e0mIPGg4g3UIPN/2cTjGCgIxSiQqJn0WIkMmx5C4aNp3JM8kVN51FwC3LXjp819Bi
 pwXksNoZTFQ26oQKJBA==
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=69980751 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8 a=RIGF2BdnXd3WRmS9KNkA:9
X-Proofpoint-ORIG-GUID: BCJ3jkwagvaprXW1RTF_hHLgLQ7VF1yb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602200057
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-16987-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A9E2C16515A
X-Rspamd-Action: no action

Recent changes replaced the use of no_64bit_msi with msi_addr_mask,
which is now expected to be initialized to DMA_BIT_MASK(64) during PCI
device setup. On SPARC systems, this initialization was inadvertently
missed for devices instantiated from device tree nodes, leaving
msi_addr_mask unset for OF-created pci_dev instances. As a result,
MSI address validation fails during probe, causing affected devices
to fail initialization.

Initialize pdev->msi_addr_mask to DMA_BIT_MASK(64) in
of_create_pci_dev() so that MSI address validation succeeds and PCI
device probing works as expected.

Fixes: 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi flag to a DMA address mask")
Signed-off-by: Nilay Shroff <nilay@linux.ibm.com>
---
 arch/sparc/kernel/pci.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index b290107170e9..a4815d544781 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -355,6 +355,13 @@ static struct pci_dev *of_create_pci_dev(struct pci_pbm_info *pbm,
 	dev->error_state = pci_channel_io_normal;
 	dev->dma_mask = 0xffffffff;
 
+	/*
+	 * Assume 64-bit addresses for MSI initially. Will be changed to 32-bit
+	 * if MSI (rather than MSI-X) capability does not have
+	 * PCI_MSI_FLAGS_64BIT. Can also be overridden by driver.
+	 */
+	dev->msi_addr_mask = DMA_BIT_MASK(64);
+
 	if (of_node_name_eq(node, "pci")) {
 		/* a PCI-PCI bridge */
 		dev->hdr_type = PCI_HEADER_TYPE_BRIDGE;
-- 
2.52.0


