Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45D31723E01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 11:41:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qb58t0Ktdz3fg5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 19:41:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ys1w4a/6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229; helo=mail-oi1-x229.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Ys1w4a/6;
	dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qb55Q5s5bz3f0s
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 19:38:50 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-39ab96e6aefso2002640b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686044328; x=1688636328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCh6RVJI4h7nw2maw98k2ell5XwYb4yP+21lrC089v4=;
        b=Ys1w4a/6FCc9j6NvOaE9+7w4fuxadYIURiTEJim5ekaVKCKzhi5Kj53XtM8f61wR4v
         fz66GqNp0onlIJWdgFFac+Fc9JJ+CcsocEQ0b+0Eu+iR3q24Ef9FF6Ryde/m1gIPMy4x
         W6sKOBo1Pnc8jTpcJmFHH+e85JS7HYoDvXhtsFqR7wexNGdX/lFiLi7kfT0z9eDPu2dE
         0C2ag9Pzf7uos+Gt7TiijiA7An9sCi0161gCt0AkqN9lThzJVXB969MX2z3AYVl3kypf
         Z/Qzh0RtiPZl9WyhZXz84YYaGpoNu9ujyrtKE+2dFc7ssCvcCgyRi8NZBU8ug0X7utt1
         tQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686044328; x=1688636328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCh6RVJI4h7nw2maw98k2ell5XwYb4yP+21lrC089v4=;
        b=HnB9V+wjpMQvcKd1+9dDl0O+M6bihf+4tjp2WHBbpCttXl5qr04nkSUaFnYz0TSEF1
         EuKAw2SoEzRhAUQV9IrIE3fj5yesn0WbnxX37Fe16jH6gzxgyc+Apmdf3E94lTXALImC
         sjRIg+XYijy3pmBNJv1fJysx3sRpx9gCtaN3r71/6jr/dtyzM85ZBhazoY8vjA00qZpH
         60irugGU4kCCKIOR3pmaEglFj6CQdPOo4DqWfm8orOUJV33dGp/L9+T7Iej1rw9txN5H
         /DdCVAxeuhCjq+nspqQmkARFvNdt9PYmXLJWquwv7+t27/WcLMxFDFvYaKzvnxEp7gxM
         su7A==
X-Gm-Message-State: AC+VfDyqaEzyIdNSYwXwv3mgAlADWRtHtp3DALvLYe7ePY7bIj0v2ZD8
	eHcy4tijgnMpN30yWRMi4Xe7n4LSpjqZ+g==
X-Google-Smtp-Source: ACHHUZ7E/8oi8nxRWE7Cwv9fr4Es95LhTZYyXhaTIRsiIkkKDw+t8RG3Op6X3COs94l+wblvlQSTHQ==
X-Received: by 2002:a05:6808:8fb:b0:39a:5ea3:6b16 with SMTP id d27-20020a05680808fb00b0039a5ea36b16mr1677958oic.41.1686044327883;
        Tue, 06 Jun 2023 02:38:47 -0700 (PDT)
Received: from wheely.local0.net (58-6-230-127.tpgi.com.au. [58.6.230.127])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001ac8218ddb7sm8048442plg.84.2023.06.06.02.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 02:38:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/4] powerpc/64: Use -mprofile-kernel for big endian ELFv2 kernels
Date: Tue,  6 Jun 2023 19:38:31 +1000
Message-Id: <20230606093832.199712-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606093832.199712-1-npiggin@gmail.com>
References: <20230606093832.199712-1-npiggin@gmail.com>
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
Cc: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-mprofile-kernel is an optimised calling convention for mcount that
Linux  has only implemented with the ELFv2 ABI, so it was disabled for
big endian kernels. However it does work with ELFv2 big endian, so let's
allow that if the compiler supports it.

Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                            |  5 +++--
 arch/powerpc/tools/gcc-check-mprofile-kernel.sh | 11 ++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 296e0448b5fc..9db707829638 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -547,8 +547,9 @@ config LD_HEAD_STUB_CATCH
 	  If unsure, say "N".
 
 config MPROFILE_KERNEL
-	depends on PPC64 && CPU_LITTLE_ENDIAN && FUNCTION_TRACER
-	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -I$(srctree)/include -D__KERNEL__)
+	depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
+	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_LITTLE_ENDIAN
+	def_bool $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG_ENDIAN
 
 config HOTPLUG_CPU
 	bool "Support for enabling/disabling CPUs"
diff --git a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
index 137f3376ac2b..a31a56016c09 100755
--- a/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
+++ b/arch/powerpc/tools/gcc-check-mprofile-kernel.sh
@@ -7,20 +7,21 @@ set -o pipefail
 # To debug, uncomment the following line
 # set -x
 
-# -mprofile-kernel is only supported on 64le, so this should not be invoked
-# for other targets. Therefore we can pass in -m64 and -mlittle-endian
-# explicitly, to take care of toolchains defaulting to other targets.
+# -mprofile-kernel is only supported on 64-bit, so this should not be invoked
+# for 32-bit. We pass in -m64 explicitly, and -mbig-endian and -mlittle-endian
+# are passed in from Kconfig, which takes care of toolchains defaulting to
+# other targets.
 
 # Test whether the compile option -mprofile-kernel exists and generates
 # profiling code (ie. a call to _mcount()).
 echo "int func() { return 0; }" | \
-    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
+    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
     2> /dev/null | grep -q "_mcount"
 
 # Test whether the notrace attribute correctly suppresses calls to _mcount().
 
 echo -e "#include <linux/compiler.h>\nnotrace int func() { return 0; }" | \
-    $* -m64 -mlittle-endian -S -x c -O2 -p -mprofile-kernel - -o - \
+    $* -m64 -S -x c -O2 -p -mprofile-kernel - -o - \
     2> /dev/null | grep -q "_mcount" && \
     exit 1
 
-- 
2.40.1

