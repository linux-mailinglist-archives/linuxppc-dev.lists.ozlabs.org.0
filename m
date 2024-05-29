Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 3BCF38D3CDA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 18:36:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=U6nBRG4z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqFGC42bPz79lg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 02:29:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=U6nBRG4z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sifive.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=samuel.holland@sifive.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqFFV5908z798q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 02:29:01 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1f47f07aceaso19398655ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 09:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717000135; x=1717604935; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iUKf6RPGHkE9ueRDvwJp4yAPIvOh2riYCScZzEfcavE=;
        b=U6nBRG4zpvlSqMRbmFpCx0uaJ3BRr4NVxmd90SDmcZ7mNZ5YB80OA0m57mjWdlKUFh
         msfQhEYoRdt6YIjh0tJ2jgcYmqp/eomBUKFHtv4NgYPgGSTMqJtlZONiwJ47UHmPRUIy
         ORoSV4X/87nCbBFpYrrdJtgmFYgB5TJz48Z9oQn62wqfUSNINzNTphmenPOxXdlj4HyQ
         PtL/vIF6tlXYShgaFqmlsTTHnA1o6sOSWJ4u+orw812LkMsGjTzTrQ7FpUS8hqcpbsy9
         N7MiQSmDsTCqvRQveU8hw3fEEvkuJHRFAFE5L8dYPuIHC3Gk4G1cv7ki3/vLZs7F5Qh1
         XSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717000135; x=1717604935;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUKf6RPGHkE9ueRDvwJp4yAPIvOh2riYCScZzEfcavE=;
        b=MR5Imyv/k8Jvt7gLx+Tfo82VUyNMHlGXg2NMMrMhUZkB6gj7MfDbxi4imPDp35TWBV
         aZ1gNbY19SLDyC9Fs8/DiwPXLW4aMIUTVDCFyqh9Y3eMCWUtjwrf13lYIs6QE9EIkiJe
         AYHcKYPm3wiH77QEVIjbtstbBtyQXJCgknGIfABuwYlh7Gw1ZEmZaKR2YeVdCjgNX2eB
         sxIgGeB9UPpPSk7mqDI5W9fyJsmM3s0Ugw5ODqzpiVvsjgMKFuaGmcB/4WPcLmu7UBCZ
         O79jVa72DdYbJcKj590y+a9pZGCO4M5TwRYT6GAlVLAh+8b2b9rsssa71EFf1TyczrwM
         ZIIw==
X-Gm-Message-State: AOJu0Yz3NVOvy0H9rsNgDTDRj0alr30OgxC+zC8YuSkrXGCk2+6NNSen
	oXeADfhkFnfGzaoKNbnPslbXVi1KWG2/9R+OZArLXqjOnQ6DwXZpeU8bdmKUR/F/UU8YrTdJHSj
	6l8aUHOIy2MOdDCOnc0tf5W6H0WwSzYS+zLlYTvryDpJx4Vw23evJAhzbJLZXnqr/1dlow88nxC
	WbAtYp5BSE6E096JEs53CGI2oGwyn07Scx4bbeOlwGdtCsD3P691druA==
X-Google-Smtp-Source: AGHT+IEjVPCvcjtvs+arO36qgagTdadtsaeqU3GiNIZQ/tvSccsvX/2ca/K2QWSCF0VhUZl8F1kyfA==
X-Received: by 2002:a17:902:c943:b0:1f4:64ba:af9f with SMTP id d9443c01a7336-1f464bab2f7mr139578315ad.48.1717000134988;
        Wed, 29 May 2024 09:28:54 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9a88e0sm101756305ad.231.2024.05.29.09.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 09:28:54 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Limit ARCH_HAS_KERNEL_FPU_SUPPORT to PPC64
Date: Wed, 29 May 2024 09:28:50 -0700
Message-ID: <20240529162852.1209-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building a 32-bit kernel, some toolchains do not allow mixing soft
float and hard float object files:

    LD      vmlinux.o
  powerpc64le-unknown-linux-musl-ld: lib/test_fpu_impl.o uses hard float, arch/powerpc/kernel/udbg.o uses soft float
  powerpc64le-unknown-linux-musl-ld: failed to merge target specific data of file lib/test_fpu_impl.o
  make[2]: *** [scripts/Makefile.vmlinux_o:62: vmlinux.o] Error 1
  make[1]: *** [Makefile:1152: vmlinux_o] Error 2
  make: *** [Makefile:240: __sub-make] Error 2

This is not an issue when building a 64-bit kernel. To unbreak the
build, limit ARCH_HAS_KERNEL_FPU_SUPPORT to 64-bit kernels. This is okay
because the only real user of this option, amdgpu, was previously
limited to PPC64 anyway; see commit a28e4b672f04 ("drm/amd/display: use
ARCH_HAS_KERNEL_FPU_SUPPORT").

Fixes: 01db473e1aa3 ("powerpc: implement ARCH_HAS_KERNEL_FPU_SUPPORT")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405250851.Z4daYSWG-lkp@intel.com/
Reported-by: Guenter Roeck <linux@roeck-us.net>
Closes: https://lore.kernel.org/lkml/eeffaec3-df63-4e55-ab7a-064a65c00efa@roeck-us.net/
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3c968f2f4ac4..c88c6d46a5bc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,7 +137,7 @@ config PPC
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_KCOV
-	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC_FPU
+	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC64 && PPC_FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
-- 
2.44.1

