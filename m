Return-Path: <linuxppc-dev+bounces-16985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNDhM0oHmGmh/QIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 08:03:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F17165125
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 08:03:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHLnJ6dCgz30Lv;
	Fri, 20 Feb 2026 18:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771571012;
	cv=none; b=JRhY5AtcwjB4mCkCLbcC26utCVZUV1b54wqEkRVJdz1kbA8wmO84fjq+wJKVBsUMCqRRpHNgUxzIXPabaIbwuRgiEbOF3LXkqeUy6jCGLhOJeAtz+Y4gmvyQSgc1xyf3WTrBG6VsFvv7T3+yY1q9QtwPT/rS4z+KdAPLW+95U3MpKv7HQoubbX+zYL2y/ieUY+fEZPoNZkoPxe7XjweQ5Om9eg4Tcosgf8GFJnrkJ5+rf7ux2b07lkQPPgOXCRUyoZtp/ExMlsSN+5A3ez7DvjoYxh/pqoqhDldN9O5ReESCaabSzb9F094xPOU67NRJM1EpUqfc4Ka5NCFjX11nmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771571012; c=relaxed/relaxed;
	bh=9ZQ/AXgj3qXjXBXbOZFZ/gpXw6vzsJvSBlTkhasAW/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L0yhwhG5fWPLFOfwEws480AqRhuJaImCXPO6cFlyVi/wWk1skSyw7tV9ZIrmMYZ7z/n3z1Iw2Sqp9dB30DXPI1OBB2R7XXiQLNNDFq3VpH3cb+kzjxAqYGit/LVln1Yw2/B39E62ioGqqrneoTa+JQg+LmboE/VxwR9yg7iupQLmN4B/VZZX+/AWFtHLSB7Yuws4MR1JhyR4b6T3VHvWWlIYPqbq+zXkpmUAUz4BrUAA6tH+Gs0OHMk0MiJc608YGhlN7bdaasWaKDCJL/gowqtErQ8iqqvO+0Z4vZnQrYtYFeuzGKXC5umNqbLDa4PhCfbMNru6iS5yEAS1yI86iQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e8718+gp; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e8718+gp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nilay@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHLnH5wLxz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 18:03:31 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JMM23c1271197;
	Fri, 20 Feb 2026 07:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=9ZQ/AXgj3qXjXBXbOZFZ/gpXw6vzsJvSBlTkhasAW
	/g=; b=e8718+gpueMX9S6BRPxwFi87lndujXYrijNBx6dwxBs4Q1/Y3sfuuot/B
	PJt2nt2eQRalwNpZPF17NinZGtJKvjnrWQoTUREw/5tqh/po0XJPMqoRb17hYbwi
	QNuiMtI5AeuAiL3l0SOLiUs/AVFvYC9MgmNegJ8TRMoc1qkC5aDMDG/fbONb2mGX
	KdJyVs2cA2DMRLnVpWFFdf9sz5YSIFjz9yGS8xZDFh4WZ9WV9Y2iZAYu+swLE3w5
	8v7xvu06KMm3qqgwceT0BpShtawQ8dLtkqPhiWTJPBnjZNef58JGbvRxAd5ekoys
	4EQ0BeWVRNB9oNCp97qrSEalXNVcA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj4krcnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:03:12 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61K3wkL5001391;
	Fri, 20 Feb 2026 07:03:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb2bqegs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Feb 2026 07:03:11 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61K737xo45941126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Feb 2026 07:03:07 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFF5C20043;
	Fri, 20 Feb 2026 07:03:07 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F83C20040;
	Fri, 20 Feb 2026 07:03:01 +0000 (GMT)
Received: from li-c9696b4c-3419-11b2-a85c-f9edc3bf8a84.ibm.com.com (unknown [9.111.50.5])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Feb 2026 07:03:00 +0000 (GMT)
From: Nilay Shroff <nilay@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        sparclinux@vger.kernel.org
Cc: wangruikang@iscas.ac.cn, tglx@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        gjoyce@ibm.com, helgaas@kernel.org, davem@davemloft.net,
        andreas@gaisler.com, Nilay Shroff <nilay@linux.ibm.com>
Subject: [PATCHv2 0/2] pci: fix msi_addr_mask on powerpc and sparc systems
Date: Fri, 20 Feb 2026 12:32:26 +0530
Message-ID: <20260220070239.1693303-1-nilay@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA1NyBTYWx0ZWRfX8SfcUII9E4v6
 wE5oK4sWy8Psfc3YqT6yGi8NBBTjlv5ggn5RYccGrOAec+BtxMb1CxNlDfwhjwf+TUx/JMgLFfd
 zE0lW+yyPGSgEMmm8+xMTrkUX1zu6ruKCAlIVcqcoDSOmb/dARJRjbw7E2R6KGR2GB+CkE7EPGq
 pQlImzrf07rxNV2vdfMuVeL0YTaIya82DHyx/SjeKiLs/PlNW/niCtVtPZDKgO3CwRl6w55jDbs
 KiuVJxajLXUxFx381VirV7aloID/Z5fdBphZNeuj+OO3djqJqsMjjwrZM49c9KjQx83vEfeu/5t
 CXn7kBIS7gmXrfT08I1Bj7PHLv/2nWy9ZwI+7bIudBnPeazE2QyrsorCHShGahwPUwScSNpE7nR
 yAiImPP0oa1edkOekuvf7MvTY/2dxT+cN0tmEBl1heOxfILUFZdKTvsKPZogT3nGD8BEFCzSwBb
 kj9amcEeKlNQfYwm1jA==
X-Proofpoint-ORIG-GUID: JRidqch_C7uYEkMP_xY2JTPdFE77Mj7k
X-Proofpoint-GUID: 31nQogI8sxKE3Phs7mGlsZbfAqExsNAg
X-Authority-Analysis: v=2.4 cv=M7hA6iws c=1 sm=1 tr=0 ts=69980730 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=PpxxDPt2hjBrRrFdXa0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_06,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
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
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[iscas.ac.cn,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com];
	TAGGED_FROM(0.00)[bounces-16985-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nilay@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 35F17165125
X-Rspamd-Action: no action

Hi,

Recent changes [1] which replaced pci_dev::no_64bit_msi with pci_dev::
msi_addr_mask inadvertently missed to initialize the pci_dev::msi_addr_mask
to the DMA_BIT_MASK(64) on powerpc platform. Due to this, later the 
validation the programmed MSI address against the msi_addr_mask fails.
This causes pci device probe method failures on powerpc platform. We also
realized that similar issue could potentially happen on sparc system as
well. So this series initializes pci_dev::msi_addr_mask to DMA_BIT_MASK(64)
when pci_dev is instantiated for both powerpc and sparc platforms.

The first patch in the series fixes this on powerpc platform. The second
patch fixes this issue on sparc platform. Please note that as I don't have
access to the sparc platform, this patch was only compile tested on the
sparc system. Anyone from the community is welcome to test it who has
access to the sparc machine.

[1] https://lore.kernel.org/all/20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn/

Changes since v1:
  - Initialize the pci_dev:msi_addr_mask on sparc platform (Vivian Wang)
  - Some minor cosmetic fixes (Bjorn Helgaas)

Nilay Shroff (2):
  powerpc/pci: Initialize msi_addr_mask for OF-created PCI devices
  sparc/pci: Initialize msi_addr_mask for OF-created PCI devices

 arch/powerpc/kernel/pci_of_scan.c | 7 +++++++
 arch/sparc/kernel/pci.c           | 7 +++++++
 2 files changed, 14 insertions(+)

-- 
2.52.0


