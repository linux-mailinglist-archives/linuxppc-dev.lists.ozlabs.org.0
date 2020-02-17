Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 833CC160854
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 03:50:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LT4N1SBXzDqfb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 13:50:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sWSE0U/R; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LT2Q1xz9zDqck
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 13:48:45 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id s1so8047404pfh.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 18:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zP8tBhIUwlLb+t78KQPeCGcT+HwTJH1VXfGEXiTBXd0=;
 b=sWSE0U/R4qMzmIjFjZJjNaKeAN8xoIYe+iuMjSf1rS6BeSoO2s1FaJ/AkDX5YSdjRh
 MznQS6Y00WUhdvVp7LWwyyi1xZEj8WiTg/EVQ9AWdMCzM7J5ZvAbYnb+1+eWQREAS5CR
 FkGqguikjc6GyLFZ41zNb4FYE5qHHsNwXn9L2cEFh02bAWfuemoEoCAVnkn68SYY7V1T
 pnIUpoz0CjSBBfQJPKTseieWVMXbsrN2S6FEIJPBLdakM8+NjfoVpKbDrUFe2GPORevu
 jEYNNYRmOyzAaLZt8/HY2Xh/3ezeXxk3z2GmWsZlv4szTbyqm+Y1VnpbwfMJagzo//QL
 V06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zP8tBhIUwlLb+t78KQPeCGcT+HwTJH1VXfGEXiTBXd0=;
 b=TXwFbT9iDs59E3WViUF4ng7yH6IJ7VcsJX3Zl0G9DSe74qEbunhx/XqInTEyaS3Xv4
 aILm1ykAAnnr4FlUOgK3kEHMzR8qZTyJtSKUPBrz7nH/yDfTe4ZBuVe9Y2EsBA/BXMyD
 MHXMc8ch6AQ/HrYyK6TyC+jDWlcZTB7BXwij/8WJqf2DisOo5zw5KLtUz60umhiYH+W3
 fhD/lX1O6Q7OAiA71Gjld7mHz7pFvFQESJSSxa9lJn+f3Qc9O4ul8GjLHcuZGetUDhWU
 D8SMz+IJQoEoKpjRdN0xMQOwU4DDErrc/KwuiziDxqkeAsvd5W6pXedbYue7WwJeT3Aq
 4YhQ==
X-Gm-Message-State: APjAAAW67pOf5rTrDC64qSzwSfgLDmcbPSOzqBAaCXfnXoub+CVzyOZi
 AAlbh/WZUSxq89t9x4bV3wSeG/le
X-Google-Smtp-Source: APXvYqyVdTBh+R1EBdgt3miVIQe4YXW1R8Iz5fUkXvQDu/oP+NbiCae4sD42CPlTdSJWMYfVV30mLA==
X-Received: by 2002:a63:3689:: with SMTP id
 d131mr15453141pga.250.1581907723471; 
 Sun, 16 Feb 2020 18:48:43 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id c3sm14641731pfj.159.2020.02.16.18.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 18:48:43 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/powernv: Treat an empty reboot string as default
Date: Mon, 17 Feb 2020 13:48:32 +1100
Message-Id: <20200217024833.30580-1-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Treat an empty reboot cmd string the same as a NULL string. This squashes a
spurious unsupported reboot message that sometimes gets out when using
xmon.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 11fdae8..a8fe630 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -229,7 +229,7 @@ static void  __noreturn pnv_restart(char *cmd)
 	pnv_prepare_going_down();
 
 	do {
-		if (!cmd)
+		if (!cmd || !strlen(cmd))
 			rc = opal_cec_reboot();
 		else if (strcmp(cmd, "full") == 0)
 			rc = opal_cec_reboot2(OPAL_REBOOT_FULL_IPL, NULL);
-- 
2.9.5

