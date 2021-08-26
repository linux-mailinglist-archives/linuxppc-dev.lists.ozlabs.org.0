Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 446F23F876E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 14:29:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwMbH1B20z2ymk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 22:28:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=il0wgKVT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=il0wgKVT; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwMYJ31ZLz2yZf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 22:27:16 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id u15so1670551plg.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ryP8RcAuuRvMSKlPfni1/npXw+1pi/AcjAhpzZJND8Q=;
 b=il0wgKVTB8xcB/6qp8hJAQ2/xRLv5/yifpOo3avmAvwQhEIRcNX1TpLmR8QCFgIZ+E
 jMVKHEP3oroMxzjAI5AymjtMbEFt3h8biI4BP4t6bW+v5v4FEyaFeiBXRyvX7kqiPVtz
 xmEvR1WKa3rT1E9HOQmRpipgCPo+c0bnsCj+BM7P51XvFMMrRZ27lK4+bg75r8Nrcirz
 xuIWQsKD/Klm35canfI2GMEe6/+l6xPApCetqx50rc5s0Hd+ZEan78Z9bteqN/B3j7Hu
 nOtH/Yi8DZwFzeyjsCO1hamy1KWW62ECIJ7k9oWjs5apFbJ9JSkw4xOfa2QCiC0KrHTg
 CFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ryP8RcAuuRvMSKlPfni1/npXw+1pi/AcjAhpzZJND8Q=;
 b=p7R4U78kK+SvWy/jGCO1wh7wIYniKksIW2MwJlMyw5Ry+tgDyYqrX3igE5JApBze4c
 j5zP1xKM2IxosPYMvxSZ/rc+NRmTKXstCIqcsQ2uAsVY07gK4DWcc4tYiGoTSDF2wEfB
 TRwsETFwV2U9pgrd30WXqXElW+KjEVuvbbHiID1qSTbDQmf8KySGpQQG+90SDOJx34d9
 ZZzQvFQWCBWUmcFGWvir5SdwrTokXg0b8nHaaZQhmrsRHLutVZMfLNhEs9o4jrdtRlrP
 wkFu/kXuVjz/343Ew1nyhmkeixNILkqub3mo6yYDsT36PMILlg7hsw3ind2afJ3MLf+9
 yrvg==
X-Gm-Message-State: AOAM531qE2vgFdmYMo4+ZqFolIZZlgYS6wG8f/cysNX4bD6L0SYjDDz2
 NbbDn6f2TqoQEzkZ6cJtVMk=
X-Google-Smtp-Source: ABdhPJyutsBxdY9Hf9O0MDaduStZuiNspuskd8v20MHJoejqpo7OQsGN9mR6mYrBA4kPznu5mwbRTQ==
X-Received: by 2002:a17:90a:4316:: with SMTP id
 q22mr16549995pjg.151.1629980834057; 
 Thu, 26 Aug 2021 05:27:14 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id o2sm3683188pgu.76.2021.08.26.05.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 05:27:12 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Anton Blanchard <anton@ozlabs.org>, Michael Neuling <mikey@neuling.org>
Subject: [PATCH 2/3] powerpc/configs/microwattt: Enable Liteeth
Date: Thu, 26 Aug 2021 21:56:52 +0930
Message-Id: <20210826122653.3236867-3-joel@jms.id.au>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210826122653.3236867-1-joel@jms.id.au>
References: <20210826122653.3236867-1-joel@jms.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Liteeth is the network device used by Microwatt.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/microwatt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/microwatt_defconfig b/arch/powerpc/configs/microwatt_defconfig
index a08b739123da..2f8b1fec9a16 100644
--- a/arch/powerpc/configs/microwatt_defconfig
+++ b/arch/powerpc/configs/microwatt_defconfig
@@ -53,6 +53,7 @@ CONFIG_MTD_SPI_NOR=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_RAM=y
 CONFIG_NETDEVICES=y
+CONFIG_LITEX_LITEETH=y
 # CONFIG_WLAN is not set
 # CONFIG_INPUT is not set
 # CONFIG_SERIO is not set
-- 
2.33.0

