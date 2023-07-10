Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3A174D72E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 15:15:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Go7brugI;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MsqvxlT6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R04Hg52zvz3dXk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 23:15:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=Go7brugI;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=MsqvxlT6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R03zT1PSXz30hw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 23:01:24 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0BDD7221C1;
	Mon, 10 Jul 2023 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688994082; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0Gm3caehTf+DDNUO7FEiHJTJ/hpEoZRP8IUYE91TXw=;
	b=Go7brugIegGY+ZVPi6YfHKxGodhrQekZWN2V2ZK6jxPYBTjY635csao0oKFNQYWr11kMz8
	G39YnLW+q7ItBbkzh7LkyKVTEiNWztYwaEDCGYGHHmSJ6suqKc0jI7HYjJIJ0YgoIdBdUB
	y0bMj50CzUM97CeHB3sibChMwMXdKNs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688994082;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I0Gm3caehTf+DDNUO7FEiHJTJ/hpEoZRP8IUYE91TXw=;
	b=MsqvxlT6sFr6ha7xHjLd+Ynf+kok1rNaAtXEFt/8fbacjxNPr9mpxokzH4T2unRIgadntW
	9gKaSCCViPXyQpCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFEF513A05;
	Mon, 10 Jul 2023 13:01:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qGYSKiEBrGTTFAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Mon, 10 Jul 2023 13:01:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH 17/17] fbdev: Remove FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
Date: Mon, 10 Jul 2023 14:50:21 +0200
Message-ID: <20230710130113.14563-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710130113.14563-1-tzimmermann@suse.de>
References: <20230710130113.14563-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Helge Deller <deller@gmx.de>
---
 include/linux/fb.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/fb.h b/include/linux/fb.h
index 1d5c13f34b09..43458f582f35 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -383,7 +383,6 @@ struct fb_tile_ops {
 #endif /* CONFIG_FB_TILEBLITTING */
 
 /* FBINFO_* = fb_info.flags bit flags */
-#define FBINFO_DEFAULT		0
 #define FBINFO_HWACCEL_DISABLED	0x0002
 	/* When FBINFO_HWACCEL_DISABLED is set:
 	 *  Hardware acceleration is turned off.  Software implementations
@@ -504,8 +503,6 @@ struct fb_info {
 	bool skip_vt_switch; /* no VT switch on suspend/resume required */
 };
 
-#define FBINFO_FLAG_DEFAULT	FBINFO_DEFAULT
-
 /* This will go away
  * fbset currently hacks in FB_ACCELF_TEXT into var.accel_flags
  * when it wants to turn the acceleration engine on.  This is
-- 
2.41.0

