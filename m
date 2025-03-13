Return-Path: <linuxppc-dev+bounces-7014-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22174A601F4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 21:10:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDJWg18CQz3cZ2;
	Fri, 14 Mar 2025 07:10:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::14"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741888664;
	cv=none; b=iB/7NlvR/ohaKXNNw1cPAMOKYD80fDsGmhX6M3XUis2R8WH5XzoJS6xurByHvtTjvUQX21Bx4+4/x8qw+iXUbkQwphtuqoqOFukpNkYPQzSrYVSSsHK6joSeTUYh2Af+/I/L0NKPyAgpm9fe2xFri2JDdM70nPFq/9EvWIBnHgv7utLhbU2l79wekUlnGZu7w+68hekenSSPaW5t5jQOVNOCiiYIViF3dzs9PT0xZQIy77fjPsvMWGjFTGLU3D/n4v8fKzG56NNGWrazvUKjoUK22DFSi1j8oGRJ83WMSrjtuY5ATNBXmvtzT54CRHux8QYDStFx0IjzRXN3gozstQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741888664; c=relaxed/relaxed;
	bh=inXF0fSbPXzIw85fLojKxfeAwoCHVSrQnIcBk6Xmr0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AbfdbRrFNOuwPUZ1iKqq9gApKi0tjwIBg0Alyxn+XmyigpAz0YpIzJAW73RGsAVQBjWFZQMTbugV+vJSfsfBi/ebiGWfqSxQJflQXRGtDwZva8nXmVR8xdLT8Csz2LtoKXptw4C0rmoKugm5xIZWsfoLfMD3HdpwqRghYBiUsWiweO0XSZPRcX8DBcmqizedKsIFSOuwdtBvscCOXpfTwNEL8aClh3oOyqjce2McIckVgOPMJVawiB8sEZiUlMTKBFhIGaH520NIrdkNY+8qakY06UHiMQZOxrrF5O2uP6sqRjfONkDFdNlV4a83s/eeVecz8iKou+TQA+lCye32NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=AxKMmKCQ; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=AxKMmKCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDFZv6d58z3c6c
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 04:57:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1741888660; bh=inXF0fSbPXzIw85fLojKxfeAwoCHVSrQnIcBk6Xmr0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=AxKMmKCQ/tUIryjmV6bln3IsP87BGHN2B6gCMBY0/d23v1QncY7Fg4tvz9Ply2c2E
	 EtZ9j5hk/a93x8xbTIDeFfX4xhjnAVkRHkqxR8JXcWkfYBYn7XqIDdRKjBW5K87Ulo
	 CNJgfqkZkXshsU8mgMnsK14BhABBlO4wuzXR08U5aw0PIYhxgH+zSWNXs1ZU6RpevA
	 c5zAnwkfBTXgRsb0ihRA3j+8KZaIVNDtvH5S/9CVFPq29NX+vt8ZOFeBQn2HXQM5tN
	 9k0MxlQGKreHFKOYa/LE6axle2cpz397PbIJD/cx26VfVqozGpfawjRItUXG8S00o0
	 WqDysq/Kj/HAg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZDFZr3T6Cz8t05;
	Thu, 13 Mar 2025 18:57:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3614:2b00:7ee6:68e5:4447:ba92
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3614:2b00:7ee6:68e5:4447:ba92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+HSEbJ8SZ+LQGIWIboOg0KFAeQEvQjoXs=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZDFZm2cS5z8svD;
	Thu, 13 Mar 2025 18:57:36 +0100 (CET)
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
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	WANG Xuerui <git@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next 11/11] bpf: Fall back to nospec for spec path verification
Date: Thu, 13 Mar 2025 18:53:12 +0100
Message-ID: <20250313175312.1120183-2-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313175312.1120183-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
 <20250313175312.1120183-1-luis.gerhorst@fau.de>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This trades verification complexity for runtime overheads due to the
nospec inserted because of the EINVAL.

With increased limits this allows applying mitigations to large BPF
progs such as the Parca Continuous Profiler's prog. However, this
requires a jump-seq limit of 256k. In any case, the same principle
should apply to smaller programs therefore include it even if the limit
stays at 8k for now. Most programs in [1] only require a limit of 32k.

[1] https://arxiv.org/pdf/2405.00078 ("VeriFence: Lightweight and
    Precise Spectre Defenses for Untrusted Linux Kernel Extensions")

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 03af82f52a02..49c7e2608ccd 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -187,6 +187,7 @@ struct bpf_verifier_stack_elem {
 };
 
 #define BPF_COMPLEXITY_LIMIT_JMP_SEQ	8192
+#define BPF_COMPLEXITY_LIMIT_SPEC_V1_VERIFICATION	(BPF_COMPLEXITY_LIMIT_JMP_SEQ / 2)
 #define BPF_COMPLEXITY_LIMIT_STATES	64
 
 #define BPF_MAP_KEY_POISON	(1ULL << 63)
@@ -2010,6 +2011,19 @@ static struct bpf_verifier_state *push_stack(struct bpf_verifier_env *env,
 	struct bpf_verifier_stack_elem *elem;
 	int err;
 
+	if (!env->bypass_spec_v1 &&
+	    cur->speculative &&
+	    env->stack_size > BPF_COMPLEXITY_LIMIT_SPEC_V1_VERIFICATION) {
+		/* Avoiding nested speculative path verification because we are
+		 * close to exceeding the jump sequence complexity limit. Will
+		 * instead insert a speculation barrier which will impact
+		 * performace. To improve performance, authors should reduce the
+		 * program's complexity. Barrier will be inserted in
+		 * do_check().
+		 */
+		return ERR_PTR(-EINVAL);
+	}
+
 	elem = kzalloc(sizeof(struct bpf_verifier_stack_elem), GFP_KERNEL);
 	if (!elem) {
 		err = -ENOMEM;
-- 
2.48.1


