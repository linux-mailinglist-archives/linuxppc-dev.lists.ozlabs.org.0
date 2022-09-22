Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A405E612A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 13:33:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYCpZ3pfcz2yx2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 21:33:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L3Z+YDtx;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Jbh5FUj0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=L3Z+YDtx;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Jbh5FUj0;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYCp15wRLz307C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 21:33:13 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 096D71F8D2;
	Thu, 22 Sep 2022 11:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1663846390; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ceZaqUNRgQsm6VJ+c/v7OOid2+I3LiXAsjtFG2yMJUs=;
	b=L3Z+YDtxYnoW476TrRBTiZHjlxioEmEJV1K/rE/2NRHWCGoLgYrdC12tmI8CgOvDZdA4Sg
	m26duvm+l+E13tTAPbhu+b0p3IxaHKoJNkib6NBVkT0rfQGJZ4xdR3cKbg5jdKMyZ02tBO
	5xGAQ/imTVEuDiG9dA+nCDiiOVlsTbE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1663846390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ceZaqUNRgQsm6VJ+c/v7OOid2+I3LiXAsjtFG2yMJUs=;
	b=Jbh5FUj0TQ0sbBdsEFCglv7CACwOENl99d/Tdjhi81j0iEQRJvWMscKbmTsvrskPyQtKjF
	LXwFMIg9ym0gtqCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8BE613AF0;
	Thu, 22 Sep 2022 11:33:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id cKFYLPVHLGPyPAAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Thu, 22 Sep 2022 11:33:09 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch,
	deller@gmx.de,
	maxime@cerno.tech,
	sam@ravnborg.org,
	msuchanek@suse.de,
	mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	geert@linux-m68k.org,
	mark.cave-ayland@ilande.co.uk
Subject: [PATCH v3 2/4] drm/ofdrm: Add CRTC state
Date: Thu, 22 Sep 2022 13:33:04 +0200
Message-Id: <20220922113306.11251-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922113306.11251-1-tzimmermann@suse.de>
References: <20220922113306.11251-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a dedicated CRTC state to ofdrm to later store information for
palette updates.

v3:
	* rework CRTC state helpers (Javier)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/tiny/ofdrm.c | 59 ++++++++++++++++++++++++++++++++++--
 1 file changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/ofdrm.c b/drivers/gpu/drm/tiny/ofdrm.c
index 5ac9aa769513..a78aee800956 100644
--- a/drivers/gpu/drm/tiny/ofdrm.c
+++ b/drivers/gpu/drm/tiny/ofdrm.c
@@ -279,6 +279,21 @@ static struct resource *ofdrm_find_fb_resource(struct ofdrm_device *odev,
  * Modesetting
  */
 
+struct ofdrm_crtc_state {
+	struct drm_crtc_state base;
+};
+
+static struct ofdrm_crtc_state *to_ofdrm_crtc_state(struct drm_crtc_state *base)
+{
+	return container_of(base, struct ofdrm_crtc_state, base);
+}
+
+static void ofdrm_crtc_state_destroy(struct ofdrm_crtc_state *ofdrm_crtc_state)
+{
+	__drm_atomic_helper_crtc_destroy_state(&ofdrm_crtc_state->base);
+	kfree(ofdrm_crtc_state);
+}
+
 /*
  * Support all formats of OF display and maybe more; in order
  * of preference. The display's update function will do any
@@ -429,13 +444,51 @@ static const struct drm_crtc_helper_funcs ofdrm_crtc_helper_funcs = {
 	.atomic_check = ofdrm_crtc_helper_atomic_check,
 };
 
+static void ofdrm_crtc_reset(struct drm_crtc *crtc)
+{
+	struct ofdrm_crtc_state *ofdrm_crtc_state =
+		kzalloc(sizeof(*ofdrm_crtc_state), GFP_KERNEL);
+
+	if (crtc->state)
+		ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc->state));
+
+	if (ofdrm_crtc_state)
+		__drm_atomic_helper_crtc_reset(crtc, &ofdrm_crtc_state->base);
+	else
+		__drm_atomic_helper_crtc_reset(crtc, NULL);
+}
+
+static struct drm_crtc_state *ofdrm_crtc_atomic_duplicate_state(struct drm_crtc *crtc)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_crtc_state *crtc_state = crtc->state;
+	struct ofdrm_crtc_state *new_ofdrm_crtc_state;
+
+	if (drm_WARN_ON(dev, !crtc_state))
+		return NULL;
+
+	new_ofdrm_crtc_state = kzalloc(sizeof(*new_ofdrm_crtc_state), GFP_KERNEL);
+	if (!new_ofdrm_crtc_state)
+		return NULL;
+
+	__drm_atomic_helper_crtc_duplicate_state(crtc, &new_ofdrm_crtc_state->base);
+
+	return &new_ofdrm_crtc_state->base;
+}
+
+static void ofdrm_crtc_atomic_destroy_state(struct drm_crtc *crtc,
+					    struct drm_crtc_state *crtc_state)
+{
+	ofdrm_crtc_state_destroy(to_ofdrm_crtc_state(crtc_state));
+}
+
 static const struct drm_crtc_funcs ofdrm_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.reset = ofdrm_crtc_reset,
 	.destroy = drm_crtc_cleanup,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
-	.atomic_duplicate_state = drm_atomic_helper_crtc_duplicate_state,
-	.atomic_destroy_state = drm_atomic_helper_crtc_destroy_state,
+	.atomic_duplicate_state = ofdrm_crtc_atomic_duplicate_state,
+	.atomic_destroy_state = ofdrm_crtc_atomic_destroy_state,
 };
 
 static int ofdrm_connector_helper_get_modes(struct drm_connector *connector)
-- 
2.37.3

