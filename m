Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E77957B881
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 16:28:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnyjP3XMFz3cj7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 00:28:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QYn4+z7O;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jyOQSNHt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QYn4+z7O;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jyOQSNHt;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnyht1Tvmz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 00:27:41 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 71350340B4;
	Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1658327254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yz7+smYS3HuO96mDgkOeccHC0wiruCJTbt1mSo6CxY8=;
	b=QYn4+z7OGKtjKPV+6oZ10A6H6a/55DPyEc5eTpgb+gKt/Qo+orfpus8sEMlP840LNd8AGf
	TjqPrrK9dArPyKrvgfCME6SO0l9Ido4ILeDqcq2GAgaLCyA9NEBbIgjWsPO+M6/JB8ZRXv
	z2nyf8HtNuBjKKuVF5CO6XRLDAqoUxs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1658327254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yz7+smYS3HuO96mDgkOeccHC0wiruCJTbt1mSo6CxY8=;
	b=jyOQSNHtmxG+RfwvTVkV7PyQazO+R47MR+fkZH62BRse9K5txob30noH5UtZRpPVmdgdFA
	feLFUNjbeLZLCFBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 30F7113ABB;
	Wed, 20 Jul 2022 14:27:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id CJUbC9YQ2GLfHgAAMHmgww
	(envelope-from <tzimmermann@suse.de>); Wed, 20 Jul 2022 14:27:34 +0000
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
Subject: [PATCH v2 01/10] drm/simpledrm: Remove mem field from device structure
Date: Wed, 20 Jul 2022 16:27:23 +0200
Message-Id: <20220720142732.32041-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720142732.32041-1-tzimmermann@suse.de>
References: <20220720142732.32041-1-tzimmermann@suse.de>
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

Remove the unused mem field from struct simpledrm_device.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tiny/simpledrm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 768242a78e2b..9fd507119372 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -217,7 +217,6 @@ struct simpledrm_device {
 	unsigned int pitch;
 
 	/* memory management */
-	struct resource *mem;
 	void __iomem *screen_base;
 
 	/* modesetting */
@@ -558,7 +557,6 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 	if (!screen_base)
 		return -ENOMEM;
 
-	sdev->mem = mem;
 	sdev->screen_base = screen_base;
 
 	return 0;
-- 
2.36.1

