Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E043E324943
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:11:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmHrR6Yz1z3dfb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:11:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=KZ6LFXwi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=KZ6LFXwi; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmHpn45dcz3cmg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:10:25 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id u26so2665764pfn.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j8mGSfyrI16t8C5opevepSL8PbiCz5ZPTwbSvODpO1s=;
 b=KZ6LFXwi2BaYM5/6xpZ4rIl+pHqnfVFLDntIHJ1jdzN23Jo27uZ4eEqcW0ewrPFYzD
 rv0y+2gDcA6xgStI1M5aexrJ4uZHDgG8Z9nX4LD8obavqSOdXOKhGN+hFf/yfRmtBhUk
 mf3qf4iS7DWOcdFF7snMUGot4iTKqreXpi9r4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j8mGSfyrI16t8C5opevepSL8PbiCz5ZPTwbSvODpO1s=;
 b=RPAJvakFS31X80Xy2+W+83MeyDuSkpgY2rObvrE2DAVb4KNBaMtmM1sNRAHfyhZpSo
 ZXmxGhJ24GBBEtqtpivJ6vSFk2N+mssFlaXDdh+AHSLdIupzal0k8INMYl4U6MswzDhk
 xVDYvDNkV3LaPKwquMP33vswCoBlkmmsG00gT+yg8vFbWua7N7wKhf4FuOxplOLmszQ0
 etZDnupX2zIfDzjfW/FaWWL0Y69pNYDzFgY/3jTqNdCHZ5Z6zQIb2KzeLX1DYWICBUve
 p5DQWjxEIWCZCaV41g8uQiLgNf7ox1ib4jT/ENPXih8TlVwdFQNqX2jTEio0jLxuSjPE
 s3dw==
X-Gm-Message-State: AOAM533S10UmB0BGP9F/OA81O5Q2kUITw3d4CeL0oH6t32/n8tC5vuKV
 3UaQtW5BuzKHusLdsLBu4r0LPA==
X-Google-Smtp-Source: ABdhPJwep6rd4Zw+WiH8NCmj741NOJ2dH8UExc5RnoD8ire82akxru6Fdm+cr1ADeHMFhCj7JREdYA==
X-Received: by 2002:a62:8c05:0:b029:1d8:7f36:bcd8 with SMTP id
 m5-20020a628c050000b02901d87f36bcd8mr1127377pfd.43.1614222623302; 
 Wed, 24 Feb 2021 19:10:23 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-6e65-7e50-8dac-f7ef.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:6e65:7e50:8dac:f7ef])
 by smtp.gmail.com with ESMTPSA id h12sm3873815pgs.7.2021.02.24.19.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:10:23 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: llvmlinux@lists.linuxfoundation.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/8] powerpc/head-64: do less gas-specific stuff with
 sections
Date: Thu, 25 Feb 2021 14:10:01 +1100
Message-Id: <20210225031006.1204774-4-dja@axtens.net>
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

Reopening the section without specifying the same flags breaks
the llvm integrated assembler. Don't do it: just specify all the
flags all the time.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/include/asm/head-64.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/asm/head-64.h
index 4cb9efa2eb21..7d8ccab47e86 100644
--- a/arch/powerpc/include/asm/head-64.h
+++ b/arch/powerpc/include/asm/head-64.h
@@ -15,10 +15,10 @@
 .macro define_data_ftsec name
 	.section ".head.data.\name\()","a",@progbits
 .endm
-.macro use_ftsec name
-	.section ".head.text.\name\()"
-.endm
-
+//.macro use_ftsec name
+//	.section ".head.text.\name\()"
+//.endm
+#define use_ftsec define_ftsec
 /*
  * Fixed (location) sections are used by opening fixed sections and emitting
  * fixed section entries into them before closing them. Multiple fixed sections
-- 
2.27.0

