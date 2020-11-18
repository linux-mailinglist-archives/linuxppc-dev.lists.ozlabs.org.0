Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB0A2B72E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 01:10:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbNVQ5h5kzDqVk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 11:10:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=34gw0xwwkdiesijxfzqsnjwxlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=ddMrpjFp; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbNSD2BXZzDqV7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 11:08:03 +1100 (AEDT)
Received: by mail-qk1-x74a.google.com with SMTP id v134so181074qka.19
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 16:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=V3tvIh5NHv05LPYSP9VOlCUVLr3gN78y2A44GlQ/+zg=;
 b=ddMrpjFpXh0ci590xEOLW7SJSIup4OgtQiHQGQ7qJKT5bTz6H0JhT6g/+XnLsGuqbE
 agLaFQDvs9x5ip/ZvJHe5SBw+tta4FuWRorIhOOJWouCuHJ5oxSiyiM0Dq0oRCepln3C
 UrY8dPQfN5sC6c6tLJzmPWnJOM7U3NffOmxi+/2T++V/wj6NzikDg8L4Jbrj3f+exuLK
 mlof4+m6FaWVdUzULd3YtCJRpJb4/kPeVPLW0HR2gdpHiy4vxMG50vv83YtD801HkeyP
 m1WJRCVkpX7fUJ6zGSuVfQRljJUTzEIrWttcMSALDzYdh3AQG1MZslH8qTzVqRj26HFJ
 +qHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=V3tvIh5NHv05LPYSP9VOlCUVLr3gN78y2A44GlQ/+zg=;
 b=bKGSK3f/ajtuvzabKUTCtNfR3ueTglr9BfjFmWo2C5TxjeNrR37TI82BGR47CN8GuG
 zjMx8SpJrvQ3WAZ9q7Sdku5Be9GFJpboo4pG9RPAB1enwRiPneH+3u4EL7wLWsm8JvQi
 dnVoTKQy3YyvQEHGojqevH13yijgn60iBViQ3hDLH2Ut78jOXnuuJp8uep1Pnrt1vTbr
 DLTbKgAb57dDSNEfNDyOR6UbHj9nUTJzPcap5Cz1qp2r0dpqva8fOVNF0du5iJ5aU3KQ
 Hxs01ZTtlz2vTxWr9MwKUICfZA9+7G0e0HJ3/HMqMfENwpBerJZGyrokwy92KJaD3t/9
 dfvQ==
X-Gm-Message-State: AOAM532lXpKCIDmmRetm/aPhR8eTL6zvTb+/vjrxSVwF8z7I7L7FPCh5
 6vPv+TQv0qR97YgwYHI5o541chn3EQcE+TZeD9Q=
X-Google-Smtp-Source: ABdhPJxyT4QSqjiO/hV2SGyByZFsZRA7niNoQlakX/V0MDwLgNhsF7VsvTbGKPGQxyGwFCBQLO7iPm/RgWu/MnQ8oPg=
X-Received: from ndesaulniers1.mtv.corp.google.com
 ([2620:15c:211:202:f693:9fff:fef4:4d25])
 (user=ndesaulniers job=sendgmr) by 2002:a0c:f185:: with SMTP id
 m5mr2278509qvl.27.1605658080093; Tue, 17 Nov 2020 16:08:00 -0800 (PST)
Date: Tue, 17 Nov 2020 16:07:48 -0800
Message-Id: <20201118000751.845172-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 0/3] PPC: Fix -Wimplicit-fallthrough for clang
From: Nick Desaulniers <ndesaulniers@google.com>
To: "Gustavo A . R . Silva" <gustavoars@kernel.org>
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
Cc: clang-built-linux@googlegroups.com,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Arvind Sankar <nivedita@alum.mit.edu>, Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

Changes V1->V2:
* collect tags via b4 (fix Gustavo's tag as per Miguel in patch 2/3).
* reword commit message of patch 1/3 as per Arvind.
* reformat patch 2/3 as per kernel test robot and Gustavo.

Nick Desaulniers (3):
  powerpc: boot: include compiler_attributes.h
  Revert "lib: Revert use of fallthrough pseudo-keyword in lib/"
  powerpc: fix -Wimplicit-fallthrough

 arch/powerpc/boot/Makefile      |  1 +
 arch/powerpc/boot/decompress.c  |  1 -
 arch/powerpc/kernel/prom_init.c |  1 +
 arch/powerpc/kernel/uprobes.c   |  1 +
 arch/powerpc/perf/imc-pmu.c     |  1 +
 lib/asn1_decoder.c              |  4 ++--
 lib/assoc_array.c               |  2 +-
 lib/bootconfig.c                |  4 ++--
 lib/cmdline.c                   | 10 ++++-----
 lib/dim/net_dim.c               |  2 +-
 lib/dim/rdma_dim.c              |  4 ++--
 lib/glob.c                      |  2 +-
 lib/siphash.c                   | 36 ++++++++++++++++-----------------
 lib/ts_fsm.c                    |  2 +-
 lib/vsprintf.c                  | 14 ++++++-------
 lib/xz/xz_dec_lzma2.c           |  4 ++--
 lib/xz/xz_dec_stream.c          | 16 +++++++--------
 lib/zstd/bitstream.h            | 10 ++++-----
 lib/zstd/compress.c             |  2 +-
 lib/zstd/decompress.c           | 12 +++++------
 lib/zstd/huf_compress.c         | 17 +++++++++++-----
 21 files changed, 78 insertions(+), 68 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog

