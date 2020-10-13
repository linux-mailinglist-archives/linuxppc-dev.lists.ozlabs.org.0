Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A7728CD4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 13:59:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9YxM0hrHzDqKs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 22:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=mchehab@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=He/Oxt6d; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9Yr56grDzDqbh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 22:54:45 +1100 (AEDT)
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de
 [95.90.213.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 51A1922447;
 Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602590081;
 bh=9mtg6cPA9MJfrf7/vYpFkaem8befp1IfLRwT5OVMr08=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=He/Oxt6d2cmA9KfQOE7Dt6LEH8Ncj3xqfh5tdAQ6WwqGZeNuOQQhrebZf2Q54ei+8
 +/+qrEv5gFpaa9BZ2XAp6pdewPBhX8mm6EVBw5LPJ1TsB4duKc7W7VrfhtOJKFEXZQ
 zzecwXyO2OkA79qSfSp4/rIp3ojHxAHC5a5AYpeA=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1kSIt5-006CVz-Cm; Tue, 13 Oct 2020 13:54:39 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: [PATCH v6 59/80] docs: powerpc: syscall64-abi.rst: fix a malformed
 table
Date: Tue, 13 Oct 2020 13:54:14 +0200
Message-Id: <6dee3216d15ef03bf8b35fd55149631d7f71d62d.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
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
Cc: Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported:

	Documentation/powerpc/syscall64-abi.rst:53: WARNING: Malformed table.
	Text in column margin in table line 2.

	=========== ============= ========================================
	--- For the sc instruction, differences with the ELF ABI ---
	r0          Volatile      (System call number.)

This table requires a different notation to be valid.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/powerpc/syscall64-abi.rst | 32 ++++++++++++-------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/Documentation/powerpc/syscall64-abi.rst b/Documentation/powerpc/syscall64-abi.rst
index 379817ca64d2..cf9b2857c72a 100644
--- a/Documentation/powerpc/syscall64-abi.rst
+++ b/Documentation/powerpc/syscall64-abi.rst
@@ -49,22 +49,22 @@ Register preservation rules
 Register preservation rules match the ELF ABI calling sequence with the
 following differences:
 
---- For the sc instruction, differences with the ELF ABI ---
-=========== ============= ========================================
-r0          Volatile      (System call number.)
-r3          Volatile      (Parameter 1, and return value.)
-r4-r8       Volatile      (Parameters 2-6.)
-cr0         Volatile      (cr0.SO is the return error condition.)
-cr1, cr5-7  Nonvolatile
-lr          Nonvolatile
-=========== ============= ========================================
-
---- For the scv 0 instruction, differences with the ELF ABI ---
-=========== ============= ========================================
-r0          Volatile      (System call number.)
-r3          Volatile      (Parameter 1, and return value.)
-r4-r8       Volatile      (Parameters 2-6.)
-=========== ============= ========================================
++------------------------------------------------------------------------+
+|        For the sc instruction, differences with the ELF ABI		 |
++--------------+--------------+------------------------------------------+
+| r0           | Volatile     | (System call number.)			 |
+| rr3          | Volatile     | (Parameter 1, and return value.)	 |
+| rr4-r8       | Volatile     | (Parameters 2-6.)			 |
+| rcr0         | Volatile     | (cr0.SO is the return error condition.)	 |
+| rcr1, cr5-7  | Nonvolatile  |						 |
+| rlr          | Nonvolatile  |						 |
++--------------+--------------+------------------------------------------+
+|      For the scv 0 instruction, differences with the ELF ABI		 |
++--------------+--------------+------------------------------------------+
+| r0           | Volatile     | (System call number.)			 |
+| r3           | Volatile     | (Parameter 1, and return value.)	 |
+| r4-r8        | Volatile     | (Parameters 2-6.)			 |
++--------------+--------------+------------------------------------------+
 
 All floating point and vector data registers as well as control and status
 registers are nonvolatile.
-- 
2.26.2

