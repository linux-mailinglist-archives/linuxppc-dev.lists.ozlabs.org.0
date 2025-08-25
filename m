Return-Path: <linuxppc-dev+bounces-11270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0372DB34E8E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 23:59:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9l7Q0KlCz3cn9;
	Tue, 26 Aug 2025 07:59:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756159153;
	cv=none; b=JZ9nx6JQSRUE+7n3SwDu/0niDfm3caJRb4CuJErAUdlEto42zqMJ0d0x45A4KRSY9Mx1T8+QXySwD1rsD7lhbzpEDBx0FH9qu9UZX09RpSZvqPcAgh4DYL5uHIXX+KuQxhpzLBR446IwIbGdrAfwlUt3kzSgHKx93cW9UAwNqvrRaDb5doanaEzlodw6kXDW7EfgsNXmxqCvAFC9teXBVarMJSAIwcjYxZ6le/SQ4JzSKw0QAqsnNki3m9xQq+xHQlSc66ywNpYwjRPs8WylciSjSBKz03ByUp1p2v/skcuTUEUiDV7g19OVpKV0lZA0MNj+8tYOj5vzpn7geGP8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756159153; c=relaxed/relaxed;
	bh=aoX32mBukCgos+eY8y/iBEIBj7IcwJxArjK5vyVSXCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SypDyd0Vw5IcUEPtuHGCSjrjqMkS81WnFmaQr5M3EkcpYbVU+B/s5GG7zpBCuRkL0x2K3w5m2N9LCq5lpJNa2H1/A68ry6uQ3KCY6r39m915HZDh1nrP+S+g9fc7kLbK5zfTqKPQHiIlNOE1pCiaGHMxbiiaKS8bVlgHPbfRsMSLC41Exk44wft/npyJz7dqEfxmca2tZWjkhKX9zDdRbTPYZLnkmk6BubBDE3dT7H1xy0iTKs1954eymkjebyQP/Z2eQVixWXl6d1ijXENKodyi/MYojeeJRxb/VzL4H51d/GZldvbelM9W3KzZ3XwlGvhNDalsj4a10fabkJUzpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=abChkQEz; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=abChkQEz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=namhyung@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9l7P39k2z3cmx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 07:59:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB6FB5C64BB;
	Mon, 25 Aug 2025 21:59:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22EA6C113D0;
	Mon, 25 Aug 2025 21:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756159150;
	bh=u8H/POAkJXnqexD0Vo2T0kBej6xh78KY+6A9Mc8aNYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=abChkQEzU5PNu5yh5V5zz4XaRUE6mimBliaIxCekwJuh0MLwa/xPzXMchzTd8A4Ml
	 Vwib2mNxW88e5ZXuA8SOFewTKrlNPBfmCTSMfByl9mcu5ZL1e6Ea8dC8rQEYrePu4B
	 ajp0QuFs7cE9wRwT4gkQXR/zgKyBGJdVpKiLjMXw6L8JYgINQUxu3ZLPfSNQNq7TFs
	 GuGyojSO/SnBdr8kRliTaSROa1FkKolRnOwukNLVmx/Jwf4frlPZifu3rW/PtDwUh3
	 MN4bUOOvVkrSzYb7uJ17H9kScX0QTZ4u9unlmj5ja/kimatMDgFgI0vBiuzx3DfCqz
	 4I+F7CG8/QW9g==
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Ian Rogers <irogers@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linux-perf-users@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 06/11] tools headers: Sync powerpc headers with the kernel source
Date: Mon, 25 Aug 2025 14:58:58 -0700
Message-ID: <20250825215904.2594216-7-namhyung@kernel.org>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
In-Reply-To: <20250825215904.2594216-1-namhyung@kernel.org>
References: <20250825215904.2594216-1-namhyung@kernel.org>
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
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To pick up the changes in this cset:

  69bf2053608423cb powerpc: Drop GPL boilerplate text with obsolete FSF address

This addresses these perf build warnings:

  Warning: Kernel ABI header differences:
    diff -u tools/arch/powerpc/include/uapi/asm/kvm.h arch/powerpc/include/uapi/asm/kvm.h

Please see tools/include/uapi/README for further details.

Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/arch/powerpc/include/uapi/asm/kvm.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/tools/arch/powerpc/include/uapi/asm/kvm.h b/tools/arch/powerpc/include/uapi/asm/kvm.h
index eaeda001784ebb6f..077c5437f5219b05 100644
--- a/tools/arch/powerpc/include/uapi/asm/kvm.h
+++ b/tools/arch/powerpc/include/uapi/asm/kvm.h
@@ -1,18 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License, version 2, as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program; if not, write to the Free Software
- * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
- *
  * Copyright IBM Corp. 2007
  *
  * Authors: Hollis Blanchard <hollisb@us.ibm.com>
-- 
2.51.0.261.g7ce5a0a67e-goog


