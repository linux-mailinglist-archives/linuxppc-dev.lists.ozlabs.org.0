Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E3D4B0DB4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 13:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jvc0347LSz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Feb 2022 23:44:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kYbXENzl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kYbXENzl; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JvbzN4J0rz30MQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 23:44:14 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id h8so6978777lfj.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Feb 2022 04:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYLyrvK0lBlYHTzi+wQsHNbyaWDy5kqoghsteHCo+O4=;
 b=kYbXENzl7JVQX8/fGz513ufsSQRYWQ+FSIXDK+hS0NMudgKgaXcRBcj9yBweMTtlME
 uvgpJf32AGx0ak8tqS6vEO+D8CDQQqzq4uwTCDBRoYpiHQQ080GOsA2KgAUONA7Wwki7
 LjGu2ZDP4aQSSN34Y0Hvr0ei8XlzsXK/5LSWIefrIvAv4ac2kgcMUtENs6bbqQM4IRQb
 8UECuUY1t2SLsVdmVZ4SMalKvQrf1iMdMEi//UuTmMddyz4KtLs4RI4R/Y0AP0eR5G9E
 lRsH5NJRFFe03BHuoU5u1NojOrT4UGluw1pNJH4e7b+sCZKS+ttXueJPsX1pHngDmxDp
 aNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYLyrvK0lBlYHTzi+wQsHNbyaWDy5kqoghsteHCo+O4=;
 b=Rrw7bwMsN0q+mHonl6Qq+T/aGLRiNMYbyKt07neefiUWgr97vx3bNTDhyWtQLVOHPt
 oQNlYNdlFnxiH2BkCXBAecV81HHU0ZVCulEuIMA7ZDVaxj8sJlU8r8E/TecD8erSEDs7
 bqrJW+a39VSigObmk8tDk5D2oHtEXiCADYy2eA+cSbMPzEDKlzx7QFFQHgSwmahQgmB4
 lu5pYta/U9otSI1MapBvcxfbugpF5ZtfMtUegible72BcnALs3ob3CAMkr7RVzcYs3Zk
 RJDCHsFmfxtmjMIQ1zsF+3zVx5gupAH778KbOIkzbslPCVUWnm5GTvWETXS7+40IKRmC
 lNmw==
X-Gm-Message-State: AOAM531O1QjyKGMJA9XKwwKy+Q5bCBt4iFpny5o14V4hzh2Ff0fWt+qt
 eDKULtPeqwDn2l6X3CCf5ZKIKGcLBayrjA==
X-Google-Smtp-Source: ABdhPJx96KjqtNknDEz2fAkwXtdH3zsGBS+a/kKIYgOnMOqGX9zLxiwKPQT9pL2LLLkUi27wjDlJVw==
X-Received: by 2002:ac2:4d34:: with SMTP id h20mr5152537lfk.52.1644497047417; 
 Thu, 10 Feb 2022 04:44:07 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id z8sm2863676ljn.89.2022.02.10.04.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:44:07 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/lib/sstep: fix 'ptesync' build error
Date: Thu, 10 Feb 2022 13:44:04 +0100
Message-Id: <20220210124404.34773-1-anders.roxell@linaro.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Building tinyconfig with gcc (Debian 11.2.0-16) and assembler (Debian
2.37.90.20220207) the following build error shows up:

{standard input}: Assembler messages:
{standard input}:2088: Error: unrecognized opcode: `ptesync'
make[3]: *** [/builds/linux/scripts/Makefile.build:287: arch/powerpc/lib/sstep.o] Error 1

Re-add the ifdef __powerpc64__ around the 'ptesync' in function
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
index a94b0cd0bdc5..d23772f91a36 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -3264,12 +3264,14 @@ void emulate_update_regs(struct pt_regs *regs, struct instruction_op *op)
 		case BARRIER_EIEIO:
 			eieio();
 			break;
+#ifdef __powerpc64__
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

