Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5962B930956
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 10:42:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B7V9IigM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMJjZ0CSbz3cYJ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 18:42:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B7V9IigM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMJd16tsjz3d4L
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 18:38:13 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3C15D60AE3;
	Sun, 14 Jul 2024 08:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20085C116B1;
	Sun, 14 Jul 2024 08:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720946291;
	bh=LjwBIK+b2D+BSfM5bKhp6MDPM+Wpr0//MiA+sJQ0Hkk=;
	h=From:To:Cc:Subject:Date:From;
	b=B7V9IigMd1vltmXQQzdLePysQGC25irDQsTeBZhiuyTK6DiKPbjso+5cKcYut2oAI
	 jcBAl7QQYDurz2fXbYh2sIUTXqcCVYK9hpOO/sxzpE/nX56RTYXcgg1sJ4qxUypVZm
	 KxP3OlU3CxWx/O8dbdjmx/k/+Q4Yj3JHyyN1rzVV77LDQ0cnX6sh/eOir7VkSc/IPn
	 KTlMqM4Lq0JkVyKlw65LSbFChJUFP1e9tKIObLfqN3J49D3t41ippEfv1L3LWvF3tz
	 RR5avVH+fgk6VOlNbcJ3sXmS0iHO46T/cJXAJsc3SJ+C3eeuqptkGdJmMnEe5fIxxo
	 +zUsYmQHmycgg==
From: Naveen N Rao <naveen@kernel.org>
To: <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>,
	<bpf@vger.kernel.org>
Subject: [PATCH 1/2] MAINTAINERS: Update email address of Naveen
Date: Sun, 14 Jul 2024 14:04:23 +0530
Message-ID: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
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
Cc: Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I have switched to using my @kernel.org id for my contributions. Update
MAINTAINERS and mailmap to reflect the same.

Cc: Naveen N. Rao <naveen.n.rao@linux.ibm.com>
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 .mailmap    | 2 ++
 MAINTAINERS | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/.mailmap b/.mailmap
index 81ac1e17ac3c..289011ebca00 100644
--- a/.mailmap
+++ b/.mailmap
@@ -473,6 +473,8 @@ Nadia Yvette Chambers <nyc@holomorphy.com> William Lee Irwin III <wli@holomorphy
 Naoya Horiguchi <nao.horiguchi@gmail.com> <n-horiguchi@ah.jp.nec.com>
 Naoya Horiguchi <nao.horiguchi@gmail.com> <naoya.horiguchi@nec.com>
 Nathan Chancellor <nathan@kernel.org> <natechancellor@gmail.com>
+Naveen N Rao <naveen@kernel.org> <naveen.n.rao@linux.ibm.com>
+Naveen N Rao <naveen@kernel.org> <naveen.n.rao@linux.vnet.ibm.com>
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org> <quic_neeraju@quicinc.com>
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org> <neeraju@codeaurora.org>
 Neil Armstrong <neil.armstrong@linaro.org> <narmstrong@baylibre.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index fa32e3c035c2..05f14b67cd74 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,7 +3878,7 @@ S:	Odd Fixes
 F:	drivers/net/ethernet/netronome/nfp/bpf/
 
 BPF JIT for POWERPC (32-BIT AND 64-BIT)
-M:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
+M:	Naveen N Rao <naveen@kernel.org>
 M:	Michael Ellerman <mpe@ellerman.id.au>
 L:	bpf@vger.kernel.org
 S:	Supported
@@ -12332,7 +12332,7 @@ F:	mm/kmsan/
 F:	scripts/Makefile.kmsan
 
 KPROBES
-M:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
+M:	Naveen N Rao <naveen@kernel.org>
 M:	Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
 M:	"David S. Miller" <davem@davemloft.net>
 M:	Masami Hiramatsu <mhiramat@kernel.org>
@@ -12708,7 +12708,7 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
 R:	Christophe Leroy <christophe.leroy@csgroup.eu>
-R:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
+R:	Naveen N Rao <naveen@kernel.org>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
 W:	https://github.com/linuxppc/wiki/wiki

base-commit: 582b0e554593e530b1386eacafee6c412c5673cc
-- 
2.45.2

