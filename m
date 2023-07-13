Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3B175234B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 15:18:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u0ovCl5n;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A51Kravc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1wCw1pHpz3cdr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jul 2023 23:18:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u0ovCl5n;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=A51Kravc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1vtw1c1Fz3c5M
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jul 2023 23:03:52 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 57D3F1FDE9;
	Thu, 13 Jul 2023 13:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1689253429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsudHL+kPXRnJx5x/UKWrjHzIvsH1WJ679RIcWPHmtc=;
	b=u0ovCl5n9MXop+Ezot8TRk5lVZ/nQUjpfCQyoMpnD+ml/blTy1EX6KSWhLsu459q0Eq2U8
	PIw8ttscCXkaHc70J9VBTCXNp6gk69BSsRmnFEDlT3OC5GOGaEaTJ5QqLucyQSlQ4FdI8T
	A3wuOF50BNKme5ap5wuNSPJD05OxYAM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689253429;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IsudHL+kPXRnJx5x/UKWrjHzIvsH1WJ679RIcWPHmtc=;
	b=A51KravctEI4QKJ8lOtnEBJyCx51GonM0INWeFww81on0QVoAdctELm3OeK4Dpwibg0Sv7
	PgGihZTRQ5YvRaDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF5D513A94;
	Thu, 13 Jul 2023 13:03:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2A2BOTT2r2TVPgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 13:03:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	javierm@redhat.com
Subject: [PATCH v2 17/18] fbdev: Remove FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT
Date: Thu, 13 Jul 2023 14:58:37 +0200
Message-ID: <20230713130338.31086-18-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713130338.31086-1-tzimmermann@suse.de>
References: <20230713130338.31086-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org, linux-nvidia@lists.surfsouth.com, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove the unused flags FBINFO_DEFAULT and FBINFO_FLAG_DEFAULT. No
functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
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

