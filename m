Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A90324942
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHr16Bnrz3dZd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:11:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=ZHNUVkPe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=ZHNUVkPe; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHpk4mFQz3cZB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:21 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id s23so2689907pji.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQhb6STfoZTOuXOnEfdTXXKPYmBzQ3+lG70/GEa7zCQ=;
 b=ZHNUVkPeeY7IvkmuAJPqUua1HZz+QFbSxzSgQq4KuhXdoSK62BlztfN0JNA34OjRsv
 IZBch0D3Z8hbeGaQDkI9PKe+qcV5FiCxJ/LSPNRVPlXH9nIt8dRq4a33XVi9m8EURiPx
 sZLki+budmNBUhXsoyKrN+H/M7Fl+JgNm9cac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQhb6STfoZTOuXOnEfdTXXKPYmBzQ3+lG70/GEa7zCQ=;
 b=IFPdrZdS/VWO58xrLQjfsVOQBFYrOM9uZk9UK6tkVgr7YHsZrM4hXtP8VFTVv01RSQ
 PidxO40iEeXs5LaHoVWcBi3Eym1VppRvksAIxG+Wcesf3LM5MmzKFVjyFHucqyavTcVS
 SiNTO2D++i5Kbla40BKtXNP9U+hGZsxRNr58+N9pdXLe/ZDmBwLu3QboyL4vZVtd9DKi
 QkHiAaOKMpF6mzcCc/JclCuXf5E+v7iNAszDExhyJJjcG8DHE7Bffnp/7TwVwzRIjSTw
 xPkBcTN9kkfQ8J07HKyZVKkVD3qoNGWWZny+6XQg7HwInXrzSiYSC8hwny3m3GO3WIBm
 nEMQ==
X-Gm-Message-State: AOAM5338mmNgj0m5IZV38KFZaQ6VlZSXyK3ICPHwWuZyaqKQ+gSSjV+i
 Crl5fEygAw4QEsPuzrkgPLfkdg==
X-Google-Smtp-Source: ABdhPJwCBumhdhZwZSSahF76eCh/hmxAZT5H5uWHMXseESWhmiVup9p3emOt7eKSfxcbH7DH1tGBzA==
X-Received: by 2002:a17:902:c94e:b029:e4:45c7:143a with SMTP id
 i14-20020a170902c94eb02900e445c7143amr1186600pla.16.1614222619709; 
 Wed, 24 Feb 2021 19:10:19 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id 8sm4292406pfp.171.2021.02.24.19.10.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:10:19 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: llvmlinux@lists.linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/8] powerpc: check for support for -Wa,-m{power4,any}
Date: Thu, 25 Feb 2021 14:10:00 +1100
Message-Id: <20210225031006.1204774-3-dja@axtens.net>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225031006.1204774-1-dja@axtens.net>
References: <20210225031006.1204774-1-dja@axtens.net>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

LLVM's integrated assembler does not like either -Wa,-mpower4
or -Wa,-many. So just don't pass them if they're not supported.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 08cf0eade56a..3e2c72d20bb8 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -252,7 +252,9 @@ cpu-as-$(CONFIG_E500)		+= -Wa,-me500
 # When using '-many -mpower4' gas will first try and find a matching power4
 # mnemonic and failing that it will allow any valid mnemonic that GAS knows
 # about. GCC will pass -many to GAS when assembling, clang does not.
-cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= -Wa,-mpower4 -Wa,-many
+# LLVM IAS doesn't understand either flag: https://github.com/ClangBuiltLinux/linux/issues/675
+# but LLVM IAS only supports ISA >= 2.06 for Book3S 64 anyway...
+cpu-as-$(CONFIG_PPC_BOOK3S_64)	+= $(call as-option,-Wa$(comma)-mpower4) $(call as-option,-Wa$(comma)-many)
 cpu-as-$(CONFIG_PPC_E500MC)	+= $(call as-option,-Wa$(comma)-me500mc)
 
 KBUILD_AFLAGS += $(cpu-as-y)
-- 
2.27.0

