Return-Path: <linuxppc-dev+bounces-17316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IB6nJGmwoGnUlgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17316-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC091AF3CD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 21:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMNhP6wSLz2yY0;
	Fri, 27 Feb 2026 07:43:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772138597;
	cv=none; b=mk+t7f6sm3vJyK7FthMUJmKb77pjuij7OBBLBpeyinYSZiuUrBJBJdXBV+6AwnC6n6Yk8+HbrAEheTXeJMvWRZQavwqmS7vzPLiqfuSHYl2eFBOX4UugV74eXKn7t9ojw9X6a6C7u28H9FH3qS6ISC8msMDokf0jACeeC6zMICrTs1v4bqnY7nTeLrHSpCeUG2nfoRkDcsrlUWDstS0ePYHFGJC0gnmQ7rsIMor5HXaGglLfTUiIPU4vy/ueoh6RcBe7etsrRn6RDXDekX0XNS9DDyqWYR9QYQYpZctAQqKakvEzZsAfECO9KXEiG31JGQHkgA2/vdi+gV/ReTGBzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772138597; c=relaxed/relaxed;
	bh=rsCLzFHsit0XXORi4hF57ctZ8q1yz9cd5P7TZRc9Byc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WJRa2YwvuI2MbvPYe4C5HqmzBlnFR/8WLaJWAZXd+R7Ux6dv0SDWDIE7aKA8rW3Klet9CS1LDBwnFlgKObyholTM5il8M7XUmTHEtdNVj7EMe3ZAhKeUdMLXXUTqTvy7RjIbdfQOms9fZXnb6v8qKhuKb9LIaRRPPawix3k5p6U8kPBce86u8lxwWRSSzZODBBek8EJCfI9+YP3hoHQD4sJH04ifr3f9r2ElZ+ltaIj98gypd3dMEv6A9IPVLtgSGZu1TRf4OPKwciKAj+NHCQ+pIe7QcvsW+Z0yLMVbknOlvnessp+jViH2Z7PLyMb6zis2xow5KeWf7uJVa+ApSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T9Pf6ijh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T9Pf6ijh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMNhN52Xhz2yLG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 07:43:16 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QGetJi567419;
	Thu, 26 Feb 2026 20:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=rsCLzFHsit0XXORi4hF57ctZ8q1y
	z9cd5P7TZRc9Byc=; b=T9Pf6ijhlmbJffaMAaOVepvmH0RN9IUh0vUypRoTO87s
	0oCTmYQWjCIbvdyBp40oEMpzs4PvvuaPykOJGpkVLWxhobzynsIrAfYREDbQ9cwo
	vZFZlea4v6xM97PH13JYmNl1pwH0dZbgAyWtYwDwS+CxUIwlLae2RF/WCoqvTRH+
	v2WWCXNSXwTH2HoPQ2yBaLPB+u40nmOVysHSLf4jZ1bZSEvl9b1GM9bQ5RdTgXQ+
	3ms457lq0IRVO6zvQCqO4gYdfuYJBOMTopwxciy6kv7N+0mVJjyRbY21JkyS19ON
	Q1fAHsHochpxLxyLyXe/dorYl+BgrYugrovKMeFvOw==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4cr8ye8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:43:00 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61QIDJST015750;
	Thu, 26 Feb 2026 20:43:00 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfq1sx4yh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 20:42:59 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61QKgupi21954886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Feb 2026 20:42:56 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 049DD2004D;
	Thu, 26 Feb 2026 20:42:56 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6C90E20040;
	Thu, 26 Feb 2026 20:42:54 +0000 (GMT)
Received: from ltcrain4-lp15.ltc.tadn.ibm.com (unknown [9.5.7.39])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Feb 2026 20:42:54 +0000 (GMT)
From: adubey@linux.ibm.com
To: linuxppc-dev@lists.ozlabs.org
Cc: bpf@vger.kernel.org, hbathini@linux.ibm.com, ast@kernel.org,
        daniel@iogearbox.net, andrii@kernel.org, maddy@linux.ibm.com,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 0/4] powerpc64/bpf: Add support for instruction array and indirect jump
Date: Thu, 26 Feb 2026 20:43:07 -0500
Message-ID: <20260227014315.39980-1-adubey@linux.ibm.com>
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
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IMEiqJx4NthextgONZ4zH6NDcdAILSrR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4NCBTYWx0ZWRfXxP8mPDIjXI/O
 tAQwqRnApXoWDw9s+RsJ20zoEZMWSfQ8+lWLY12/ONYl5W2UCrVQzPM16qyodkZrKwRokzosOK4
 mVWt/bEKkWrj1FW0oaEcgSFFoRbv68hJQ2HVAWmCso3G7rS4GN1BwJwPZx4QqXO7NcQVYX28xM0
 lgEXHhdg88PsyUE4bkXkR9iQ2ko6IjGsmi0HJiL9dLbSxdC7J+zJE0oGJClAQdOsNNTKpsrItK3
 ANM/3iRmVsaxY5n4v598N853A5cYUWECWIkW0U4W2WdZCNbSJ08d9tIueZwQEprO/aCnkVUWz7j
 Lm93ySPDqTvIRn3RGb1eP6sg4CFNtvZSfMCZZRsnJgfaWJoxFFlFTMY009ZiboBZkiA53lkaDp2
 B468sH+3oGUqoeRo/eQg7Hydi8WnYQV6768r58P4slzT6GlswCZkeZayMkKqM+2Hr7/N6R7DGNt
 ZbVvk83+blMFR4PHCCw==
X-Proofpoint-GUID: IMEiqJx4NthextgONZ4zH6NDcdAILSrR
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69a0b054 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=qf4gfuq51q0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=Ot0sBYFguVUK1xx3aFIA:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602260184
X-Spam-Status: No, score=1.7 required=3.0 tests=DATE_IN_FUTURE_03_06,
	DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.79 / 15.00];
	DATE_IN_FUTURE(4.00)[4];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17316-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[adubey@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: ABC091AF3CD
X-Rspamd-Action: no action

From: Abhishek Dubey <adubey@linux.ibm.com>

The first 2 patch enable support for instruction array. Now, the 
instruction offset map maintain the mapping:
original inst -> xlated inst -> jited inst

The last two patch enable support for indirect jump. Any eligile
register can store jump target address for control flow to jump.

The features will be enabled on ppc32 in a separate series.

The patch series is rebased over:
https://lore.kernel.org/bpf/20260226031324.17352-1-adubey@linux.ibm.com

All selftest related to instruction array and indirect jump
are passing.

./test_progs-cpuv4 -n 20
#21/1    bpf_insn_array/one2one:OK
#21/2    bpf_insn_array/simple:OK
#21/3    bpf_insn_array/deletions:OK
#21/4    bpf_insn_array/deletions-with-functions:OK
#21/5    bpf_insn_array/blindness:OK
#21/6    bpf_insn_array/incorrect-index:OK
#21/7    bpf_insn_array/load-unfrozen-map:OK
#21/8    bpf_insn_array/no-map-reuse:OK
#21/9    bpf_insn_array/bpf-side-ops:OK
#21      bpf_insn_array:OK
Summary: 1/9 PASSED, 0 SKIPPED, 0 FAILED

./test_progs-cpuv4 -n 21  
#20/1    bpf_gotox/one-switch:OK
#20/2    bpf_gotox/one-switch-non-zero-sec-offset:OK
#20/3    bpf_gotox/two-switches:OK
#20/4    bpf_gotox/big-jump-table:OK
#20/5    bpf_gotox/static-global:OK
#20/6    bpf_gotox/nonstatic-global:OK
#20/7    bpf_gotox/other-sec:OK
#20/8    bpf_gotox/static-global-other-sec:OK
#20/9    bpf_gotox/nonstatic-global-other-sec:OK
#20/10   bpf_gotox/one-jump-two-maps:OK
#20/11   bpf_gotox/one-map-two-jumps:OK
#20      bpf_gotox:OK
Summary: 1/11 PASSED, 0 SKIPPED, 0 FAILED

v1->v2:
  Handle image offset for ABIv1

[v1]: https://lore.kernel.org/bpf/20260225010950.20218-1-adubey@linux.ibm.com

Abhishek Dubey (4):
  powerpc64/bpf: Add support for instruction array
  selftest/bpf: Enable instruction array test for powerpc64
  powerpc64/bpf: Add support for indirect jump
  selftest/bpf: Enable gotox tests for powerpc64

 arch/powerpc/net/bpf_jit_comp.c                        | 10 ++++++++++
 arch/powerpc/net/bpf_jit_comp64.c                      |  8 ++++++++
 .../testing/selftests/bpf/prog_tests/bpf_insn_array.c  |  2 +-
 tools/testing/selftests/bpf/progs/verifier_gotox.c     |  4 ++--
 4 files changed, 21 insertions(+), 3 deletions(-)

-- 
2.52.0


