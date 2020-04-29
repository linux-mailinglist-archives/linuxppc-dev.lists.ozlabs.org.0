Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AF81BD203
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 04:04:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Bhf11vYbzDqyc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 12:04:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BhcF16vfzDqxc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 12:02:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49BhcD46qpz9sRf;
 Wed, 29 Apr 2020 12:02:52 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v6 11/28] powerpc: Use a datatype for instructions
Date: Wed, 29 Apr 2020 12:02:51 +1000
Message-ID: <2014493.21tHG7dN9E@townsend>
In-Reply-To: <20200428015814.15380-12-jniethe5@gmail.com>
References: <20200428015814.15380-1-jniethe5@gmail.com>
 <20200428015814.15380-12-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: npiggin@gmail.com, bala24@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jordan,

I needed the below fix for building with CONFIG_STRICT_KERNEL_RWX enabled. 
Hopefully it's correct, I have not yet had a chance to test it beyond building 
it.

- Alistair

---
 arch/powerpc/lib/code-patching.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-
patching.c
index ad5754c5f007..a8c8ffdb1ccd 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -166,8 +166,8 @@ static int do_patch_instruction(struct ppc_inst *addr, 
struct ppc_inst instr)
 		goto out;
 	}
 
-	patch_addr = (unsigned int *)(text_poke_addr) +
-			((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
+	patch_addr = (struct ppc_inst *)(text_poke_addr) +
+		((kaddr & ~PAGE_MASK) / sizeof(unsigned int));
 
 	__patch_instruction(addr, instr, patch_addr);
 
-- 
2.20.1




