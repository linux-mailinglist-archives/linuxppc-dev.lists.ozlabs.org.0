Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 480348068C0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 08:39:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPL4Vi6N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlTn65Ndwz3dK0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 18:39:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JPL4Vi6N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlTlK6BxPz2xdb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 18:37:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5FC73CE1BBB;
	Wed,  6 Dec 2023 07:37:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6B6C433CA;
	Wed,  6 Dec 2023 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701848266;
	bh=NBVGfqVBHtAx9X1sh3B08SNoMFLKVcpgb4FXXBWHsyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPL4Vi6NNgX0+0tCKtbzdc6ew3vUTYwk1DSCwubQJi5d2S5vcnba2Vn6Tz7P5ZzK7
	 xQ7komMKBfd3RmPvmAtyjXDGj8gKz82+cMmt3jhZYGJgSY4f/zi9KPc5vvUKBYCHDo
	 sAO1MmZEPALJaj4aAovbZRF2EaBVGaqKCmL/W/XlsxpX0n4KDfHSJyOvFHM+9hFb4o
	 OAVd/9ve1j2R6k7zmhYFicvHyJstnGx+T7O76bXRQB5H7ccxepsaLoJMzmbNPqXu8w
	 J3tt2eB/ggpQtrrJhwBucFXuE5qJzb12C8/KPKaA/b3L1pRRNSX2XNxZsOdwAJNgj3
	 MBG7Yg+O65tBQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 12/27] tty: hvc: convert to u8 and size_t
Date: Wed,  6 Dec 2023 08:36:57 +0100
Message-ID: <20231206073712.17776-13-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206073712.17776-1-jirislaby@kernel.org>
References: <20231206073712.17776-1-jirislaby@kernel.org>
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Amit Shah <amit@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nicholas Piggin <npiggin@gmail.com>, linux-serial@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Switch character types to u8 and sizes to size_t. To conform to
characters/sizes in the rest of the tty layer.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Amit Shah <amit@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: virtualization@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
---
 arch/powerpc/include/asm/hvconsole.h       |  4 ++--
 arch/powerpc/include/asm/hvsi.h            | 18 ++++++++--------
 arch/powerpc/include/asm/opal.h            |  8 +++++---
 arch/powerpc/platforms/powernv/opal.c      | 14 +++++++------
 arch/powerpc/platforms/pseries/hvconsole.c |  4 ++--
 drivers/char/virtio_console.c              | 10 ++++-----
 drivers/tty/hvc/hvc_console.h              |  4 ++--
 drivers/tty/hvc/hvc_dcc.c                  | 24 +++++++++++-----------
 drivers/tty/hvc/hvc_iucv.c                 | 18 ++++++++--------
 drivers/tty/hvc/hvc_opal.c                 |  5 +++--
 drivers/tty/hvc/hvc_riscv_sbi.c            |  9 ++++----
 drivers/tty/hvc/hvc_rtas.c                 | 11 +++++-----
 drivers/tty/hvc/hvc_udbg.c                 |  9 ++++----
 drivers/tty/hvc/hvc_vio.c                  | 18 ++++++++--------
 drivers/tty/hvc/hvc_xen.c                  | 23 +++++++++++----------
 drivers/tty/hvc/hvsi_lib.c                 | 20 ++++++++++--------
 16 files changed, 107 insertions(+), 92 deletions(-)

diff --git a/arch/powerpc/include/asm/hvconsole.h b/arch/powerpc/include/asm/hvconsole.h
index ccb2034506f0..d841a97010a0 100644
--- a/arch/powerpc/include/asm/hvconsole.h
+++ b/arch/powerpc/include/asm/hvconsole.h
@@ -21,8 +21,8 @@
  * Vio firmware always attempts to fetch MAX_VIO_GET_CHARS chars.  The 'count'
  * parm is included to conform to put_chars() function pointer template
  */
-extern int hvc_get_chars(uint32_t vtermno, char *buf, int count);
-extern int hvc_put_chars(uint32_t vtermno, const char *buf, int count);
+extern ssize_t hvc_get_chars(uint32_t vtermno, u8 *buf, size_t count);
+extern ssize_t hvc_put_chars(uint32_t vtermno, const u8 *buf, size_t count);
 
 /* Provided by HVC VIO */
 void hvc_vio_init_early(void);
diff --git a/arch/powerpc/include/asm/hvsi.h b/arch/powerpc/include/asm/hvsi.h
index 464a7519ed64..9058edcb632b 100644
--- a/arch/powerpc/include/asm/hvsi.h
+++ b/arch/powerpc/include/asm/hvsi.h
@@ -64,7 +64,7 @@ struct hvsi_priv {
 	unsigned int	inbuf_len;	/* data in input buffer */
 	unsigned char	inbuf[HVSI_INBUF_SIZE];
 	unsigned int	inbuf_cur;	/* Cursor in input buffer */
-	unsigned int	inbuf_pktlen;	/* packet length from cursor */
+	size_t		inbuf_pktlen;	/* packet length from cursor */
 	atomic_t	seqno;		/* packet sequence number */
 	unsigned int	opened:1;	/* driver opened */
 	unsigned int	established:1;	/* protocol established */
@@ -72,24 +72,26 @@ struct hvsi_priv {
 	unsigned int	mctrl_update:1;	/* modem control updated */
 	unsigned short	mctrl;		/* modem control */
 	struct tty_struct *tty;		/* tty structure */
-	int (*get_chars)(uint32_t termno, char *buf, int count);
-	int (*put_chars)(uint32_t termno, const char *buf, int count);
+	ssize_t (*get_chars)(uint32_t termno, u8 *buf, size_t count);
+	ssize_t (*put_chars)(uint32_t termno, const u8 *buf, size_t count);
 	uint32_t	termno;
 };
 
 /* hvsi lib functions */
 struct hvc_struct;
 extern void hvsilib_init(struct hvsi_priv *pv,
-			 int (*get_chars)(uint32_t termno, char *buf, int count),
-			 int (*put_chars)(uint32_t termno, const char *buf,
-					  int count),
+			 ssize_t (*get_chars)(uint32_t termno, u8 *buf,
+					      size_t count),
+			 ssize_t (*put_chars)(uint32_t termno, const u8 *buf,
+					      size_t count),
 			 int termno, int is_console);
 extern int hvsilib_open(struct hvsi_priv *pv, struct hvc_struct *hp);
 extern void hvsilib_close(struct hvsi_priv *pv, struct hvc_struct *hp);
 extern int hvsilib_read_mctrl(struct hvsi_priv *pv);
 extern int hvsilib_write_mctrl(struct hvsi_priv *pv, int dtr);
 extern void hvsilib_establish(struct hvsi_priv *pv);
-extern int hvsilib_get_chars(struct hvsi_priv *pv, char *buf, int count);
-extern int hvsilib_put_chars(struct hvsi_priv *pv, const char *buf, int count);
+extern ssize_t hvsilib_get_chars(struct hvsi_priv *pv, u8 *buf, size_t count);
+extern ssize_t hvsilib_put_chars(struct hvsi_priv *pv, const u8 *buf,
+				 size_t count);
 
 #endif /* _HVSI_H */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index b66b0c615f4f..af304e6cb486 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -313,9 +313,11 @@ extern int early_init_dt_scan_recoverable_ranges(unsigned long node,
 				 const char *uname, int depth, void *data);
 void __init opal_configure_cores(void);
 
-extern int opal_get_chars(uint32_t vtermno, char *buf, int count);
-extern int opal_put_chars(uint32_t vtermno, const char *buf, int total_len);
-extern int opal_put_chars_atomic(uint32_t vtermno, const char *buf, int total_len);
+extern ssize_t opal_get_chars(uint32_t vtermno, u8 *buf, size_t count);
+extern ssize_t opal_put_chars(uint32_t vtermno, const u8 *buf,
+			      size_t total_len);
+extern ssize_t opal_put_chars_atomic(uint32_t vtermno, const u8 *buf,
+				     size_t total_len);
 extern int opal_flush_chars(uint32_t vtermno, bool wait);
 extern int opal_flush_console(uint32_t vtermno);
 
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index cdf3838f08d3..45dd77e3ccf6 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -424,7 +424,7 @@ static int __init opal_message_init(struct device_node *opal_node)
 	return 0;
 }
 
-int opal_get_chars(uint32_t vtermno, char *buf, int count)
+ssize_t opal_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 {
 	s64 rc;
 	__be64 evt, len;
@@ -441,10 +441,11 @@ int opal_get_chars(uint32_t vtermno, char *buf, int count)
 	return 0;
 }
 
-static int __opal_put_chars(uint32_t vtermno, const char *data, int total_len, bool atomic)
+static ssize_t __opal_put_chars(uint32_t vtermno, const u8 *data,
+				size_t total_len, bool atomic)
 {
 	unsigned long flags = 0 /* shut up gcc */;
-	int written;
+	ssize_t written;
 	__be64 olen;
 	s64 rc;
 
@@ -484,7 +485,7 @@ static int __opal_put_chars(uint32_t vtermno, const char *data, int total_len, b
 		if (atomic) {
 			/* Should not happen */
 			pr_warn("atomic console write returned partial "
-				"len=%d written=%d\n", total_len, written);
+				"len=%zu written=%zd\n", total_len, written);
 		}
 		if (!written)
 			written = -EAGAIN;
@@ -497,7 +498,7 @@ static int __opal_put_chars(uint32_t vtermno, const char *data, int total_len, b
 	return written;
 }
 
-int opal_put_chars(uint32_t vtermno, const char *data, int total_len)
+ssize_t opal_put_chars(uint32_t vtermno, const u8 *data, size_t total_len)
 {
 	return __opal_put_chars(vtermno, data, total_len, false);
 }
@@ -508,7 +509,8 @@ int opal_put_chars(uint32_t vtermno, const char *data, int total_len)
  * true at the moment because console space can race with OPAL's console
  * writes.
  */
-int opal_put_chars_atomic(uint32_t vtermno, const char *data, int total_len)
+ssize_t opal_put_chars_atomic(uint32_t vtermno, const u8 *data,
+			      size_t total_len)
 {
 	return __opal_put_chars(vtermno, data, total_len, true);
 }
diff --git a/arch/powerpc/platforms/pseries/hvconsole.c b/arch/powerpc/platforms/pseries/hvconsole.c
index 1ac52963e08b..8803c947998e 100644
--- a/arch/powerpc/platforms/pseries/hvconsole.c
+++ b/arch/powerpc/platforms/pseries/hvconsole.c
@@ -25,7 +25,7 @@
  *	firmware.
  * @count: not used?
  */
-int hvc_get_chars(uint32_t vtermno, char *buf, int count)
+ssize_t hvc_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 {
 	long ret;
 	unsigned long retbuf[PLPAR_HCALL_BUFSIZE];
@@ -52,7 +52,7 @@ EXPORT_SYMBOL(hvc_get_chars);
  *	firmware. Must be at least 16 bytes, even if count is less than 16.
  * @count: Send this number of characters.
  */
-int hvc_put_chars(uint32_t vtermno, const char *buf, int count)
+ssize_t hvc_put_chars(uint32_t vtermno, const u8 *buf, size_t count)
 {
 	unsigned long *lbuf = (unsigned long *) buf;
 	long ret;
diff --git a/drivers/char/virtio_console.c b/drivers/char/virtio_console.c
index 8abe599c1c07..035f89f1a251 100644
--- a/drivers/char/virtio_console.c
+++ b/drivers/char/virtio_console.c
@@ -650,7 +650,7 @@ static ssize_t __send_to_port(struct port *port, struct scatterlist *sg,
  * Give out the data that's requested from the buffer that we have
  * queued up.
  */
-static ssize_t fill_readbuf(struct port *port, char __user *out_buf,
+static ssize_t fill_readbuf(struct port *port, u8 __user *out_buf,
 			    size_t out_count, bool to_user)
 {
 	struct port_buffer *buf;
@@ -669,7 +669,7 @@ static ssize_t fill_readbuf(struct port *port, char __user *out_buf,
 		if (ret)
 			return -EFAULT;
 	} else {
-		memcpy((__force char *)out_buf, buf->buf + buf->offset,
+		memcpy((__force u8 *)out_buf, buf->buf + buf->offset,
 		       out_count);
 	}
 
@@ -1104,7 +1104,7 @@ static const struct file_operations port_fops = {
  * it to finish: inefficient in theory, but in practice
  * implementations will do it immediately.
  */
-static int put_chars(u32 vtermno, const char *buf, int count)
+static ssize_t put_chars(u32 vtermno, const u8 *buf, size_t count)
 {
 	struct port *port;
 	struct scatterlist sg[1];
@@ -1132,7 +1132,7 @@ static int put_chars(u32 vtermno, const char *buf, int count)
  * We call out to fill_readbuf that gets us the required data from the
  * buffers that are queued up.
  */
-static int get_chars(u32 vtermno, char *buf, int count)
+static ssize_t get_chars(u32 vtermno, u8 *buf, size_t count)
 {
 	struct port *port;
 
@@ -1143,7 +1143,7 @@ static int get_chars(u32 vtermno, char *buf, int count)
 	/* If we don't have an input queue yet, we can't get input. */
 	BUG_ON(!port->in_vq);
 
-	return fill_readbuf(port, (__force char __user *)buf, count, false);
+	return fill_readbuf(port, (__force u8 __user *)buf, count, false);
 }
 
 static void resize_console(struct port *port)
diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.h
index 4062f8ad84df..cf4c1af08a7c 100644
--- a/drivers/tty/hvc/hvc_console.h
+++ b/drivers/tty/hvc/hvc_console.h
@@ -52,8 +52,8 @@ struct hvc_struct {
 
 /* implemented by a low level driver */
 struct hv_ops {
-	int (*get_chars)(uint32_t vtermno, char *buf, int count);
-	int (*put_chars)(uint32_t vtermno, const char *buf, int count);
+	ssize_t (*get_chars)(uint32_t vtermno, u8 *buf, size_t count);
+	ssize_t (*put_chars)(uint32_t vtermno, const u8 *buf, size_t count);
 	int (*flush)(uint32_t vtermno, bool wait);
 
 	/* Callbacks for notification. Called in open, close and hangup */
diff --git a/drivers/tty/hvc/hvc_dcc.c b/drivers/tty/hvc/hvc_dcc.c
index 1751108cf763..e34505385ff6 100644
--- a/drivers/tty/hvc/hvc_dcc.c
+++ b/drivers/tty/hvc/hvc_dcc.c
@@ -26,10 +26,10 @@
 /* Lock to serialize access to DCC fifo */
 static DEFINE_SPINLOCK(dcc_lock);
 
-static DEFINE_KFIFO(inbuf, unsigned char, DCC_INBUF_SIZE);
-static DEFINE_KFIFO(outbuf, unsigned char, DCC_OUTBUF_SIZE);
+static DEFINE_KFIFO(inbuf, u8, DCC_INBUF_SIZE);
+static DEFINE_KFIFO(outbuf, u8, DCC_OUTBUF_SIZE);
 
-static void dcc_uart_console_putchar(struct uart_port *port, unsigned char ch)
+static void dcc_uart_console_putchar(struct uart_port *port, u8 ch)
 {
 	while (__dcc_getstatus() & DCC_STATUS_TX)
 		cpu_relax();
@@ -54,9 +54,9 @@ static int __init dcc_early_console_setup(struct earlycon_device *device,
 
 EARLYCON_DECLARE(dcc, dcc_early_console_setup);
 
-static int hvc_dcc_put_chars(uint32_t vt, const char *buf, int count)
+static ssize_t hvc_dcc_put_chars(uint32_t vt, const u8 *buf, size_t count)
 {
-	int i;
+	size_t i;
 
 	for (i = 0; i < count; i++) {
 		while (__dcc_getstatus() & DCC_STATUS_TX)
@@ -68,9 +68,9 @@ static int hvc_dcc_put_chars(uint32_t vt, const char *buf, int count)
 	return count;
 }
 
-static int hvc_dcc_get_chars(uint32_t vt, char *buf, int count)
+static ssize_t hvc_dcc_get_chars(uint32_t vt, u8 *buf, size_t count)
 {
-	int i;
+	size_t i;
 
 	for (i = 0; i < count; ++i)
 		if (__dcc_getstatus() & DCC_STATUS_RX)
@@ -149,8 +149,8 @@ static DECLARE_WORK(dcc_pwork, dcc_put_work);
  */
 static void dcc_get_work(struct work_struct *work)
 {
-	unsigned char ch;
 	unsigned long irqflags;
+	u8 ch;
 
 	/*
 	 * Read characters from DCC and put them into the input FIFO, as
@@ -172,10 +172,10 @@ static DECLARE_WORK(dcc_gwork, dcc_get_work);
  * Write characters directly to the DCC if we're on core 0 and the FIFO
  * is empty, or write them to the FIFO if we're not.
  */
-static int hvc_dcc0_put_chars(u32 vt, const char *buf, int count)
+static ssize_t hvc_dcc0_put_chars(u32 vt, const u8 *buf, size_t count)
 {
-	int len;
 	unsigned long irqflags;
+	ssize_t len;
 
 	if (!IS_ENABLED(CONFIG_HVC_DCC_SERIALIZE_SMP))
 		return hvc_dcc_put_chars(vt, buf, count);
@@ -211,10 +211,10 @@ static int hvc_dcc0_put_chars(u32 vt, const char *buf, int count)
  * Read characters directly from the DCC if we're on core 0 and the FIFO
  * is empty, or read them from the FIFO if we're not.
  */
-static int hvc_dcc0_get_chars(u32 vt, char *buf, int count)
+static ssize_t hvc_dcc0_get_chars(u32 vt, u8 *buf, size_t count)
 {
-	int len;
 	unsigned long irqflags;
+	ssize_t len;
 
 	if (!IS_ENABLED(CONFIG_HVC_DCC_SERIALIZE_SMP))
 		return hvc_dcc_get_chars(vt, buf, count);
diff --git a/drivers/tty/hvc/hvc_iucv.c b/drivers/tty/hvc/hvc_iucv.c
index 543f35ddf523..fdecc0d63731 100644
--- a/drivers/tty/hvc/hvc_iucv.c
+++ b/drivers/tty/hvc/hvc_iucv.c
@@ -215,11 +215,11 @@ static void destroy_tty_buffer_list(struct list_head *list)
  * If the IUCV path has been severed, then -EPIPE is returned to cause a
  * hang up (that is issued by the HVC layer).
  */
-static int hvc_iucv_write(struct hvc_iucv_private *priv,
-			  char *buf, int count, int *has_more_data)
+static ssize_t hvc_iucv_write(struct hvc_iucv_private *priv,
+			      u8 *buf, size_t count, int *has_more_data)
 {
 	struct iucv_tty_buffer *rb;
-	int written;
+	ssize_t written;
 	int rc;
 
 	/* immediately return if there is no IUCV connection */
@@ -312,10 +312,10 @@ static int hvc_iucv_write(struct hvc_iucv_private *priv,
  *		the routine locks the struct hvc_iucv_private->lock to call
  *		helper functions.
  */
-static int hvc_iucv_get_chars(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_iucv_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 {
 	struct hvc_iucv_private *priv = hvc_iucv_get_private(vtermno);
-	int written;
+	ssize_t written;
 	int has_more_data;
 
 	if (count <= 0)
@@ -352,8 +352,8 @@ static int hvc_iucv_get_chars(uint32_t vtermno, char *buf, int count)
  * If an existing IUCV communicaton path has been severed, -EPIPE is returned
  * (that can be passed to HVC layer to cause a tty hangup).
  */
-static int hvc_iucv_queue(struct hvc_iucv_private *priv, const char *buf,
-			  int count)
+static ssize_t hvc_iucv_queue(struct hvc_iucv_private *priv, const u8 *buf,
+			      size_t count)
 {
 	size_t len;
 
@@ -455,12 +455,12 @@ static void hvc_iucv_sndbuf_work(struct work_struct *work)
  * Locking:	The method gets called under an irqsave() spinlock; and
  *		locks struct hvc_iucv_private->lock.
  */
-static int hvc_iucv_put_chars(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_iucv_put_chars(uint32_t vtermno, const u8 *buf, size_t count)
 {
 	struct hvc_iucv_private *priv = hvc_iucv_get_private(vtermno);
 	int queued;
 
-	if (count <= 0)
+	if (!count)
 		return 0;
 
 	if (!priv)
diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
index 2cdf66e395cc..095c33ad10f8 100644
--- a/drivers/tty/hvc/hvc_opal.c
+++ b/drivers/tty/hvc/hvc_opal.c
@@ -58,7 +58,7 @@ static const struct hv_ops hvc_opal_raw_ops = {
 	.notifier_hangup = notifier_hangup_irq,
 };
 
-static int hvc_opal_hvsi_get_chars(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_opal_hvsi_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 {
 	struct hvc_opal_priv *pv = hvc_opal_privs[vtermno];
 
@@ -68,7 +68,8 @@ static int hvc_opal_hvsi_get_chars(uint32_t vtermno, char *buf, int count)
 	return hvsilib_get_chars(&pv->hvsi, buf, count);
 }
 
-static int hvc_opal_hvsi_put_chars(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_opal_hvsi_put_chars(uint32_t vtermno, const u8 *buf,
+				       size_t count)
 {
 	struct hvc_opal_priv *pv = hvc_opal_privs[vtermno];
 
diff --git a/drivers/tty/hvc/hvc_riscv_sbi.c b/drivers/tty/hvc/hvc_riscv_sbi.c
index 31f53fa77e4a..a72591279f86 100644
--- a/drivers/tty/hvc/hvc_riscv_sbi.c
+++ b/drivers/tty/hvc/hvc_riscv_sbi.c
@@ -15,9 +15,9 @@
 
 #include "hvc_console.h"
 
-static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_sbi_tty_put(uint32_t vtermno, const u8 *buf, size_t count)
 {
-	int i;
+	size_t i;
 
 	for (i = 0; i < count; i++)
 		sbi_console_putchar(buf[i]);
@@ -25,9 +25,10 @@ static int hvc_sbi_tty_put(uint32_t vtermno, const char *buf, int count)
 	return i;
 }
 
-static int hvc_sbi_tty_get(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_sbi_tty_get(uint32_t vtermno, u8 *buf, size_t count)
 {
-	int i, c;
+	size_t i;
+	int c;
 
 	for (i = 0; i < count; i++) {
 		c = sbi_console_getchar();
diff --git a/drivers/tty/hvc/hvc_rtas.c b/drivers/tty/hvc/hvc_rtas.c
index 184d325abeed..a0b90275b37f 100644
--- a/drivers/tty/hvc/hvc_rtas.c
+++ b/drivers/tty/hvc/hvc_rtas.c
@@ -31,10 +31,10 @@ static struct hvc_struct *hvc_rtas_dev;
 static int rtascons_put_char_token = RTAS_UNKNOWN_SERVICE;
 static int rtascons_get_char_token = RTAS_UNKNOWN_SERVICE;
 
-static inline int hvc_rtas_write_console(uint32_t vtermno, const char *buf,
-		int count)
+static ssize_t hvc_rtas_write_console(uint32_t vtermno, const u8 *buf,
+				      size_t count)
 {
-	int i;
+	size_t i;
 
 	for (i = 0; i < count; i++) {
 		if (rtas_call(rtascons_put_char_token, 1, 1, NULL, buf[i]))
@@ -44,9 +44,10 @@ static inline int hvc_rtas_write_console(uint32_t vtermno, const char *buf,
 	return i;
 }
 
-static int hvc_rtas_read_console(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_rtas_read_console(uint32_t vtermno, u8 *buf, size_t count)
 {
-	int i, c;
+	size_t i;
+	int c;
 
 	for (i = 0; i < count; i++) {
 		if (rtas_call(rtascons_get_char_token, 0, 2, &c))
diff --git a/drivers/tty/hvc/hvc_udbg.c b/drivers/tty/hvc/hvc_udbg.c
index ff0dcc56413c..fdc2699b78dc 100644
--- a/drivers/tty/hvc/hvc_udbg.c
+++ b/drivers/tty/hvc/hvc_udbg.c
@@ -19,9 +19,9 @@
 
 static struct hvc_struct *hvc_udbg_dev;
 
-static int hvc_udbg_put(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvc_udbg_put(uint32_t vtermno, const u8 *buf, size_t count)
 {
-	int i;
+	size_t i;
 
 	for (i = 0; i < count && udbg_putc; i++)
 		udbg_putc(buf[i]);
@@ -29,9 +29,10 @@ static int hvc_udbg_put(uint32_t vtermno, const char *buf, int count)
 	return i;
 }
 
-static int hvc_udbg_get(uint32_t vtermno, char *buf, int count)
+static ssize_t hvc_udbg_get(uint32_t vtermno, u8 *buf, size_t count)
 {
-	int i, c;
+	size_t i;
+	int c;
 
 	if (!udbg_getc_poll)
 		return 0;
diff --git a/drivers/tty/hvc/hvc_vio.c b/drivers/tty/hvc/hvc_vio.c
index 736b230f5ec0..47930601a26a 100644
--- a/drivers/tty/hvc/hvc_vio.c
+++ b/drivers/tty/hvc/hvc_vio.c
@@ -58,20 +58,20 @@ struct hvterm_priv {
 	hv_protocol_t		proto;	/* Raw data or HVSI packets */
 	struct hvsi_priv	hvsi;	/* HVSI specific data */
 	spinlock_t		buf_lock;
-	char			buf[SIZE_VIO_GET_CHARS];
-	int			left;
-	int			offset;
+	u8			buf[SIZE_VIO_GET_CHARS];
+	size_t			left;
+	size_t			offset;
 };
 static struct hvterm_priv *hvterm_privs[MAX_NR_HVC_CONSOLES];
 /* For early boot console */
 static struct hvterm_priv hvterm_priv0;
 
-static int hvterm_raw_get_chars(uint32_t vtermno, char *buf, int count)
+static ssize_t hvterm_raw_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 {
 	struct hvterm_priv *pv = hvterm_privs[vtermno];
 	unsigned long i;
 	unsigned long flags;
-	int got;
+	size_t got;
 
 	if (WARN_ON(!pv))
 		return 0;
@@ -115,7 +115,8 @@ static int hvterm_raw_get_chars(uint32_t vtermno, char *buf, int count)
  *       you are sending fewer chars.
  * @count: number of chars to send.
  */
-static int hvterm_raw_put_chars(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvterm_raw_put_chars(uint32_t vtermno, const u8 *buf,
+				    size_t count)
 {
 	struct hvterm_priv *pv = hvterm_privs[vtermno];
 
@@ -133,7 +134,7 @@ static const struct hv_ops hvterm_raw_ops = {
 	.notifier_hangup = notifier_hangup_irq,
 };
 
-static int hvterm_hvsi_get_chars(uint32_t vtermno, char *buf, int count)
+static ssize_t hvterm_hvsi_get_chars(uint32_t vtermno, u8 *buf, size_t count)
 {
 	struct hvterm_priv *pv = hvterm_privs[vtermno];
 
@@ -143,7 +144,8 @@ static int hvterm_hvsi_get_chars(uint32_t vtermno, char *buf, int count)
 	return hvsilib_get_chars(&pv->hvsi, buf, count);
 }
 
-static int hvterm_hvsi_put_chars(uint32_t vtermno, const char *buf, int count)
+static ssize_t hvterm_hvsi_put_chars(uint32_t vtermno, const u8 *buf,
+				     size_t count)
 {
 	struct hvterm_priv *pv = hvterm_privs[vtermno];
 
diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 34c01874f45b..0e497501f8e3 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -84,13 +84,13 @@ static inline void notify_daemon(struct xencons_info *cons)
 	notify_remote_via_evtchn(cons->evtchn);
 }
 
-static int __write_console(struct xencons_info *xencons,
-		const char *data, int len)
+static ssize_t __write_console(struct xencons_info *xencons,
+			       const u8 *data, size_t len)
 {
 	XENCONS_RING_IDX cons, prod;
 	struct xencons_interface *intf = xencons->intf;
-	int sent = 0;
 	unsigned long flags;
+	size_t sent = 0;
 
 	spin_lock_irqsave(&xencons->ring_lock, flags);
 	cons = intf->out_cons;
@@ -115,10 +115,11 @@ static int __write_console(struct xencons_info *xencons,
 	return sent;
 }
 
-static int domU_write_console(uint32_t vtermno, const char *data, int len)
+static ssize_t domU_write_console(uint32_t vtermno, const u8 *data, size_t len)
 {
-	int ret = len;
 	struct xencons_info *cons = vtermno_to_xencons(vtermno);
+	size_t ret = len;
+
 	if (cons == NULL)
 		return -EINVAL;
 
@@ -129,7 +130,7 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
 	 * kernel is crippled.
 	 */
 	while (len) {
-		int sent = __write_console(cons, data, len);
+		ssize_t sent = __write_console(cons, data, len);
 
 		if (sent < 0)
 			return sent;
@@ -144,14 +145,14 @@ static int domU_write_console(uint32_t vtermno, const char *data, int len)
 	return ret;
 }
 
-static int domU_read_console(uint32_t vtermno, char *buf, int len)
+static ssize_t domU_read_console(uint32_t vtermno, u8 *buf, size_t len)
 {
 	struct xencons_interface *intf;
 	XENCONS_RING_IDX cons, prod;
-	int recv = 0;
 	struct xencons_info *xencons = vtermno_to_xencons(vtermno);
 	unsigned int eoiflag = 0;
 	unsigned long flags;
+	size_t recv = 0;
 
 	if (xencons == NULL)
 		return -EINVAL;
@@ -209,7 +210,7 @@ static const struct hv_ops domU_hvc_ops = {
 	.notifier_hangup = notifier_hangup_irq,
 };
 
-static int dom0_read_console(uint32_t vtermno, char *buf, int len)
+static ssize_t dom0_read_console(uint32_t vtermno, u8 *buf, size_t len)
 {
 	return HYPERVISOR_console_io(CONSOLEIO_read, len, buf);
 }
@@ -218,9 +219,9 @@ static int dom0_read_console(uint32_t vtermno, char *buf, int len)
  * Either for a dom0 to write to the system console, or a domU with a
  * debug version of Xen
  */
-static int dom0_write_console(uint32_t vtermno, const char *str, int len)
+static ssize_t dom0_write_console(uint32_t vtermno, const u8 *str, size_t len)
 {
-	int rc = HYPERVISOR_console_io(CONSOLEIO_write, len, (char *)str);
+	int rc = HYPERVISOR_console_io(CONSOLEIO_write, len, (u8 *)str);
 	if (rc < 0)
 		return rc;
 
diff --git a/drivers/tty/hvc/hvsi_lib.c b/drivers/tty/hvc/hvsi_lib.c
index 09289c8154ae..22e1bc4d8a66 100644
--- a/drivers/tty/hvc/hvsi_lib.c
+++ b/drivers/tty/hvc/hvsi_lib.c
@@ -12,7 +12,7 @@ static int hvsi_send_packet(struct hvsi_priv *pv, struct hvsi_header *packet)
 	packet->seqno = cpu_to_be16(atomic_inc_return(&pv->seqno));
 
 	/* Assumes that always succeeds, works in practice */
-	return pv->put_chars(pv->termno, (char *)packet, packet->len);
+	return pv->put_chars(pv->termno, (u8 *)packet, packet->len);
 }
 
 static void hvsi_start_handshake(struct hvsi_priv *pv)
@@ -178,9 +178,10 @@ static int hvsi_get_packet(struct hvsi_priv *pv)
 	return 0;
 }
 
-int hvsilib_get_chars(struct hvsi_priv *pv, char *buf, int count)
+ssize_t hvsilib_get_chars(struct hvsi_priv *pv, u8 *buf, size_t count)
 {
-	unsigned int tries, read = 0;
+	unsigned int tries;
+	size_t read = 0;
 
 	if (WARN_ON(!pv))
 		return -ENXIO;
@@ -199,7 +200,7 @@ int hvsilib_get_chars(struct hvsi_priv *pv, char *buf, int count)
 	for (tries = 1; count && tries < 2; tries++) {
 		/* Consume existing data packet */
 		if (pv->inbuf_pktlen) {
-			unsigned int l = min(count, (int)pv->inbuf_pktlen);
+			size_t l = min(count, pv->inbuf_pktlen);
 			memcpy(&buf[read], &pv->inbuf[pv->inbuf_cur], l);
 			pv->inbuf_cur += l;
 			pv->inbuf_pktlen -= l;
@@ -228,10 +229,11 @@ int hvsilib_get_chars(struct hvsi_priv *pv, char *buf, int count)
 	return read;
 }
 
-int hvsilib_put_chars(struct hvsi_priv *pv, const char *buf, int count)
+ssize_t hvsilib_put_chars(struct hvsi_priv *pv, const u8 *buf, size_t count)
 {
 	struct hvsi_data dp;
-	int rc, adjcount = min(count, HVSI_MAX_OUTGOING_DATA);
+	size_t adjcount = min_t(size_t, count, HVSI_MAX_OUTGOING_DATA);
+	int rc;
 
 	if (WARN_ON(!pv))
 		return -ENODEV;
@@ -411,9 +413,9 @@ void hvsilib_close(struct hvsi_priv *pv, struct hvc_struct *hp)
 }
 
 void hvsilib_init(struct hvsi_priv *pv,
-		  int (*get_chars)(uint32_t termno, char *buf, int count),
-		  int (*put_chars)(uint32_t termno, const char *buf,
-				   int count),
+		  ssize_t (*get_chars)(uint32_t termno, u8 *buf, size_t count),
+		  ssize_t (*put_chars)(uint32_t termno, const u8 *buf,
+				       size_t count),
 		  int termno, int is_console)
 {
 	memset(pv, 0, sizeof(*pv));
-- 
2.43.0

