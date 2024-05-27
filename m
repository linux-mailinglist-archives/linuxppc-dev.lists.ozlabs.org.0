Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 55D538D078C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 18:07:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a5lNzkyp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vp0jm3FNJz89nQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 02:00:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a5lNzkyp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vp0fS2PH0z88lF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 01:57:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 083D261B18;
	Mon, 27 May 2024 15:57:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB84C2BBFC;
	Mon, 27 May 2024 15:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716825470;
	bh=jliCrrRlvQBl/x/36ti7pFXBGun1yJO+TJTp8mWdxmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a5lNzkypUQh3XLSgOjFmtL/I54QX9vmBQr1RgDeoi0x5k4JBqbtD+l+ww5zAX6eH0
	 +bTRt5Z1eBEOC324bTzLAQHa6JYRgL3/fd5yltWnqWObDdkTAfwLTlu+7DFD3VomF4
	 rTaRGvGWtsi2JAVCWKWX129o5H42caLJfXfKxlbnpPe6uvpgpMj1tU5ncSt/iRkyms
	 TZ0+uxzop0Ntk0nuem+WQlekep7beD2XDt+EDbQSJwYfFC0NXJ64WaJajL5GA5Q6/g
	 HHvwt+5doel9BHwQFuoJnlFvsO3RT9WmoIuLdIqOKoEXWaXPz+9kv5ykuIWNZFU+MH
	 NXuNq2eg8bQvA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 09/11] powerpc/pseries: Enforce hcall result buffer validity and size
Date: Mon, 27 May 2024 11:56:46 -0400
Message-ID: <20240527155710.3865826-9-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527155710.3865826-1-sashal@kernel.org>
References: <20240527155710.3865826-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.92
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Sasha Levin <sashal@kernel.org>, gautam@linux.ibm.com, llvm@lists.linux.dev, sshegde@linux.ibm.com, nathan@kernel.org, jniethe5@gmail.com, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit ff2e185cf73df480ec69675936c4ee75a445c3e4 ]

plpar_hcall(), plpar_hcall9(), and related functions expect callers to
provide valid result buffers of certain minimum size. Currently this
is communicated only through comments in the code and the compiler has
no idea.

For example, if I write a bug like this:

  long retbuf[PLPAR_HCALL_BUFSIZE]; // should be PLPAR_HCALL9_BUFSIZE
  plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf, ...);

This compiles with no diagnostics emitted, but likely results in stack
corruption at runtime when plpar_hcall9() stores results past the end
of the array. (To be clear this is a contrived example and I have not
found a real instance yet.)

To make this class of error less likely, we can use explicitly-sized
array parameters instead of pointers in the declarations for the hcall
APIs. When compiled with -Warray-bounds[1], the code above now
provokes a diagnostic like this:

error: array argument is too small;
is of size 32, callee requires at least 72 [-Werror,-Warray-bounds]
   60 |                 plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf,
      |                 ^                                   ~~~~~~

[1] Enabled for LLVM builds but not GCC for now. See commit
    0da6e5fd6c37 ("gcc: disable '-Warray-bounds' for gcc-13 too") and
    related changes.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20240408-pseries-hvcall-retbuf-v1-1-ebc73d7253cf@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/hvcall.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
index 95fd7f9485d55..a0fef2493c1f1 100644
--- a/arch/powerpc/include/asm/hvcall.h
+++ b/arch/powerpc/include/asm/hvcall.h
@@ -493,7 +493,7 @@ long plpar_hcall_norets_notrace(unsigned long opcode, ...);
  * Used for all but the craziest of phyp interfaces (see plpar_hcall9)
  */
 #define PLPAR_HCALL_BUFSIZE 4
-long plpar_hcall(unsigned long opcode, unsigned long *retbuf, ...);
+long plpar_hcall(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL_BUFSIZE], ...);
 
 /**
  * plpar_hcall_raw: - Make a hypervisor call without calculating hcall stats
@@ -507,7 +507,7 @@ long plpar_hcall(unsigned long opcode, unsigned long *retbuf, ...);
  * plpar_hcall, but plpar_hcall_raw works in real mode and does not
  * calculate hypervisor call statistics.
  */
-long plpar_hcall_raw(unsigned long opcode, unsigned long *retbuf, ...);
+long plpar_hcall_raw(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL_BUFSIZE], ...);
 
 /**
  * plpar_hcall9: - Make a pseries hypervisor call with up to 9 return arguments
@@ -518,8 +518,8 @@ long plpar_hcall_raw(unsigned long opcode, unsigned long *retbuf, ...);
  * PLPAR_HCALL9_BUFSIZE to size the return argument buffer.
  */
 #define PLPAR_HCALL9_BUFSIZE 9
-long plpar_hcall9(unsigned long opcode, unsigned long *retbuf, ...);
-long plpar_hcall9_raw(unsigned long opcode, unsigned long *retbuf, ...);
+long plpar_hcall9(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL9_BUFSIZE], ...);
+long plpar_hcall9_raw(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL9_BUFSIZE], ...);
 
 /* pseries hcall tracing */
 extern struct static_key hcall_tracepoint_key;
-- 
2.43.0

