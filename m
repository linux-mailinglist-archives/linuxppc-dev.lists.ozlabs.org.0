Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D5E4C3124
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 17:23:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4J9g1D4Xz3bZX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 03:23:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Vr8lT5GT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::130;
 helo=mail-lf1-x130.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Vr8lT5GT; dkim-atps=neutral
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4J911Vp9z2yLP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 03:22:44 +1100 (AEDT)
Received: by mail-lf1-x130.google.com with SMTP id f37so4755214lfv.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 08:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zm6gpRYr4dD9b0AAx6gTTzvG8t4EB7U1VrZe7XoIHoo=;
 b=Vr8lT5GTXULpvaAj6TBJpBaLjzUAb1oKHJIgtNBeOdNtV1IJ9MIqVqCvGJnDsX8WT4
 szJ1QHdTeG3k90CYV1dXqqRtcPa94g/9KqT6oTotXzkORo8jHrIyOF02Ult+RLNWJnTa
 lXREQRV8KsewIXf/2/9+mwyxeEuzbfxrYfBUGvXcnHLBJUNGCToLH72Qs3e2QVtf74IS
 GerXzIdJ0lVlmwHZygEcXNV/RSai4fiIoo4Jh5Z4Pr8FZHpsm5UePyf7+FDTT0GxWuKW
 CU4QZCIrCiz7+/nreiUp9hk0Wt1pq41EnIQu0hkTdCUgEW+9QulWxlwlUIwm3JRJut2l
 583A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zm6gpRYr4dD9b0AAx6gTTzvG8t4EB7U1VrZe7XoIHoo=;
 b=S5NxlIoi2YDsx7VoEFC91lR+elQllHI0mA19weUs78/M9YteiK56U/IZYM9EQ7h04F
 v371/cW5F/rU38pdSOfFn3fbixSWy/jyz1UCwXMBBGfV1ZdXcRsdTq9bhMJtkZxFCVv8
 vgr02QC/cx6CAUVhuKNspqQAB7ZsTzGDpHed6i5gAjq/QY6jCFoOG5tyy3CcnolT2kGZ
 tnwX7Fbf4Vb1blJOVLk7JAdr8/4lHarXRRoMk6vL3spzYYNcAs0k7PGfIZ+R45bOhfDC
 1E+mIIvn0qn9Fra5zb8BM/YqRzAiSeQfas2/zy/23jKbmD7vHeX3SRV2aJrTz6skCBW3
 WgvA==
X-Gm-Message-State: AOAM531t1/6M/PzsI8cNofXzKy1/Ojf/AeBFbZv/Ay9rBzlswtA/3Jy9
 ovNENzeDsuur8L2bbXA3x4m1JQ==
X-Google-Smtp-Source: ABdhPJwaoUI9TOQkchwsQbX3+Ug1W4r+DZp5/dG/LnVIgISWE3rcPKdluOkNX3A8dhCkk+X97gQpOw==
X-Received: by 2002:a05:6512:1111:b0:439:6328:c168 with SMTP id
 l17-20020a056512111100b004396328c168mr2234764lfg.650.1645719758894; 
 Thu, 24 Feb 2022 08:22:38 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id e16sm243684lfs.67.2022.02.24.08.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:22:38 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCHv2 3/3] powerpc: lib: sstep: fix build errors
Date: Thu, 24 Feb 2022 17:22:15 +0100
Message-Id: <20220224162215.3406642-3-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224162215.3406642-1-anders.roxell@linaro.org>
References: <20220224162215.3406642-1-anders.roxell@linaro.org>
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
{standard input}:10576: Error: unrecognized opcode: `stbcx.'
{standard input}:10680: Error: unrecognized opcode: `lharx'
{standard input}:10694: Error: unrecognized opcode: `lbarx'

Rework to add assembler directives [1] around the instruction.  The
problem with this might be that we can trick a power6 into
single-stepping through an stbcx. for instance, and it will execute that
in kernel mode.

[1] https://sourceware.org/binutils/docs/as/PowerPC_002dPseudo.html#PowerPC_002dPseudo

Cc: <stable@vger.kernel.org>
Co-developed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/lib/sstep.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index d2d29243fa6d..f3ed80513a90 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1097,7 +1097,10 @@ NOKPROBE_SYMBOL(emulate_dcbz);
 
 #define __put_user_asmx(x, addr, err, op, cr)		\
 	__asm__ __volatile__(				\
+		".machine push\n"			\
+		".machine power8\n"			\
 		"1:	" op " %2,0,%3\n"		\
+		".machine pop\n"			\
 		"	mfcr	%1\n"			\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
@@ -1110,7 +1113,10 @@ NOKPROBE_SYMBOL(emulate_dcbz);
 
 #define __get_user_asmx(x, addr, err, op)		\
 	__asm__ __volatile__(				\
+		".machine push\n"			\
+		".machine power8\n"			\
 		"1:	"op" %1,0,%2\n"			\
+		".machine pop\n"			\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"3:	li	%0,%3\n"		\
-- 
2.34.1

