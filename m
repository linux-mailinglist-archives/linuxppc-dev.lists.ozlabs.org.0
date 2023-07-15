Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF232754BA1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 21:06:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=2XBhveaF;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pXOOzKCn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R3HrM56n9z3ddm
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Jul 2023 05:06:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=2XBhveaF;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=pXOOzKCn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R3HYx2Z7Dz3bpG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 Jul 2023 04:53:57 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id B5EFA1FD64;
	Sat, 15 Jul 2023 18:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689447229; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWl4r3MXDzIpXc1GMxrVHAXu9+tdMITd+1eR5phnaTY=;
	b=2XBhveaF0EXWqyWpcuViIof7w1bKRLiFpK2QeNwSktWI9KGVDuHwKl6T7Yq59n7ebakCQn
	BKpF+nD9USZMe4GKbZq543HXeB49/W85H8q5rrJsAkZ5hsi9h3ggn0Vx5GXXDCDSeSB/uG
	iK9o7ZwdmD/+ZAKiwz+MLtbIgrWhz2U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689447229;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YWl4r3MXDzIpXc1GMxrVHAXu9+tdMITd+1eR5phnaTY=;
	b=pXOOzKCnKbgy9j9RxOZ+6JxWEIR/bHFAzMOK/A9i596gWdBo/d8KdlCofgVWwT+Q4C8CHY
	xrSQAJ9b5b/CinDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 52109133F7;
	Sat, 15 Jul 2023 18:53:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IMz2Ej3rsmQCBwAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Sat, 15 Jul 2023 18:53:49 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com,
	geert@linux-m68k.org,
	dan.carpenter@linaro.org
Subject: [PATCH v4 09/18] auxdisplay: Remove flag FBINFO_FLAG_DEFAULT from fbdev drivers
Date: Sat, 15 Jul 2023 20:51:51 +0200
Message-ID: <20230715185343.7193-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715185343.7193-1-tzimmermann@suse.de>
References: <20230715185343.7193-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, Robin van der Gracht <robin@protonic.nl>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by framebuffer_alloc(). So do
not set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>
Cc: Robin van der Gracht <robin@protonic.nl>
---
 drivers/auxdisplay/cfag12864bfb.c | 1 -
 drivers/auxdisplay/ht16k33.c      | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/auxdisplay/cfag12864bfb.c b/drivers/auxdisplay/cfag12864bfb.c
index c2cab7e2b126..729845bcc803 100644
--- a/drivers/auxdisplay/cfag12864bfb.c
+++ b/drivers/auxdisplay/cfag12864bfb.c
@@ -79,7 +79,6 @@ static int cfag12864bfb_probe(struct platform_device *device)
 	info->var = cfag12864bfb_var;
 	info->pseudo_palette = NULL;
 	info->par = NULL;
-	info->flags = FBINFO_FLAG_DEFAULT;
 
 	if (register_framebuffer(info) < 0)
 		goto fballoced;
diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index edaf92b7ea77..df3f37651e45 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -646,7 +646,6 @@ static int ht16k33_fbdev_probe(struct device *dev, struct ht16k33_priv *priv,
 	fbdev->info->var = ht16k33_fb_var;
 	fbdev->info->bl_dev = bl;
 	fbdev->info->pseudo_palette = NULL;
-	fbdev->info->flags = FBINFO_FLAG_DEFAULT;
 	fbdev->info->par = priv;
 
 	err = register_framebuffer(fbdev->info);
-- 
2.41.0

