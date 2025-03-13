Return-Path: <linuxppc-dev+bounces-6947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92975A5EDB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 09:10:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD0Yk0B44z30Vr;
	Thu, 13 Mar 2025 19:10:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741853449;
	cv=none; b=Ao4RiWC+Egqs13ooklR7ujGVc73IBDauDxN9d+vAPNlamduzy9q6wf7Ca7xHEeaMBVjtugK56EjGqbl0EjUguHK/K5cSlMpd3BEafISrIiWt9e6TNnhG9vHD5edGLaB+aDoDitBYPe0UXU4K2ZptFniuqiSYyNbIl9mkg4JQyHTfAyvj/1LVWTDz9kb5o50rdPpTAJgohBrYmGSO130h0dk9xVYuvNh7qWrc5POP4eaqXYs55JKGO/btz7UHVXWWU1fJf3Bsz+GZcFgy2uVpbZJIFeZTcBWqaz0qRnKEECAcPjo8jTz+7KCvNgqjeLjMrhHYy2BULN707XsnbKDUxA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741853449; c=relaxed/relaxed;
	bh=AQ9BY6MfqeBnYUVfru7kZ8K/PoXW+VVvjrZDNrKJmTM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HuXXEWIWe49oVfG2jor2ayLbf+qwfJdkSLg1D7F0YUSkjnpgkjL/T/XRXjjqDIecTQCO3KOQbu2SLrYcMpf91bp9gXNPRnu2/C+THvAJPmLlyW9v4k/FTbMnXO/1vUMzLtn4/QfPbkIM4D8/uuKwbRToHK1WcePfRrbu433sjQg+TPaNI4tFRByvt1YeKjqwCG2JN3leS5Syqz9ldoMvHhAQ84CW0oI4ODubMqZiO0c2m8ymWfjlP/z/e9Km4dq6cvDDpgD6ivRdRdLj0EP4tstsWlICcV/IPd7HQYuxeJZKdkXTM99K7K2NT70DPsen1mr7KK12CxFsNSOhbv4XqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=make24@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 480 seconds by postgrey-1.37 at boromir; Thu, 13 Mar 2025 19:10:48 AEDT
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD0Yh4nyvz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 19:10:48 +1100 (AEDT)
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-03 (Coremail) with SMTP id rQCowAA3PAwMkdJncq_UFA--.3004S2;
	Thu, 13 Mar 2025 16:02:28 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: geoff@infradead.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	arnd.bergmann@de.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	Ma Ke <make24@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] [POWERPC] ps3: fix error handling in ps3_system_bus_device_register()
Date: Thu, 13 Mar 2025 16:02:19 +0800
Message-Id: <20250313080219.306311-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3PAwMkdJncq_UFA--.3004S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF13GrWUGF4kuFW8uFyUZFb_yoWkuFb_tw
	4Ivas3X3yxJFsrKFn5CF13Crn3GF9IqrWYqr42q3Wxta4rXayq93y8XFyUJw4UWas7Ar45
	AFn8Kr43A3WSkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
	1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
	Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJV
	W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI2
	0VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28Icx
	kI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2Iq
	xVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42
	IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
	6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aV
	CY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU122NtUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Once device_register() failed, we should call put_device() to
decrement reference count for cleanup. Or it could cause memory leak.

As comment of device_register() says, 'NOTE: _Never_ directly free
@dev after calling this function, even if it returned an error! Always
use put_device() to give up the reference initialized in this function
instead.'

Found by code review.

Cc: stable@vger.kernel.org
Fixes: a3d4d6435b56 ("[POWERPC] ps3: add ps3 platform system bus support")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 arch/powerpc/platforms/ps3/system-bus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index afbaabf182d0..c477d0ee523a 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -769,6 +769,9 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
 	pr_debug("%s:%d add %s\n", __func__, __LINE__, dev_name(&dev->core));
 
 	result = device_register(&dev->core);
+	if (result)
+		put_device(&dev->core);
+
 	return result;
 }
 
-- 
2.25.1


