Return-Path: <linuxppc-dev+bounces-2707-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D41409B5C5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 08:10:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XddYM4pWTz2yxP;
	Wed, 30 Oct 2024 18:09:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730272199;
	cv=none; b=ONbhSj4CtI6CIcyzhAmvdlZ1+uOQo8kx1SCXOTkRmVUiLZ1jj0LbuBXj3vWONoOt1OHkZ6bMUE9Wu8yz2p6FIWNICm6r+1YsIK0jgdNiE2nQdAAMlF3iQAPWoO7YCTr/O6PbJZjO3YeCdHVyYDj88SYSC1/hihAJUtL4bq5qvxf54eK1nMNFu1SxTOh+zxKl5+4p4CTVW6aGY2zp6NfIk3v/dMSz640buqa+OP68Y89hkhKNWiKomgj/t/0NVXO2YGN2qunLleTBQMANesytv5qNAQqgvR3TKZhu1qvEtta2RGswfGOTd62+B8L2L5zP6a2zsCsEfSQ0ndG4xjZD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730272199; c=relaxed/relaxed;
	bh=fMqU1TC7xuIT8q8DHtbVoyWQNBWznIEINbrSJnudSu0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lmUSGZTabILkGANsb7PDLCrPPg1iJr/h2xygBIH4ANz4l7WgLXJdSqZldlZYMkihqVWwB2YSGse3kid5y9NsdfP0E76L0gRijR8q9jbtRA3jVM9Zw7Erfk8rSgOlIo3wFIIuOlco83bCBB/du1qti5dq/7STEcv6H8BN/lK3wV7suhiFLuURQJzEB0mNF/j03c47kRqiJ9iftHwQIKkdhzDoSfSVKx3/VuoeAxE2e336QI+J0xKpitvT4f9zhOMbK9jrPGsSsEjgbINg8YtWZYs7hw5bu0OzLtNQo6DZ0EAsng8lUM9YXVPSQil+FSHem43qqLYtqH2Gts6Oc6dPsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i82S1ref; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i82S1ref;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XddYL5CbVz2yZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 18:09:58 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U2d25p002096;
	Wed, 30 Oct 2024 07:09:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fMqU1TC7xuIT8q8DH
	tbVoyWQNBWznIEINbrSJnudSu0=; b=i82S1refGSBBgdSUTVlYoYbIZaacqg5HE
	GhH2ryToLqb8hM9KBus/a0oZ/foe+NpwxmjZMhgTexpXMtFCCjM961GyHWTRGMfj
	EmbYaOwPxSokFU9i2my/j+2ONcjKJIoslabqKC2JiQDxHDptCoHO3G26gypoSFzv
	pYiZAVrMpheWfj0sHcvnyDZIlSNnu7a30UtgYF6sePciL+ljbefodk2579DEE0cI
	rnWL7cazZmjOxLet6gOH/WfHJEGH3PImZ1CaxoixB2fEf8bfyXBZceFkcEe04Pab
	LfM0eZqrKstdjMKOnoAZF68A6MzWuIHIu7jMozyEsEvWxn019ZUvA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j43g5hm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:33 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49U79Xh8031262;
	Wed, 30 Oct 2024 07:09:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42j43g5hkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:32 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49U6kHhE028170;
	Wed, 30 Oct 2024 07:09:31 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42hb4xy120-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 07:09:31 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49U79S6a26608326
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Oct 2024 07:09:28 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF60420043;
	Wed, 30 Oct 2024 07:09:27 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14B792004B;
	Wed, 30 Oct 2024 07:09:24 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.203.115.143])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 30 Oct 2024 07:09:23 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao" <naveen@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Andrii Nakryiko <andrii@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Vishal Chourasia <vishalc@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Subject: [PATCH v7 08/17] powerpc/ftrace: Move ftrace stub used for init text before _einittext
Date: Wed, 30 Oct 2024 12:38:41 +0530
Message-ID: <20241030070850.1361304-9-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241030070850.1361304-1-hbathini@linux.ibm.com>
References: <20241030070850.1361304-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: FKpdpZl3IYL28_mALACe8ouT4YoP7ozH
X-Proofpoint-ORIG-GUID: mshknU9CYKOIDfues1PagZev2DPPPAmN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300051
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Naveen N Rao <naveen@kernel.org>

Move the ftrace stub used to cover inittext before _einittext so that it
is within kernel text, as seen through core_kernel_text(). This is
required for a subsequent change to ftrace.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/vmlinux.lds.S | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 7ab4e2fb28b1..b4c9decc7a75 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -265,14 +265,13 @@ SECTIONS
 	.init.text : AT(ADDR(.init.text) - LOAD_OFFSET) {
 		_sinittext = .;
 		INIT_TEXT
-
+		*(.tramp.ftrace.init);
 		/*
 		 *.init.text might be RO so we must ensure this section ends on
 		 * a page boundary.
 		 */
 		. = ALIGN(PAGE_SIZE);
 		_einittext = .;
-		*(.tramp.ftrace.init);
 	} :text
 
 	/* .exit.text is discarded at runtime, not link time,
-- 
2.47.0


