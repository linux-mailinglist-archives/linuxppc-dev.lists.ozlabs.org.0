Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8DE4F42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 16:37:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4706C34yKHzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Oct 2019 01:37:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="SlILOK4o"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4705Hz4FstzDqgH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2019 00:56:31 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AAD6821D7F;
 Fri, 25 Oct 2019 13:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572011789;
 bh=4wI4BXv8dbGkn69FexzjVQhmlDi4VgU0N1H2yt7Nd+M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SlILOK4oJLEx4AMM+s9c/fWEmUOFhIsrk1dIB0loaW2liWvpe/4Cc0SWFTZZaU3w2
 NhA8MZZQjO1M4zG0RHktifMfaziIG7aR7FXQyDTQc7Z6aC7KXRuSmkEStxHO7ou05n
 9oo/+g0FH1mkfj9d2ofOCdofKlaxOFVVDJdT4zFc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/37] powerpc/pseries/hvconsole: Fix stack
 overread via udbg
Date: Fri, 25 Oct 2019 09:55:37 -0400
Message-Id: <20191025135603.25093-13-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025135603.25093-1-sashal@kernel.org>
References: <20191025135603.25093-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

[ Upstream commit 934bda59f286d0221f1a3ebab7f5156a996cc37d ]

While developing KASAN for 64-bit book3s, I hit the following stack
over-read.

It occurs because the hypercall to put characters onto the terminal
takes 2 longs (128 bits/16 bytes) of characters at a time, and so
hvc_put_chars() would unconditionally copy 16 bytes from the argument
buffer, regardless of supplied length. However, udbg_hvc_putc() can
call hvc_put_chars() with a single-byte buffer, leading to the error.

  ==================================================================
  BUG: KASAN: stack-out-of-bounds in hvc_put_chars+0xdc/0x110
  Read of size 8 at addr c0000000023e7a90 by task swapper/0

  CPU: 0 PID: 0 Comm: swapper Not tainted 5.2.0-rc2-next-20190528-02824-g048a6ab4835b #113
  Call Trace:
    dump_stack+0x104/0x154 (unreliable)
    print_address_description+0xa0/0x30c
    __kasan_report+0x20c/0x224
    kasan_report+0x18/0x30
    __asan_report_load8_noabort+0x24/0x40
    hvc_put_chars+0xdc/0x110
    hvterm_raw_put_chars+0x9c/0x110
    udbg_hvc_putc+0x154/0x200
    udbg_write+0xf0/0x240
    console_unlock+0x868/0xd30
    register_console+0x970/0xe90
    register_early_udbg_console+0xf8/0x114
    setup_arch+0x108/0x790
    start_kernel+0x104/0x784
    start_here_common+0x1c/0x534

  Memory state around the buggy address:
   c0000000023e7980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   c0000000023e7a00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 f1 f1
  >c0000000023e7a80: f1 f1 01 f2 f2 f2 00 00 00 00 00 00 00 00 00 00
                           ^
   c0000000023e7b00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
   c0000000023e7b80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
  ==================================================================

Document that a 16-byte buffer is requred, and provide it in udbg.

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/platforms/pseries/hvconsole.c |  2 +-
 drivers/tty/hvc/hvc_vio.c                  | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hvconsole.c b/arch/powerpc/platforms/pseries/hvconsole.c
index 74da18de853af..73ec15cd27080 100644
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
index 59eaa620bf13a..80fd06fbd712a 100644
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
2.20.1

