Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE9079DC42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:52:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ViwkkMrG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlf4F1TbPz3fW5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:52:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=ViwkkMrG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rldxj5tWrz3c2r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:47:05 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-401b393df02so72403725e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 15:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558821; x=1695163621; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9kqE25xddEGWdkAd5IJWaOPr3bcznXZB6DbOZ/MzuKY=;
        b=ViwkkMrGObqfLKB8a4j+345slJ8OJnRo1BZvhMbI6JkwIQGtVdrTweH9Z/ytw6haRz
         vNUP/C+1Ft6TJk+1gDhtvQqkoAlLRbaVSfOQ4AN2wR6eo8cx4SuDvFqCQ/267sluWygU
         UgIcl5uJya8GFAr0ihuLtdd9vS/IkTJ/l7Y7F1mv2Ldq2xlgD7UhnsEmSkR/kRak1aAK
         k9sbaONX41MHqrY5krW9W9MYwMrRBWgyt0YWF1f2cCpDYWJidpkCLWJUuRKKBAcJnxbY
         +EEDG0cG5a2bCcyyD0eMWLX0OCyPv5L4qtBgpLACRDe8cUkKKLH19l5MSuU8CpoWU0iL
         vySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558821; x=1695163621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9kqE25xddEGWdkAd5IJWaOPr3bcznXZB6DbOZ/MzuKY=;
        b=oTsqnoBZjkoO+iganmbBOMQb4PvJnuK3xZFpXBcxVNGT0odeD45na9Q02MjFIbreuT
         QMvMCDwoNGpBCuz9atV0Zh8ybAoudQOSwUUkoiKQbbXJXZpToGJTHerxCq90ysHS8OU0
         LysWFCVahbcmPXtJ+z2IFpSyh9pqjnJLjvrqSOi6h07BmYkZv6xN0St1tXLyf6P5LCZ0
         VtWPgCjTL9YmjzHPUSfmnvuxy7Vn4JjVoFM6Ke9UnRfzIjyYgKqkU7xDmO2DTjIDCKi0
         7r/vC/+AbhUt57O2wBi8F7DMuLTZSLH6s1uXFI3a2MwePrDde7z1QrA8CBuXxsnPil3f
         jVRw==
X-Gm-Message-State: AOJu0YyvDDnPoXT0ZUjmJeH4drbWWKaJx+18Hofx1v791JUYaNw0xEqZ
	RsXQN0bVfEIwt1/fb3A+sJc=
X-Google-Smtp-Source: AGHT+IFtRPmqCA45qZeOfe4gap2/v8LgzERhETar42HTdZcTU3NFDWNWl1Q7ouaYhNuNBRQewOmqOA==
X-Received: by 2002:a7b:cbcc:0:b0:3fe:db1b:8c39 with SMTP id n12-20020a7bcbcc000000b003fedb1b8c39mr604002wmi.41.1694558821453;
        Tue, 12 Sep 2023 15:47:01 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:47:01 -0700 (PDT)
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
Subject: [PATCH bpf-next 5/6] bpf, arm32: Always zero extend for LDX with B/H/W
Date: Tue, 12 Sep 2023 22:46:53 +0000
Message-Id: <20230912224654.6556-6-puranjay12@gmail.com>
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

The JITs should not depend on the verifier for zero extending the upper
32 bits of the destination register when loading a byte, half-word, or
word.

A following patch will make the verifier stop patching zext instructions
after LDX.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/arm/net/bpf_jit_32.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/arm/net/bpf_jit_32.c b/arch/arm/net/bpf_jit_32.c
index 6a1c9fca5260..757a99febba5 100644
--- a/arch/arm/net/bpf_jit_32.c
+++ b/arch/arm/net/bpf_jit_32.c
@@ -1081,20 +1081,17 @@ static inline void emit_ldx_r(const s8 dst[], const s8 src,
 	case BPF_B:
 		/* Load a Byte */
 		emit(ARM_LDRB_I(rd[1], rm, off), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_a32_mov_i(rd[0], 0, ctx);
+		emit_a32_mov_i(rd[0], 0, ctx);
 		break;
 	case BPF_H:
 		/* Load a HalfWord */
 		emit(ARM_LDRH_I(rd[1], rm, off), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_a32_mov_i(rd[0], 0, ctx);
+		emit_a32_mov_i(rd[0], 0, ctx);
 		break;
 	case BPF_W:
 		/* Load a Word */
 		emit(ARM_LDR_I(rd[1], rm, off), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_a32_mov_i(rd[0], 0, ctx);
+		emit_a32_mov_i(rd[0], 0, ctx);
 		break;
 	case BPF_DW:
 		/* Load a Double Word */
-- 
2.39.2

