Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA32930957
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 10:42:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pxZSXosr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WMJkL1bFnz3dKX
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2024 18:42:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pxZSXosr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WMJd60sD5z3bZ3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Jul 2024 18:38:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F4023CE08D5;
	Sun, 14 Jul 2024 08:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87465C4AF0E;
	Sun, 14 Jul 2024 08:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720946296;
	bh=ugC4vwFu7JaQt1R2nRsfoFX5qwcKVpwZZbz8n+GBd9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pxZSXosrHHlpL16bUcUgZDTuAeILEVlZOjAtoC92mNbUrTnmDNGt3BeNJrNxHFdaI
	 L/nFZRGNhonsOkXirfSOo4oXklswe+YGKJjmgVWZZ0zuDF2mLTVHpfgVYHQ/74sfGL
	 jJZhc3X+XBN3Tz0AcXoNgUMkC3ozduknjf1oI0KyNcmxr6lfo8m7GYja0ncoKSNDSW
	 MFyYcjZV8L+UuDMIWPg+xusUjmSODbZeVOqhjz2KcpnqcgtNo4+lOD5PZ2M2kT2zf1
	 //pETtZ8Y7VKpE0fOpThz5A4M0h8TExmzBmmGYPRq/ASi5PdiznKJrFJHXMsHAL3vh
	 4uTMelhlFuY1w==
From: Naveen N Rao <naveen@kernel.org>
To: <linux-kernel@vger.kernel.org>,
	<linuxppc-dev@lists.ozlabs.org>,
	<bpf@vger.kernel.org>
Subject: [PATCH 2/2] MAINTAINERS: Update powerpc BPF JIT maintainers
Date: Sun, 14 Jul 2024 14:04:24 +0530
Message-ID: <24fea21d9d4458973aadd6a02bb1bf558b8bd0b2.1720944897.git.naveen@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
References: <fb6ef126771c70538067709af69d960da3560ce7.1720944897.git.naveen@kernel.org>
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

Hari Bathini has been updating and maintaining the powerpc BPF JIT since
a while now. Christophe Leroy has been doing the same for 32-bit
powerpc. Add them as maintainers for the powerpc BPF JIT.

I am no longer actively looking into the powerpc BPF JIT. Change my role
to that of a reviewer so that I can help with the odd query.

Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05f14b67cd74..c7a931ee7a2e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3878,8 +3878,10 @@ S:	Odd Fixes
 F:	drivers/net/ethernet/netronome/nfp/bpf/
 
 BPF JIT for POWERPC (32-BIT AND 64-BIT)
-M:	Naveen N Rao <naveen@kernel.org>
 M:	Michael Ellerman <mpe@ellerman.id.au>
+M:	Hari Bathini <hbathini@linux.ibm.com>
+M:	Christophe Leroy <christophe.leroy@csgroup.eu>
+R:	Naveen N Rao <naveen@kernel.org>
 L:	bpf@vger.kernel.org
 S:	Supported
 F:	arch/powerpc/net/
-- 
2.45.2

