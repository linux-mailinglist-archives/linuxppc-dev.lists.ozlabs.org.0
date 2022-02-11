Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE254B1AB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 01:52:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvw760Z71z3cPr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 11:52:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FzIp0sPY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FzIp0sPY; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jvw6S1CXPz2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 11:51:28 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id i17so13509140lfg.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 16:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US4EJyI61Chwwwjh7fTMLFf0K8eLU8HLJNw4j3h5APA=;
 b=FzIp0sPYDlh2ARdqWPqRObIpKCKhmRMqWrlDWmfa7ZtO4aijq98amCVqJ5QSWU9BWh
 dC1pf1GpIJaalULogZDQi7AW6ilGaxWvZj8FJIilfP385GYufGkm+yMkloEIv4oNjTIw
 bneWChfRGwR5FpEhDwJefTgopwjeg9XdJNrAkhjZFU1vHrEtPRvX+4DFtEc9S6NwrVyi
 4ujOuXJqO0/fNaWJhTqtDx3sTXJraT2DzOl9UaxVDF5zsSlXtzKJv7OWZHcuX/4rNFOO
 2mNROUZ1rN9iAkqaPcUBALcyK0ormI4G3Jb3Tq6gX3KMGiS3pz1bSwB4FkbrjZEoYSLU
 LR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=US4EJyI61Chwwwjh7fTMLFf0K8eLU8HLJNw4j3h5APA=;
 b=kxpME22ToXOLQpvE81OrGSQrIruE2N0x41i7VhiSRpJkB2mvXKOMg7meEitydyfeug
 sYfrA5/FPje5JQyvFBLJaeaKLyEwQaa7nroiL4B+CkF2NyuyWGx6OmF0JJGoSk35G2GS
 9c5cm2kibMg3EvmAYVxqV8f1iua5uZyCf8clBEyjYB7r1zhPoKAHaw2S0rJEPqp4U32e
 9zdeRwEKCvWon6NNwHCVnV+EKWy/WgTAaSRZhBp06hN0eIRbH9YPMTn5Qu+bu2KgUB2G
 WxSbGU5B4v1qwW/n2GqZ+11E+Dx+GFO69mYqT29d/rSDytniXWPtQhCz9tNfG8qRMxWy
 a3tA==
X-Gm-Message-State: AOAM5314KPJRz4fFLI8LOopAvuqcTqaE/sJ+oSRPEx1kpTBTRbva9xOh
 V2E4UqUAKHwz8yMGhZ6gGD1Cag==
X-Google-Smtp-Source: ABdhPJxAZ7c6mrEQDtvfnjS/yAfpykqcD4PeognSn9ictkDAmdOvpGT/nlb5H4gDZ3y5MibeXkp5GA==
X-Received: by 2002:a05:6512:2821:: with SMTP id
 cf33mr6818251lfb.37.1644540678921; 
 Thu, 10 Feb 2022 16:51:18 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id cf26sm2948725lfb.277.2022.02.10.16.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 16:51:18 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCHv2] powerpc/lib/sstep: fix 'ptesync' build error
Date: Fri, 11 Feb 2022 01:51:13 +0100
Message-Id: <20220211005113.1361436-1-anders.roxell@linaro.org>
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
2.37.90.20220207) the following build error shows up:

{standard input}: Assembler messages:
{standard input}:2088: Error: unrecognized opcode: `ptesync'
make[3]: *** [/builds/linux/scripts/Makefile.build:287: arch/powerpc/lib/sstep.o] Error 1

Add the 'ifdef CONFIG_PPC64' around the 'ptesync' in function
'emulate_update_regs()' to like it is in 'analyse_instr()'. Since it looks like
it got dropped inadvertently by commit 3cdfcbfd32b9 ("powerpc: Change
analyse_instr so it doesn't modify *regs").

Cc: stable@vger.kernel.org # v4.14+
Fixes: 3cdfcbfd32b9 ("powerpc: Change analyse_instr so it doesn't modify *regs")
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/lib/sstep.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index a94b0cd0bdc5..bd3734d5be89 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3264,12 +3264,14 @@ void emulate_update_regs(struct pt_regs *regs, struct instruction_op *op)
 		case BARRIER_EIEIO:
 			eieio();
 			break;
+#ifdef CONFIG_PPC64
 		case BARRIER_LWSYNC:
 			asm volatile("lwsync" : : : "memory");
 			break;
 		case BARRIER_PTESYNC:
 			asm volatile("ptesync" : : : "memory");
 			break;
+#endif
 		}
 		break;
 
-- 
2.34.1

