Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDE87D5F7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 03:25:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VT4FhvsZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SFWTP24J8z3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Oct 2023 12:25:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VT4FhvsZ;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SFWSW07lQz307V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Oct 2023 12:24:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698197097;
	bh=mYmWPBBhitfJ2lWBLyvEkmk/PelbRzX+d+nT4y6lJdg=;
	h=From:To:Subject:Date:From;
	b=VT4FhvsZkgYcVORCxUkMWbh4z3Ex/WOX9E/RGWaiSkIqCw6BvJcqFy7oi0kcy+mSS
	 vEegSVGiDDVo1ugTEdFsUDB5jNAWIsglJubFSIdicVTTfaQxFKFO+ESm8mz60J7vj/
	 DwuNJAKKqFynp5bywfLymiOj8J+2cnO+k5XYnwn41Ne2c/lJ++XdoIrvKFpEzU6qsp
	 Z4hlaXwi4mYa3kQh2DrlqsEMirF2qQO9pT3vhVZe+lqKTKi/cvjSjwgljP4uxafKiC
	 crwrDKAtO6OZTqYKZboVc9XcrPS/L4lq3+NV8QCYOqdnpco/5XQPnaSQTFZBtqdZG2
	 APnHfoqAsHgJQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SFWST6CpPz4wdB;
	Wed, 25 Oct 2023 12:24:57 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Make cpu_spec __ro_after_init
Date: Wed, 25 Oct 2023 12:24:52 +1100
Message-ID: <20231025012452.1985680-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.41.0
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

The cpu_spec is a struct holding various information about the CPU the
kernel is executing on. It's populated early in boot and must not change
after that.

In particular the cpu_features and mmu_features hold the set of
discovered CPU/MMU features and are used to set static keys for each
feature, and do binary patching of assembly. So any change to the
cpu_features/mmu_features later in boot will not be reflected in
the state of the static keys or patched code.

There is already logic to check that cpu_features/mmu_features don't
change, see check_features() in feature-fixups.c.

But as another layer of protection the entire cpu_spec should be read
only after init, annotate it as such.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/cputable.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/cputable.c b/arch/powerpc/kernel/cputable.c
index e97a0fd0ae90..c6678c91401b 100644
--- a/arch/powerpc/kernel/cputable.c
+++ b/arch/powerpc/kernel/cputable.c
@@ -20,9 +20,9 @@
 #include <asm/setup.h>
 #include <asm/cpu_setup.h>
 
-static struct cpu_spec the_cpu_spec __read_mostly;
+static struct cpu_spec the_cpu_spec __ro_after_init;
 
-struct cpu_spec* cur_cpu_spec __read_mostly = NULL;
+struct cpu_spec* cur_cpu_spec __ro_after_init = NULL;
 EXPORT_SYMBOL(cur_cpu_spec);
 
 /* The platform string corresponding to the real PVR */
-- 
2.41.0

