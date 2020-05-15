Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1E31D597C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 20:52:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NyGC39xFzDr32
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 04:52:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=odyzMQV0; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ny4v1ynyzDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 04:44:43 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id d184so1390569pfd.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peJsTqjtzZlMiQ6/hlyhWPfLomD22UhRmluRyXSzAqM=;
 b=odyzMQV0MtWn4lHEcUbNe7/SQACylDgvPhRHGIoyKomvD/3z5ouRD/l5/zfv1dOmhq
 NxkCsfaFWEwbotVggUkRs8NNA3DAwjLSBkZGbpGsRpcQV4554sI0v28SCXGJLGoBiqyw
 TBsdNh4fLBiObsU7hXtjF8FcMcaOXWUzTNA3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=peJsTqjtzZlMiQ6/hlyhWPfLomD22UhRmluRyXSzAqM=;
 b=Ewbt9fKxCPIM57eiXKPhqp1pE4aXP5DSrQPMQw7lUIkUZVI00Nmr4jsOPF8dZEHq0g
 aTTcxjO+6682hiyOoNd/ARHAbstk4mEUa3kVBrdscVlu7OxCXoB3ogFsDBYiyp7Kb2bY
 5DDeeA7nWOMk3161TXSH7A5WG59AfefUk+C0KbrK03+3kfzTS3ixU2l+b//RKFhw7151
 3ecVQH/BjRuqZQZ5/wf5JdLOC8AO4wLvwULBMrR0GMnoxmq7TAGKxOkxQr04Jd28JC2X
 BIgPiQjnjCi84WnQSm1tRYs2r91NyqYDQCEC5bORAsX0mN+6+CfK2BxqOCWYcJedUiK2
 sTUA==
X-Gm-Message-State: AOAM5305xJu6k/kSjUi2WzMMgxs+R78onAZ4SdlPB9u4dxMA6uurJHL4
 /dIhphaQE8FooLQC+6IuF32i7A==
X-Google-Smtp-Source: ABdhPJwHvkUqt7aY1ys8FJyyIpV2sU/MV5A7WjetunJbfb+VaZrSZ8GTZCL7/OPgum1aJcyxju5OJg==
X-Received: by 2002:a63:7d3:: with SMTP id 202mr4282979pgh.279.1589568279879; 
 Fri, 15 May 2020 11:44:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id 131sm2304275pgf.49.2020.05.15.11.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 11:44:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH v4 1/6] printk: Collapse shutdown types into a single dump
 reason
Date: Fri, 15 May 2020 11:44:29 -0700
Message-Id: <20200515184434.8470-2-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
References: <20200515184434.8470-1-keescook@chromium.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To turn the KMSG_DUMP_* reasons into a more ordered list, collapse
the redundant KMSG_DUMP_(RESTART|HALT|POWEROFF) reasons into
KMSG_DUMP_SHUTDOWN. The current users already don't meaningfully
distinguish between them, so there's no need to, as discussed here:
https://lore.kernel.org/lkml/CA+CK2bAPv5u1ih5y9t5FUnTyximtFCtDYXJCpuyjOyHNOkRdqw@mail.gmail.com/

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 arch/powerpc/kernel/nvram_64.c | 4 +---
 fs/pstore/platform.c           | 8 ++------
 include/linux/kmsg_dump.h      | 4 +---
 kernel/reboot.c                | 6 +++---
 4 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index fb4f61096613..0cd1c88bfc8b 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -655,9 +655,7 @@ static void oops_to_nvram(struct kmsg_dumper *dumper,
 	int rc = -1;
 
 	switch (reason) {
-	case KMSG_DUMP_RESTART:
-	case KMSG_DUMP_HALT:
-	case KMSG_DUMP_POWEROFF:
+	case KMSG_DUMP_SHUTDOWN:
 		/* These are almost always orderly shutdowns. */
 		return;
 	case KMSG_DUMP_OOPS:
diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 072440457c08..90d74ebaa70a 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -144,12 +144,8 @@ static const char *get_reason_str(enum kmsg_dump_reason reason)
 		return "Oops";
 	case KMSG_DUMP_EMERG:
 		return "Emergency";
-	case KMSG_DUMP_RESTART:
-		return "Restart";
-	case KMSG_DUMP_HALT:
-		return "Halt";
-	case KMSG_DUMP_POWEROFF:
-		return "Poweroff";
+	case KMSG_DUMP_SHUTDOWN:
+		return "Shutdown";
 	default:
 		return "Unknown";
 	}
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 2e7a1e032c71..3f82b5cb2d82 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -25,9 +25,7 @@ enum kmsg_dump_reason {
 	KMSG_DUMP_PANIC,
 	KMSG_DUMP_OOPS,
 	KMSG_DUMP_EMERG,
-	KMSG_DUMP_RESTART,
-	KMSG_DUMP_HALT,
-	KMSG_DUMP_POWEROFF,
+	KMSG_DUMP_SHUTDOWN,
 };
 
 /**
diff --git a/kernel/reboot.c b/kernel/reboot.c
index c4d472b7f1b4..491f1347bf43 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -250,7 +250,7 @@ void kernel_restart(char *cmd)
 		pr_emerg("Restarting system\n");
 	else
 		pr_emerg("Restarting system with command '%s'\n", cmd);
-	kmsg_dump(KMSG_DUMP_RESTART);
+	kmsg_dump(KMSG_DUMP_SHUTDOWN);
 	machine_restart(cmd);
 }
 EXPORT_SYMBOL_GPL(kernel_restart);
@@ -274,7 +274,7 @@ void kernel_halt(void)
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
 	pr_emerg("System halted\n");
-	kmsg_dump(KMSG_DUMP_HALT);
+	kmsg_dump(KMSG_DUMP_SHUTDOWN);
 	machine_halt();
 }
 EXPORT_SYMBOL_GPL(kernel_halt);
@@ -292,7 +292,7 @@ void kernel_power_off(void)
 	migrate_to_reboot_cpu();
 	syscore_shutdown();
 	pr_emerg("Power down\n");
-	kmsg_dump(KMSG_DUMP_POWEROFF);
+	kmsg_dump(KMSG_DUMP_SHUTDOWN);
 	machine_power_off();
 }
 EXPORT_SYMBOL_GPL(kernel_power_off);
-- 
2.20.1

