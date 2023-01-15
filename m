Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D32B666B3BB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 20:58:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nw5Yd5PZfz3cDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 06:58:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=p7QXG0m4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=p7QXG0m4;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nw5Xg0M1Qz3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 06:57:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Up+tgsBQS/MSjHV1TfHK8OacAykPC785+p3kOJ4Jv3c=; b=p7QXG0m4G/22EjPacsIepmUwUd
	1z1XgzlygJiVy1WDVOlZ4CIQypYstf1coo1aZYneA31RdBquud0d1s5z7Kcgig1xUrnzfpFs1DIvx
	HAhj5h+kg8mINtiNcG0qPNYW1ZSZtc5SzmDRdCxBGOx1KfazHgrHdivhumjOCgv2X9qVQKUUwBHu4
	J5vRhAoqYflAFbg3/pc0e5jw/xO+RoP6Up7pk7RzHLW2I7IUfuvvXFJGS8A34QrhNxMiDllASNjhh
	xjF40iYy/zqKCrq/BilZaWTHKfpGqXvlndw+yLLCHQNevfoWACSao/F7IrLBtgrcUiIkFIHPa+Pd8
	0Rj8c6bw==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56] helo=[192.168.1.80])
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH983-0086Ca-54; Sun, 15 Jan 2023 19:57:19 +0000
Message-ID: <e5709458-5675-2f69-2d59-f380bfbd70b3@infradead.org>
Date: Sun, 15 Jan 2023 11:56:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Geoff Levand <geoff@infradead.org>
Subject: [PATCH v1 1/1] hvc_console: Allow backends to set I/O buffer size
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To allow HVC backends to set the I/O buffer sizes to values that are most
efficient for the backend, change the macro definitions where the buffer sizes
are set to be conditional on whether or not the macros are already defined.
Also, rename the macros from N_OUTBUF to HVC_N_OUBUF and from N_INBUF to
HVC_N_INBUF.

Typical usage in the backend source file would be:

  #define HVC_N_OUTBUF 32
  #define HVC_N_INBUF 32
  #include "hvc_console.h"

Signed-off-by: Geoff Levand <geoff@infradead.org>
---

Hi,

With this patch the buffer sizes are set by defining preprocessor macros before
including the hvc_console.h header file.  Another way would be to have Kconfig
options for the buffer sizes.  Since the optimal buffer size is so closely tied
to the backend implementation I thought that using these preprocessor macros
would be the better way.

-Geoff

The following changes since commit 5dc4c995db9eb45f6373a956eb1f69460e69e6d4:

  Linux 6.2-rc4 (2023-01-15 09:22:43 -0600)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geoff/ps3-linux.git for-merge-hvc-v1

for you to fetch changes up to 8f3cd1e0589f134380f80a1f551c8232ed0bc1f2:

  hvc_console: Allow backends to set I/O buffer size (2023-01-15 09:36:22 -0800)


 drivers/tty/hvc/hvc_console.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
index a683e21df19c..f7809d19e2cd 100644
--- a/drivers/tty/hvc/hvc_console.c
+++ b/drivers/tty/hvc/hvc_console.c
@@ -42,12 +42,15 @@
 #define HVC_CLOSE_WAIT (HZ/100) /* 1/10 of a second */
 
 /*
- * These sizes are most efficient for vio, because they are the
- * native transfer size. We could make them selectable in the
- * future to better deal with backends that want other buffer sizes.
+ * These default sizes are most efficient for vio, because they are
+ * the native transfer size.
  */
-#define N_OUTBUF	16
-#define N_INBUF		16
+#if !defined(HVC_N_OUTBUF)
+# define HVC_N_OUTBUF	16
+#endif
+#if !defined(HVC_N_INBUF)
+# define HVC_N_INBUF	16
+#endif
 
 #define __ALIGNED__ __attribute__((__aligned__(L1_CACHE_BYTES)))
 
@@ -151,7 +154,7 @@ static uint32_t vtermnos[MAX_NR_HVC_CONSOLES] =
 static void hvc_console_print(struct console *co, const char *b,
 			      unsigned count)
 {
-	char c[N_OUTBUF] __ALIGNED__;
+	char c[HVC_N_OUTBUF] __ALIGNED__;
 	unsigned i = 0, n = 0;
 	int r, donecr = 0, index = co->index;
 
@@ -633,7 +636,7 @@ static int __hvc_poll(struct hvc_struct *hp, bool may_sleep)
 {
 	struct tty_struct *tty;
 	int i, n, count, poll_mask = 0;
-	char buf[N_INBUF] __ALIGNED__;
+	char buf[HVC_N_INBUF] __ALIGNED__;
 	unsigned long flags;
 	int read_total = 0;
 	int written_total = 0;
@@ -674,7 +677,7 @@ static int __hvc_poll(struct hvc_struct *hp, bool may_sleep)
 
  read_again:
 	/* Read data if any */
-	count = tty_buffer_request_room(&hp->port, N_INBUF);
+	count = tty_buffer_request_room(&hp->port, HVC_N_INBUF);
 
 	/* If flip is full, just reschedule a later read */
 	if (count == 0) {
-- 
2.34.1

