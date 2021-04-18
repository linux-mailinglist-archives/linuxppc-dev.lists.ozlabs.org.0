Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CB2363783
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 22:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNh8X0FG5z3byT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:18:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=kaadgowH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=kaadgowH; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNh864mF3z301B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 06:17:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=P3jASfyCJaGy4At9UonobsYPxnlqYERhqVFY4wSxwP8=; b=kaadgowHizNRL4HX4j5Neo+MW8
 7c3QaXh6DfUM7ED+bXjFTCmxIhcp5O99ojc/GZKZ8voKc+9px4bKWvczTPLyVjBVcZPOBQJ3H1Sbp
 mqAqBu7uxSAVItL0NSLEiitU3bbY6iJy924aaQ8ax5XYo/pKJ68v8i3uJZRzckA9coIgLHCSPfhow
 k7oORh09H1r0Pk8EPkdvNt2fe8qPEuhHHPBS8iFpE/3oQZVtldnoGOF5faUrEdC3KOUnrJE8iGuw1
 exxW6E2SMng5aGc2Odi1/QiSVFDHp57M63GATwjLQVWCPYtAtyHd4AszpQNFQXXmBVJpnq5yy7GQR
 9zPPJJYQ==;
Received: from [2601:1c0:6280:3f0::df68] (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lYDrG-008WMz-99; Sun, 18 Apr 2021 20:17:31 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] powerpc: add enable_kernel_fp() stub for ALTIVEC without
 PPC_FPU
Date: Sun, 18 Apr 2021 13:17:25 -0700
Message-Id: <20210418201726.32130-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: kernel test robot <lkp@intel.com>, Randy Dunlap <rdunlap@infradead.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On a kernel config with ALTIVEC=y and PPC_FPU not set/enabled,
there is a build error:

drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of function 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
           enable_kernel_fp();

so add a stub function for that when PPC_FPU is not set.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: lkp@intel.com
---
 arch/powerpc/include/asm/switch_to.h |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210416.orig/arch/powerpc/include/asm/switch_to.h
+++ linux-next-20210416/arch/powerpc/include/asm/switch_to.h
@@ -48,6 +48,7 @@ static inline void disable_kernel_fp(voi
 #else
 static inline void save_fpu(struct task_struct *t) { }
 static inline void flush_fp_to_thread(struct task_struct *t) { }
+static inline void enable_kernel_fp(void) { }
 #endif
 
 #ifdef CONFIG_ALTIVEC
