Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F14AA4AB067
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Feb 2022 16:51:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JsDKg5bNpz3cR0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 02:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=home.drummond.us header.i=@home.drummond.us header.a=rsa-sha256 header.s=default header.b=DhtOVt4f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=home.drummond.us (client-ip=74.95.14.229;
 helo=talisker.home.drummond.us; envelope-from=walt@home.drummond.us;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=home.drummond.us header.i=@home.drummond.us
 header.a=rsa-sha256 header.s=default header.b=DhtOVt4f; 
 dkim-atps=neutral
Received: from talisker.home.drummond.us (drummond.us [74.95.14.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JsDJM28VRz2xrj
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Feb 2022 02:50:41 +1100 (AEDT)
Received: from talisker.home.drummond.us (localhost [127.0.0.1])
 by talisker.home.drummond.us (8.15.2/8.15.2/Debian-20) with ESMTP id
 216FnCIm2355965; Sun, 6 Feb 2022 07:49:12 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=home.drummond.us;
 s=default; t=1644162552;
 bh=C0SGrdD0bHER6z6tzFAueoA7f+uAqZowOEaDKBDt4aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DhtOVt4f61DooeJVSmXijShgM7VraTmww4/6eaVCj2rydDXgCMSB/Y13Vi1m/3xDx
 KV8lyPqjGDJhQlqio1792gXowICHBJEZLXO3uuC8D1VtUxCDjUnQjeKpj53jf/GA+D
 20HhEk4r4bWbXrLtDH++IkNTDsNvg1gcURNN/WB/k12SBS4tqAqbHwNb7jwmEsNH7o
 smPrQYVQikvzCPQGnL3RjGt9NeVnXWUXstMvHQCetN1Did/caYW0cD764om3kwBCMv
 5/nArkFHBskLMQijfGlWBT9yfWP/dL+CTlvoygh8VMvinOSjdc60d/T+TfuM8QiIkW
 Dcw5LLKBwZRCg==
Received: (from walt@localhost)
 by talisker.home.drummond.us (8.15.2/8.15.2/Submit) id 216FnBsV2355964;
 Sun, 6 Feb 2022 07:49:11 -0800
From: Walt Drummond <walt@drummond.us>
To: agordeev@linux.ibm.com, arnd@arndb.de, benh@kernel.crashing.org,
 borntraeger@de.ibm.com, chris@zankel.net, davem@davemloft.net,
 gregkh@linuxfoundation.org, hca@linux.ibm.com, deller@gmx.de,
 ink@jurassic.park.msu.ru, James.Bottomley@HansenPartnership.com,
 jirislaby@kernel.org, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, paulus@samba.org, rth@twiddle.net, dalias@libc.org,
 tsbogend@alpha.franken.de, gor@linux.ibm.com, ysato@users.osdn.me
Subject: [PATCH v2 1/3] vstatus: Allow the n_tty line dicipline to write to a
 user tty
Date: Sun,  6 Feb 2022 07:48:52 -0800
Message-Id: <20220206154856.2355838-2-walt@drummond.us>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220206154856.2355838-1-walt@drummond.us>
References: <20220206154856.2355838-1-walt@drummond.us>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-xtensa@linux-xtensa.org, walt@drummond.us,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, ar@cs.msu.ru,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refactor the implementation of n_tty_write() into do_n_tty_write(),
and change n_tty_write() to call do_n_tty_write() after acquiring
tty.termios_rwsem.

This allows the n_tty line dicipline to write to a user tty via
do_n_tty_write() when already holding tty.termios_rwsem.

Signed-off-by: Walt Drummond <walt@drummond.us>
---
 drivers/tty/n_tty.c | 69 +++++++++++++++++++++++++++------------------
 include/linux/tty.h |  2 +-
 2 files changed, 42 insertions(+), 29 deletions(-)

diff --git a/drivers/tty/n_tty.c b/drivers/tty/n_tty.c
index 0ec93f1a61f5..64a058a4c63b 100644
--- a/drivers/tty/n_tty.c
+++ b/drivers/tty/n_tty.c
@@ -2231,45 +2231,24 @@ static ssize_t n_tty_read(struct tty_struct *tty, struct file *file,
 	return retval;
 }
 
-/**
- *	n_tty_write		-	write function for tty
- *	@tty: tty device
- *	@file: file object
- *	@buf: userspace buffer pointer
- *	@nr: size of I/O
- *
- *	Write function of the terminal device.  This is serialized with
- *	respect to other write callers but not to termios changes, reads
- *	and other such events.  Since the receive code will echo characters,
- *	thus calling driver write methods, the output_lock is used in
- *	the output processing functions called here as well as in the
- *	echo processing function to protect the column state and space
- *	left in the buffer.
- *
- *	This code must be sure never to sleep through a hangup.
- *
- *	Locking: output_lock to protect column state and space left
- *		 (note that the process_output*() functions take this
- *		  lock themselves)
- */
-
-static ssize_t n_tty_write(struct tty_struct *tty, struct file *file,
-			   const unsigned char *buf, size_t nr)
+static ssize_t do_n_tty_write(struct tty_struct *tty, struct file *file,
+			      const unsigned char *buf, size_t nr)
 {
 	const unsigned char *b = buf;
 	DEFINE_WAIT_FUNC(wait, woken_wake_function);
 	int c;
 	ssize_t retval = 0;
 
+	lockdep_assert_held_read(&tty->termios_rwsem);
+
 	/* Job control check -- must be done at start (POSIX.1 7.1.1.4). */
-	if (L_TOSTOP(tty) && file->f_op->write_iter != redirected_tty_write) {
+	if (L_TOSTOP(tty) &&
+	    !(file && file->f_op->write_iter != redirected_tty_write)) {
 		retval = tty_check_change(tty);
 		if (retval)
 			return retval;
 	}
 
-	down_read(&tty->termios_rwsem);
-
 	/* Write out any echoed characters that are still pending */
 	process_echoes(tty);
 
@@ -2336,10 +2315,44 @@ static ssize_t n_tty_write(struct tty_struct *tty, struct file *file,
 	remove_wait_queue(&tty->write_wait, &wait);
 	if (nr && tty->fasync)
 		set_bit(TTY_DO_WRITE_WAKEUP, &tty->flags);
-	up_read(&tty->termios_rwsem);
+
 	return (b - buf) ? b - buf : retval;
 }
 
+/**
+ *	n_tty_write		-	write function for tty
+ *	@tty: tty device
+ *	@file: file object
+ *	@buf: userspace buffer pointer
+ *	@nr: size of I/O
+ *
+ *	Write function of the terminal device.  This is serialized with
+ *	respect to other write callers but not to termios changes, reads
+ *	and other such events.  Since the receive code will echo characters,
+ *	thus calling driver write methods, the output_lock is used in
+ *	the output processing functions called here as well as in the
+ *	echo processing function to protect the column state and space
+ *	left in the buffer.
+ *
+ *	This code must be sure never to sleep through a hangup.
+ *
+ *	Locking: output_lock to protect column state and space left
+ *		 (note that the process_output*() functions take this
+ *		  lock themselves)
+ */
+
+static ssize_t n_tty_write(struct tty_struct *tty, struct file *file,
+			   const unsigned char *buf, size_t nr)
+{
+	ssize_t retval = 0;
+
+	down_read(&tty->termios_rwsem);
+	retval = do_n_tty_write(tty, file, buf, nr);
+	up_read(&tty->termios_rwsem);
+
+	return retval;
+}
+
 /**
  *	n_tty_poll		-	poll method for N_TTY
  *	@tty: terminal device
diff --git a/include/linux/tty.h b/include/linux/tty.h
index 168e57e40bbb..cbe5d535a69d 100644
--- a/include/linux/tty.h
+++ b/include/linux/tty.h
@@ -237,7 +237,7 @@ struct tty_file_private {
 
 static inline bool tty_io_nonblock(struct tty_struct *tty, struct file *file)
 {
-	return file->f_flags & O_NONBLOCK ||
+	return (file && file->f_flags & O_NONBLOCK) ||
 		test_bit(TTY_LDISC_CHANGING, &tty->flags);
 }
 
-- 
2.30.2

