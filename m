Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F5C12A878
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Dec 2019 17:08:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47jdKn5HP6zDqMG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Dec 2019 03:08:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="A7dgdOh8"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47jdHv2N7bzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Dec 2019 03:06:32 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id x8so11746746pgk.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Dec 2019 08:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gSfzJ6ds8IXkEBlYekF/JAP35cE9VK7DVuScN5rtr4Q=;
 b=A7dgdOh8g5N+5kh1Nip9xO4MOjiOO1NC9oH4BnLHzUEL2fsL79kLU1+F8zs4r4Esgc
 vt9uqhl0x6oOcXLODLAdn806O93r9fUjdQ7eLoLnM0oRJnVd4oCZpJuVplmXE8kwwOzP
 oOoZJ5yBr30pbzmZxmLzvIVp1gb3Bo774Tdp2gaW8BOpzFyVlDBuLwAknHlLXNN4jVSL
 b3zSNzbSXu2zneY79KuJy2JT0qkV8ph/9XFXFFyxx69pZwnh73sk2unq5yYZqMb2cbC2
 oDiGYKCmOQ4qX336e6ckeW1ZDDQTjAlWHi+8h5pwqGPHD62h1zPJe5Z4v+X9dVnznV01
 NWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=gSfzJ6ds8IXkEBlYekF/JAP35cE9VK7DVuScN5rtr4Q=;
 b=iX/RAXIrB/cevtBjNpoW69ZkTXYlseOFbkQNRpVnPuL9vbsHrcybfb2C4zvPGWsGjw
 HpLy+9yOtmbrfA5YqlX/GEHtBAdoU0KdkD9j/LbQ31GhhFXYLwCid1U5EuuvCrcRM1mn
 VDzOpaJ7kYoS9Jde3Tp7n27hv5zklhuOWxILmwcmqS3yecMX/SxDh3tHgUVqDzp5rwum
 CDZ0NkHh6saqySP9ZU9BWVbQcKX0UPBhHAUdPMcf+/TVl5DyuV5pEmyvEN/jHGxhyRfN
 +DY3/fmSqitYWa/sWpQHHAXGc+z5R1DFuztTIrdjPYhyXVGZ7xbMw7g0npqKSyU9bY93
 faVA==
X-Gm-Message-State: APjAAAWy+srt9iFu8qlgza4SFscj/a+CWI2IoWAgvO+uOTLuLHvdrFj0
 Pj8+B+xu+GA6Lj1VXcamACs=
X-Google-Smtp-Source: APXvYqyxeBrcyEJVROE3Qu5C3iF+WCirFJ1Gck5i/SgcUM2Blnu+Sf/LotuqHbPg5QD1kJmrsYrN6Q==
X-Received: by 2002:a63:2ad8:: with SMTP id q207mr43853722pgq.45.1577289989451; 
 Wed, 25 Dec 2019 08:06:29 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id z30sm33510680pff.131.2019.12.25.08.06.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 25 Dec 2019 08:06:28 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/shared: Fix build problem
Date: Wed, 25 Dec 2019 08:06:26 -0800
Message-Id: <20191225160626.968-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Phil Auld <pauld@redhat.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Waiman Long <longman@redhat.com>,
 Will Deacon <will@kernel.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since commit 656c21d6af5d ("powerpc/shared: Use static key to detect
shared processor") and 14c73bd344da ("powerpc/vcpu: Assume dedicated
processors as non-preempt"), powerpc test builds may fail with the
following build errors.

./arch/powerpc/include/asm/spinlock.h:39:1: error:
	type defaults to ‘int’ in declaration of ‘DECLARE_STATIC_KEY_FALSE’
./arch/powerpc/include/asm/spinlock.h: In function ‘vcpu_is_preempted’:
./arch/powerpc/include/asm/spinlock.h:44:7: error:
	implicit declaration of function ‘static_branch_unlikely’
./arch/powerpc/include/asm/spinlock.h:44:31: error:
	‘shared_processor’ undeclared

The offending commits use static_branch_unlikely and shared_processor
without adding the include file declaring it.

Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Phil Auld <pauld@redhat.com>
Cc: Waiman Long <longman@redhat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Juri Lelli <juri.lelli@redhat.com>
Fixes: 656c21d6af5d ("powerpc/shared: Use static key to detect shared processor")
Fixes: 14c73bd344da ("powerpc/vcpu: Assume dedicated processors as non-preempt")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/powerpc/include/asm/spinlock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 1b55fc08f853..5ddd48616b1c 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -16,6 +16,7 @@
  * (the type definitions are in asm/spinlock_types.h)
  */
 #include <linux/irqflags.h>
+#include <linux/jump_label.h>
 #ifdef CONFIG_PPC64
 #include <asm/paca.h>
 #include <asm/hvcall.h>
-- 
2.17.1

