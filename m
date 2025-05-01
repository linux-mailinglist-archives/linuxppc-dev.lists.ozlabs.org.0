Return-Path: <linuxppc-dev+bounces-8213-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46ADDAA5B74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 09:39:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zp5Xj5Rxgz2xjK;
	Thu,  1 May 2025 17:39:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.22
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746085157;
	cv=none; b=FLb7eszhimbnbctQoU6eGJXBt6x0bQ9MJBIZ4Xz+Uq6v1Xypq9QmO/WEumt97Qt6IxqNC+t3FUj2+DR9nipPJWKe/cO1H73xRU4wLm4uEMQRrwYeY321Iy0RkJwKahVIceC3NowtR52jWrkSmfTTlGy6vS2aVnvR/TV5lg/ve883TbSomFJk59rPlSPIT6RU5zH55gh8A+nFJwYlSb2j9g5B8KgpkBWnC44LaSDx2TR/sSGp7eJuSx9vOwl1hhWzaSsXrOdGjYwvcAbaAqnVRlqhV+bTgWGnxsiL5zf3B+w8cjLV+XpsAzmElqR7lVcIBENxdiWGZYLrRbvnYUD7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746085157; c=relaxed/relaxed;
	bh=x1254cGxcCub/kUQM5hyyDzmObtkQ9/oIwWSNnQPgK4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=R75OpUQD5cU4kMd0xbcRRYdH8KcWx4eLeLT8XmvrB3F+/r1M4kTFxmwxGYY0oxrWFC3530I7wUa0MovnyZgDSX1gEy0UYUbi2FcwT53o86SRuhS7LurxemxjTrGZra2c2zvzuqZWxYh2gtcBLy8CTgQExiJOvxQqRz9QqxguvxBndXmgHeFI3M5nspI+FRG5fbBpgsXGmhBLmk3jythY06zzAhw+aw45tMBmrlApgOH5vV21CScVasD/siqaBIKRAF25savK6k7sS+mCWdviSZwgBxdjEhJTcySySKvTRk+gaTibvHqUsNRm7R91guzb8tpncUEm9O6dSh9NF91SDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=FX3yLych; dkim-atps=neutral; spf=pass (client-ip=131.188.11.22; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=FX3yLych;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.22; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de [131.188.11.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zp5Xj0JL4z2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 17:39:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1746085151; bh=x1254cGxcCub/kUQM5hyyDzmObtkQ9/oIwWSNnQPgK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From:To:CC:Subject;
	b=FX3yLychYpnbM41rzVxjhzYjWpqFtMMfFl0/eHPmVM6vLil3mxlWlhfQqx1eMKq35
	 PaBHRJM/523p3naZaSkiQH2f9O1BROVtxVYeVzFlpqc89WiFNhsXYR9ugMkUy2fBsh
	 o0czQCiMH/Ba6T42kV8XUeCJEwW61yGWTkHFjpCoSoTfGB4W6R7Jr0M+ePJV7Oiftb
	 fWxXiRp1K+gp1kRuTyfxfCf/oIsDmOy3bz2WbMxn9ADd+w8D/LyYYE+fhgJCc7QEhQ
	 D0S5eOw0QV3kyVLh9iDNr6bLkPnUl4B6xmpHSeQgwCk5G7WL7ebqK3lceKS00XbzGW
	 ad3HH/BixD9Cg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4Zp5Xb4D4Kz210D;
	Thu,  1 May 2025 09:39:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3636:a700:12b2:e53f:6cbc:f48c
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3636:a700:12b2:e53f:6cbc:f48c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+zpOyiwhLO6/w+KVc9wUxs9Zvj7+vbGvk=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4Zp5XX1rzQz1yR1;
	Thu,  1 May 2025 09:39:08 +0200 (CEST)
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
Subject: [PATCH bpf-next v3 01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
Date: Thu,  1 May 2025 09:35:52 +0200
Message-ID: <20250501073603.1402960-2-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501073603.1402960-1-luis.gerhorst@fau.de>
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Currently, __xlated_unpriv and __jited_unpriv do not work because the
BPF syscall will overwrite info.jited_prog_len and info.xlated_prog_len
with 0 if the process is not bpf_capable(). This bug was not noticed
before, because there is no test that actually uses
__xlated_unpriv/__jited_unpriv.

To resolve this, simply restore the capabilities earlier (but still
after loading the program). Adding this here unconditionally is fine
because the function first checks that the capabilities were initialized
before attempting to restore them.

This will be important later when we add tests that check whether a
speculation barrier was inserted in the correct location.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Fixes: 9c9f73391310 ("selftests/bpf: allow checking xlated programs in verifier_* tests")
Fixes: 7d743e4c759c ("selftests/bpf: __jited test tag to check disassembly after jit")
---
 tools/testing/selftests/bpf/test_loader.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_loader.c b/tools/testing/selftests/bpf/test_loader.c
index 49f2fc61061f..9551d8d5f8f9 100644
--- a/tools/testing/selftests/bpf/test_loader.c
+++ b/tools/testing/selftests/bpf/test_loader.c
@@ -1042,6 +1042,14 @@ void run_subtest(struct test_loader *tester,
 	emit_verifier_log(tester->log_buf, false /*force*/);
 	validate_msgs(tester->log_buf, &subspec->expect_msgs, emit_verifier_log);
 
+	/* Restore capabilities because the kernel will silently ignore requests
+	 * for program info (such as xlated program text) if we are not
+	 * bpf-capable. Also, for some reason test_verifier executes programs
+	 * with all capabilities restored. Do the same here.
+	 */
+	if (restore_capabilities(&caps))
+		goto tobj_cleanup;
+
 	if (subspec->expect_xlated.cnt) {
 		err = get_xlated_program_text(bpf_program__fd(tprog),
 					      tester->log_buf, tester->log_buf_sz);
@@ -1067,12 +1075,6 @@ void run_subtest(struct test_loader *tester,
 	}
 
 	if (should_do_test_run(spec, subspec)) {
-		/* For some reason test_verifier executes programs
-		 * with all capabilities restored. Do the same here.
-		 */
-		if (restore_capabilities(&caps))
-			goto tobj_cleanup;
-
 		/* Do bpf_map__attach_struct_ops() for each struct_ops map.
 		 * This should trigger bpf_struct_ops->reg callback on kernel side.
 		 */
-- 
2.49.0


