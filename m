Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C46C160856
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 03:52:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48LT6Q2QpdzDqdR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2020 13:52:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dSE9fj4j; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48LT2T2QsDzDqck
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2020 13:48:49 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id d9so8276197pgu.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Feb 2020 18:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bfN31QyEQ318P9jrNAVw/XcIMKnKFHouc6kwP9vybhY=;
 b=dSE9fj4jSvv20UVihW0FPffedIHVrk+55J5JUWZorQDqPSzKgkvVwUtoNdpBG9F7Eb
 h7xlZondo3K5e34WckXyoQr3tgMqvDG7NapN9g7hJclrbuOCXCcBUEjRD8YU3tksIE71
 7J8IGwnZTOzVXErnGvnGIR4EoSBoy364LzhWWzoA1PN/wwWpzgUNAC8olCxQQZ8DL5IF
 2hGbPW++iomZhT8qAToJDIwoQdHvDyAIvlh7n8oUemsgHOnZaLFcUf9L1Sh0p4ulvwgA
 B+2xiBGOTc/RwSWN/sD/BhGX3M0XOd5UQ9NgKeEkcXTQPjehLNJJueNUAsP40RqzYlXT
 WAEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bfN31QyEQ318P9jrNAVw/XcIMKnKFHouc6kwP9vybhY=;
 b=tIn/ehV9nP6Im7SyQhnInHix4lw09cWT4FW8I1Wizg1FakIfYqChqGYY+TL3/h0XtV
 FuXvjPK9Rj2UW1XNEb9SQUymClRhTER8ZYZTlHuGGvAUB8nTmzm3PaJshDtiTtGQE1aw
 2ZjLyLHWQ4+jvhMR2m9YPGZu1EFguTPIj+dijxvkI6WQrIjJnQOQfKZhKKHf2eXbBmyx
 QtA7hZvktdmJ00XbMzg7fQRRwXdWKbIAkwuNx2u8uFdG6Kwg1OYYwSpjdhHzsmXT3pQD
 mZndwO01/D8qFemramkr2JY4C3HmoOF13RiX9YzfW0o5u9/Db8EZKpjnSDsBs8TGhrY3
 HEMQ==
X-Gm-Message-State: APjAAAXXcZsa68gi+A5xTGMuf2Bi9wme1+r53gmRlwhFE/sExvIOawkw
 D7ERbGqXyQYSWiaaAuQcIoFeYJSe
X-Google-Smtp-Source: APXvYqxj6hx8QZzkewxwRiRnPukKQns8gHjO3F60vRYAotSPzZMpPt5t/E2bmUVg7asLPm119NsDBg==
X-Received: by 2002:a63:78b:: with SMTP id 133mr15177678pgh.379.1581907725288; 
 Sun, 16 Feb 2020 18:48:45 -0800 (PST)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id c3sm14641731pfj.159.2020.02.16.18.48.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 18:48:44 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/powernv: Add explicit fast-reboot support
Date: Mon, 17 Feb 2020 13:48:33 +1100
Message-Id: <20200217024833.30580-2-oohall@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217024833.30580-1-oohall@gmail.com>
References: <20200217024833.30580-1-oohall@gmail.com>
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

Add a way to manually invoke a fast-reboot rather than setting the NVRAM
flag. The idea is to allow userspace to invoke a fast-reboot using the
optional string argument to the reboot() system call, or using the xmon
zr command so we don't need to leave around a persistent changes on
a system to use the feature.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
Companion skiboot patch:
http://lists.ozlabs.org/pipermail/skiboot/2020-February/016420.html
---
 arch/powerpc/include/asm/opal-api.h    | 1 +
 arch/powerpc/platforms/powernv/setup.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index c1f25a7..1dffa3c 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -1067,6 +1067,7 @@ enum {
 	OPAL_REBOOT_PLATFORM_ERROR	= 1,
 	OPAL_REBOOT_FULL_IPL		= 2,
 	OPAL_REBOOT_MPIPL		= 3,
+	OPAL_REBOOT_FAST		= 4,
 };
 
 /* Argument to OPAL_PCI_TCE_KILL */
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index a8fe630..3bc188d 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -237,6 +237,8 @@ static void  __noreturn pnv_restart(char *cmd)
 			rc = opal_cec_reboot2(OPAL_REBOOT_MPIPL, NULL);
 		else if (strcmp(cmd, "error") == 0)
 			rc = opal_cec_reboot2(OPAL_REBOOT_PLATFORM_ERROR, NULL);
+		else if (strcmp(cmd, "fast") == 0)
+			rc = opal_cec_reboot2(OPAL_REBOOT_FAST, NULL);
 		else
 			rc = OPAL_UNSUPPORTED;
 
-- 
2.9.5

