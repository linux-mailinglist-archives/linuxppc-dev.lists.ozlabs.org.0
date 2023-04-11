Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BD46DD7F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 12:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwhsq3bxGz3cgV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:29:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VyD4smd9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwhrx4sVZz3c8T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 20:28:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VyD4smd9;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pwhrx3L0lz4xDn;
	Tue, 11 Apr 2023 20:28:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681208929;
	bh=MD8pPiUC3f5QfQC9GwN4+wJBSpaCcAhghRKzcNImi9w=;
	h=From:To:Cc:Subject:Date:From;
	b=VyD4smd99+YQ2LjESIX3dFsdHmF2MMcDg51cIgu6hI1/6SxVE5bKLVhbc+1A3uMLG
	 7wVD9KsxDljn+BVdmOhHjXcviU3DIv+xLsbifKz4hmiWSghlQznm+JN7XER6zAnGF2
	 x66dhfNNaj/UWdZ3hw6rz+54gBYrFrh4AYcSGAb7qcwAFg/LztCySsW5VN9WByqfLb
	 mCChEI0waSjDEsmuUejkkjGLoowT4FvqKmT5YWdQuUu6XoOdoubnvxouRhhE1LcPfs
	 R0j5kq/u/E3lNVpTLN8fus90mh3cgkAzS8efvQwpUydndBeP3l9dJ72trb30g/nr5i
	 CtyEj+N0PatUg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/corenet: Add PPC_QEMU_E500 to corenet configs
Date: Tue, 11 Apr 2023 20:28:38 +1000
Message-Id: <20230411102838.512859-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
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
Cc: oss@buserror.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add PPC_QEMU_E500 to corenet_base.config, which is then used to generate
corenet64_smp_defconfig and corenet32_smp_defconfig.

That then allows both those configs to build kernels that boot in qemu
using the ppce500 machine type and respectively -cpu e5500 or -cpu
e500mc.

The code that is added by PPC_QEMU_E500 just defines another machine
with a probe function that recognises qemu, so there should be no change
when booting on actual hardware supported by CORENET_GENERIC.

The increase in vmlinux size is less than 1KB.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/corenet_base.config | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/corenet_base.config b/arch/powerpc/configs/corenet_base.config
index b568d465e59e..1c40de1e764b 100644
--- a/arch/powerpc/configs/corenet_base.config
+++ b/arch/powerpc/configs/corenet_base.config
@@ -1 +1,2 @@
 CONFIG_CORENET_GENERIC=y
+CONFIG_PPC_QEMU_E500=y
-- 
2.39.2

