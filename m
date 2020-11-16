Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 501532B3C2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 05:37:33 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZGWt2dkkzDqPn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Nov 2020 15:37:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::749; helo=mail-qk1-x749.google.com;
 envelope-from=3mqgyxwwkdggtjkygartokxymuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=H99SKUXX; dkim-atps=neutral
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZGTt58t5zDqNj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 15:35:41 +1100 (AEDT)
Received: by mail-qk1-x749.google.com with SMTP id q25so10779175qkm.17
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Nov 2020 20:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=dwGE+EuvUvxVOeNwuorSmE5DCZ0byzW0xaKhrjXEexc=;
 b=H99SKUXX64FEZ0L0DZDFL7PBMvbh0WtZXXCKrj79Di6uyCKBepzBw4cdVVGPbeFABe
 4NMxaq1WCaXHqdcuR7FkisoHaP648WInpsTp+jfiBpGUy6CKo+sth6PwbM4Uh/jMJCgK
 j0o25q0zwXoGRLY98HcnMrcH/gAM7CKiQC4O5WXWIDI1g/msKvAR0TaLpCyuCtj//La4
 O0o5pp56+xVZofvyHaAor/ZdEWYRuZo2lGy3QqHzBoou4wgyUfxxwjw6KhmofddsIetz
 H1I2RaWoY20rLy3UwqVs4aQ66wV1SBbRIC8N6VaLBI4ySkaaXLHiLdUEFkSyMsroVe/T
 98SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=dwGE+EuvUvxVOeNwuorSmE5DCZ0byzW0xaKhrjXEexc=;
 b=qznE9qGL6D+xdm8/RRzlPPKgmkyjCVzocdMz2INEXogBkE5ECeyPs6Yr0uVliI4Nbz
 KzNPR7CR3nNsYWnsYS66ZJEXM66T0g+ETxC33FfisXdF7MwnWRJCtKLSP/4M2c1RKLvh
 3CJwknBdmf0i9O7URmaQD50xUrMDA9e/J1B7VeP9lM58ia3Ju2hH92i3peu6/GJR3eMS
 xHt1qhoy1hxax+X0TADka3rvTTtuTvnxvHAhyQjSWQG+ICrH6UiggkxWJQHgbfKTFvdL
 TAv3PcIOigdSngE1WLfTmD0cQ8jxI1KgD1ya0d7tPk0UZpQxD9wBfK+/iZ4Dc7X4zH8d
 q6qA==
X-Gm-Message-State: AOAM531ETaZObocz5SYc5psKOJWMc+nNWwAeadhwLZNpE5d13v9KFZ8i
 ElZ03CmzWYGST6JYqwseEFR1nR9xOgvq0Z/xBJg=
X-Google-Smtp-Source: ABdhPJz12dxc1TJNZLZgpfNy1rVDfQ/Md/DvGbTEtDrzxIUMLxx8DHgejJ9M6MuuQqwxMb9lyp3uZYb3Fu1D7zolZ80=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:ad4:524b:: with SMTP id
 s11mr14139796qvq.3.1605501337720; Sun, 15 Nov 2020 20:35:37 -0800 (PST)
Date: Sun, 15 Nov 2020 20:35:29 -0800
Message-Id: <20201116043532.4032932-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 0/3] PPC: Fix -Wimplicit-fallthrough for clang
From: Nick Desaulniers <ndesaulniers@google.com>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 Nathan Chancellor <natechancellor@gmail.com>, 
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While cleaning up the last few -Wimplicit-fallthrough warnings in tree
for Clang, I noticed
commit 6a9dc5fd6170d ("lib: Revert use of fallthrough pseudo-keyword in lib/")
which seemed to undo a bunch of fixes in lib/ due to breakage in
arch/powerpc/boot/ not including compiler_types.h.  We don't need
compiler_types.h for the definition of `fallthrough`, simply
compiler_attributes.h.  Include that, revert the revert to lib/, and fix
the last remaining cases I observed for powernv_defconfig.

Nick Desaulniers (3):
  powerpc: boot: include compiler_attributes.h
  Revert "lib: Revert use of fallthrough pseudo-keyword in lib/"
  powerpc: fix -Wimplicit-fallthrough

 arch/powerpc/boot/Makefile     |  1 +
 arch/powerpc/boot/decompress.c |  1 -
 arch/powerpc/kernel/uprobes.c  |  1 +
 arch/powerpc/perf/imc-pmu.c    |  1 +
 lib/asn1_decoder.c             |  4 ++--
 lib/assoc_array.c              |  2 +-
 lib/bootconfig.c               |  4 ++--
 lib/cmdline.c                  | 10 +++++-----
 lib/dim/net_dim.c              |  2 +-
 lib/dim/rdma_dim.c             |  4 ++--
 lib/glob.c                     |  2 +-
 lib/siphash.c                  | 36 +++++++++++++++++-----------------
 lib/ts_fsm.c                   |  2 +-
 lib/vsprintf.c                 | 14 ++++++-------
 lib/xz/xz_dec_lzma2.c          |  4 ++--
 lib/xz/xz_dec_stream.c         | 16 +++++++--------
 lib/zstd/bitstream.h           | 10 +++++-----
 lib/zstd/compress.c            |  2 +-
 lib/zstd/decompress.c          | 12 ++++++------
 lib/zstd/huf_compress.c        |  4 ++--
 20 files changed, 67 insertions(+), 65 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog

