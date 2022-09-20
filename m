Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5CA5BF153
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 01:36:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXHx81pHsz3c6n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 09:36:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nSlKnczQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=yury.norov@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=nSlKnczQ;
	dkim-atps=neutral
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXHwX6vM7z2yXt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 09:35:40 +1000 (AEST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-12b542cb1d3so6589704fac.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 16:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=IRDa0k/5OP13nGxllwfWF1EOQGOPviM7zC68vUvS8jc=;
        b=nSlKnczQGqN1Us7whr/LRt5gaNNsUx6ooGDTzx23pwJu7GAQG6xX33Xuk4q82lL7rl
         ROLfBhqMNooyocPd1Hs9Czajwik4AxWlhQuxhsenSIS6jeZrlLZHtd3xOprE3ZhE39Kt
         JKKCTGtEHMfAR26JMC+ULiK7/KGtk8zs22E0hFtjPOxSsklxW6rS+hGYFH+KxfrNu5MC
         DBTIhQOIDHJmP9FfnQpkmignF0sBFechkoGKp0kKAz8mr9frjJWNWy+cpBZ/47kQzGvo
         pI72meHb0V1eIJJjNXM2giAs5PcMFsYNATvbq6VhWv1YGGy9SoYwYGgxK1fzXXYkLkPw
         jpDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=IRDa0k/5OP13nGxllwfWF1EOQGOPviM7zC68vUvS8jc=;
        b=yTJCgVLkhtqyoxEk01KgKwMsH/1WWlEYuZAKvIsDvbHRelE5upKB9Ucl3wfurTJKyf
         2ioPjTWi/IqQd4ycIwMIGHMb8VilLF9BIcFjXsxYIdmILYUeblfmvcz397R+1LL605sz
         d7MUnp6VlpWL1icJzyWRk8Cz5fwIJbowh69NbZlrnQlPq6YRS5LB4J380C5hjZPjy20z
         PX71B+Xr0EYAUfRiexSxxkyo6uR5lphcENv0iLoYKCr4iImrxa9Yt3TtS7U8/TjpBc/5
         OaNi++UR7pbiFEF4dftEk6svViDP0hy+pobdI8CCpvAhr3iKdmH6+2Az8Lb+vlXSTjD8
         hxFQ==
X-Gm-Message-State: ACrzQf2OHzt0UXXtA6wOnKm2CIiQcuuH9IeEkrUWygHrWNUG8Khpm1b3
	QoRR+89Kj+W8w4q4Utlzt2Xf18dh+TU=
X-Google-Smtp-Source: AMsMyM7eVQJV2lPOgYS/WZ4tP3lKzX+i0j3VqqUYBDcPJ8PR85Mbe4BXVSmGTPK1WZVMd+XRPavp/A==
X-Received: by 2002:a05:6870:2499:b0:101:7531:c7ec with SMTP id s25-20020a056870249900b001017531c7ecmr3594616oaq.42.1663716937255;
        Tue, 20 Sep 2022 16:35:37 -0700 (PDT)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id q64-20020acac043000000b0034ffacec0basm547712oif.15.2022.09.20.16.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 16:35:36 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Alan Modra <amodra@au1.ibm.com>,
	Daniel Axtens <dja@axtens.net>
Subject: [PATCH v2] powerpc/64: don't refer nr_cpu_ids in asm code when it's undefined
Date: Tue, 20 Sep 2022 16:33:25 -0700
Message-Id: <20220920233325.1614019-1-yury.norov@gmail.com>
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
v2: move "lwz     r7,0(r7)" under #else conditional.

 arch/powerpc/kernel/head_64.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index cf2c08902c05..d36939029701 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -400,8 +400,12 @@ generic_secondary_common_init:
 #else
 	LOAD_REG_ADDR(r8, paca_ptrs)	/* Load paca_ptrs pointe	 */
 	ld	r8,0(r8)		/* Get base vaddr of array	 */
+#if (NR_CPUS == 1) || defined(CONFIG_FORCE_NR_CPUS)
+	LOAD_REG_IMMEDIATE(r7, NR_CPUS)
+#else
 	LOAD_REG_ADDR(r7, nr_cpu_ids)	/* Load nr_cpu_ids address       */
 	lwz	r7,0(r7)		/* also the max paca allocated 	 */
+#endif
 	li	r5,0			/* logical cpu id                */
 1:
 	sldi	r9,r5,3			/* get paca_ptrs[] index from cpu id */
-- 
2.34.1

