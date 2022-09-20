Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 278565BEA4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 17:32:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MX5C8228Sz3c1Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 01:32:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GZvvYs8Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GZvvYs8Q;
	dkim-atps=neutral
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MX5BS5QVgz30KY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 01:31:58 +1000 (AEST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-1280590722dso4782963fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 08:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=NSVDXfSRUDiwSJM94IRfEXRWFe0gjMqEORV1yJ1Cr/g=;
        b=GZvvYs8QmONhNtvXrYrUFMpoJ84rht+aW6CrX7UAdPQuRptDlZcYDtA77Ohj6q3tjE
         e3KZ7Iflou0f6pfJCVCTp9db/mcuYM/kAo31GTyWHkEOcpr9VK5+86DF01k9/5LD1za+
         GmH1c0WMIpTy44oZvMNYt8e6twYc4DxacunJTkfg0Mnl0UbulOPIDX4+uQNhh/qFcMHl
         vlWYmwiWHUWnJI9LhvhuU8lzhw8PjreNdi2vx6trOjt+OC+McQpUDeJfEnl0HCKKtbn0
         a2//xL01A298AgEgJF+iTGAqDvL+XXHWO40zaKmUpsJx0O3m8JLnY3b7UNefhKFGtBGj
         Cb5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=NSVDXfSRUDiwSJM94IRfEXRWFe0gjMqEORV1yJ1Cr/g=;
        b=zYnzJOp+i3DiKz9893WkZH1sfiyLpNyQNeXHC6ODi3kZffHKudJFIaIcYPd58hDBBR
         CmoPO2M19gNTtuowvsB0T0VZN1IRIiBzvH6FkUzSEd++E9OnNeadcNkLjCd9AkQcRauB
         CXCJTpwQn0xClInBL+vJG+OD0wHF5Qun3KOeLDuxE9iVPGIWQLiWUlXfwSwovE5U4aDh
         W/kJ/gmJJVA7meXV71tcFgyuNniirQSwDDk0fW7w8OKzdr/vkPi632hOg94uIsxW8Hkk
         FjnvlSu2mqg79RB9/yaOZ2rFNtGnX6JLCdNfL/YAqvKaTsTxUYPvvJqWsjYUdE81i8lJ
         d+5g==
X-Gm-Message-State: ACrzQf2gwyU/UmRRf9gfoj2ecIvmNLsQnTkvid+0Xmbt0ztHnLKPmi1p
	ubLiG0sFYV8hFWMVmoCJeCStyTahKFc=
X-Google-Smtp-Source: AMsMyM4WgwMmk5VzErXM6IcIhRMz8WP7ZQ5NaOyzKBL0qI0fTo38tGTcDavZLCzqdCdOUJu5P5PQpw==
X-Received: by 2002:a05:6871:5d1:b0:127:7771:f0d3 with SMTP id v17-20020a05687105d100b001277771f0d3mr2373464oan.199.1663687909805;
        Tue, 20 Sep 2022 08:31:49 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id u28-20020a4a615c000000b00448985f1f17sm39521ooe.9.2022.09.20.08.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 08:31:49 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alan Modra <amodra@au1.ibm.com>,
	Daniel Axtens <dja@axtens.net>
Subject: [PATCH] powerpc/64: don't refer nr_cpu_ids in asm code when it's undefined
Date: Tue, 20 Sep 2022 08:29:35 -0700
Message-Id: <20220920152935.1569605-1-yury.norov@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Yury Norov <yury.norov@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

generic_secondary_common_init() calls LOAD_REG_ADDR(r7, nr_cpu_ids)
conditionally on CONFIG_SMP. However, if NR_CPUS == 1, kernel doesn't
use the nr_cpu_ids, and in C code, it's just:
  #if NR_CPUS == 1
  #define nr_cpu_ids
  ...

The [1] makes declaration of nr_cpu_ids conditional on NR_CPUS == 1,
and that reveals the issue: compiler can't link the
LOAD_REG_ADDR(r7, nr_cpu_ids) against nonexisting symbol.

Current code looks unsafe for those who build kernel with CONFIG_SMP=y and
NR_CPUS == 1. This is weird configuration, but not disallowed.

Fix the linker error by replacing LOAD_REG_ADDR() with LOAD_REG_IMMEDIATE()
conditionally on NR_CPUS == 1.

The issue was spotted after applying [1], which adds a CONFIG_FORCE_NR_CPUS
option that has the similar effect on nr_cpu_ids. So, in this patch, make
the LOAD_REG() conditional on CONFIG_FORCE_NR_CPUS too.

On top of:
[1] https://lore.kernel.org/lkml/20220905230820.3295223-4-yury.norov@gmail.com/T/#m96ffe122721893471fd3470d911a8f2fad6d03b3

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Yury Norov <yury.norov@gmail.com>
---
 arch/powerpc/kernel/head_64.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cf2c08902c05..7cb97881635e 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -400,7 +400,11 @@ generic_secondary_common_init:
 #else
 	LOAD_REG_ADDR(r8, paca_ptrs)	/* Load paca_ptrs pointe	 */
 	ld	r8,0(r8)		/* Get base vaddr of array	 */
+#if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
+	LOAD_REG_IMMEDIATE(r7, NR_CPUS)
+#else
 	LOAD_REG_ADDR(r7, nr_cpu_ids)	/* Load nr_cpu_ids address       */
+#endif
 	lwz	r7,0(r7)		/* also the max paca allocated 	 */
 	li	r5,0			/* logical cpu id                */
 1:
-- 
2.34.1

