Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F25F879DC30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 00:49:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=feWrBYcV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlf0S5MfFz3df5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 08:49:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=feWrBYcV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=puranjay12@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rldxg1tJjz3c2r
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 08:47:02 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-401187f8071so2136835e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 15:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694558816; x=1695163616; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5maphRaiJtxCw6vGqmBPcygT14ffJWcXjb1lb6GupVY=;
        b=feWrBYcVvvpj+VIbc2PiQuImx0Z3f3VRFx//YoDWtvctOJX58TRCa+ur+paOyleDWd
         zkEbB/FjJ7l1BCc8EK1q1T1k6VNHPTX/+t+qLSS8EpHeEuPY40YRM06ODj0dYeaIXAiD
         rH1TqLqgwsRKbLxFCu4IhqMfSr3KW3Jc5/K3PonyiXcggOcm7H4TVyzcMU5SKAost8+B
         Lne2nkAtaOoyUsm0KIaOrHZtNHZXGVbqdbCndic9sXoKWq1qcTdHyJR4HgJoOzC2EVoY
         CsuL1fSpPZWbAlNlLBzgFPUnVF1nG5XgTwdDr1eS1IVLNXyhUmBVX/h57cbaTtq7f3K9
         Gxng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694558816; x=1695163616;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5maphRaiJtxCw6vGqmBPcygT14ffJWcXjb1lb6GupVY=;
        b=mqF+/3EhlmzMekZxUvwJQa7GQvfU8OEwk+Io1qfU1NfnMHKiRDbe4NVUBrmSEHmofJ
         SZsS46Mfers9sVOEtWSn8i0U6+Dyw6C2PSBdMXwtu09RGW0oBBS7tVNKpd0Zmmq5Sb83
         KY8P7yFdxzyZdVsgUN/jVTfamQskZRav6Rvds5nVrGz0p26cw4U9XLSel3ZBlN6vh57S
         yOIDtI5Fny1Nf4t8GAOT6RZuTa7z4Xc+/AAHg9OiU+GXHf88SaA63Jsx4ytYBkvrJJtj
         /HyCVVEa/oqlSeD3VYAXAwfuF9bqwws7WtCtNyRBymkjjkTjlgzkv/R/fDiISp/tkeRC
         LNAg==
X-Gm-Message-State: AOJu0YxiZFdKLlfbnCHIuaChXJz1FTaq3HCDbB9ixUVofKopMiDF2/99
	XqKjQluAQAyxQPZbW69bv2Q=
X-Google-Smtp-Source: AGHT+IFYGntNSfOXewM/tS8LvcLOqQgmS8ZJLgFgXfGLUpzIXraOzxew/iXIiOfAYDr2U/xwgoNtcg==
X-Received: by 2002:a05:600c:21cc:b0:401:c8b9:4b86 with SMTP id x12-20020a05600c21cc00b00401c8b94b86mr734598wmj.9.1694558815736;
        Tue, 12 Sep 2023 15:46:55 -0700 (PDT)
Received: from ip-172-31-30-46.eu-west-1.compute.internal (ec2-34-242-166-189.eu-west-1.compute.amazonaws.com. [34.242.166.189])
        by smtp.gmail.com with ESMTPSA id e15-20020a5d594f000000b00317df42e91dsm13921794wri.4.2023.09.12.15.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 15:46:55 -0700 (PDT)
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
Subject: [PATCH bpf-next 0/6] bpf: verifier: stop emitting zext for LDX
Date: Tue, 12 Sep 2023 22:46:48 +0000
Message-Id: <20230912224654.6556-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
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

All 64-bit architectures that support the BPF JIT do LDX + zero extension
with a single CPU instruction. Some 64-bit architectures like riscv64,
s390, mips64, etc. have bpf_jit_needs_zext() -> true. This means although
these architectures do LDX + zero extension with a single CPU instruction,
the verifier emits extra zero extension instructions after LDX | B/H/W.

After a discussion about this in [1], it was decided that the verifier
should not emit zext instructions for LDX and all JITs that can't do a LDX
+ zero extension with a single instruction should emit two instructions by
default for LDX.

All 32 bit JITs checked for ctx->prog->aux->verifier_zext and did not do
explicit zero extension after LDX if this is set by the verifier.

This patch series changes all applicable 32-bit JITs to always do a zero
extension after LDX without checking ctx->prog->aux->verifier_zext.

The last patch modifies the verifier to always mark the destination of LDX
as 64 bit which in turn stops the verifier from emitting zext after LDX.

These changes have not been tested because I don't have the hardware to do
so, I would request the JIT maintainers to help me test this. Especially,
the powerpc32 JTI where amount of code change is more.

[1] https://lore.kernel.org/all/CANk7y0j2f-gPgZwd+YfTL71-6wfvky+f=kBC_ccqsS0EHAysyA@mail.gmail.com/

Puranjay Mohan (6):
  bpf, riscv32: Always zero extend for LDX with B/W/H
  bpf, x86-32: Always zero extend for LDX with B/W/H
  bpf, parisc32: Always zero extend for LDX with B/W/H
  bpf, powerpc32: Always zero extend for LDX
  bpf, arm32: Always zero extend for LDX with B/H/W
  bpf, verifier: always mark destination of LDX as 64-bit

 arch/arm/net/bpf_jit_32.c         |  9 +++------
 arch/parisc/net/bpf_jit_comp32.c  |  9 +++------
 arch/powerpc/net/bpf_jit_comp32.c | 25 ++++++++-----------------
 arch/riscv/net/bpf_jit_comp32.c   |  9 +++------
 arch/x86/net/bpf_jit_comp32.c     |  2 --
 kernel/bpf/verifier.c             |  4 +---
 6 files changed, 18 insertions(+), 40 deletions(-)

-- 
2.39.2

