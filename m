Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 556EB2019CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 19:53:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pRHY27GfzDrTN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jun 2020 03:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=sergey.senozhatsky@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DmEOGUp1; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pQcM5M9jzDqCX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jun 2020 03:22:51 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 64so4687685pfv.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 10:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykiyUBcX7lv0L02KjGOJYnNL284qndFCqddofaXQGhM=;
 b=DmEOGUp1l+mc7oLgPAXP4ow/v0iL4q0vdktF7FaO72WHHr9IDU5NxrUPIZd1+bBjQf
 dTDBpj+Cj4cBSkhUk7QUcY8PiwNUGbwAiyzcrvmCx1xZyGh+cFhjM+SdP8MVlcLF8J7a
 9sgawsqVdZbX0Hk/k7LGLjbVW+EBsgPNFBotTxqTlrec/SPIDY8+Ifaf8yWhtYCf1D1P
 0qDb4hKEMpas+WUtQAPqJ5XJ4DfMKCdkhlqoMdHWfuPZzmp8m3rosi5qX5P+y679FWpx
 6nbpayxmPnUOyqwTgSzoFgqJmyiSyKEhVkedqgBtMwQRpyYFYuNXwFytIyaFl5jZGziY
 wYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ykiyUBcX7lv0L02KjGOJYnNL284qndFCqddofaXQGhM=;
 b=YYcaurqM55WZEwGSIQE1uA8lbnFu3+tNrL4ZhssTaD2cMfSVNVFfTESqnnd5xAWt0R
 3uwv2DeD8t488arkVYqP2gz6OTr5N7FJmdgLeADMbgOtMaYJz3nA060dCYRzObH4F/On
 LP5A3Y5V+Tq6g8sQdAeJW2JQAlh5+koGaK884TPICYMjMZAE3Xgd0gGigdcV71tqWtma
 3/KJtfsJl1W5kFXlv/DV0P4fkFVT8IKuAF4NftLtPlIhTFkISXOt2SAnRG4wz1LxLSgp
 CgI5QcEUkDI3S+JzF6V6LMtuvpiCB/IRGVvucgmXXeUqBw/0D78HS8DUnXZgn/sPZsGz
 PG7g==
X-Gm-Message-State: AOAM5327gyWlMpK1U7/9z54Ypg08lGKB2zAtAboiZaLFuv1cpVpxcHqD
 1tyk4H2TBdT9LbggG5ALFsE=
X-Google-Smtp-Source: ABdhPJzICZfJ745drSzqyE/YfQ9U/bajMnz4wLScZa8TtChqLw3rST0e2UrE+D0qFU8EPbXoOgTKbQ==
X-Received: by 2002:a62:5e83:: with SMTP id s125mr8468465pfb.315.1592587367772; 
 Fri, 19 Jun 2020 10:22:47 -0700 (PDT)
Received: from localhost.localdomain ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id
 t201sm6426048pfc.104.2020.06.19.10.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jun 2020 10:22:47 -0700 (PDT)
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: [PATCH] hvc: unify console setup naming
Date: Sat, 20 Jun 2020 02:22:40 +0900
Message-Id: <20200619172240.754910-1-sergey.senozhatsky@gmail.com>
X-Mailer: git-send-email 2.27.0
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Jiri Slaby <jslaby@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the 'common' foo_console_setup() naming scheme. There are 71
foo_console_setup() callbacks and only one foo_setup_console().

Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jslaby@suse.com>
---
 drivers/tty/hvc/hvc_xen.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 5ef08905fe05..2a0e51a20e34 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -603,7 +603,7 @@ static void xen_hvm_early_write(uint32_t vtermno, const char *str, int len) { }
 #endif
 
 #ifdef CONFIG_EARLY_PRINTK
-static int __init xenboot_setup_console(struct console *console, char *string)
+static int __init xenboot_console_setup(struct console *console, char *string)
 {
 	static struct xencons_info xenboot;
 
@@ -647,7 +647,7 @@ static void xenboot_write_console(struct console *console, const char *string,
 struct console xenboot_console = {
 	.name		= "xenboot",
 	.write		= xenboot_write_console,
-	.setup		= xenboot_setup_console,
+	.setup		= xenboot_console_setup,
 	.flags		= CON_PRINTBUFFER | CON_BOOT | CON_ANYTIME,
 	.index		= -1,
 };
-- 
2.27.0

