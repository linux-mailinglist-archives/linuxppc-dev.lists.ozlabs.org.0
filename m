Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2E45DAA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 14:02:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0J1b5bJ3z3fML
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 00:02:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bjlFBk67;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bjlFBk67; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Hn54dSxz3c7Z
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 23:51:21 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id g28so5171006pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 04:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ec1iJ3RRwygNSblSnoglitg1g/fNrFXE3ND6zBA/J14=;
 b=bjlFBk67VD+zRmEXIbbTE2K5FLzykt+N3rIKxTUmyUhWwcn8GRn/XydVx01WIlYHLB
 rEvN9PinR+SZlz6rxUVM/4Uge5Hl4CMgopWFcuDfpwzPHss3mYQLPQ+wG/2gs7wOxMiw
 lcpfGtHX93D8xD/hqWPwF+lXaBLRt5ymAde1n5LcNKyfPLJgfwFIEghnToYTnuFrw1n9
 XY7jnJvdOBAqpLknANNcNIzZmsngPh+hmAoxVxaK67nrciFW2BZMIqUs6NBXOXe6+2ZV
 /LWmP4aQEBNDC4L/E+M3LNewXMNB8/QxhyLn8zCcQ/o7iQzeDDBhDkjU/XWmMCEVb3ib
 X69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ec1iJ3RRwygNSblSnoglitg1g/fNrFXE3ND6zBA/J14=;
 b=J1WNphifFwgcIolo++hsHr8me/z5DbvBrmehQSczZwwM3PoJvOI3TQmpexqWe7mG2j
 5fB5egO9l6B9mv5qIVBfRGjd8oSlzXM/36LLLZGys9ejS4+QNr2gLlkFo5QKYcQ61ZYJ
 XzME/E9RY9nJ4nYakxT1KH3LKfW4lqtr6BACNKOiTueFlNCDyWBrzSZhTvdLJ2VxLjLt
 LqSA9bflOh2az3T/2LG/RE5EFca6HhjyByjAjX4GqsID1HLtF0b8iwIl+8suWaSkQZAu
 m/4Mc/PHSSyw/5S/4ALyqdw67W4fL1Dqw2GHvVx8y+j1ZmJDbE4i3a+g+Ag367h5rlY6
 j1EA==
X-Gm-Message-State: AOAM533UViEhkSUmbcxxJFx3pbczCj2kWpK2JXH5JMBYyvkP7GCxv6Ty
 +c2XFwEniEJ7yQUq0YaAueZA+OWH8DU=
X-Google-Smtp-Source: ABdhPJzdEC8huKancegDQxBji5XH7ZViRC7PSaiLQHE53TnqAmRZf12rQtah5TVYmUSBqQQUiDuFmw==
X-Received: by 2002:a63:dd10:: with SMTP id t16mr1345275pgg.318.1637844679516; 
 Thu, 25 Nov 2021 04:51:19 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (115-64-213-93.static.tpgi.com.au.
 [115.64.213.93])
 by smtp.gmail.com with ESMTPSA id gc22sm7242851pjb.57.2021.11.25.04.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Nov 2021 04:51:19 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 17/17] powerpc/microwatt: add POWER9_CPU,
 clear PPC_64S_HASH_MMU
Date: Thu, 25 Nov 2021 22:50:25 +1000
Message-Id: <20211125125025.1472060-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211125125025.1472060-1-npiggin@gmail.com>
References: <20211125125025.1472060-1-npiggin@gmail.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Microwatt implements a subset of ISA v3.0 (which is equivalent to
the POWER9_CPU option). It is radix-only, so does not require hash
MMU support.

This saves 20kB compressed dtbImage and 56kB vmlinux size.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/configs/microwatt_defconfig | 3 ++-
 arch/powerpc/platforms/microwatt/Kconfig | 1 -
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index 07d87a4044b2..eff933ebbb9e 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -15,6 +15,8 @@ CONFIG_EMBEDDED=y
 # CONFIG_COMPAT_BRK is not set
 # CONFIG_SLAB_MERGE_DEFAULT is not set
 CONFIG_PPC64=y
+CONFIG_POWER9_CPU=y
+# CONFIG_PPC_64S_HASH_MMU is not set
 # CONFIG_PPC_KUEP is not set
 # CONFIG_PPC_KUAP is not set
 CONFIG_CPU_LITTLE_ENDIAN=y
@@ -27,7 +29,6 @@ CONFIG_PPC_MICROWATT=y
 CONFIG_CPU_FREQ=y
 CONFIG_HZ_100=y
 CONFIG_PPC_4K_PAGES=y
-# CONFIG_PPC_MEM_KEYS is not set
 # CONFIG_SECCOMP is not set
 # CONFIG_MQ_IOSCHED_KYBER is not set
 # CONFIG_COREDUMP is not set
diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/platforms/microwatt/Kconfig
index 823192e9d38a..5e320f49583a 100644
--- a/arch/powerpc/platforms/microwatt/Kconfig
+++ b/arch/powerpc/platforms/microwatt/Kconfig
@@ -5,7 +5,6 @@ config PPC_MICROWATT
 	select PPC_XICS
 	select PPC_ICS_NATIVE
 	select PPC_ICP_NATIVE
-	select PPC_HASH_MMU_NATIVE if PPC_64S_HASH_MMU
 	select PPC_UDBG_16550
 	select ARCH_RANDOM
 	help
-- 
2.23.0

