Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE4E4B7484
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 20:01:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jyr5n2x1Nz3cbf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 06:01:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=3WMprktJ;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=bkE4/FbI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=pvorel@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256
 header.s=susede2_rsa header.b=3WMprktJ; 
 dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=bkE4/FbI; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyr4N6W40z3bPT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 05:59:48 +1100 (AEDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B75D91F3A3;
 Tue, 15 Feb 2022 18:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1644951585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlvCoVY4/AXiss/7GQAmz2XxuAfig9UNMP5JzKN9tQk=;
 b=3WMprktJe6emwDD4SMrkDBkYT+zbLLh50KLlGQfyisZvCa8wXKXrNAWfnY4VKMmefpM9ri
 xVQ+9WTUD9GQpscBeJ832Nb6w0KUP9Zi7OjHTLQrkk0c5nt4VrXgi1mVN3FHcPMCpr8l36
 kzyKUtXfm/tXl8bVOBHi5qVGaCzIaLs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1644951585;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LlvCoVY4/AXiss/7GQAmz2XxuAfig9UNMP5JzKN9tQk=;
 b=bkE4/FbI79I5WdDKbjmQfwb65KwEmzxzrO/G7IpT1/LEFbHg+68IID29PrVxnhUFjQzJSx
 mBn4G7680+Sw/kCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 50C451376E;
 Tue, 15 Feb 2022 18:59:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mBAYEiH4C2L2MwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 15 Feb 2022 18:59:45 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-crypto@vger.kernel.org
Subject: [PATCH v2 2/2] crypto: vmx: Add missing dependencies
Date: Tue, 15 Feb 2022 19:59:36 +0100
Message-Id: <20220215185936.15576-3-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220215185936.15576-1-pvorel@suse.cz>
References: <20220215185936.15576-1-pvorel@suse.cz>
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

vmx-crypto module depends on CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or
CRYPTO_XTS, thus add them.

These dependencies are likely to be enabled, but if
CRYPTO_DEV_VMX_ENCRYPT=y && !CRYPTO_MANAGER_DISABLE_TESTS
and either of CRYPTO_AES, CRYPTO_CBC, CRYPTO_CTR or CRYPTO_XTS is built
as module or disabled, alg_test() from crypto/testmgr.c complains during
boot about failing to allocate the generic fallback implementations
(2 == ENOENT):

[    0.540953] Failed to allocate xts(aes) fallback: -2
[    0.541014] alg: skcipher: failed to allocate transform for p8_aes_xts: -2
[    0.541120] alg: self-tests for p8_aes_xts (xts(aes)) failed (rc=-2)
[    0.544440] Failed to allocate ctr(aes) fallback: -2
[    0.544497] alg: skcipher: failed to allocate transform for p8_aes_ctr: -2
[    0.544603] alg: self-tests for p8_aes_ctr (ctr(aes)) failed (rc=-2)
[    0.547992] Failed to allocate cbc(aes) fallback: -2
[    0.548052] alg: skcipher: failed to allocate transform for p8_aes_cbc: -2
[    0.548156] alg: self-tests for p8_aes_cbc (cbc(aes)) failed (rc=-2)
[    0.550745] Failed to allocate transformation for 'aes': -2
[    0.550801] alg: cipher: Failed to load transform for p8_aes: -2
[    0.550892] alg: self-tests for p8_aes (aes) failed (rc=-2)

Fixes: c07f5d3da643 ("crypto: vmx - Adding support for XTS")
Fixes: d2e3ae6f3aba ("crypto: vmx - Enabling VMX module for PPC64")

Suggested-by: Nicolai Stange <nstange@suse.de>
Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
changes v1->v2:
* use "select" instead of "depends on" (Nicolai)
* drop !CRYPTO_MANAGER_DISABLE_TESTS as the dependency is always (Nicolai)

 drivers/crypto/vmx/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/crypto/vmx/Kconfig b/drivers/crypto/vmx/Kconfig
index 1a3808b719f3..ce054e64b92c 100644
--- a/drivers/crypto/vmx/Kconfig
+++ b/drivers/crypto/vmx/Kconfig
@@ -2,7 +2,11 @@
 config CRYPTO_DEV_VMX_ENCRYPT
 	tristate "Power VMX cryptographic acceleration instructions driver"
 	depends on PPC64 && VSX
+	select CRYPTO_AES
+	select CRYPTO_CBC
+	select CRYPTO_CTR
 	select CRYPTO_GHASH
+	select CRYPTO_XTS
 	default m
 	help
 	  Support for VMX cryptographic acceleration instructions on Power8 CPU.
-- 
2.35.1

