Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2042F4C14ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 15:00:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3d362qJdz3cDV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 01:00:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=kErSueoT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::232;
 helo=mail-lj1-x232.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=kErSueoT; dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3d1S6Zjmz30RD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 00:58:51 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id bn33so24758460ljb.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 05:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aHyzMFtQe0EUOGyo5aNMOVUBLvuCyxjF47uhkzb6m4c=;
 b=kErSueoTeHbWeWky89XlisWfN7RXR5Bflcws8Duv1Byb1Kjh6SF4QfOqyyH08ANsvr
 YCBvyKZjsm46rLQCoeD5JVy+tQiKQRI+WhZ4MZP6JubaTFlr24WPJHfFvjKfMFiv7n64
 /J+uOha29mNmckK7Skdqrj9iZ9ShzeHKZ+TEdPTJykePyCGNzgsCqXHq36TLn6MlMCmz
 pEogmT6UzYgfoCF1MgWeFvfNElXy0hAnBm+zOZ+C4sZ79i1L6ukdUe5xmf2b+0/OCBnr
 XXur+Bz41evUrrlQ8GLP01gv320vzdqUu3DMs6qv+PHpFSasxuk1NYXaot5vBdBdtShd
 1jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aHyzMFtQe0EUOGyo5aNMOVUBLvuCyxjF47uhkzb6m4c=;
 b=MErVn0tfvXqVp8T9O8K2N/394DIWQ6HSdg/ZmUjooAqSMqDcH01reCVMW0H27RHvFc
 jVg0V+7VlQ+sVMLRnqXcXsut8uOj6UQpy47wDT3zi3Q0vvcSlN0ljV5h67atScrUFO3I
 BsEdYwREDufiMSdBe5v4J7MvXcx0150m36HTeQKLJMoxgTa1baTqSZY/xtLUUtRWcuaW
 icZKfFhVzyFV3gV6f+3frpGKtad97aadJOpkKPmpX3zwPri4J7c0jTKemdxpMIDkcqXe
 UJ3SGtFOLynxFROb3JlteEJKLiyXtJLTg0/kcmWqNmCTryvJeocXOCFSQrZSz3uckHEz
 aHpA==
X-Gm-Message-State: AOAM531GI3ZatJpiKDhqawt1DX8FsvGo+t6YzsOkuDQ6ryjbJQRNrzyv
 yJQj2zH8+rs9SvQrj03RT+/Bcw==
X-Google-Smtp-Source: ABdhPJy+EUB1iUZR6g+rNGOcfuP/RW3CsnyJ4DsE44Il+ubBCSVjVoKE42htrM/ebNo+fSdbSc3ufQ==
X-Received: by 2002:a05:651c:307:b0:244:dc4c:c2f2 with SMTP id
 a7-20020a05651c030700b00244dc4cc2f2mr20026151ljp.531.1645624725984; 
 Wed, 23 Feb 2022 05:58:45 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id v29sm2099448ljv.72.2022.02.23.05.58.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 05:58:45 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc: lib: sstep: fix build errors
Date: Wed, 23 Feb 2022 14:58:20 +0100
Message-Id: <20220223135820.2252470-3-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220223135820.2252470-1-anders.roxell@linaro.org>
References: <20220223135820.2252470-1-anders.roxell@linaro.org>
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
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/powerpc/lib/sstep.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index d2d29243fa6d..b9f43bbdd55a 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1097,7 +1097,10 @@ NOKPROBE_SYMBOL(emulate_dcbz);
 
 #define __put_user_asmx(x, addr, err, op, cr)		\
 	__asm__ __volatile__(				\
+		".machine \"push\"\n"			\
+		".machine \"power8\"\n"			\
 		"1:	" op " %2,0,%3\n"		\
+		".machine \"pop\"\n"			\
 		"	mfcr	%1\n"			\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
@@ -1110,7 +1113,10 @@ NOKPROBE_SYMBOL(emulate_dcbz);
 
 #define __get_user_asmx(x, addr, err, op)		\
 	__asm__ __volatile__(				\
+		".machine \"push\"\n"			\
+		".machine \"power8\"\n"			\
 		"1:	"op" %1,0,%2\n"			\
+		".machine \"pop\"\n"			\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"3:	li	%0,%3\n"		\
-- 
2.34.1

