Return-Path: <linuxppc-dev+bounces-17563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EBxG/jbpmnRXwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:02:48 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5281EFCE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQGDW5tt1z3bnr;
	Wed, 04 Mar 2026 00:02:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772542955;
	cv=none; b=ek+Q5IL7XFkwXFbOCqJwOeQsEgRuJ2NEaRUbv2cABhZiOBHEhtBEEEPruFIB8I2zdY7S0vFil9uhaqCL/VX4IYo67e5YDj2OBkp0tTl2AOj3ZyKalB1GJku+C/Iqq2+xjp0wZW9OedpUGGWL9OfYOFxiwAm+uf0wVUJgl3YfN/lrA8g+8V/dMd4UELTCzsUk3DW5PQyAqYZWMl+ussGao54xkUplol4uL7JQf+gKqwN+irzedbNIj19or/A3TIxRa5cGkIF6kGYvCTGUkYYx27x2Lv9udROHC52KqNa+zBISkmkzCO9RQoHxmPEoUYyYvmM8tOsz6DnxvNn26/pFcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772542955; c=relaxed/relaxed;
	bh=+fv2d9YzwyaoOUzkFlb0vld37qH2Ki7NAgNl2ZyRHLM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YOr6mwlOSQhaecm7dL3FSA6He0AXsqP3WZRgKpXL7VyV5shXnJ5fwTQw179LlNDli9MAdVyidaEYiJUdJ9m8osGWWvxjYYc47040t/M0+t0eUrO6vACNYmdu88125b9tmRLI6nvLxH7Hpfbvit9hEBwSV+Eaf11VUZ4qiZexEZnnN/+KwLHzt4+nkqA5/ZCRsE/3nHNcqvl/GWFvKCLRXlbcAL1DfrNTwbg215bPr/MtgvOF9TUvXXKYtPrH1mU+SJPO+ucL3A63Bie1lYV3DyXwewaUHy6fL0JSBksZxeTTiRvkv7DIsDgoKlThFwp2gOmXI9EWPHzlCbI28RP1Ew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LrFj4GvF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LrFj4GvF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQGDV0MpJz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:02:33 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6236MnZB1805485;
	Tue, 3 Mar 2026 13:02:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=+fv2d9YzwyaoOUzkFlb0vld37qH2Ki7NAgNl2ZyRH
	LM=; b=LrFj4GvFLPM59zf6MMUPn3QQj6vtMjBUxu3ew+7mKHncJ8PrRHdHQAuUW
	Dlok4uwRHEptb7jkdbR4Z9/TdTKqJ9at+wv0G0H35LpozqyA0bK+X60ZgATz1B9T
	HnuAYT1ZAthzq2p4afQOgYuPhAPhm4yzVXpR14mEEsvjr67Q7ESSxsJMCx3p65Yi
	DB9Vr1z0aEOFe/tq0RjqG4uTa3HuvtQL8ZC2fOWWT0XmFEL7PCnimJS1G9Kfq2Sj
	Fl7qXI76TNDZYdKZPlG5NLk6fgriUK8e53xLDQWYg+sYN2elDzAW+NpUTpHJnIj/
	VnMRCggzVQ+eruu9kMBlsMqeiHKRQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskbtp40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6239XXEI003243;
	Tue, 3 Mar 2026 13:02:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmb2y2cj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623D2Bpv51577314
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:02:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3A6CE20043;
	Tue,  3 Mar 2026 13:02:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F64D2004B;
	Tue,  3 Mar 2026 13:02:09 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.17])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:02:09 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [PATCH v3 0/6] powerpc64/bpf: various fixes
Date: Tue,  3 Mar 2026 18:32:02 +0530
Message-ID: <20260303130208.325249-1-hbathini@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: z_0NSw_3dTrF0f6JReJl-xxYUZEbIn7-
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69a6dbd8 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8 a=6UyuRm9t2VcF-Ioa368A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5OSBTYWx0ZWRfX3uDFtlcNQcJP
 4q4ODmWotvN+zEa5wP60KBYNCUAvlxhqQbaqObN3kST6qdSCBMDjmrrRr2p3oSswgSe22Sfbu73
 WveaFShKunsSbCVbw7Bsp2jPDqjr2vCVhmgonqswh4qHYKpy9FBl2/3u0QCV9zYc9aUAq4YPAgA
 K8N9KYhfmK99WBZuS4tOV1KMCXW8QOsZXq0ilFj26zTGNxeVuqrJgwJlxErrBTlFwVet7rTuU3z
 vjA+xhBwpXtRXK8Ve5L37icuJnKN++qkt//uujWBiG7sgtTPOra6FiMG4WrteCGHnxgE8MhtoP5
 VIO377iFoV+Lx5P4ZpdiUlZCtFbswrdX1r12L3aA4o5HrOZ+UcGocA8YfMG4iYs12DcR++AhTWa
 uiaub8rhAKQ031JhPD5niSqBUg1AgX4yHmwDbi4/I+CEvSBXl9LjcLLrLLqGlMto9pktb0twQFn
 8DtnaGRMNbV99RgpGfw==
X-Proofpoint-GUID: z_0NSw_3dTrF0f6JReJl-xxYUZEbIn7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: CC5281EFCE4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN_FAIL(0.00)[1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.1.f.9.b.1.2.0.0.4.9.4.0.4.2.asn6.rspamd.com:server fail];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17563-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCVD_COUNT_SEVEN(0.00)[10];
	RSPAMD_EMAILBL_FAIL(0.00)[bot.kernel.org:query timed out];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

List of fixes for powerpc64 BPF JIT:
- Patches 1, 2 & 6 fix issues with existing powerpc64 JIT and are
  tagged for -stable.
- Patches 3 & 4 resolve issues with bpf2bpf tailcall support added
  recently.
- Patch 5 resolves an issue reported by bot+bpf-ci@kernel.org while
  adding exceptions support on powerpc64 BPF JIT.

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


