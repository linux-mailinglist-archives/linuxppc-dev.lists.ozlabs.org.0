Return-Path: <linuxppc-dev+bounces-9557-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D44E9AE08C0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 16:29:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNNK31nKfz2xck;
	Fri, 20 Jun 2025 00:29:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::14"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750343351;
	cv=none; b=iGrzEf17T9EyiWEv8m+2x6Uw77itK0GVRsBK/SdXPwIaYVW2Z+A8nmVh8afHQ9vGt75qQeHkfSmcsfcrJmo5be/eBYdY92BCSCf+AmM8AGk01IFpOMNi1GP1wHtv99ToutBXeVQfm2vcdiPrehFfLzGVmVYBNewYoSXz/wO7xTfacypvPg+dGtLePuE9PPnACjBBm3N2npEpqF+aIIybtRnUuz2Y+gSdK744Z8RLrgu0PWKq3qjnifSEWyxdZTtyjPTOz5HOF+vuwWOIQ/0A421eVy3kNLsiSYBLyaCowolwxwQSBtgy2G318EZSmtPRS2207+eMc0ew++icCtxrNg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750343351; c=relaxed/relaxed;
	bh=S14nIAZKvZkp/VwnTFIYJCuXUidvu32HhMy8SRNMghs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ozIFY4GdaoDuyONFPpp+XYf1zl9uKp54TRJ3DfbZc5dkZs6RncFe0SejQeyy6cGiL7TBXn0YI4A3307B/bR7xAdONVV0JOUBs30UaJtgaw0rDSdi4WWClQhDCG4Nde7i+5jZzZgZId5SpN8sf27i8HIpmxGU/gf0dJgayDfyqe/POpax8RKNriVGWkCGtM3AT9P4+/rBb5Ui2SKq14lExqUEiNz2mnfcVw90GzogpQ45Y7eI5584AAmEThpel2AUkVlNYYpo++CSA/eYLERCeLSp5KsEkC8mAL8XAtWJ6gAFxt0EOvvCz3n8wV7kcMCcX+c6xyigpTaxZkdQDlMqpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=XWPeZLyf; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=XWPeZLyf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNNJy2GH1z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 00:29:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1750343336; bh=S14nIAZKvZkp/VwnTFIYJCuXUidvu32HhMy8SRNMghs=;
	h=From:To:Cc:Subject:Date:From:To:CC:Subject;
	b=XWPeZLyf+OeOlBWfNzuhC15Vnxb95TmG2vo5NyCaRFC2kbC1jiYUkY0smdSnfkuFs
	 aiBCQ2SuVwtJBj19lPaJhJlWP9IZRsQu7PL6+4CrVDG3b1lU88UjEmkUXeoAybvumU
	 4rcOi5uhgJ01j0bek/6LpWvZgsbH4uUXgDE2WTdVgtltXmpA1UxSE9/pnJBY31N+Wd
	 Y/5C/qRyV2BxtU/PDuvH1p7E6ub9+EdEJjOJ+Apx4G7ohUV2DsoOu770hUJRx3iaVN
	 ZQROW8T15UrrOX4RCm662XlOqdWD1mZn8Vz9ff68GQfJbAQODbkzzWkQ+SPmfeVSQV
	 gTfJ5FIZViFCQ==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4bNNJl6ZMyz8sqg;
	Thu, 19 Jun 2025 16:28:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3610:e200:f74c:d89c:f3eb:14e2
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3610:e200:f74c:d89c:f3eb:14e2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19YMo4uslHrzyvMvsz98NrnEv3rvWYw/jc=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4bNNJh4dDMz8spN;
	Thu, 19 Jun 2025 16:28:52 +0200 (CEST)
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
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	bpf@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH bpf-next] powerpc/bpf: Fix warning for unused ori31_emitted
Date: Thu, 19 Jun 2025 16:26:47 +0200
Message-ID: <20250619142647.2157017-1-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
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
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Without this, the compiler (clang21) might emit a warning under W=1
because the variable ori31_emitted is set but never used if
CONFIG_PPC_BOOK3S_64=n.

Without this patch:

$ make -j $(nproc) W=1 ARCH=powerpc SHELL=/bin/bash arch/powerpc/net
  [...]
  CC      arch/powerpc/net/bpf_jit_comp.o
  CC      arch/powerpc/net/bpf_jit_comp64.o
../arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
../arch/powerpc/net/bpf_jit_comp64.c:417:28: warning: variable 'ori31_emitted' set but not used [-Wunused-but-set-variable]
  417 |         bool sync_emitted, ori31_emitted;
      |                            ^~~~~~~~~~~~~
  AR      arch/powerpc/net/built-in.a

With this patch:

  [...]
  CC      arch/powerpc/net/bpf_jit_comp.o
  CC      arch/powerpc/net/bpf_jit_comp64.o
  AR      arch/powerpc/net/built-in.a

Fixes: dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506180402.uUXwVoSH-lkp@intel.com/
Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
---
 arch/powerpc/net/bpf_jit_comp64.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 3665ff8bb4bc..a25a6ffe7d7c 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -820,13 +820,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		case BPF_ST | BPF_NOSPEC:
 			sync_emitted = false;
 			ori31_emitted = false;
-#ifdef CONFIG_PPC_E500
-			if (!bpf_jit_bypass_spec_v1()) {
+			if (IS_ENABLED(CONFIG_PPC_E500) &&
+			    !bpf_jit_bypass_spec_v1()) {
 				EMIT(PPC_RAW_ISYNC());
 				EMIT(PPC_RAW_SYNC());
 				sync_emitted = true;
 			}
-#endif
 			if (!bpf_jit_bypass_spec_v4()) {
 				switch (stf_barrier) {
 				case STF_BARRIER_EIEIO:
@@ -849,10 +848,10 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 					break;
 				}
 			}
-#ifdef CONFIG_PPC_BOOK3S_64
-			if (!bpf_jit_bypass_spec_v1() && !ori31_emitted)
+			if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
+			    !bpf_jit_bypass_spec_v1() &&
+			    !ori31_emitted)
 				EMIT(PPC_RAW_ORI(_R31, _R31, 0));
-#endif
 			break;
 
 		/*

base-commit: cd7312a78f36e981939abe1cd1f21d355e083dfe
-- 
2.49.0


