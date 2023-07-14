Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E687534A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 10:08:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lh7vIr6c;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QGMxHCNv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2PHd3Zqtz3dGm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 18:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Lh7vIr6c;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QGMxHCNv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2Nwl2c4yz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jul 2023 17:52:07 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 83D7622163;
	Fri, 14 Jul 2023 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689321124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjE7evrec+6fTNNO2iEP5O884klzqzhDg9Mgv82xETg=;
	b=Lh7vIr6ckxc/iABjsJgQyPX2+F649Ga1fLcw+t6ynF0XPltSHJcY7keOXADImMc/dbsXKp
	xyUOTHFD9ZSU9WbwlNosGPDYqOHjdKPKebwbu8snAFn0N1/u3gpsb9A2fV2S9P5gnWwuAA
	c11Id3xw4wVOPXXYVUeNCX9YszdHQ3s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689321124;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fjE7evrec+6fTNNO2iEP5O884klzqzhDg9Mgv82xETg=;
	b=QGMxHCNv2iIjqPsDqSpcZCEXodf5ZsEvU0z7mPx0TmyWW116Sni3xmSwhsAgfcnLkU6nOS
	SUzZMqMdOAUlo3Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D2A413A15;
	Fri, 14 Jul 2023 07:52:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id sM0TCqT+sGQCQwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 07:52:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v3 18/18] fbdev: Document that framebuffer_alloc() returns zero'ed data
Date: Fri, 14 Jul 2023 09:49:44 +0200
Message-ID: <20230714075155.5686-19-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714075155.5686-1-tzimmermann@suse.de>
References: <20230714075155.5686-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Most fbdev drivers depend on framebuffer_alloc() to initialize the
allocated memory to 0. Document this guarantee.

v3:
	* slightly reword the sentence (Miguel)

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
Cc: Helge Deller <deller@gmx.de>
---
 drivers/video/fbdev/core/fb_info.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_info.c b/drivers/video/fbdev/core/fb_info.c
index 8bdbefdd4b70..4847ebe50d7d 100644
--- a/drivers/video/fbdev/core/fb_info.c
+++ b/drivers/video/fbdev/core/fb_info.c
@@ -13,7 +13,8 @@
  *
  * Creates a new frame buffer info structure. Also reserves @size bytes
  * for driver private data (info->par). info->par (if any) will be
- * aligned to sizeof(long).
+ * aligned to sizeof(long). The new instances of struct fb_info and
+ * the driver private data are both cleared to zero.
  *
  * Returns the new structure, or NULL if an error occurred.
  *
-- 
2.41.0

