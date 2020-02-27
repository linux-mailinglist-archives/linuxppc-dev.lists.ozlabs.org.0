Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D883170FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 06:03:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SgY70l6RzDqpk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 16:03:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SgSs5YnMzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 15:59:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=WC51/Frf; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48SgSs4RSyz9sRf; Thu, 27 Feb 2020 15:59:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 48SgSs3c6jz9sS3; Thu, 27 Feb 2020 15:59:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582779581;
 bh=yA88Kw5i796MQbUhVKxw2dqknHcTX0KrdGz31AUT5ww=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WC51/FrfzEN2UxL/T0ymfsac1piENwXoDJ2mfleh4FJApwlg2Gnjkjaa9I5YqXVlP
 gQ0GCF4mvHR4bFtKVCuif3sVigsCxfIf/UOj8U2KITQteMKnhCHQK5Xv83wblJM/PS
 sIgDLt+Mrufyaim1CVjXRjQsJW3MUawsXf+rGx6rHABRZEQGd4geOF4p/UDXiM9eB3
 2mhvcVvVOxods5YnX0h0KA+LDblpMACw6HfHwtl/Ji3ZOcjsGeciQtPy+M4MD5d6i/
 CttNvfv0F8iTRxw7nf5NaWwz3Y0TZDf48rdBhCL6fOefMRC5rLu23pM/RTWa8NEKmP
 cgQV4NsVU+s6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 2/2] powerpc/vmlinux.lds: Discard .interp section
Date: Thu, 27 Feb 2020 15:59:33 +1100
Message-Id: <20200227045933.22967-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200227045933.22967-1-mpe@ellerman.id.au>
References: <20200227045933.22967-1-mpe@ellerman.id.au>
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
Cc: joel@jms.id.au, amodra@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .interp section specifies which "interpreter", ie. dynamic loader,
the kernel requests. But that doesn't make any sense, the kernel is
not a regular binary that is run with an interpreter.

The content seems to be some default value, this file doesn't even
exist on my system:
  00000000  2f 75 73 72 2f 6c 69 62  2f 6c 64 2e 73 6f 2e 31  |/usr/lib/ld.so.1|

So the section serves no useful purpose and consumes a small amount of
space.

Also Alan Modra says we "likely could discard" it, so do so.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/vmlinux.lds.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index 31a0f201fb6f..619ffbaf72ad 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -257,7 +257,6 @@ SECTIONS
 	}
 	.hash : AT(ADDR(.hash) - LOAD_OFFSET) { *(.hash) }
 	.gnu.hash : AT(ADDR(.gnu.hash) - LOAD_OFFSET) { *(.gnu.hash) }
-	.interp : AT(ADDR(.interp) - LOAD_OFFSET) { *(.interp) }
 	.rela.dyn : AT(ADDR(.rela.dyn) - LOAD_OFFSET)
 	{
 		__rela_dyn_start = .;
@@ -370,5 +369,6 @@ SECTIONS
 		*(.gnu.version*)
 		*(.gnu.attributes)
 		*(.eh_frame)
+		*(.interp)
 	}
 }
-- 
2.21.1

