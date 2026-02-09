Return-Path: <linuxppc-dev+bounces-16721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CFAXGJefiWlU/wQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:49:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14910D2F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 09:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8dfW2W0Xz2ydq;
	Mon, 09 Feb 2026 19:49:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770626963;
	cv=none; b=Y4FJHxqHQjSYT4ShfgT6AFsUQiMlEanBMvaPMPzFRI/VlIoglkis1HtOMBt/IB5kizXYZBevZ+Kg41nwXqTirugQX5geQvTGfzGN5HN+qV5RTmrc9cDRXJwfQkBcUOCHfGOdjrkR/C85MMLHgtznDGX+h0PqTfU/wkR5gnVlXHHuksCrDpEMLLPW+hcvHiVtcenq0tbMNPMiEC5PYfN0Pw7Xvf2tKne1gXgkHZxVVvHT5/c2+fhzI3YTKAE3Opc9rjupDiHCWjDL/GIC61sqT/Bis3UWiGaCLU/QJs21s+XTKCf/JZ4z13VjcAkmw52/XsFUgUDWUWDMxorsy3UZBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770626963; c=relaxed/relaxed;
	bh=YnQFQzUNjN2gOs681tQev4rv4hNKCmGJcvC9HKfZEvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O3z1e0HS5dRl17yUvxCCaKGSaeI9YZuT+SpqlR2BhFi+XUa8cZuYgdLlWMcMzrCoikXsZQVYiq/tpja1b5VIZ732LWQP9w0J6vvoTFHrqfcQnbJJ5l30IbD+OJrBctIwyeCu5DRV25KrOFb8zzgPXVfWmwGJ01hGTu4ZQcSnan7GF0dn0Jn5TxFXqCf6uIXK0RNRxQve0iS0gl7tF3GzLc3G+OQJFJBTtECXnPjve/y7awGn/R8aHUsh8i/HrF1J6Lp2jIBLKny/TOq6nn8sHBF0kzO2MlCWoIITTIkwotvc4Vf0+COe+rJa0c8jmE9SNOCgvjrkYegJYi8ikau6RQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=psYdizw0; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=psYdizw0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8dfV0TrQz2xc8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 19:49:21 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6192BVP6806309;
	Mon, 9 Feb 2026 08:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=YnQFQzUNjN2gOs681tQev4rv4hNKCmGJcvC9HKfZE
	vA=; b=psYdizw0Dx/BMqNRdeOGRS5W3yAmhnhr1b3gW00RSzHWB55pmMAjuJlrb
	7sse9ewYEw/s6dpjXaSIyPHz0+dfGhzzEeGGegDTjMgmI7hSoXbUvzfjf+D8CSsh
	oK9hlFFNqszCZ8ahYo/v/RPZCe9uiZvjyRzrk6HJXI6iX7KSINDozMkCYUyIeLIr
	eBD4azhPWplpPgObrBGxhtUUwwxYZ04r7XobCkjXvZEmivB0IX3Ko4SW0c6XbgoP
	RxN5DZibzXioWyeV7nOf5hICpddxyouW5xlHBBHtXFnGCNCPHOY32Old8ohxhV1C
	gCCjpZc0dlaorL77mz4vS2MjqD6EA==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696u66d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:50 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61981nLe008390;
	Mon, 9 Feb 2026 08:48:48 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6g3y4ht7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Feb 2026 08:48:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6198miZW16646538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Feb 2026 08:48:45 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CF5022004D;
	Mon,  9 Feb 2026 08:48:44 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F94820040;
	Mon,  9 Feb 2026 08:48:41 +0000 (GMT)
Received: from li-2fa77bcc-2701-11b2-a85c-cd621c23b6bd.in.ibm.com (unknown [9.79.195.233])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Feb 2026 08:48:41 +0000 (GMT)
From: Sathvika Vasireddy <sv@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: nathan@kernel.org, masahiroy@kernel.org, kees@kernel.org,
        naveen@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
        npiggin@gmail.com, maddy@linux.ibm.com, segher@kernel.crashing.org,
        christophe.leroy@csgroup.eu, mingo@kernel.org, mpe@ellerman.id.au,
        sv@linux.ibm.com, nsc@kernel.org
Subject: [RFC PATCH v3 0/6] objtool: Fixup alternate feature relative addresses
Date: Mon,  9 Feb 2026 14:18:14 +0530
Message-ID: <20260209084820.57298-1-sv@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
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
X-Authority-Analysis: v=2.4 cv=YZiwJgRf c=1 sm=1 tr=0 ts=69899f72 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=voM4FWlXAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=1UX6Do5GAAAA:8 a=5NDuelTg4wUFaKIfu4cA:9
 a=IC2XNlieTeVoXbcui8wp:22 a=Et2XPkok5AAZYJIKzHr1:22
X-Proofpoint-ORIG-GUID: apd56NP4EAJ9jdsu8g3BvI6cI-gS2um2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3MiBTYWx0ZWRfX9bv80hBO5xFh
 m9Pu4YEWTOf4n1Bi0bUD46pNKIz8Mzd/k3uVq7vc/Om4Ial1fkoN/Yy2Vj2d8OFJDTF8GuWu8b2
 QRKnrbiTF/40KYhPKpXHATRN0DMkPEXOdjo5tCjEIzqfXCS8oWR8rfnNU31+oLPFiXho0RdfOZ7
 2mXMf7CSZ7l/zP/JOX/P3gXVUzmx/6OlIPWhto9gR1HwGYAjVkUXEQdZ+9TubBgSsQv+duKNC7q
 X1zZ+xmEl2KX1wduSYvqSH13XlZl0gf92aDGTbdiCr4k6TiLgsNzAATqrYZP+C2W6OpcHcsn4j0
 lcGnYYbjodVM84C6DZm3EfimhQ/+irhcpNIzJaekUdGYrxkEhZbv9bGCNqgiHBd3KV43mGlr3hH
 mgRhuYEp6j5TKS17o00PXVjBLg0hapT+cs25gHMsCFxZD2fSDbiGVNkaRR1/hRBQBTPrqURQT24
 z7/vA+MwAu7lEpBwkdg==
X-Proofpoint-GUID: lh3hroaCX5qepGYOM8XSZXt9j6XEracO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1011 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090072
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:nathan@kernel.org,m:masahiroy@kernel.org,m:kees@kernel.org,m:naveen@kernel.org,m:jpoimboe@kernel.org,m:peterz@infradead.org,m:npiggin@gmail.com,m:maddy@linux.ibm.com,m:segher@kernel.crashing.org,m:christophe.leroy@csgroup.eu,m:mingo@kernel.org,m:mpe@ellerman.id.au,m:sv@linux.ibm.com,m:nsc@kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,infradead.org,gmail.com,linux.ibm.com,kernel.crashing.org,csgroup.eu,ellerman.id.au];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16721-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sv@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,ozlabs.org:url];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 7B14910D2F2
X-Rspamd-Action: no action

This patch series implements build-time fixup of alternate feature
relative addresses for powerpc.

Previously, Nicholas Piggin proposed a build-time solution using a
custom PowerPC tool [1], which provided the foundation for this approach.
The current implementation leverages objtool's existing ELF parsing
infrastructure to do the same.

This patchset applies atop powerpc/merge branch.

Links and History:
[1] Original PowerPC tool approach:
    http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20170521010130.13552-1-npiggin@gmail.com/
[2] Initial RFC v1:
    https://lore.kernel.org/linuxppc-dev/20240422092206.147078-1-sv@linux.ibm.com/T/#t
[3] PowerPC instruction decoder borrowed from:
    https://lore.kernel.org/linuxppc-dev/bfa8364da047d8610a09458a1cd924a0566aedbb.1736955567.git.christophe.leroy@csgroup.eu/#Z31tools:objtool:arch:powerpc:decode.c

Testing:
Build and Boot tested on ppc64le, ppc64be, and ppc32be configs.

Changes in V3:
- Split code into individual patches
- Put objtool call into cmd_link_vmlinux
- Move HAVE_OBJTOOL_FEATURE_FIXUP from arch/Kconfig to 
  arch/powerpc/Kconfig 

Changes in V2:
- Added implementation support for ppc64 LE, BE, ppc32 BE.

Sathvika Vasireddy (6):
  objtool/powerpc: Add build-time fixup of alternate feature branch
    targets
  objtool: Set ELF_F_LAYOUT flag to preserve vmlinux segment layout
  objtool: Fix "can't find starting instruction" warnings on vmlinux
  objtool/powerpc: Skip jump destination analysis and unnanotated
    intra-function call warnings for --ftr-fixup
  kbuild: Add objtool integration for PowerPC feature fixups
  powerpc: Enable build-time feature fixup processing by default

 Makefile                                  |   7 +
 arch/powerpc/Kconfig                      |   3 +
 arch/powerpc/Makefile                     |   5 +
 arch/powerpc/include/asm/feature-fixups.h |   2 +-
 arch/powerpc/kernel/vmlinux.lds.S         |   8 +-
 arch/powerpc/lib/feature-fixups.c         |  12 -
 scripts/Makefile.lib                      |   4 +-
 scripts/Makefile.vmlinux                  |   8 +-
 tools/objtool/arch/powerpc/decode.c       |  15 +-
 tools/objtool/arch/powerpc/special.c      | 437 ++++++++++++++++++++++
 tools/objtool/builtin-check.c             |   2 +
 tools/objtool/check.c                     |  42 ++-
 tools/objtool/elf.c                       |   4 +
 tools/objtool/include/objtool/builtin.h   |   1 +
 tools/objtool/include/objtool/special.h   |  56 +++
 tools/objtool/special.c                   |  29 ++
 16 files changed, 611 insertions(+), 24 deletions(-)

-- 
2.43.0


