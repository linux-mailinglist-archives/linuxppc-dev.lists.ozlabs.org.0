Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23C3A44A70D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 07:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpJZN736vz3c69
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 17:52:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Z7qmG+Xp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Z7qmG+Xp; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpJYh16ZDz2x9Z
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 17:51:52 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id x131so13385300pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 22:51:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E2gPNceil4c2ICMleLexggXCMkrway+bPo4BYF6dfBI=;
 b=Z7qmG+XpoxlpkM+e+KjwzB0LC91MRepwOErbM+vmMmtKPMhWlKUQbVzoK9qpHaa7/a
 fYmC9XxgHFRWGUkk1jugvTOBxqzNI+oal8xjmrgvcqQ1KerKSsHoE/175pWfu+yaOXFG
 NZGdFXGZ9KdGTr8HbRKObbx5QB8iwIlcHJujAFIXu9IY+SqM5WvS6yZOuETdHt98Kxkq
 iTeTglzllcVhcGkccZYhaupGXWuRwdKmMUvGdQXoSfOPGzNkJ8i6RhFbddZBZEAHFYfY
 V3GHarCMjy8A4AKkcgsA5FabhDpYIzVKeSUVBF/rgfJIzLMj9uCVeenW+zc1QCblFtv4
 8eFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E2gPNceil4c2ICMleLexggXCMkrway+bPo4BYF6dfBI=;
 b=WgG1yVKQ8tq8Dj+QZHaunrDBhCEYqMWAg5scbnLD3P1a+QE46Ijxop5GHjqBveogOD
 DD9REoPwDgplFx16CscaWuS7o8TL+LdovWjpoVcofVb3rVSZJNx+cg0sNkytuq7QhcXH
 ygoRrpfJrlNvEfj2IQWZQuXh/6Oo2H73oWPnTCX0NPUnFLt6SpVrtokELcEG8Gi3VyXp
 VbDKs5AG/h55xtz0BQIBuAgJpor5aLxlUrivwFoJtje5P5Aid9bQO6vlmmBBW3ilzsxa
 XcKEl6QJ9O5eunUhslFWGBk4ewFfxIHP7gTS3YFYHFBu9AERU1eCb8cIptT78TTmq5/l
 l2Jg==
X-Gm-Message-State: AOAM531pGs5s26ICdSR0jPwy6PQ3muzaiBFiHRPBc3RJp/IyBws2WKEE
 Bo3hJIqZgDjn/3g3Zmu3zs+fOlnPR48=
X-Google-Smtp-Source: ABdhPJxUzu00RR6rxUab2ewUysMy2ymdjspfoN2cDYxLL5pPBlDEbSlwfTYqnuIv/ooOo9IEwrpNuA==
X-Received: by 2002:a63:954d:: with SMTP id t13mr4236628pgn.179.1636440708952; 
 Mon, 08 Nov 2021 22:51:48 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 w192sm12465956pfd.21.2021.11.08.22.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 22:51:48 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc/64s: introduce CONFIG_MAXSMP to test very large SMP
Date: Tue,  9 Nov 2021 16:51:31 +1000
Message-Id: <20211109065131.2041720-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similarly to x86, add MAXSMP that should help flush out problems with
vary large SMP and other values associated with very big systems.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
Since v1:
- Reduce MAXSMP NR_CPUS to 8192 if COMPILE_TEST, to reduce compile errors
  that aren't caught by existing x86 builds.

Thanks,
Nick

 arch/powerpc/Kconfig                   | 8 ++++++++
 arch/powerpc/platforms/Kconfig.cputype | 9 +++++++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8f6185d3998..d585fcfa456f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -64,6 +64,13 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
 config NEED_PER_CPU_PAGE_FIRST_CHUNK
 	def_bool y if PPC64
 
+config MAXSMP
+	bool "Enable Maximum number of SMP Processors and NUMA Nodes"
+	depends on SMP && DEBUG_KERNEL && PPC_BOOK3S_64
+	help
+	  Enable maximum number of CPUS and NUMA Nodes for this architecture.
+	  If unsure, say N.
+
 config NR_IRQS
 	int "Number of virtual interrupt numbers"
 	range 32 1048576
@@ -666,6 +673,7 @@ config NUMA
 
 config NODES_SHIFT
 	int
+	default "10" if MAXSMP
 	default "8" if PPC64
 	default "4"
 	depends on NUMA
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index a208997ade88..14c275e0ff93 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -475,9 +475,14 @@ config SMP
 
 	  If you don't know what to do here, say N.
 
+# MAXSMP sets 8192 if COMPILE_TEST because that's what x86 has flushed out.
+# Exceeding that will cause a lot of compile errors. Have to deal with those
+# first.
 config NR_CPUS
-	int "Maximum number of CPUs (2-8192)" if SMP
-	range 2 8192 if SMP
+	int "Maximum number of CPUs (2-8192)" if SMP && !MAXSMP
+	range 2 16384 if SMP
+	default 16384 if MAXSMP && !COMPILE_TEST
+	default 8192 if MAXSMP && COMPILE_TEST
 	default "1" if !SMP
 	default "32" if PPC64
 	default "4"
-- 
2.23.0

