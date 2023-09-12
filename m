Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F45179DC40
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:51:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PHQl2BUD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlf3J2FKTz3fGL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:51:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=PHQl2BUD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rldxj4717z3c2r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:47:05 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-31adc5c899fso6585052f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 15:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558822; x=1695163622; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GxeItlNv04+BjzshAn31wAsB9adLvt962s1bQaHQhqk=;
        b=PHQl2BUDC0LZiPgkoz62e6HRa+mTHqmYVOEMNAf1Ip5OPEj/vDkDnokae8K24QLnrm
         em+8qjdxTs13+N5p9ow7axJ+++4FO4zVjfOun3duZpkZZIzvdra0YDJUdbOq6VifqCmR
         f3Lihi0flsSNV571MK8uxoSWhhYL3hVe9o/jOIsCiZCKTSuzwqsmmILMIYR707e0iJB0
         ldZ6MX6z7zcVnP3z71GKVftoYLDX0PNhduxkHVrogm70STvyME7GkL/4oRzLIomFwjOv
         3VsiiIDd8aY4/9aJPqV40nV0gYtdCTQrGpFkD9Y6/mRl631BEjL8aWY410QqLv+GFz38
         Qg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558822; x=1695163622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GxeItlNv04+BjzshAn31wAsB9adLvt962s1bQaHQhqk=;
        b=EERYx4kvBUcS2wMtOscK1WVAf6CQf6Ums+Ft1OmfQfkSGIr1zqxJfuhiiEyD0rC+xv
         7JZE9gWhH4X2UMoFvjZwbjEogGgtLKNgoNxo3xIoKP8hkPs5OhovQhyOafu/fD/wkqBu
         Qx5fPPDziUEivwl6qF1SRkyf35ZmL2EcE6HQ5n2OgmPYpoRoRpMJv2wc+F0DSm9eJthO
         UyDgZAaKSA7NKMUbrgICcdZgU6oy+B8lhL+z5fXmMoXC46uO56IjnKfScor0T0aaxHc3
         NFgGbNZBqV2qf5v/xjcv4/uhCTbS8tvbBvYJSlN5ck8DYsPXglYf2dddmueDGjnqIdoI
         OnNA==
X-Gm-Message-State: AOJu0YyyPEBK07P1EvzpwaUZKYT0glT0vCe3tUB6zTfqsV/CnuqVH+6k
	dwpvsMwhQmn6q1JWEZnCp3g=
X-Google-Smtp-Source: AGHT+IGIRL1pLS66Q0kL+tNt95f9G7dGNYYYAmglWQ49OAUKZ2P+a9yQAWCML5eZu0IFvzTnTl7LPw==
X-Received: by 2002:a5d:45d0:0:b0:31f:9838:dfc4 with SMTP id b16-20020a5d45d0000000b0031f9838dfc4mr646970wrs.33.1694558822455;
        Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shubham Bansal <illusionist.neo@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Luke Nelson <luke.r.nels@gmail.com>,
	Xi Wang <xi.wang@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Wang YanQing <udknight@gmail.com>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 6/6] bpf, verifier: always mark destination of LDX as 64-bit
Date: Tue, 12 Sep 2023 22:46:54 +0000
Message-Id: <20230912224654.6556-7-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230912224654.6556-1-puranjay12@gmail.com>
References: <20230912224654.6556-1-puranjay12@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: puranjay12@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All 64-bit JITs utilize a single instruction to load + zero-extend a
byte, word, or a half-word. The optimisation of emitting zext for LDX is
not useful for most of the JITs.

All the JITs that relied on the verifier for zero extension of LDX
desitination registers have been modified to always zero extend the
destination.

Now the verifier can safely mark LDX destination as 64-bit and stop
emitting zero-extension instructions for it.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 kernel/bpf/verifier.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index dbba2b806017..02a1ac1a1327 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -3028,9 +3028,7 @@ static bool is_reg64(struct bpf_verifier_env *env, struct bpf_insn *insn,
 		return false;
 
 	if (class == BPF_LDX) {
-		if (t != SRC_OP)
-			return BPF_SIZE(code) == BPF_DW;
-		/* LDX source must be ptr. */
+		/* LDX source must be a ptr. and LDX destination is always zero-extended. */
 		return true;
 	}
 
-- 
2.39.2

