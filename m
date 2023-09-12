Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5778079DC34
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:50:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m5vAzGkP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlf1Q0wlwz3dlb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:50:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=m5vAzGkP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rldxg5Y23z3c2r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:47:03 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401d6f6b2e0so1846945e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 15:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558819; x=1695163619; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oda7cl9iVFTkbJ1PzPqgjhpi/bhkWFnkRBdUJ5tFX88=;
        b=m5vAzGkPzeMnObn5guqSJXmflaB5sPd52/DKEZIbXaRAHSdqCibI6PCzOn7fsQUW4f
         dV46xiM4RyJ+gETB0B0b8ucOHgrP5USt/3wOxyhIYzp5SCd77H2sCx3yifRuut2EG0q0
         8biVno/egrdka6Km9v1apZONGQtKQIVBFxbAdf2bLKW9dDX/ENrxVoMv5dV6DxFVZnEu
         Te5APkzely639OXIrRB1FKjJvUQhE4qnpMXPG/F3cSynSkDsrV1XOd9FsppoJ1CDNWzl
         fRuGFYLbvloT1eqDdjTE8AlAhoJ2rgDmhGBYrPJ1XPfI0CN9F3jlAS+dMfy69Y7nPZS8
         VZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558819; x=1695163619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oda7cl9iVFTkbJ1PzPqgjhpi/bhkWFnkRBdUJ5tFX88=;
        b=Lpr6bEGRfaFj9NlXJDoKjXO4Se/+X4blJ7UgwIO16+IUywDXtIvqDBZrtkpmJ+xncm
         mK5UBY4hEiAjBrYoutTRqm5q0nx/ZNsY3N4Jg1cu7hnMPkHy+Pyy39htbthLJu6NTIky
         sk2v/3DU/LNlJ/st6DRU4kT9mdsm0rQMkJtiiiGEuhZMzVSHjKK9DLfFR/YtC5JCeEQD
         jz5UXKd5eZcbowr3IDMGf8qg7uQD+mKzTGVgh1bq7KzDI89v3Yl0u0Q7NKg3uE0RnYpG
         B8971dApunIH8H0ioluoXlHhRKpgxVg5ypbigcK9TSP39Xs+cUR7kq9lULGgEP6ymk40
         Y9bw==
X-Gm-Message-State: AOJu0YyI1JgjAiqsFkKBdLwYRdoiM4lmHxxzr0ExUO1OrPSv+87y0VZf
	FTPV4LAfr63S0ZCibD0Sex8=
X-Google-Smtp-Source: AGHT+IHcd9xLp1ws84Is5QLcU4SiUEHRnEtZ9HHHFgMinXaJVjwni/sneatzZERdYAHhMylr9POa6g==
X-Received: by 2002:a5d:484a:0:b0:31a:cca0:2f3a with SMTP id n10-20020a5d484a000000b0031acca02f3amr3150339wrs.0.1694558819326;
        Tue, 12 Sep 2023 15:46:59 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:59 -0700 (PDT)
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
Subject: [PATCH bpf-next 3/6] bpf, parisc32: Always zero extend for LDX with B/W/H
Date: Tue, 12 Sep 2023 22:46:51 +0000
Message-Id: <20230912224654.6556-4-puranjay12@gmail.com>
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
 arch/parisc/net/bpf_jit_comp32.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/parisc/net/bpf_jit_comp32.c b/arch/parisc/net/bpf_jit_comp32.c
index 5ff0cf925fe9..cc3972d6c971 100644
--- a/arch/parisc/net/bpf_jit_comp32.c
+++ b/arch/parisc/net/bpf_jit_comp32.c
@@ -1026,18 +1026,15 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
 	switch (size) {
 	case BPF_B:
 		emit(hppa_ldb(off + 0, srcreg, lo(rd)), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
+		emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
 		break;
 	case BPF_H:
 		emit(hppa_ldh(off + 0, srcreg, lo(rd)), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
+		emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
 		break;
 	case BPF_W:
 		emit(hppa_ldw(off + 0, srcreg, lo(rd)), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
+		emit_hppa_copy(HPPA_REG_ZERO, hi(rd), ctx);
 		break;
 	case BPF_DW:
 		emit(hppa_ldw(off + 0, srcreg, hi(rd)), ctx);
-- 
2.39.2

