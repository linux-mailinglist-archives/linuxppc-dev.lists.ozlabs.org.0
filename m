Return-Path: <linuxppc-dev+bounces-9117-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60531ACCEA0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 23:07:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBjvv5LyMz2y92;
	Wed,  4 Jun 2025 07:07:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::16"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748984843;
	cv=none; b=nNQxWbmUO52fPqOp+iQYdxSfzW3uynkANu+F//+8l7NHjcqB2zLt7UEIIO5aiRM5v3BViafWQdjrivUoDLKtR65fvpIoShnN8rHJctqKxewVMZXRrML4DwgsoXBSJDqEiswVEDQQxjpO13b2uCLwywe3aPheoIQoXd9dJcw8xlEsxTm5gvupekwGzRjOQsLEeKfyh/jG5Y71GA0BMFoKV4KonXJyC3xltGG2Rljs+MbSP8Aieo05B8W0A+R+8mgOxWlvNSRdRMxfypttPPsqu18QNpxSr3DbJ+f7aTjWpwPXeoPu/zBMoMxL3mXEAWq+Ae9s5vjsL2AJnyCl/jb9oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748984843; c=relaxed/relaxed;
	bh=YVxtmO4xn8cSl7FBJlgzMb9wooxDCpxLcAclWqMaFmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PhRbpUM3C4fDxsCJArpAKL3JZ+tK6dTOf6t/Ig14b0jI2NTIA3IwDj72U5AEwTSCzbN7ansGc1DD01HhJWICuM5Cos1zeCZ76/fy8FlH7Wcff7hTYmdCfWCQ6Zci7vHvebNGwYT0gcYq5wY+oQztRI5YtkWXdlYrQr2OiKoPlvWAqu/Mfry05ghiP4t6Ox7AsI6nitR9W7t3PCbiYjz+VRVLs/u7ZsuN64q5vNUdW4vb6DGnxmy+6wlQIfPaomrIMoOxG3OmYy6IwTiwtEm03ETteH9dhZ+fpPopN+quxmOl0ohYwF6e6HySJoqHzGQGQCB9xxuoQ3qwzcRcdkk4Fw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=BHXbgFqX; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=BHXbgFqX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBjvt5lsQz2xpl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 07:07:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1748984839; bh=YVxtmO4xn8cSl7FBJlgzMb9wooxDCpxLcAclWqMaFmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=BHXbgFqXtexbXiv6sFCqsIvSTwIIN1FMHcHaPV/j0mKpceFyEZkaMimsfvHqxhHYn
	 g7m2ycAwHH99GxDrX5JaRlXlOXQESK/D5kJc/V3Bi2OYgH2WlKfAXD/BImG1fLtZ8w
	 L89Kbi3GXnubdsYpALrgw0T6MOgu7mni3knFqc/a5Qw9n38LE3Zy5Lp8pzQM9iVWHL
	 Ur3kZpqYhF/2wCmmvjIdnxrNWyVejF32jtn3vg/LVTlvctYHJg71tQFLrIyYFTQjqW
	 P7eyaobt3/S5GVDmOWhUpxQFqHxc4Xe+6u+jOHBz3n2BYVZrI10O8kJpfVWDOM+P2u
	 IibavPDvr3hcg==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4bBjvq3ZCmz1yTV;
	Tue,  3 Jun 2025 23:07:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck5.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3639:fe00:a21f:4ce4:8495:5578
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3639:fe00:a21f:4ce4:8495:5578])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX18Ca/MPWWDtOYDvTUE1FQFkkdhcs5t0j4o=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4bBjvl5qDwz1y0m;
	Tue,  3 Jun 2025 23:07:15 +0200 (CEST)
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
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next v4 3/9] bpf: Return -EFAULT on internal errors
Date: Tue,  3 Jun 2025 22:57:54 +0200
Message-ID: <20250603205800.334980-4-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603205800.334980-1-luis.gerhorst@fau.de>
References: <20250603205800.334980-1-luis.gerhorst@fau.de>
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
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This prevents us from trying to recover from these on speculative paths
in the future.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>
Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Acked-by: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 kernel/bpf/verifier.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index c76fbf46a365..46cf737acad5 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -11653,7 +11653,7 @@ static int check_helper_call(struct bpf_verifier_env *env, struct bpf_insn *insn
 				verbose(env, "verifier internal error:");
 				verbose(env, "func %s has non-overwritten BPF_PTR_POISON return type\n",
 					func_id_name(func_id));
-				return -EINVAL;
+				return -EFAULT;
 			}
 			ret_btf = btf_vmlinux;
 			ret_btf_id = *fn->ret_btf_id;
@@ -15278,12 +15278,12 @@ static int adjust_reg_min_max_vals(struct bpf_verifier_env *env,
 	if (WARN_ON_ONCE(ptr_reg)) {
 		print_verifier_state(env, vstate, vstate->curframe, true);
 		verbose(env, "verifier internal error: unexpected ptr_reg\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 	if (WARN_ON(!src_reg)) {
 		print_verifier_state(env, vstate, vstate->curframe, true);
 		verbose(env, "verifier internal error: no src_reg\n");
-		return -EINVAL;
+		return -EFAULT;
 	}
 	err = adjust_scalar_min_max_vals(env, insn, dst_reg, *src_reg);
 	if (err)
-- 
2.49.0


