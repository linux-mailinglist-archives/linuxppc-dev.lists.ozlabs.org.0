Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F6D873665
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 13:30:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=s7NL1SeH;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=E328/abI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=URDeu/hI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VLzGhH1D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqWwz3pZCz3vYN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 23:30:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=s7NL1SeH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=E328/abI;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=URDeu/hI;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=VLzGhH1D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=tzimmermann@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqWwC0vY7z3cWB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 23:29:47 +1100 (AEDT)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8306F4ED40;
	Wed,  6 Mar 2024 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709728182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Zluc5pdwJo1X5Y/YYPNxWSl6vvjmlAN09PftLZOSlFU=;
	b=s7NL1SeHWkF2MbeTlPKqQvm95tz3aoqI2G9lDHzeXkJsnwrnQI7vwvEbFf4QMWaGRWRODx
	H2FIztmYi2AXTnuSQ9d7Qb3C0A+C/in4mHKsiKKdlnycGTCWnUtg90g/ED7H+j5bml4Cc9
	s/oCqv7Bqiwo5KhRmdWzGJ8lMrV2uqo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709728182;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Zluc5pdwJo1X5Y/YYPNxWSl6vvjmlAN09PftLZOSlFU=;
	b=E328/abIB3tFTOP6OXZ6hhUDJebGKd7aPjZMUzqkPeuagY2oqMhzDEs6MwbCv3ZE76f+wD
	J0Idh9PMsta+bgBA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1709728181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Zluc5pdwJo1X5Y/YYPNxWSl6vvjmlAN09PftLZOSlFU=;
	b=URDeu/hI/Zn02IV37ksOM9LCOfTbuQG06F0Hfd3pNkwydo2ILv/fHvjsNKw8m0NEXy0mni
	2eHlmrB1XiSSWgDOFIan2geuceVjWRykzdaKFw1W81jxIAzMCnx+lpsFsfoh/1aFOqMo0o
	IiY6p7x18yXLVdEy6xJD3Sm/W/mqti4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1709728181;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=Zluc5pdwJo1X5Y/YYPNxWSl6vvjmlAN09PftLZOSlFU=;
	b=VLzGhH1DuXcZrVbxUMRIZC6ogdcZerr3MLWzPtHJEV32tN+D/nnh/2wJ9RIaeDOiLAdm2/
	HCSyZzUc8zdk/+CA==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id B5B661377D;
	Wed,  6 Mar 2024 12:29:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap2.dmz-prg2.suse.org with ESMTPSA
	id oRTxKrRh6GWdTgAAn2gu4w
	(envelope-from <tzimmermann@suse.de>); Wed, 06 Mar 2024 12:29:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mpe@ellerman.id.au,
	jani.nikula@intel.com,
	naresh.kamboju@linaro.org,
	deller@gmx.de,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com
Subject: [PATCH v3 0/3] arch/powerpc: Resolve backlight include dependencies
Date: Wed,  6 Mar 2024 13:28:17 +0100
Message-ID: <20240306122935.10626-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.19 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[14];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url];
	 FREEMAIL_TO(0.00)[ellerman.id.au,intel.com,linaro.org,gmx.de,gmail.com,csgroup.eu,kernel.org,linux.ibm.com];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_ALL(0.00)[];
	 BAYES_HAM(-0.71)[83.48%]
X-Spam-Level: ****
X-Spam-Score: 4.19
X-Spam-Flag: NO
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After cleaning up <linux/fb.h> in commit 11b4eedfc87d ("fbdev: Do
not include <linux/backlight.h> in header"), building with
CONFIG_PMAC_BACKLIGHT=y returns errors about missing declarations.
Patches 1 and 2 resolve the errors. Patch 1 has been reviewed at [1].
Patch 3 removes another dependency between backlight and fbdev code.

Compile tested with ppc6xx_defconfig.

v3:
	* add Fixes tag and fix typos in patch 3
v2:
	* via-pmu-backlight: fix build errors
	* powerpc: resolve dependency between fbdev and backlight

[1] https://patchwork.freedesktop.org/series/130661/

Thomas Zimmermann (3):
  fbdev/chipsfb: Include <linux/backlight.h>
  macintosh/via-pmu-backlight: Include <linux/backlight.h>
  arch/powerpc: Remove <linux/fb.h> from backlight code

 arch/powerpc/include/asm/backlight.h        |  5 ++--
 arch/powerpc/platforms/powermac/backlight.c | 26 ---------------------
 drivers/macintosh/via-pmu-backlight.c       |  1 +
 drivers/video/fbdev/chipsfb.c               |  1 +
 4 files changed, 4 insertions(+), 29 deletions(-)

-- 
2.44.0

