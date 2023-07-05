Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6787E747B91
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 04:32:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Uul3FU3A;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwkFZ5LLXz3bx8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 12:32:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Uul3FU3A;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwkDk16fYz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 12:31:17 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1b8ad356fe4so2206485ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jul 2023 19:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688524274; x=1691116274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tVa0lsFr8ZePx6XnfcGFA3JzWxl9e3hch7lpVLVOyx4=;
        b=Uul3FU3ASw7P/zdx1iBGtH9pEEMTjyxBAJrxWUz5tGr0Xewg6/HnjopDz/xPd2wwkV
         SQNQes+DoTpM7hcGId9uY/yai8Zl71ue0zrDZqWG97KacY0E3SeYviZIllSmfmIdBniF
         a247dadU/+DRPGZUHLwYIJ8bB2m9DEJp3SGEUko3NEWzTvApNQKusyrF+KdxK02x70AI
         NX+dj9K9XiPB+SqjNyyl6GOSX/YOYAARSF1sq+bi0rLk+IZHpSen9zWM38YKUVXDi30x
         IWjCMy5VYUlux06oz+M0Hkzl6bmwhWpf/WJP4W7JeDJuYJGYP+++N6xmx0d9wytO0WUE
         oKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688524274; x=1691116274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVa0lsFr8ZePx6XnfcGFA3JzWxl9e3hch7lpVLVOyx4=;
        b=gnuEl2yNIHgyFFwDEMOKtP8sJ0voPQ3UUwbEN0St0Ol5WfiJdpg+OEP3jWtJH7gqK+
         CBUhoo0P3EtSAFGPNW84M39xqvr2QkQEEsMOVqTfO0aA9P0yclzBrKpczOT0Gi6asTvv
         rLhzobx7gtpUmLoHjUFtyzXaH/PG5lp3juoxiHKrxMmz+ufBM2LgeQdsC6VtVAm0qGHk
         VMUUZJdoi8lRi7jYLkA3sNMVxvCnRGo+fWAayqD+lE7MzzWTctOCfdxxdN/1BAx/3X9i
         u1KZeCRegOcDlvni2sbFZrlOe0+Dw3Lh2z8SVxkIagkRmR/Cc3ur2uB0jE4pusYGAdsq
         AWuQ==
X-Gm-Message-State: ABy/qLaxMLr1/P7INIvCAGrVwBorFD6P0kvKNzWbBKUPy6hxYzxUf+3o
	JjodY3sLElT9yPpbDX8sYq8v6hEQOgg=
X-Google-Smtp-Source: APBJJlErLpFBjfK1Wc/QTyD2N1gwG3bhdRlecO/OwCK+gv1dp7lr6ETCM96PH39JAPjf+uitKjtcxQ==
X-Received: by 2002:a17:902:e5c1:b0:1b7:ed6a:d8a5 with SMTP id u1-20020a170902e5c100b001b7ed6ad8a5mr13952256plf.61.1688524273579;
        Tue, 04 Jul 2023 19:31:13 -0700 (PDT)
Received: from localhost.localdomain (2403-5808-8af8-0-7926-51ea-3ff2-71dd.ip6.aussiebb.net. [2403:5808:8af8:0:7926:51ea:3ff2:71dd])
        by smtp.gmail.com with ESMTPSA id w14-20020a170902e88e00b001b8b1f6619asm92338plg.75.2023.07.04.19.31.11
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 19:31:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/config: Disable SLAB_DEBUG_ON in skiroot
Date: Wed,  5 Jul 2023 12:00:56 +0930
Message-Id: <20230705023056.16273-1-joel@jms.id.au>
X-Mailer: git-send-email 2.40.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In 5.10 commit 5e84dd547bce ("powerpc/configs/skiroot: Enable some more
hardening options") set SLUB_DEUBG_ON.

When 5.14 came around, commit 792702911f58 ("slub: force on
no_hash_pointers when slub_debug is enabled") print all the
pointers when SLUB_DEUBG_ON is set. This was fine, but in 5.12 commit
5ead723a20e0 ("lib/vsprintf: no_hash_pointers prints all addresses as
unhashed") added the warning at boot.

Disable SLAB_DEBUG_ON as we don't want the nasty warning. We have
CONFIG_EXPERT so SLAB_DEBUG is enabled. We do lose the settings in
DEBUG_DEFAULT_FLAGS, but it's not clear that these should have been
always-on anyway.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/skiroot_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 71cfb990a74f..8d3eacb50d56 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -289,7 +289,6 @@ CONFIG_LIBCRC32C=y
 # CONFIG_XZ_DEC_SPARC is not set
 CONFIG_PRINTK_TIME=y
 CONFIG_MAGIC_SYSRQ=y
-CONFIG_SLUB_DEBUG_ON=y
 CONFIG_SCHED_STACK_END_CHECK=y
 CONFIG_DEBUG_STACKOVERFLOW=y
 CONFIG_PANIC_ON_OOPS=y
-- 
2.40.1

