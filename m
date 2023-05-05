Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0086F7DAE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 09:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCMYm3hxtz3fM2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 17:21:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h6b2eJoz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=h6b2eJoz;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCMW25MvWz3f56
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 17:19:10 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-63b60366047so1058931b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 May 2023 00:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683271148; x=1685863148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZKP2k1QZLguzKrLisnZsQB/74Npr5qzdWwWabEU72c=;
        b=h6b2eJozZO2sZ4yUZB+PvLDFaaEI/srEX6I2x8dI/MNr9ET5/dcmMEFJFuPAKI97/E
         /p49efsRAMgd1XIjZFL2Cl7IrwMEtZ16CgkK01wm5X1rrxat8w2A5Hf1NvoYR1hY3E7l
         Kv7pNqzoIFiIPX0V4H8gdh/Dq6B2WIJUbpE3IHaL4L4+ePygOuTGpBpdAU0DFh09FJpG
         YpEe3BMUWUGyvIS6HEs0pEC2B9cTdxlYklQtQu5JOgrASbH2ztS2mXWTOMG5Gx57Q4RE
         APLSw62Xtkln0ZL59CwHXRweL2Qqz41eb6jfLiBdw9Fd7mEcGlo51lmemEI6hN4zNPe3
         Ul8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683271148; x=1685863148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZKP2k1QZLguzKrLisnZsQB/74Npr5qzdWwWabEU72c=;
        b=HPn8u3eg5ZJn2XB+6/JtlBAHn129HnOcxcP/q3p8uYriitoJLDbfovNZBsd8HS4z3R
         rtmA2Pk74F0YvjIwXdx1gEWPvJQQKQcMdrEVWyKdAYiz57XUNq3X7n81MTP9xnxVhH/1
         oZoYRj3bz1pBxre9qnRstxxLdsKCyXNLw0t4SDIsecUcM0ZCYIFEv9zaIehhvduFdVfw
         2uWYiXtnJkwYyeZnotJyvCkyDuD5XQiPnpEo7kdkHP+voa+NWE78Ju+SAvrUCOpljv9d
         j2V6j5IG1Jve8R1Q6AapEi4nmSI/5MjFXubcpDgSBv2e4wpsq7jKl7Go3Y4JVgd0gGke
         OOzQ==
X-Gm-Message-State: AC+VfDxj4hCBCXtSGCuIeJdo+r8tLJMbIWHF1d79e/0AtJ/6R9n5oTvF
	+Ujwkv5mkCxcV+PI5doJfdWL2SKWb3g=
X-Google-Smtp-Source: ACHHUZ6gLNPNTE/r/pfpmUNzfMRdT+nmlOzFbAr2GBx7ETJsNI1GW8Plj0mQx/XIqU5vMfk+iZdNPA==
X-Received: by 2002:a05:6a00:1823:b0:63b:7fc0:a4af with SMTP id y35-20020a056a00182300b0063b7fc0a4afmr1131447pfa.26.1683271148190;
        Fri, 05 May 2023 00:19:08 -0700 (PDT)
Received: from wheely.local0.net ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id i10-20020aa78d8a000000b00625d84a0194sm915384pfr.107.2023.05.05.00.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 00:19:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] powerpc/64: Make ELFv2 the default for big-endian builds
Date: Fri,  5 May 2023 17:18:48 +1000
Message-Id: <20230505071850.228734-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505071850.228734-1-npiggin@gmail.com>
References: <20230505071850.228734-1-npiggin@gmail.com>
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

All supported toolchains now support ELFv2 on big-endian, so flip the
default on this and hide the option behind EXPERT for the purpose of
bug hunting.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e5d81645c902..a64bfd9b8a1d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -624,9 +624,8 @@ config ARCH_HAS_KEXEC_PURGATORY
 	def_bool KEXEC_FILE
 
 config PPC64_BIG_ENDIAN_ELF_ABI_V2
-	prompt "Build big-endian kernel using ELF ABI V2 (EXPERIMENTAL)" if LD_IS_BFD
-	bool
-	default y if LD_IS_LLD
+	prompt "Build big-endian kernel using ELF ABI V2" if LD_IS_BFD && EXPERT
+	def_bool y
 	depends on PPC64 && CPU_BIG_ENDIAN
 	depends on CC_HAS_ELFV2
 	help
-- 
2.40.1

