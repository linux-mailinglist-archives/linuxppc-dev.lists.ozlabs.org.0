Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CDE3674A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:07:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQY673gw4z30GS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 07:07:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=W5BXQXsm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=W5BXQXsm; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQY5l1zCwz2yRY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 07:07:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ZM2ehOGr3Lw3U7fLtVZbH3jW2tFkDDiwHuTaEwECTJA=; b=W5BXQXsmoH3x4c7K1/YLKMLcrs
 DST56gERsOa4jPLxOyYtKmBYKyJvhtGU6vSMFuRLfsUcdJSu/Ib23nysrFK949La8dZ31kRzUn55E
 QiKOs3LCKvjMhQ6HkubWHkD7n9prAo5pBPviJXh3UervK71tNrauE75yhZBpgp6bLaLqdGb0o1nMh
 htRLDmM0dKkfNbvya5vVZLWhCNk0zUJc321NKxZ37b5X67Ds6NuXa73JY3m665nRLe7VRlPzKfCA6
 /VL+wrBLCarSlpmHUfHSKfBSB1E+r47Gj9/0Wooqr7N/b6ujybf41ex4iau+knabentgvcnQc9x11
 fC//4vyQ==;
Received: from [2601:1c0:6280:3f0:d7c4:8ab4:31d7:f0ba]
 (helo=smtpauth.infradead.org)
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lZK3f-00FCUo-Gl; Wed, 21 Apr 2021 21:06:55 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3] powerpc: make ALTIVEC select PPC_FPU
Date: Wed, 21 Apr 2021 14:06:47 -0700
Message-Id: <20210421210647.20836-1-rdunlap@infradead.org>
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
there are build errors:

drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of function 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
           enable_kernel_fp();
../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of function 'put_vr' [-Werror=implicit-function-declaration]
  637 |   put_vr(rn, &u.v);
      |   ^~~~~~
../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of function 'get_vr'; did you mean 'get_oc'? [-Werror=implicit-function-declaration]
  660 |   get_vr(rn, &u.v);
      |   ^~~~~~

In theory ALTIVEC is independent of PPC_FPU but in practice nobody
is going to build such a machine, so make ALTIVEC require PPC_FPU
by selecting it.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Segher Boessenkool <segher@kernel.crashing.org>
Cc: lkp@intel.com
---
v2: change ALTIVEC depends on PPC_FPU to select (Christophe and Michael)
v3: other platforms don't need to select PPC_FPU since they select ALTIVEC
    (Christophe; thanks)

 arch/powerpc/platforms/Kconfig.cputype |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210416.orig/arch/powerpc/platforms/Kconfig.cputype
+++ linux-next-20210416/arch/powerpc/platforms/Kconfig.cputype
@@ -310,6 +310,7 @@ config PHYS_64BIT
 config ALTIVEC
 	bool "AltiVec Support"
 	depends on PPC_BOOK3S_32 || PPC_BOOK3S_64 || (PPC_E500MC && PPC64)
+	select PPC_FPU
 	help
 	  This option enables kernel support for the Altivec extensions to the
 	  PowerPC processor. The kernel currently supports saving and restoring
