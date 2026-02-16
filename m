Return-Path: <linuxppc-dev+bounces-16868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOynJci/kmmrxAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16868-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 07:57:12 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A88D5141271
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Feb 2026 07:57:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fDtqg6BRpz2yqs;
	Mon, 16 Feb 2026 17:57:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771225023;
	cv=none; b=Cf+tUq20haakuKtON3trOWJTdcXXF7ep0QhLioypy0HUJIjokaNLc95Ww/PxC7LCYbEbfOu57+cnMt4Httxpvr/tOo66ql0AoUbCUdD2UPt9EIktAPnIcdNGBnZxGKIfxAt6YE+WZwFrYgNhdYWObH573EnSU+cNLiByS7c7/G/ACGm1uF6XPs3YI2DON9eIqQw58PGUl8tSbzwOyjhgMWW5FlLwL4OIdHWwbPd88MbjK5BykjhLW3WgBT1VXXXydr1Vs/ayr7hIpqTwo+bhgKXdW7EuTSuEhvBj55O6cElz8BJN1bgLboKhoNnz+xo1YEnLvoUgLwlv3aMNK9heeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771225023; c=relaxed/relaxed;
	bh=SfHWKWB1JzriRGsl3w+kqCVO0uJak/1RnASCWfq7VCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DGCBxQrnAxsSyIiEmWdY7XhDvKvUH4nPQWYUNk8Xp2LA8Fard+1pSb3KYSR7n4et/ajbOoPxXxvQDvJzxfiXUf132QagPoIjwPDkt/7HZauu2/tqObOezenSVBBU3nwZgGoxnpoyGIZdMVDmS9zLyqD4TxE0CdpJdZxM7dZU2qrb0X7FlHP1iHSLl+p+8DnHkbpLM7YIfVuxknLbcMXHwsnY3+9lRp0Y1Aeo+wmwKP35HsrCc8vkd5mS5Y7bPX3ATnovrcvLgRR/SVZTOSCXHwzKt7zuehyZTg3yc+iVKiQIOi6oJZTCOuq+jZ133I7zJi0wvWVaKYFni3IxrOGfLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f27KTx8s; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f27KTx8s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fDtqf2yMVz2xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Feb 2026 17:57:01 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61FKD3q43368131;
	Mon, 16 Feb 2026 06:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SfHWKWB1JzriRGsl3w+kqCVO0uJak/1RnASCWfq7V
	CE=; b=f27KTx8sXPoHLdcrsRoWY57dSyOoFqxuFKeh9wfsfUDVLmLkdCnk0usEw
	jd+JC2CsrKyylOFE+mNgSvpLRBXHA1lgaM1+6mhjRp2Q4yLaieUQaTwIkxgHzkU5
	hlREh1aONq2jbV2di4oiCIJSGoWEaqcjhn0gNikLlqHQIWvRKog98cdK5Ox52Uov
	UX6z9S4YD9Q9iy4/VviNu3Ou3Rn/8xdVs2Gl1eKrpoKZTKj3nVnmkMp5btfL49fL
	+2tQo5lt9f//7zIXsjD8NeY0bmnXbH739u+UjMmMvqVCCqpKZTkoZXJk2I/p6Nek
	HEOHFInNd8i+IhEAs5HH5O5NRA0Ig==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6uef42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 06:56:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61G6IR3v012624;
	Mon, 16 Feb 2026 06:56:45 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cb3crvg41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Feb 2026 06:56:45 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61G6ufrs44892456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Feb 2026 06:56:41 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D0B7C2004B;
	Mon, 16 Feb 2026 06:56:41 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D62C2004D;
	Mon, 16 Feb 2026 06:56:40 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.17])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Feb 2026 06:56:40 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH 0/5] powerpc64/bpf: various fixes
Date: Mon, 16 Feb 2026 12:26:34 +0530
Message-ID: <20260216065639.1750181-1-hbathini@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=E+/AZKdl c=1 sm=1 tr=0 ts=6992bfae cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=oGHz_WyVdRSB3F18xrQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA1NCBTYWx0ZWRfX2gZYZ9yyZB2P
 qO1amFd8pYaHP7824vNHBJXErtsbAPvJnm8zzsUXBMGd5D2KCzcREsX3JjSqZ8QhosQVNh4vf8C
 xp8RmvqVJvNXHzzUYHeWjIyBtrcbTqzLWyG1rY9BFvXBE5y1wWhfgSoDI5KeZvhAHRdYCvhSeyl
 vjSsjh1if650/yagb8O0EmY8qjQDOdMx4zBRgClaWwk3O6hUpjymUbGL5EJfrILzmosMXhDOeq0
 XuzjbthYdOkI/x8QdO77IspfOvHcMD5U6kY3BxvR1vKRyIokYq6/QSHyhC5dDTWxpcB1TxID1Wr
 RssRagOmUZAgJC7zPQnqI6mF/uKY1FNzrYH+LXRcoYmeRKiDHAUpGdvL4VMeDscMG5rROdpErpV
 3nr5fQeiiiEECDD8GAzXitfJ77svTRZwWooFzCh+WPMDHG1VX6irMW4eF5fnDEiVZMIonFaTwbD
 8mbKgLxz1wbSJsPeIdQ==
X-Proofpoint-ORIG-GUID: P4lboRg9RZ-XA9UPo2hBW0V0hKQriCKa
X-Proofpoint-GUID: P4lboRg9RZ-XA9UPo2hBW0V0hKQriCKa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602160054
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16868-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[7];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A88D5141271
X-Rspamd-Action: no action

List of fixes for powerpc64 BPF JIT:
- Patches 1 & 2 fix issues with existing powerpc64 JIT and are tagged
  for -stable.
- Patches 3 & 4 resolve issues with bpf2bpf tailcall support added
  recently.
- Patch 5 resolves an issue reported by bot+bpf-ci@kernel.org while
  adding exceptions support on powerpc64 BPF JIT.


Hari Bathini (5):
  powerpc64/bpf: do not increment tailcall count when prog is NULL
  powerpc64/bpf: fix the address returned by bpf_get_func_ip
  powerpc64/bpf: use consistent tailcall offset in trampoline
  powerpc64/bpf: remove BPF redzone protection in trampoline stack
  powerpc64/bpf: fix handling of BPF stack in exception callback

 arch/powerpc/net/bpf_jit.h        |   5 --
 arch/powerpc/net/bpf_jit_comp.c   | 113 ++++++++++++------------------
 arch/powerpc/net/bpf_jit_comp64.c |  74 ++++++++++++-------
 3 files changed, 93 insertions(+), 99 deletions(-)

-- 
2.53.0


