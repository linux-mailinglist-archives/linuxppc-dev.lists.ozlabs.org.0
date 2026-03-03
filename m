Return-Path: <linuxppc-dev+bounces-17612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPFdIjUkp2mrewAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:11:01 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4411F50BA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 19:11:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQP4J1Nv9z3bnr;
	Wed, 04 Mar 2026 05:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772561456;
	cv=none; b=JtiYBKYrT0Q1BY5fILu4QIHkGqRWIfXRzB4FAYNCMRvfWJ/xtKgIxmkPnZeums03KMH59/ESo/G6cuyuiMIES6D5yvYSBaYzepTfd8tFa/lMVvdNziFvofQwMwhOF+rXfC3e3UHhMlLVcto92DeQI+bCS76gKL9fJ/WGpBIXY4HKrAJnpzEOqOEtJ22rGVHPQpbgtxgO7nLy+JFwp7VspwvhEDYqB8eXQnO1bdMJZIy7TEwmnMFCjO+GmDzH2fAUxKP/RLB3ZM5o5yGNeYm4qaMw5xNaW16XSr3YVv/2fBshv+7OoEnyxjoGEiiZ0aLeWjyPbTiTJAc/Pq7FDXKxPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772561456; c=relaxed/relaxed;
	bh=g1/bDvKR9DZrP1UcznGemOE2aCvY6OgeiTEY5wODsto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LtyxGhc8yuoLxcqywOgiRajfQG7W4LdBWa5YZ0DaPhRms8FfV3Wnsl/thoKpLbn7Q+ONNHEdFLptYw7ImEWWvCcQDEEJyY1bnePFDuZYgCwMuXHZvcP8W+fkqoNmKOYYA5yxoEMgcuoRVbuqhRDpDN2akFHJbBk6fWqsWhE7tM2IVHiQwMhn28sDHF6B3HSliKcLwnaIHWAtofeB7+wKkw2seiE//a3HvD+HESJRBMjdZhANmNTghQziVp+S+EkZr9a795Z6ZpR+U8ALYSB//gg52fGlOumn0aHJImjunLIov8zlMsZWctazCprKFpHqcopG7DfhKLbb81IflrWoYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LXOKWIG7; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LXOKWIG7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQP4H0CG2z2yrl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 05:10:54 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236V7L11994861;
	Tue, 3 Mar 2026 18:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=g1/bDvKR9DZrP1UcznGemOE2aCvY6OgeiTEY5wODs
	to=; b=LXOKWIG7ROCI9F7U9L9DyiGnu0Qc9MFMMU1APoA9GqQci+s8DzSeJZ3lw
	KRDnmP8u2ILueUGeHML76COZXS2vHuzIeOcixzYX88n6OY49PUaQTxIFFl8A5R/F
	42OQffKuhDtEjBxCt4fDmnRmdLT9mGH+Kz5z25hzyFfkK8oHt8kBSCU0XocgCA8r
	nOHwc+0WmjWduNGbednJoMwUsZ09OS1bzy3XiJNH3VOuYhurATT8S42NdXGKfIp8
	mvDm0ds8TI26Y8FOqtC7a+80nVc7a77cQpJMS0XnJzhOiTc+p90SV20hjZmLRUIT
	y9Ey9jt7InghzofjbhFfrvcQqzaWQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskcv932-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 18:10:39 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623E5RFC016756;
	Tue, 3 Mar 2026 18:10:38 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmbpn3fqj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 18:10:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623IAYDx57344496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 18:10:34 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2511D20043;
	Tue,  3 Mar 2026 18:10:34 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 039A020040;
	Tue,  3 Mar 2026 18:10:32 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.53.81])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 18:10:31 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v4 0/6] powerpc64/bpf: various fixes
Date: Tue,  3 Mar 2026 23:40:24 +0530
Message-ID: <20260303181031.390073-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-GUID: 6jWWUrk0cPAS5nO2pOv7vhVN-sPBK1X0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE0NiBTYWx0ZWRfXxEQxzo2RqPZ3
 V83d2QveBmHuPJPoCUxBUPbKODkYVABaq42Rk1TuVPFrpRsFU2hKhNyC0uvCH+A5WtDbCvMhIRS
 UA5NybgUVHvDRs/4c4WDwYdN67nXi1uVNdENWcX/j1IQ347KqcKpis9Th57yvNVNyDKpFNrmwNL
 41tCg7uXKg89vkwIdZRmOmr/vulv60aK26j/gpl+jmZa7hp888EAjXL/7GnpZd1lmqxlwtQA8we
 0jfa21aIbyfgjSXTZVk7o8GHKrh3n0lkFvfPciEoeLqHUA8Tju7WJRU93bNWmXBDsnKrhen0O1Q
 NR6xq3XVYrYgv1t50gtsv5WvrMwqzwRS9xqvGzhtPeumZVAugY1qXuhtN5ekI2vMaxfZyGMdpLv
 9gy4J2h8h/Y3HKUwUO96Uo8QUzuA/JziKXTn7+SPZpv+VDdGo3QxZNsE2xnyV7/ekUMjUaE9fRH
 chULjg8miDUN8lKqNJw==
X-Authority-Analysis: v=2.4 cv=H7DWAuYi c=1 sm=1 tr=0 ts=69a7241f cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=F-3jXUw4vF4i_SR45usA:9
X-Proofpoint-ORIG-GUID: 6jWWUrk0cPAS5nO2pOv7vhVN-sPBK1X0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_02,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030146
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 1F4411F50BA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17612-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

List of fixes for powerpc64 BPF JIT:
- Patches 1, 2 & 6 fix issues with existing powerpc64 JIT and are
  tagged for -stable.
- Patches 3 & 4 resolve issues with bpf2bpf tailcall support added
  recently.
- Patch 5 resolves an issue reported by bot+bpf-ci@kernel.org while
  adding exceptions support on powerpc64 BPF JIT.

Changes since v3:
- Fixed a minor issue in zero_extend() helper in patch 6 as pointed
  out by bot+bpf-ci@kernel.org.

Changes since v2:
- Added Tested-by tag from Venkat on patches 1, 2  & 4.
- Patches 6 added to fix kfunc call ABI issue on powerpc.
- Fixed a few comments on Abhishek's suggestion.

Changes since v1:
- Addressed couple of review comments from bot+bpf-ci@kernel.org
  in patch 3 & 5.


Hari Bathini (6):
  powerpc64/bpf: do not increment tailcall count when prog is NULL
  powerpc64/bpf: fix the address returned by bpf_get_func_ip
  powerpc64/bpf: use consistent tailcall offset in trampoline
  powerpc64/bpf: remove BPF redzone protection in trampoline stack
  powerpc64/bpf: fix handling of BPF stack in exception callback
  powerpc64/bpf: fix kfunc call support

 arch/powerpc/net/bpf_jit.h        |   5 -
 arch/powerpc/net/bpf_jit_comp.c   | 127 +++++++++------------
 arch/powerpc/net/bpf_jit_comp64.c | 181 +++++++++++++++++++++++-------
 3 files changed, 199 insertions(+), 114 deletions(-)

-- 
2.53.0


