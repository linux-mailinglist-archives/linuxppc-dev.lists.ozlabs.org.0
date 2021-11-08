Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D05E4481F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 15:36:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HntwL3v2fz2yqC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 01:36:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=Upd25Hzf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=5.9.137.197; helo=mail.skyhub.de;
 envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=Upd25Hzf; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [5.9.137.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hntvg0HQ9z2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 01:35:58 +1100 (AEDT)
Received: from zn.tnic (p200300ec2f331100b486bab6e60d7aaf.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f33:1100:b486:bab6:e60d:7aaf])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 1A75E1EC01FC;
 Mon,  8 Nov 2021 15:35:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1636382156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:in-reply-to:in-reply-to:  references:references;
 bh=B6oOQ1q4gjLTOu5usgfET43xDRmf4tLazw1TZ6CRXFw=;
 b=Upd25HzfEqhrG5TAXmV4X7VLTXjG+2mbIZvAcNaA5XdFGwWxC22cjGdH367SqKuC2YI35V
 XePkT+plNO8Rcdx9qRLbflORPHDjzc4q/HfinrM2oVoUmKJ3f3FbXqZbeiIVI7zzNRafCc
 NDGlsVX5pxz7i7hCYlNzvvCrAxbHbAs=
Date: Mon, 8 Nov 2021 15:35:50 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alan Stern <stern@rowland.harvard.edu>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v0 00/42] notifiers: Return an error when callback is
 already registered
Message-ID: <YYk1xi3eJdMJdjHC@zn.tnic>
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101924.15759-1-bp@alien8.de>
 <20211108141703.GB1666297@rowland.harvard.edu>
 <YYkzJ3+faVga2Tl3@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YYkzJ3+faVga2Tl3@zn.tnic>
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
Cc: alsa-devel@alsa-project.org, x86@kernel.org, linux-sh@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 netdev@vger.kernel.org, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Rohit Maheshwari <rohitm@chelsio.com>,
 linux-staging@lists.linux.dev, bcm-kernel-feedback-list@broadcom.com,
 xen-devel@lists.xenproject.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-renesas-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 08, 2021 at 03:24:39PM +0100, Borislav Petkov wrote:
> I guess I can add another indirection to notifier_chain_register() and
> avoid touching all the call sites.

IOW, something like this below.

This way I won't have to touch all the callsites and the registration
routines would still return a proper value instead of returning 0
unconditionally.

---
diff --git a/kernel/notifier.c b/kernel/notifier.c
index b8251dc0bc0f..04f08b2ef17f 100644
--- a/kernel/notifier.c
+++ b/kernel/notifier.c
@@ -19,14 +19,12 @@ BLOCKING_NOTIFIER_HEAD(reboot_notifier_list);
  *	are layered on top of these, with appropriate locking added.
  */
 
-static int notifier_chain_register(struct notifier_block **nl,
-		struct notifier_block *n)
+static int __notifier_chain_register(struct notifier_block **nl,
+				     struct notifier_block *n)
 {
 	while ((*nl) != NULL) {
-		if (unlikely((*nl) == n)) {
-			WARN(1, "double register detected");
-			return 0;
-		}
+		if (unlikely((*nl) == n))
+			return -EEXIST;
 		if (n->priority > (*nl)->priority)
 			break;
 		nl = &((*nl)->next);
@@ -36,6 +34,18 @@ static int notifier_chain_register(struct notifier_block **nl,
 	return 0;
 }
 
+static int notifier_chain_register(struct notifier_block **nl,
+				   struct notifier_block *n)
+{
+	int ret = __notifier_chain_register(nl, n);
+
+	if (ret == -EEXIST)
+		WARN(1, "double register of notifier callback %ps detected",
+			n->notifier_call);
+
+	return ret;
+}
+
 static int notifier_chain_unregister(struct notifier_block **nl,
 		struct notifier_block *n)
 {


-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
