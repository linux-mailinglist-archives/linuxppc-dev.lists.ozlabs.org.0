Return-Path: <linuxppc-dev+bounces-7854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681CA94F0C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 11:51:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh0xL6tKBz3c2C;
	Mon, 21 Apr 2025 19:51:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::14"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745229062;
	cv=none; b=CVdN0Db5x19LislANrp4aoRIaPyvMcvIfkF1z9rGthTzco2tIJD1GshOa9yF420sQNsi13WPuuOq1uNrblyczit+Pp3hxvQ6az63CprD0waINYW6ibg4wzJbBOj+ZfsVl1/V1OohZ4/93fx25l2MnU3zcdanQIbM8iY3X54tgzetL9efOdzXlUfFGHqqEFNN0u5aFE1ZsUVkst95uRULi4TD5hQq1BMULSi6AU3aGYTh0AnNGb1FMMkygS+28ZLo5iT6F4x1Q/vAKtRe5Meu1silXT5LJRL0qAZN2fklJIWWVWUupy1PFfYXsunZrFNm5CLRTEfIxQf5LaVBRiYjMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745229062; c=relaxed/relaxed;
	bh=comqgaUQOxn93ZxQu1EvnNHU0RsO6P+D6nZ/mcIInMw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikwaUDpunm85o4mdtiStGa0mSxkzW6GRI51e/mUp2cc2TaFb+0ZcxsKPgEnYed190J2qpHsq7ShMTIe4px/r+Qe+mX7TFUpmJyBhezzLk5FHv/F7qsAw6reJRPWH41/aR53OCLe3/xri/Y0mcryNCc/qgs+XAjDLlcEWAD1tgYIq7NaSi4hauIqYMq60I81t0zUrfS68A/G4726ikyuzVUT7XWvci+iI9ex7ZgsWUDxnVeJwg67NLdhdFkFH5B5volUlQgaTl1i33ZZVJNS9MR0USZDHOrxLEzSGrgDduS7NWM9yEcKcLJgYSjf2OzCns1XvmnjnxZJfRFewEG+5Ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=snzUOYRQ; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=snzUOYRQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh0xK5HqSz2yYJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 19:51:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1745229058; bh=comqgaUQOxn93ZxQu1EvnNHU0RsO6P+D6nZ/mcIInMw=;
	h=From:To:Subject:Date:In-Reply-To:References:From:To:CC:Subject;
	b=snzUOYRQlWCuQNdt+aRBbVgCYN3e81XK7ZKQS84VXg08XOCJyfrKz3kz2AsKoVgtX
	 CBmwq8t/ET6b3LOqRKJGX8f+mF6j3QzxpnN2xCIHNz2+gjKjcpj5tOUCngZHak9ilr
	 pP0AOvCNeG9Y6NgcZW57XsWioVUaYhtiY0EPtc4NVHsOpEAa1x25c7ByQq4lQ9tuy7
	 K+syGWQ+gEPsnH1bbOz76UoIJxxNtaiS72ma1Tw18oQGi9fH7H4sLnMPt5zqSjy5Mx
	 OcI/iRzG8wBSiYrIrIwLLY9eufFdt0DJr6Brl5mhhBl2WPQTM6xRvS8H+0OJOI35IP
	 YfWkFHS2+qfwg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zh0xG2pkvz8shv;
	Mon, 21 Apr 2025 11:50:58 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3600:7e00:5b67:6b9c:caeb:75c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3600:7e00:5b67:6b9c:caeb:75c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18yPx2sYrjGa0RSvjuhGTnmvUS3lQ6MWsI=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zh0x32mSsz8sdr;
	Mon, 21 Apr 2025 11:50:47 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Saket Kumar Bhaskar <skb99@linux.ibm.com>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Jiayuan Chen <mrpre@163.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH bpf-next v2 09/11] selftests/bpf: Add test for Spectre v1 mitigation
Date: Mon, 21 Apr 2025 11:18:00 +0200
Message-ID: <20250421091802.3234859-10-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421091802.3234859-1-luis.gerhorst@fau.de>
References: <20250421091802.3234859-1-luis.gerhorst@fau.de>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is based on the gadget from the description of commit 9183671af6db
("bpf: Fix leakage under speculation on mispredicted branches").

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
---
 .../selftests/bpf/progs/verifier_unpriv.c     | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tools/testing/selftests/bpf/progs/verifier_unpriv.c b/tools/testing/selftests/bpf/progs/verifier_unpriv.c
index c42c3839b30c..43236b93ebb5 100644
--- a/tools/testing/selftests/bpf/progs/verifier_unpriv.c
+++ b/tools/testing/selftests/bpf/progs/verifier_unpriv.c
@@ -729,4 +729,61 @@ l0_%=:	r0 = 0;						\
 "	::: __clobber_all);
 }
 
+SEC("socket")
+__description("unpriv: Spectre v1 path-based type confusion of scalar as stack-ptr")
+__success __success_unpriv __retval(0)
+#ifdef SPEC_V1
+__xlated_unpriv("if r0 != 0x1 goto pc+2")
+/* This nospec prevents the exploit because it forces the mispredicted (not
+ * taken) `if r0 != 0x0 goto l0_%=` to resolve before using r6 as a pointer.
+ * This causes the CPU to realize that `r6 = r9` should have never executed. It
+ * ensures that r6 always contains a readable stack slot ptr when the insn after
+ * the nospec executes.
+ */
+__xlated_unpriv("nospec")
+__xlated_unpriv("r9 = *(u8 *)(r6 +0)")
+#endif
+__naked void unpriv_spec_v1_type_confusion(void)
+{
+	asm volatile ("					\
+	r1 = 0;						\
+	*(u64*)(r10 - 8) = r1;				\
+	r2 = r10;					\
+	r2 += -8;					\
+	r1 = %[map_hash_8b] ll;				\
+	call %[bpf_map_lookup_elem];			\
+	if r0 == 0 goto l2_%=;				\
+	/* r0: pointer to a map array entry */		\
+	r2 = r10;					\
+	r2 += -8;					\
+	r1 = %[map_hash_8b] ll;				\
+	/* r1, r2: prepared call args */		\
+	r6 = r10;					\
+	r6 += -8;					\
+	/* r6: pointer to readable stack slot */	\
+	r9 = 0xffffc900;				\
+	r9 <<= 32;					\
+	/* r9: scalar controlled by attacker */		\
+	r0 = *(u64 *)(r0 + 0); /* cache miss */		\
+	if r0 != 0x0 goto l0_%=;			\
+	r6 = r9;					\
+l0_%=:	if r0 != 0x1 goto l1_%=;			\
+	r9 = *(u8 *)(r6 + 0);				\
+l1_%=:  /* leak r9 */					\
+	r9 &= 1;					\
+	r9 <<= 9;					\
+	*(u64*)(r10 - 8) = r9;				\
+	call %[bpf_map_lookup_elem];			\
+	if r0 == 0 goto l2_%=;				\
+	/* leak secret into is_cached(map[0|512]): */	\
+	r0 = *(u64 *)(r0 + 0);				\
+l2_%=:							\
+	r0 = 0;						\
+	exit;						\
+"	:
+	: __imm(bpf_map_lookup_elem),
+	  __imm_addr(map_hash_8b)
+	: __clobber_all);
+}
+
 char _license[] SEC("license") = "GPL";
-- 
2.49.0


