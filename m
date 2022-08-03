Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F47A588767
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 08:33:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LyMVp3q1Sz3chb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 16:33:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Hjuww4pc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LyMV54vKKz3bnH
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 16:32:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Hjuww4pc;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LyMV54BSMz4x1V;
	Wed,  3 Aug 2022 16:32:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659508349;
	bh=FC2QLhoa0MaP65TetOS4RN4WmovBNmlkskF85I70Ajg=;
	h=From:To:Subject:Date:From;
	b=Hjuww4pcdqJMNQR9LxHkTPwZkFRMwQ/OsAL+UCSWQ9cLFlkuJRJ48MBFjywX03y/9
	 VprppXo0YWBP3jTijCZbsy5tLruiYoO2d49P3VXuKmy9Ol8fyGVwfC7kPcz1Sygo8X
	 VG7JZaNUQLW6ffF5tEjT5WLUenNnn2XCnlWg3ADISM54rjgVZ7tOj4m8C41pupqXPH
	 EKJ2JMd0DFQ4cwsa6vFBI7IN4/s7ihC32gCtNmc2IYdFIYezJCM59j2B4AycHUM28D
	 y93NDiJKCkwgNsbIMTqIvkIzCfQZmCbvI8hPHcK3yRvdDADMpZOSiG+I6+skW6EA2r
	 M99XYCs8PqcdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Update ISA versions to mention e5500/e6500
Date: Wed,  3 Aug 2022 16:32:28 +1000
Message-Id: <20220803063228.1250030-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add the NXP (nee Freescale) e5500 and e6500 to the ISA versions
documentation.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/powerpc/isa-versions.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/powerpc/isa-versions.rst b/Documentation/powerpc/isa-versions.rst
index dfcb1097dce4..5592b8899a48 100644
--- a/Documentation/powerpc/isa-versions.rst
+++ b/Documentation/powerpc/isa-versions.rst
@@ -10,6 +10,8 @@ CPU       Architecture version
 Power10   Power ISA v3.1
 Power9    Power ISA v3.0B
 Power8    Power ISA v2.07
+e6500     Power ISA v2.06 with some exceptions
+e5500     Power ISA v2.06 with some exceptions, no Altivec
 Power7    Power ISA v2.06
 Power6    Power ISA v2.05
 PA6T      Power ISA v2.04
@@ -36,6 +38,8 @@ CPU        VMX (aka. Altivec)
 Power10    Yes
 Power9     Yes
 Power8     Yes
+e6500      Yes
+e5500      No
 Power7     Yes
 Power6     Yes
 PA6T       Yes
@@ -52,6 +56,8 @@ CPU        VSX
 Power10    Yes
 Power9     Yes
 Power8     Yes
+e6500      No
+e5500      No
 Power7     Yes
 Power6     No
 PA6T       No
@@ -68,6 +74,8 @@ CPU        Transactional Memory
 Power10    No  (* see Power ISA v3.1, "Appendix A. Notes on the Removal of Transactional Memory from the Architecture")
 Power9     Yes (* see transactional_memory.txt)
 Power8     Yes
+e6500      No
+e5500      No
 Power7     No
 Power6     No
 PA6T       No
-- 
2.35.3

