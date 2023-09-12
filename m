Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5AF79DC2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:48:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=roJUg5IN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RldzX2kmQz3dRj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:48:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=roJUg5IN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rldxg1M2Tz3c2f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:47:02 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-403012f27e1so42464975e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558817; x=1695163617; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vapbmpx4kHHnDeZPSymjWm+kxhmkjrMGYPDoYN863/0=;
        b=roJUg5INdm15Nl/zC9DRzPJXmbr56nJMF5m3VeJDAcfNKEE9+fOwR1w1NG+6fTxpFF
         ibVfsZdm+EXuLeCAGrrbadrxZ7zFpDNwSa4RRiRQZKrgQucsRMyxsdVfttDCmJd9mveF
         ChUvnWbtD2BNo+fQ4yQ/HypbJX6yso8PwY+HxP2m7lO8J69vXlZyEN+R6uK9zxLm1WIY
         0wG3+6LIR81lYuWOawZFuC46BUwe4AudDM1c+Y7SCx4/vp5lVxdEZr99ZJ63TNeNuP7P
         rNGefuGCzjHrp1O0YSB8I8rl+/CWborbyKjVSX0OzGNG8VfCgJ3EkL/ZmmKC17Oko2bO
         fxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558817; x=1695163617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vapbmpx4kHHnDeZPSymjWm+kxhmkjrMGYPDoYN863/0=;
        b=CqHh3yz9WX87wdzi6qqenkn/8JOdLwwb0rEJRXa8tL4WJxgxPFcon//NkPsYzBHgPA
         SFE3wLTEp+79HtXpq5kxb2zVnYvp5sklwahaQ3sO9lsPUPLAnClZRg0eDZo2+bNYJqSu
         t7YgIdGCxZdTGi/OWIplMM5VvTl691ZQUz5qxr3cF+liYd1/ULbg52bqtJUuWXQuM266
         6HEjpX5IEC/N27tYoO7wvkaBm7F6+hi8kzzS/6diyM6JA8zo0ZxiIaV/cY50tUmd8XZE
         /1m+VE9CUV5/0In4w5W/ba+gWS5KUG77gk6HS/hxMmURJj7pg8vj+5/I3iZ0pdsp2Q8F
         xBew==
X-Gm-Message-State: AOJu0Ywkry81q77rcQJb0GTLQCtl5xZkwRubTN7dFxmZ0t6Roq5CFhrJ
	WCuJ521lvdL5G5zT0btdcx4=
X-Google-Smtp-Source: AGHT+IGYaSde42//e2zWhzE0pBMJ3eH7x1xRhsn/tGbjooCPwkOeTE3BOytCJBgEeqN+vRwsYu0ZSg==
X-Received: by 2002:adf:f302:0:b0:317:ddd3:1aed with SMTP id i2-20020adff302000000b00317ddd31aedmr616529wro.68.1694558817139;
        Tue, 12 Sep 2023 15:46:57 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:56 -0700 (PDT)
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
Subject: [PATCH bpf-next 1/6] bpf, riscv32: Always zero extend for LDX with B/W/H
Date: Tue, 12 Sep 2023 22:46:49 +0000
Message-Id: <20230912224654.6556-2-puranjay12@gmail.com>
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
 arch/riscv/net/bpf_jit_comp32.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/net/bpf_jit_comp32.c b/arch/riscv/net/bpf_jit_comp32.c
index 529a83b85c1c..8f8255519ba1 100644
--- a/arch/riscv/net/bpf_jit_comp32.c
+++ b/arch/riscv/net/bpf_jit_comp32.c
@@ -847,18 +847,15 @@ static int emit_load_r64(const s8 *dst, const s8 *src, s16 off,
 	switch (size) {
 	case BPF_B:
 		emit(rv_lbu(lo(rd), 0, RV_REG_T0), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
+		emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
 		break;
 	case BPF_H:
 		emit(rv_lhu(lo(rd), 0, RV_REG_T0), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
+		emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
 		break;
 	case BPF_W:
 		emit(rv_lw(lo(rd), 0, RV_REG_T0), ctx);
-		if (!ctx->prog->aux->verifier_zext)
-			emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
+		emit(rv_addi(hi(rd), RV_REG_ZERO, 0), ctx);
 		break;
 	case BPF_DW:
 		emit(rv_lw(lo(rd), 0, RV_REG_T0), ctx);
-- 
2.39.2

