Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B55C918751
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 18:26:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FguW4hKE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8Rsv3plTz3cNj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 02:26:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FguW4hKE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8RsB1RXXz30W8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 02:26:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0B50161BC2;
	Wed, 26 Jun 2024 16:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7728C116B1;
	Wed, 26 Jun 2024 16:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719419163;
	bh=GAWylhdOcvosi/+tg4zAZrTIoC6PCFwLB0e0teIJHnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FguW4hKEq944Yj80w28xR3oois6jmD3GQj+a5a+wnGZH+NoYwEOxgP1WoAwOpvFrD
	 7+lySWTpa7AAq4YT8550GFbZcgZLRVAWQ+V/zTjdMESGtv566fsPSoNhSgNVwhANmF
	 74jQReC/V+fSEh2WFsfw/XGhjxYbDWn+6sSTTsbjRIiyS4zvssb5r72hadLAI/e3ok
	 CLtrIejvidOAiHUUXV4myZrcEo4ZzzQ7w1ZlYsb5q3gc2XidvT2v/mbBD8tOGoCyKw
	 H2YJ1gW4TYKVWQRsE372s3YKqAW1kH/QhKkSH9VY5OrUGLwmON8QIr9OdPPwjB24Qw
	 SdXcHlgdfoUGA==
Date: Wed, 26 Jun 2024 09:26:03 -0700
From: Kees Cook <kees@kernel.org>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH] printk: Add a short description string to kmsg_dump()
Message-ID: <202406260906.533095B1@keescook>
References: <20240625123954.211184-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625123954.211184-1-jfalempe@redhat.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Vignesh Raghavendra <vigneshr@ti.com>, Uros Bizjak <ubizjak@gmail.com>, linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>, "K. Y. Srinivasan" <kys@microsoft.com>, David Airlie <airlied@gmail.com>, Wei Liu <wei.liu@kernel.org>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Dexuan Cui <decui@microsoft.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Petr Mladek <pmladek@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>, John Ogness <john.ogness@linutronix.de>, Jani Nikula <jani.nikula@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, Tony Luck <tony.luck@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Sergey Senozhatsky <senozhatsky@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, Richard Weinberger <richard@nod.at>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 25, 2024 at 02:39:29PM +0200, Jocelyn Falempe wrote:
> kmsg_dump doesn't forward the panic reason string to the kmsg_dumper
> callback.
> This patch adds a new parameter "const char *desc" to the kmsg_dumper
> dump() callback, and update all drivers that are using it.
> 
> To avoid updating all kmsg_dump() call, it adds a kmsg_dump_desc()
> function and a macro for backward compatibility.
> 
> I've written this for drm_panic, but it can be useful for other
> kmsg_dumper.
> It allows to see the panic reason, like "sysrq triggered crash"
> or "VFS: Unable to mount root fs on xxxx" on the drm panic screen.

Seems reasonable. Given the prototype before/after:

dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason)

dump(struct kmsg_dumper *dumper, enum kmsg_dump_reason reason,
     const char *desc)

Perhaps this should instead be a struct that the panic fills in? Then
it'll be easy to adjust the struct in the future:

struct kmsg_dump_detail {
	enum kmsg_dump_reason reason;
	const char *description;
};

dump(struct kmsg_dumper *dumper, struct kmsg_dump *detail)

This .cocci could do the conversion:


@ dump_func @
identifier DUMPER, CALLBACK;
@@

  struct kmsg_dumper DUMPER = {
    .dump = CALLBACK,
  };

@ detail @
identifier dump_func.CALLBACK;
identifier DUMPER, REASON;
@@

	CALLBACK(struct kmsg_dumper *DUMPER,
-		 enum kmsg_dump_reason REASON
+		 struct kmsg_dump_detail *detail
		)
	{
		<...
-		REASON
+		detail->reason
		...>
	}


Also, just to double-check, doesn't the panic reason show up in the
kmsg_dump log itself (at the end?) I ask since for pstore, "desc" is
likely redundant since it's capturing the entire console log.

-Kees

Here's the patch from the above cocci:


diff -u -p a/drivers/hv/hv_common.c b/drivers/hv/hv_common.c
--- a/drivers/hv/hv_common.c
+++ b/drivers/hv/hv_common.c
@@ -207,13 +207,13 @@ static int hv_die_panic_notify_crash(str
  * buffer and call into Hyper-V to transfer the data.
  */
 static void hv_kmsg_dump(struct kmsg_dumper *dumper,
-			 enum kmsg_dump_reason reason)
+			 struct kmsg_dump_detail *detail)
 {
 	struct kmsg_dump_iter iter;
 	size_t bytes_written;
 
 	/* We are only interested in panics. */
-	if (reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
+	if (detail->reason != KMSG_DUMP_PANIC || !sysctl_record_panic_msg)
 		return;
 
 	/*
diff -u -p a/arch/powerpc/platforms/powernv/opal-kmsg.c b/arch/powerpc/platforms/powernv/opal-kmsg.c
--- a/arch/powerpc/platforms/powernv/opal-kmsg.c
+++ b/arch/powerpc/platforms/powernv/opal-kmsg.c
@@ -20,13 +20,13 @@
  * message, it just ensures that OPAL completely flushes the console buffer.
  */
 static void kmsg_dump_opal_console_flush(struct kmsg_dumper *dumper,
-				     enum kmsg_dump_reason reason)
+				     struct kmsg_dump_detail *detail)
 {
 	/*
 	 * Outside of a panic context the pollers will continue to run,
 	 * so we don't need to do any special flushing.
 	 */
-	if (reason != KMSG_DUMP_PANIC)
+	if (detail->reason != KMSG_DUMP_PANIC)
 		return;
 
 	opal_flush_console(0);
diff -u -p a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -73,7 +73,7 @@ static const char *nvram_os_partitions[]
 };
 
 static void oops_to_nvram(struct kmsg_dumper *dumper,
-			  enum kmsg_dump_reason reason);
+			  struct kmsg_dump_detail *detail);
 
 static struct kmsg_dumper nvram_kmsg_dumper = {
 	.dump = oops_to_nvram
@@ -643,7 +643,7 @@ void __init nvram_init_oops_partition(in
  * partition.  If that's too much, go back and capture uncompressed text.
  */
 static void oops_to_nvram(struct kmsg_dumper *dumper,
-			  enum kmsg_dump_reason reason)
+			  struct kmsg_dump_detail *detail)
 {
 	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
 	static unsigned int oops_count = 0;
@@ -655,7 +655,7 @@ static void oops_to_nvram(struct kmsg_du
 	unsigned int err_type = ERR_TYPE_KERNEL_PANIC_GZ;
 	int rc = -1;
 
-	switch (reason) {
+	switch (detail->reason) {
 	case KMSG_DUMP_SHUTDOWN:
 		/* These are almost always orderly shutdowns. */
 		return;
@@ -671,7 +671,7 @@ static void oops_to_nvram(struct kmsg_du
 		break;
 	default:
 		pr_err("%s: ignoring unrecognized KMSG_DUMP_* reason %d\n",
-		       __func__, (int) reason);
+		       __func__, (int) detail->reason);
 		return;
 	}
 
warning: detail, node 59: record.reason = ... ;[1,2,21,22,32] in pstore_dump may be inconsistently modified
warning: detail, node 105: if[1,2,21,22,54] in pstore_dump may be inconsistently modified
diff -u -p a/fs/pstore/platform.c b/fs/pstore/platform.c
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -275,7 +275,7 @@ void pstore_record_init(struct pstore_re
  * end of the buffer.
  */
 static void pstore_dump(struct kmsg_dumper *dumper,
-			enum kmsg_dump_reason reason)
+			struct kmsg_dump_detail *detail)
 {
 	struct kmsg_dump_iter iter;
 	unsigned long	total = 0;
@@ -285,9 +285,9 @@ static void pstore_dump(struct kmsg_dump
 	int		saved_ret = 0;
 	int		ret;
 
-	why = kmsg_dump_reason_str(reason);
+	why = kmsg_dump_reason_str(detail->reason);
 
-	if (pstore_cannot_block_path(reason)) {
+	if (pstore_cannot_block_path(detail->reason)) {
 		if (!spin_trylock_irqsave(&psinfo->buf_lock, flags)) {
 			pr_err("dump skipped in %s path because of concurrent dump\n",
 					in_nmi() ? "NMI" : why);
@@ -311,7 +311,7 @@ static void pstore_dump(struct kmsg_dump
 		pstore_record_init(&record, psinfo);
 		record.type = PSTORE_TYPE_DMESG;
 		record.count = oopscount;
-		record.reason = reason;
+		record.reason = detail->reason;
 		record.part = part;
 		record.buf = psinfo->buf;
 
@@ -352,7 +352,7 @@ static void pstore_dump(struct kmsg_dump
 		}
 
 		ret = psinfo->write(&record);
-		if (ret == 0 && reason == KMSG_DUMP_OOPS) {
+		if (ret == 0 && detail->reason == KMSG_DUMP_OOPS) {
 			pstore_new_entry = 1;
 			pstore_timer_kick();
 		} else {
diff -u -p a/arch/um/kernel/kmsg_dump.c b/arch/um/kernel/kmsg_dump.c
--- a/arch/um/kernel/kmsg_dump.c
+++ b/arch/um/kernel/kmsg_dump.c
@@ -8,7 +8,7 @@
 #include <os.h>
 
 static void kmsg_dumper_stdout(struct kmsg_dumper *dumper,
-				enum kmsg_dump_reason reason)
+				struct kmsg_dump_detail *detail)
 {
 	static struct kmsg_dump_iter iter;
 	static DEFINE_SPINLOCK(lock);

-- 
Kees Cook
