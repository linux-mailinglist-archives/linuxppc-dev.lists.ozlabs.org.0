Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B313A6EEDDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 07:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5p9W1ZCxz3f6w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 15:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rF8VTzf6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rF8VTzf6;
	dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5p8g5L26z3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 15:58:58 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-63b5c4c769aso8637032b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 22:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682488735; x=1685080735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2+Z1BrS2b9lOnMsjeDbq4LTbbJDxklrQUCc3qJS+/Hk=;
        b=rF8VTzf6WZ7o50OlLVskwYwqOL7ymNkA1cPyImIuXWNkzzyyRpRCSRh4kycL2Xfqo9
         1g4DkxXpqg5vGIENNDYa4m6Ff75oYEH/YYLEbwRRxwDXs6obvveokqdGt2Sz8G5dgByK
         fTAg/uOp5CnvMi3rYfFSEpP2o9kgsyN1yITjUmKlWsEC3nQ4VdsKV33kljYozi5gSeW2
         J5tq9J+tO+13E3zjc/WWjo++/JNz1P7VWC3Hr9dhaZwmdQHpgFY+wermtAjA2QDbA4zq
         yUEAG0qiU2+moOqZaeKHfuOcVNfkoHESeblsFCQPkZdOoizPzbYtsfE5lTXDjIbsTjw5
         ux/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682488735; x=1685080735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+Z1BrS2b9lOnMsjeDbq4LTbbJDxklrQUCc3qJS+/Hk=;
        b=cd3GEDL27Kxgo/1TGbIZeEiXmAF1oz9MheviA/btA95uhx8DLxTBGIcoG94si9N0rs
         znRSYeKtbKZR1xtFpa0ODFsKoDGl1PJcH6nCkhrvRzheBJmSGnXzLpIeNWp8R4JnbQc2
         bR9yKvADqErEysTntB8J5K/iuVR9LIA8//vQln1j0IDmqpdD9SsnaFo0sZF/wwxdm7Z6
         xscoWZDAVtzxP60xS2733njJVSm8eEbgFslfwwSIzr3H1eyFZ4d4yU12VYv4WAwty6dY
         7oV1LBAXmcqXzZOU1CEyZblwvA508vzA30waG3Uz8sVgY4Xw+LkttT/q5VOa6VzjFjmz
         /pPw==
X-Gm-Message-State: AAQBX9fE0EBOPDu2K6av/QqlVx9r+qcgilq82g9tEkfwhxaUVcz8gHuu
	a/DPjjTZNhF9Pew64UtXO7d6yPkF2IFPww==
X-Google-Smtp-Source: AKy350YLz9UEfv/AlSQWFGtMAocPmPi87CKLiuPmNIHiYzQA0bbA3HFV2USnxV5xbnnvDWD/agF1zQ==
X-Received: by 2002:a05:6a00:1911:b0:63b:599b:a2e6 with SMTP id y17-20020a056a00191100b0063b599ba2e6mr27974734pfi.27.1682488735362;
        Tue, 25 Apr 2023 22:58:55 -0700 (PDT)
Received: from wheely.local0.net ([203.221.203.54])
        by smtp.gmail.com with ESMTPSA id f25-20020aa782d9000000b0063a1e7d7439sm10300479pfn.69.2023.04.25.22.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 22:58:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/9] powerpc: Build fixes
Date: Wed, 26 Apr 2023 15:58:37 +1000
Message-Id: <20230426055848.402993-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is against powerpc next. The first two patches are
independent build fixes for recent patches. Patches 3-5 separate
boot Makefile BOOTCFLAGS and BOOTASFLAGS and stops passing some
C code generation flags to the assembler which causes some
warnings for llvm. Patches 6-9 are not fixes but a bunch of other
improvements I noticed along the way.

Thanks,
Nick

Nicholas Piggin (9):
  powerpc: Fix merge conflict between pcrel and copy_thread changes
  powerpc/64s: Disable pcrel code model on Clang
  powerpc/boot: Seperate target flags from BOOTCFLAGS
  powerpc/boot: Seperate CPP flags from BOOTCFLAGS
  powerpc/boot: Separate BOOTCFLAGS from BOOTASFLAGS
  powerpc/boot: Clean up Makefile after cflags and asflags separation
  powerpc/build: Remove -pipe from compilation flags
  powerpc/64s: Permit d-form memops in asm when building with prefix on
    clang
  powerpc/64s: Work around llvm-as not recognising pla

 arch/powerpc/Kconfig               | 19 ++++++++-
 arch/powerpc/Makefile              |  2 +-
 arch/powerpc/boot/Makefile         | 62 +++++++++++++++---------------
 arch/powerpc/include/asm/atomic.h  |  8 ++--
 arch/powerpc/include/asm/io.h      |  2 +-
 arch/powerpc/include/asm/ppc_asm.h |  5 +++
 arch/powerpc/include/asm/uaccess.h |  4 +-
 arch/powerpc/kernel/interrupt_64.S |  2 +-
 arch/powerpc/kernel/vector.S       |  6 +++
 9 files changed, 70 insertions(+), 40 deletions(-)

-- 
2.40.0

