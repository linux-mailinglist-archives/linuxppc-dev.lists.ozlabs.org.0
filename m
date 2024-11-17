Return-Path: <linuxppc-dev+bounces-3348-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 380979D019F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 01:24:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrWhh4xkRz3bWy;
	Sun, 17 Nov 2024 11:24:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731803044;
	cv=none; b=LFTQdBudjy4EWSHjbsjl1khUndbydWo9A41C7Ghy1LGHzeSdtCyQDG/OPo1sarevNRCI3SY0Q7hBqbz9yoH32wJnqYLxPpOaob3IiSSxK4AI4ny6KvuMlURikpkOvGSc0+2HYUaSrs/GH2PrjwRTDdrI/sXrjCil+yE6qzR71VJ7O57XDwd0T7PbE1/3XsDQaJIdi+evMdxwg2X9AIuU9QygBYHly0g83/Xc/qnTIidNH1FHw2PgUAYm9YlzhbBIU/+fguRRst46h9UeFvUNMxn1zxCiyE7e3AxuSuhqzRdDBvHGS7jUGXnuzGXHXwouDdXWlaGckvJ/jf/mCBF0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731803044; c=relaxed/relaxed;
	bh=2Fr1+23Hh6Yl0sIDoBdGEun+nW5J/zidLNymxT4OIms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WRT0MDLr3Hn5TKowd/gSB7CV6nzXHxtVTx17ufIQFBl0kq2U4qD70rXF+git9TUL64L2qNogi9n+498iqcL9wafblO4hRXVnmo2kx3SqNzWqM0lZmLCMCEU63X3SpbTaU9Lx0xKpESaoXzDjQDyIGIFzVEzCxhiSSsAKZWqchY3BYe9IOiPsi1c2adUct9KP4RORSEtt7cs4LXRAlrhFae2k5MFQgVw8i4crL6WipaBaFqdppvyLV9EQATzqA9sJaVkYEMyAZ3XMw18+H8Kho6LgP6GgQ5mjnO84zJ+fFaQ52CF+nx69NiXoFijxmA1fOyObAuq5ThT+pq1cE3+iLg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UH5o4nb3; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=UH5o4nb3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrWhd0cqqz3bY7
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 11:24:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8AA195C5704;
	Sun, 17 Nov 2024 00:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B1AC4CED9;
	Sun, 17 Nov 2024 00:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731803038;
	bh=gikOnfBjekSzGf6NqlY+odr2KqKVyYrQvBhQkTK3oqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UH5o4nb3MbDFI7VGAxCOF+o9Q9t+WxRpA1f2cg+TtQFgYl2KFizmYdfMVE/ji0Ho1
	 oqZZH0z849b0GxE15m+X8+SPEyrxdQQ+NKcxPOhPuiwBSda7WTDhym+vaORjmrHnfO
	 M0/I/j1Sisn3Eiu8zI97Pfn3z6gGRPkCAOMzzoz5CtWfG/0uPRqmsIHI1UDBn5NYY/
	 3qdx5aa+nLV0C0hj02e2R2X1zsNkrLUNRxmoiXoZxNPwyDC587XCRjvadQH/swR/gB
	 hoMkyTyVXupR++o8Sy4Ve/gXdMUC8n2JysUjzdX29ZwxeqbCQlkMyFRpRllM+OoO/k
	 9+XdVmWdtGYPg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH 11/11] MAINTAINERS: add entry for CRC library
Date: Sat, 16 Nov 2024 16:22:44 -0800
Message-ID: <20241117002244.105200-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241117002244.105200-1-ebiggers@kernel.org>
References: <20241117002244.105200-1-ebiggers@kernel.org>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Eric Biggers <ebiggers@google.com>

I am volunteering to maintain the kernel's CRC library code.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a27407950242..2bfbdcad0282 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5982,10 +5982,21 @@ CRAMFS FILESYSTEM
 M:	Nicolas Pitre <nico@fluxnic.net>
 S:	Maintained
 F:	Documentation/filesystems/cramfs.rst
 F:	fs/cramfs/
 
+CRC LIBRARY
+M:	Eric Biggers <ebiggers@kernel.org>
+L:	linux-crypto@vger.kernel.org
+S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git crc-next
+F:	Documentation/staging/crc*
+F:	arch/*/lib/crc*
+F:	include/linux/crc*
+F:	lib/crc*
+F:	scripts/crc/
+
 CREATIVE SB0540
 M:	Bastien Nocera <hadess@hadess.net>
 L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-creative-sb0540.c
-- 
2.47.0


