Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2298432902
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 08:58:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HQql3Xf4zDqQy
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 16:58:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="Rt8XkLpT"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HQpY028LzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 16:57:07 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id a186so9327292pfa.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Jun 2019 23:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ0QFMzqYV1PJ8wBpau0Xqg70yYE6JKTP6lyDqZVbcE=;
 b=Rt8XkLpTgVAu7m4UcOeGrfklXy2IOECdhFlsJSsajlzasyd4sBUV9jib0jJb0+Obqr
 sEVzZvg06mS7foR07Go6ffybuSzac6w7e5rUK2w4ezsLvZkQ3GoPLuuT74GtC0RkQtNb
 9z1YDoaozZIaGuOWG/RtSOKRM15p/ahEQj8P4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJ0QFMzqYV1PJ8wBpau0Xqg70yYE6JKTP6lyDqZVbcE=;
 b=lZDA0HHHroNFJ8rpBCyJdOIpePV3IN7Bv586FWhjoiu0GzT/teUMfMRThLTV0j+pTo
 DDHlVRtH27/Ted6tJg0q4fzfKN8orP0Nxo+LbtXKeQrQoH73GREBEKcYEVaYnGJzAdG7
 2rWm6hqv68rO+zll+wEVhW3cNHBcGFStGAT+oZTrTvGpy5rJ8ArHOr3wdg/pNAkbpFlT
 Pk76b3sWxzueaA40Vuo+shbDH1XpiBJjs8AMENLAIHFhaw3qu133suDkvWJXjcHj3D1S
 WEGY8jEpoevOPvMlWeQdnanzh7QTsTXr2orV8+Tr8VegCUor/q7OcpHQmIgcgPdKdAF1
 //xg==
X-Gm-Message-State: APjAAAVgX89Lz8zZHaViRNK4qKYGoP5qHPIS1ca94uo0EX4vERpNIGdM
 48Pv3o/gRYvdVaTuQYAkh3qbjQkDElA=
X-Google-Smtp-Source: APXvYqynlaq3S3Hp6ZrIWU4WFk5OqV7KxzuYoZ3ZtKXK1kkNcFybKgYAhmjUMKUtUSsn8qaesFAivQ==
X-Received: by 2002:a63:8bc7:: with SMTP id j190mr5949329pge.104.1559545024153; 
 Sun, 02 Jun 2019 23:57:04 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id d9sm12060023pgj.34.2019.06.02.23.57.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Jun 2019 23:57:03 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] powerpc: pseries/hvconsole: fix stack overread via udbg
Date: Mon,  3 Jun 2019 16:56:57 +1000
Message-Id: <20190603065657.7986-1-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
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
Cc: Dmitry Vyukov <dvyukov@google.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While developing kasan for 64-bit book3s, I hit the following stack
over-read.

It occurs because the hypercall to put characters onto the terminal
takes 2 longs (128 bits/16 bytes) of characters at a time, and so
hvc_put_chars would unconditionally copy 16 bytes from the argument
buffer, regardless of supplied length. However, udbg_hvc_putc can
call hvc_put_chars with a single-byte buffer, leading to the error.

[    0.001931] ==================================================================                                                  [150/819]
[    0.001933] BUG: KASAN: stack-out-of-bounds in hvc_put_chars+0xdc/0x110
[    0.001934] Read of size 8 at addr c0000000023e7a90 by task swapper/0
[    0.001934]
[    0.001935] CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-rc2-next-20190528-02824-g048a6ab4835b #113
[    0.001935] Call Trace:
[    0.001936] [c0000000023e7790] [c000000001b4a450] dump_stack+0x104/0x154 (unreliable)
[    0.001937] [c0000000023e77f0] [c0000000006d3524] print_address_description+0xa0/0x30c
[    0.001938] [c0000000023e7880] [c0000000006d318c] __kasan_report+0x20c/0x224
[    0.001939] [c0000000023e7950] [c0000000006d19d8] kasan_report+0x18/0x30
[    0.001940] [c0000000023e7970] [c0000000006d4854] __asan_report_load8_noabort+0x24/0x40
[    0.001941] [c0000000023e7990] [c0000000001511ac] hvc_put_chars+0xdc/0x110
[    0.001942] [c0000000023e7a10] [c000000000f81cfc] hvterm_raw_put_chars+0x9c/0x110
[    0.001943] [c0000000023e7a50] [c000000000f82634] udbg_hvc_putc+0x154/0x200
[    0.001944] [c0000000023e7b10] [c000000000049c90] udbg_write+0xf0/0x240
[    0.001945] [c0000000023e7b70] [c0000000002e5d88] console_unlock+0x868/0xd30
[    0.001946] [c0000000023e7ca0] [c0000000002e6e00] register_console+0x970/0xe90
[    0.001947] [c0000000023e7d80] [c000000001ff1928] register_early_udbg_console+0xf8/0x114
[    0.001948] [c0000000023e7df0] [c000000001ff1174] setup_arch+0x108/0x790
[    0.001948] [c0000000023e7e90] [c000000001fe41c8] start_kernel+0x104/0x784
[    0.001949] [c0000000023e7f90] [c00000000000b368] start_here_common+0x1c/0x534
[    0.001950]
[    0.001950]
[    0.001951] Memory state around the buggy address:
[    0.001952]  c0000000023e7980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    0.001952]  c0000000023e7a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1
[    0.001953] >c0000000023e7a80: f1 f1 01 f2 f2 f2 00 00 00 00 00 00 00 00 00 00
[    0.001953]                          ^
[    0.001954]  c0000000023e7b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    0.001954]  c0000000023e7b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[    0.001955] ==================================================================

Document that a 16-byte buffer is requred, and provide it in udbg.

CC: Dmitry Vyukov <dvyukov@google.com>
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

v2: avoid memcpy, push responsibility to caller.
    Solution suggested by mpe.
---
 arch/powerpc/platforms/pseries/hvconsole.c |  2 +-
 drivers/tty/hvc/hvc_vio.c                  | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvconsole.c b/arch/powerpc/platforms/pseries/hvconsole.c
index 74da18de853a..73ec15cd2708 100644
--- a/arch/powerpc/platforms/pseries/hvconsole.c
+++ b/arch/powerpc/platforms/pseries/hvconsole.c
@@ -62,7 +62,7 @@ EXPORT_SYMBOL(hvc_get_chars);
  * @vtermno: The vtermno or unit_address of the adapter from which the data
  *	originated.
  * @buf: The character buffer that contains the character data to send to
- *	firmware.
+ *	firmware. Must be at least 16 bytes, even if count is less than 16.
  * @count: Send this number of characters.
  */
 int hvc_put_chars(uint32_t vtermno, const char *buf, int count)
diff --git a/drivers/tty/hvc/hvc_vio.c b/drivers/tty/hvc/hvc_vio.c
index 6de6d4a1a221..7af54d6ed5b8 100644
--- a/drivers/tty/hvc/hvc_vio.c
+++ b/drivers/tty/hvc/hvc_vio.c
@@ -107,6 +107,14 @@ static int hvterm_raw_get_chars(uint32_t vtermno, char *buf, int count)
 	return got;
 }
 
+/**
+ * hvterm_raw_put_chars: send characters to firmware for given vterm adapter
+ * @vtermno: The virtual terminal number.
+ * @buf: The characters to send. Because of the underlying hypercall in
+ *       hvc_put_chars(), this buffer must be at least 16 bytes long, even if
+ *       you are sending fewer chars.
+ * @count: number of chars to send.
+ */
 static int hvterm_raw_put_chars(uint32_t vtermno, const char *buf, int count)
 {
 	struct hvterm_priv *pv = hvterm_privs[vtermno];
@@ -219,6 +227,7 @@ static const struct hv_ops hvterm_hvsi_ops = {
 static void udbg_hvc_putc(char c)
 {
 	int count = -1;
+	unsigned char bounce_buffer[16];
 
 	if (!hvterm_privs[0])
 		return;
@@ -229,7 +238,12 @@ static void udbg_hvc_putc(char c)
 	do {
 		switch(hvterm_privs[0]->proto) {
 		case HV_PROTOCOL_RAW:
-			count = hvterm_raw_put_chars(0, &c, 1);
+			/*
+			 * hvterm_raw_put_chars requires at least a 16-byte
+			 * buffer, so go via the bounce buffer
+			 */
+			bounce_buffer[0] = c;
+			count = hvterm_raw_put_chars(0, bounce_buffer, 1);
 			break;
 		case HV_PROTOCOL_HVSI:
 			count = hvterm_hvsi_put_chars(0, &c, 1);
-- 
2.19.1

