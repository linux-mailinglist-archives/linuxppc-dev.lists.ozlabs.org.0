Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 747645F698F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:25:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjtyf16sHz3drj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:25:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZ6OG3Tm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=WZ6OG3Tm;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjtvm5g5Lz3c6g
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:23:16 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so804155pjl.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=eF+Lv9pvVaVN7SrxU9FCUbY8jJ0AR0KAOeGGKRcGhP8=;
        b=WZ6OG3TmwJrn8KAJWG6Ez9TXiW6Uz8zY3nhMIc3t1uFy+uzNRfbwJUWpMte166sVPL
         iIs7Xv5YMzfa+tmt8MjrawQyLtCoH/4kNyZZBsIG2wYFxfpQDFbJ/KdV2EDZ9dK3Fz/G
         U0y99bEb113HLfAo+CfaycWJn32snENEXpLrM2Jg+K7bZMpE+TfvgucIretAg3LCv0OK
         aKyKLoLk4QykKW8BvA6q+SwHTFnV0OLXer/zG9SgmWGcIIZQsX2etQeJh0EQD26Fod0c
         3R3ZfKvz0rXC9ovPdlV9f6C335F4o0Asapi5NHZfby/aaol4yIqr2+nxQs0oL9ln7etA
         u77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eF+Lv9pvVaVN7SrxU9FCUbY8jJ0AR0KAOeGGKRcGhP8=;
        b=lXLZNqmL00M1nTeoHUTmmlmX2giMnEUgFVP2oNdbZyj8RBAg9xPWisTdksFtUvkOgi
         YXZniEzBciVObFKjTfi3qCncx800rAycuYM2uiMtMZ2/x3+huNbjuw3c3RVc2PzJtngS
         Y/5fcUsyY7hABtI6Uzz2tr3DExjNYUH6udVYEWQVmh5ZM2KuhfSrxXsS37H7lTtVG4tZ
         DYNCfSQSZFjlAYB/oKxY8Z9DBdNZ/E6ly07FagdbKCwzDPvSMUfun7wb8njIqpVN1kf6
         yra4DW/AKI/gw2YmMR8mMZhOEyXfIkO/cUZQ9/mDxOLQ4yzdbCABHcByK2YGmVuyV8PE
         4c/w==
X-Gm-Message-State: ACrzQf3d66Oeh0R/BMiMF40er4vbfIUnfmi+so7xPh9F/FQQM1aXdzYA
	P2F5ZnmbNm3lHQSzcJ48eS8iGVwzYUw=
X-Google-Smtp-Source: AMsMyM4vjgPKGqIpiGQCbIdwk7Y5oKwjPljZG7IzV3u/JHFSsjZMD6kuLvHyHgy0iTxiWdo4okD8bQ==
X-Received: by 2002:a17:902:ef47:b0:179:d18e:4262 with SMTP id e7-20020a170902ef4700b00179d18e4262mr4761847plx.22.1665066194176;
        Thu, 06 Oct 2022 07:23:14 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902c40600b0017f8094a52asm3004784plk.29.2022.10.06.07.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:23:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/32: select HAVE_VIRT_CPU_ACCOUNTING_GEN
Date: Fri,  7 Oct 2022 00:23:00 +1000
Message-Id: <20221006142300.128189-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221006142300.128189-1-npiggin@gmail.com>
References: <20221006142300.128189-1-npiggin@gmail.com>
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

cputime_t is no longer a type, so VIRT_CPU_ACCOUNTING_GEN does not
have any affect on the type for 32-bit architectures, so there is
no reason it can't be supported.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f667279ec74c..a6e1ba506b72 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -252,6 +252,7 @@ config PPC
 	select HAVE_STATIC_CALL			if PPC32
 	select HAVE_SYSCALL_TRACEPOINTS
 	select HAVE_VIRT_CPU_ACCOUNTING
+	select HAVE_VIRT_CPU_ACCOUNTING_GEN
 	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 	select IOMMU_HELPER			if PPC64
 	select IRQ_DOMAIN
-- 
2.37.2

