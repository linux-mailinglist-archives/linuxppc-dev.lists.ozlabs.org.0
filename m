Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA604B7483
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 20:00:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyr550RZZz3cWc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 06:00:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=jB12KMIU;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=3A8UJ97d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=jB12KMIU; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3A8UJ97d; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyr4N6XFnz3bSk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 05:59:48 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3E781F382;
 Tue, 15 Feb 2022 18:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644951584; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5YAUHqgVBs+pDipEZBxQHmXGJ42CBpjYidJwV8WeMtc=;
 b=jB12KMIUWcSWnbHdoRAisy258SrDEEcRYT8dTOTG+Hg5tNVxFSfXqr5Zj8ZzScvwH143ky
 on/mKMw1ruWYkkNHOv4NPWlTIotJ5gEv5sK4XQinzEL+kHKvD4H05XiiyccsM+lA9+R6/J
 OmSg/SQrTi3cpPRhALK+ONanH1LWDmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644951584;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=5YAUHqgVBs+pDipEZBxQHmXGJ42CBpjYidJwV8WeMtc=;
 b=3A8UJ97dC6BgqoV4B9DofBSpEYlz/gEdAmvgGUFg5jmrJV6c7+zPmuel4YnhrRWD8Gsa6m
 CJGqRCW9oG3vyZBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45EE31376E;
 Tue, 15 Feb 2022 18:59:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fVAoDyD4C2L2MwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 15 Feb 2022 18:59:44 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 0/2] vmx-crypto: Add missing dependencies
Date: Tue, 15 Feb 2022 19:59:34 +0100
Message-Id: <20220215185936.15576-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nicolai Stange <nstange@suse.de>,
 linux-kbuild@vger.kernel.org, Nayna Jain <nayna@linux.ibm.com>,
 Petr Vorel <pvorel@suse.cz>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

[ Cc powerpc list and VMX people this time ]

changes v1->v2:
* new commit: crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into tristate
* use "select" instead of "depends on" (Nicolai)
* drop !CRYPTO_MANAGER_DISABLE_TESTS as the dependency is always (Nicolai)

Petr Vorel (2):
  crypto: vmx: Turn CRYPTO_DEV_VMX_ENCRYPT into tristate
  crypto: vmx: Add missing dependencies

 MAINTAINERS                            | 2 +-
 arch/powerpc/configs/powernv_defconfig | 2 +-
 arch/powerpc/configs/ppc64_defconfig   | 2 +-
 arch/powerpc/configs/pseries_defconfig | 2 +-
 drivers/crypto/Kconfig                 | 6 ------
 drivers/crypto/vmx/Kconfig             | 8 ++++++--
 6 files changed, 10 insertions(+), 12 deletions(-)

-- 
2.35.1

