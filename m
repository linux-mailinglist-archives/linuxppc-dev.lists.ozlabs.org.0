Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E52FC296873
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 04:10:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHSPh5DNXzDr3S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 13:10:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHSMG0nhszDr0p
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 13:08:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iXMjHkWA; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CHSMF2LHzz9sTc; Fri, 23 Oct 2020 13:08:41 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CHSMD6KCJz9sTK; Fri, 23 Oct 2020 13:08:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603418920;
 bh=Ng0fZOsQFBeLrflbA41ibay3UPia7+nt0IbLJd90iTg=;
 h=From:To:Subject:Date:From;
 b=iXMjHkWAEPG3UZQeTnkHquLbwkbhjWy8d8xdD3s5arMSZ/0v2aXb5xlyWjbBWVSd1
 O9buSG+oDQ9PTRAoqo/Dj+w+RsmqPMNWrRASXp/3TCPYNlSiyZzpKfZbAHaiPbAoxb
 L3O4QcjJmu2AnAdwsL6BVZ4qLwIenWz2Dl4CJp4BtVriuoMaFd8e6kfuqc30F55Kfj
 gRyevkBV6q1LiU3QkXXMghThQjTXRPw0QQi0ep0Q4VsSdU0LrEClhAideS7GhYIZEv
 yJdCG43PgPfHR7OyUvIsQlAQttmt6SFVrYzRprXUrPBw8mfzrRiA3h2L3pvz9Hen5a
 kUSZGhMuqHuNw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] powerpc/85xx: Fix declaration made after definition
Date: Fri, 23 Oct 2020 13:08:38 +1100
Message-Id: <20201023020838.3274226-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently the clang build of corenet64_smp_defconfig fails with:

  arch/powerpc/platforms/85xx/corenet_generic.c:210:1: error:
  attribute declaration must precede definition
  machine_arch_initcall(corenet_generic, corenet_gen_publish_devices);

Fix it by moving the initcall definition prior to the machine
definition, and directly below the function it calls, which is the
usual style anyway.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/85xx/corenet_generic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/85xx/corenet_generic.c b/arch/powerpc/platforms/85xx/corenet_generic.c
index 6aa8defb5857..8d6029099848 100644
--- a/arch/powerpc/platforms/85xx/corenet_generic.c
+++ b/arch/powerpc/platforms/85xx/corenet_generic.c
@@ -106,6 +106,7 @@ int __init corenet_gen_publish_devices(void)
 {
 	return of_platform_bus_probe(NULL, of_device_ids, NULL);
 }
+machine_arch_initcall(corenet_generic, corenet_gen_publish_devices);
 
 static const char * const boards[] __initconst = {
 	"fsl,P2041RDB",
@@ -206,5 +207,3 @@ define_machine(corenet_generic) {
 	.power_save		= e500_idle,
 #endif
 };
-
-machine_arch_initcall(corenet_generic, corenet_gen_publish_devices);
-- 
2.25.1

