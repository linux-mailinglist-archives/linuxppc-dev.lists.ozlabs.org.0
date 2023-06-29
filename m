Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7A174267D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 14:33:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZbROsLIJ;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Hj6UbEA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsHsk3QP5z3btl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 22:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZbROsLIJ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3Hj6UbEA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1d; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsHjG2nJKz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 22:25:38 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 524A81FD69;
	Thu, 29 Jun 2023 12:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1688041202; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8M3t+sIilpS+dvhDHVydT9EOWn+SooUMabnf/LFMHbo=;
	b=ZbROsLIJAkfIR/+jRVLDcd83SvH5cZmugk8kZwgL9JSMI/gKbyQR3HtKCm4o42ShuZpYkk
	PpOlJkUDBbcOuQ/YbZW1LarrlsmuvA7IRfwyIlPCdp7XjLFZCUf5QkBgkeK4CAQiyu6q+p
	rHluDhQg1B0za6ZvhP208NqkrxcQvWg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1688041202;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8M3t+sIilpS+dvhDHVydT9EOWn+SooUMabnf/LFMHbo=;
	b=3Hj6UbEAQMoFiqqs75ilDIpvJONgA2he7Vj193adp37UYAYmUsCXwiE0RCS1+n5Jev4Itq
	c8ZFL5Xhnj0s4yAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D74B113905;
	Thu, 29 Jun 2023 12:20:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 8BuiM/F2nWRlVAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 29 Jun 2023 12:20:01 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: arnd@arndb.de,
	deller@gmx.de,
	daniel@ffwll.ch,
	airlied@gmail.com
Subject: [PATCH 11/12] fbdev/core: Protect edid_info with CONFIG_ARCH_HAS_EDID_INFO
Date: Thu, 29 Jun 2023 13:45:50 +0200
Message-ID: <20230629121952.10559-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629121952.10559-1-tzimmermann@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
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
Cc: linux-arch@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org, linux-mips@vger.kernel.org, linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guard usage of edid_info with CONFIG_ARCH_HAS_EDID_INFO instead
of CONFIG_X86. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/video/fbdev/core/fbmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 35be4431f649a..9ae063021e431 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -1480,17 +1480,19 @@ int fb_validate_mode(const struct fb_var_screeninfo *var, struct fb_info *info)
 		-EINVAL : 0;
 }
 
-#if defined(CONFIG_FIRMWARE_EDID) && defined(CONFIG_X86)
+#if defined(CONFIG_FIRMWARE_EDID)
 const unsigned char *fb_firmware_edid(struct fb_info *info)
 {
 	unsigned char *edid = NULL;
 
+#if defined(CONFIG_ARCH_HAS_EDID_INFO)
 	/*
 	 * We need to ensure that the EDID block is only
 	 * returned for the primary graphics adapter.
 	 */
 	if (fb_is_primary_device(info))
 		edid = edid_info.dummy;
+#endif
 
 	return edid;
 }
-- 
2.41.0

