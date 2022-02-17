Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8674B9DD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 11:59:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzsK12ywbz3ccd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 21:59:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=ZmB0wl9B;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=k0ZVrYbl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=ZmB0wl9B; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=k0ZVrYbl; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzsHb3R3jz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 21:58:03 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6A5C8210E1;
 Thu, 17 Feb 2022 10:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1645095480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ejJOPMGqoqTuXltYTN+lNUEISoj2/cmQ0coSdRcZq5k=;
 b=ZmB0wl9B9CgZyZnf/7Ct12lyeIShGiixXlRP9IOq/4vrlpDESTcIN8KW7m/QnQcMLuQUaF
 bzzZ4SKpatk+xQqopXOBDcul+VBATMS0f79s5N3E4O0RMKPmDp6nhXoD5Wc1GUFzcYSxG+
 C2S+N2tis9gO5C8RX93fKLmFkW559YU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1645095480;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ejJOPMGqoqTuXltYTN+lNUEISoj2/cmQ0coSdRcZq5k=;
 b=k0ZVrYblyEUXeXXww5CqhEGKlAS7+qvgR0vU+sdgJQJFmqwkM84m7WcCBoIqxjnrXFRvUf
 amxF66q1wDa9bnDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EC72813DD8;
 Thu, 17 Feb 2022 10:57:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dDoXODcqDmJdTgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Thu, 17 Feb 2022 10:57:59 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v3 0/2] vmx-crypto: Add missing dependencies
Date: Thu, 17 Feb 2022 11:57:49 +0100
Message-Id: <20220217105751.6330-1-pvorel@suse.cz>
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

Hi all,


changes v2->v3:
* keep CRYPTO_DEV_VMX and merge CRYPTO_DEV_VMX_ENCRYPT into it instead
  of vice versa (suggested by Nicolai). I have no problem to send
  another version if maintainers want the original approach.
* change commit subject to be compatible
* remove MAINTAINERS changes

Petr Vorel (2):
  crypto: vmx - merge CRYPTO_DEV_VMX_ENCRYPT into CRYPTO_DEV_VMX
  crypto: vmx - add missing dependencies

 arch/powerpc/configs/powernv_defconfig |  2 +-
 arch/powerpc/configs/ppc64_defconfig   |  2 +-
 arch/powerpc/configs/pseries_defconfig |  2 +-
 drivers/crypto/Kconfig                 | 13 +++++++++----
 drivers/crypto/vmx/Kconfig             | 10 ----------
 drivers/crypto/vmx/Makefile            |  4 ++--
 6 files changed, 14 insertions(+), 19 deletions(-)
 delete mode 100644 drivers/crypto/vmx/Kconfig

-- 
2.35.1

