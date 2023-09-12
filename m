Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D376379DC27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:47:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dENn2CK6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rldyb4l9nz3d80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=dENn2CK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rldxg0lt4z3c1R
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:47:02 +1000 (AEST)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-313e742a787so195261f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558818; x=1695163618; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sT29HscYryKGVaLS4ITmGogx99J9Puoxilk7JdApwLE=;
        b=dENn2CK6x26DG5A9iAfvWHgsZ17VStW0Zs/qdpoCHHSx7uYsi5JqyCvfPsGvTQKN0g
         FWJgXGfNXNtuJvLLL5PoZInr+TSLbJf7gERrRE6FDvmh+PVRzbZyBFRi/jMyPpidGAbv
         dIW8i+zTMIE3rqekIEWO8RTOak/1PSkpUArL+Yhrj4hL2cgw7XqAvUUCjvGnMgMMzF8n
         hmZsmcqtqYR0jtasvNEaTdlblJcD9+Zb6UBlhmvo1/BxPa7sSF05OW89TLKcMdEHUeWu
         G9lm8oEEBceg2A0Kge6ZNEcszw1BMpuqGiPWmvoW9P+puAp+J0k6QkVyyczOETfeAYhj
         c8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558818; x=1695163618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sT29HscYryKGVaLS4ITmGogx99J9Puoxilk7JdApwLE=;
        b=K3s5Mk4Kw0qNJMK0RSifV2NjeeXzsgxaf353Fxt+3YFk6Dgrc+sAK2rucDGECYYXtv
         z4LhcLREwiwYpHBVURe9tB2PpWbOKQjz/jAllyh4L8R3IRPl7RLZdrHJ6MZN2d1aGnHX
         o3OCLX6Q6sSNSeGqAW+70qtUkjIzpXHOOz5ywG1PRU2/BsBqyp5CEqPDokS65WdYmWBt
         tEhSVJUQQLqUZrAIvuORcaqKqrqQpeQN+j/nMU+JxC30ZnOrZGiHt/4ZnOSdug8SougU
         LsC0WJ68WAGq+GBcBkKncKSE+kVefTp3Pyr2vQoxQoLMSBzwd+vl3vQN9kondXsdvkUT
         oDpw==
X-Gm-Message-State: AOJu0YxsaElJFejEtaLDtLtaIZ9KE/qTe4hRQXbisJtzdY36QUgSfsMn
	buwqNSCkpbGH0fCMTpFHlNE=
X-Google-Smtp-Source: AGHT+IGmXcseiJIR5TJ93E0zDMbc0daNf/KmJUUYoyIE/Gf3HMcwKKCMLML9MVROQedqC+pALyVq0A==
X-Received: by 2002:adf:dc85:0:b0:319:5234:5c92 with SMTP id r5-20020adfdc85000000b0031952345c92mr596882wrj.35.1694558818289;
        Tue, 12 Sep 2023 15:46:58 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:58 -0700 (PDT)
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
Subject: [PATCH bpf-next 2/6] bpf, x86-32: Always zero extend for LDX with B/W/H
Date: Tue, 12 Sep 2023 22:46:50 +0000
Message-Id: <20230912224654.6556-3-puranjay12@gmail.com>
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
 arch/x86/net/bpf_jit_comp32.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/net/bpf_jit_comp32.c b/arch/x86/net/bpf_jit_comp32.c
index 429a89c5468b..aef9183ff107 100644
--- a/arch/x86/net/bpf_jit_comp32.c
+++ b/arch/x86/net/bpf_jit_comp32.c
@@ -2050,8 +2050,6 @@ static int do_jit(struct bpf_prog *bpf_prog, int *addrs, u8 *image,
 			case BPF_B:
 			case BPF_H:
 			case BPF_W:
-				if (bpf_prog->aux->verifier_zext)
-					break;
 				if (dstk) {
 					EMIT3(0xC7, add_1reg(0x40, IA32_EBP),
 					      STACK_VAR(dst_hi));
-- 
2.39.2

