Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E3A856A7F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 18:06:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=01FKlZ2e;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WSXmafZ0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=01FKlZ2e;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WSXmafZ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbM092D7cz3vXw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 04:06:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=01FKlZ2e;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WSXmafZ0;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=01FKlZ2e;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WSXmafZ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 585 seconds by postgrey-1.37 at boromir; Fri, 16 Feb 2024 04:05:18 AEDT
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbLzL4KrBz3dV3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 04:05:18 +1100 (AEDT)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	by smtp-out1.suse.de (Postfix) with ESMTP id B7AF9211D2;
	Thu, 15 Feb 2024 16:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708016129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HHI73AbiDsgFPpKe9TkJUmUEu7LiJywR0x6tJv++5SM=;
	b=01FKlZ2eJYvRpCDFGs5WClGtaZcibEiXNB0fRuhPAyZ/6JlJfm4WBfckCeupeigq9EY6dl
	mWqEhwKhNymwYGSAkpp7vnGiEXn8K8HNC4jVVdbifGph0NAjE4TwBBaClQqnWa2WVovLYq
	mZBpOIlYSGGg0hb/TleNeb3giUfHJbM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708016129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HHI73AbiDsgFPpKe9TkJUmUEu7LiJywR0x6tJv++5SM=;
	b=WSXmafZ0ynuqlWv6uACXEuFrkDxjS/Gfy6KOGkN0ZNEa+YflSpYEZsCrYv8wN/E9FmLvAo
	UIxC/uLFDza3twDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1708016129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HHI73AbiDsgFPpKe9TkJUmUEu7LiJywR0x6tJv++5SM=;
	b=01FKlZ2eJYvRpCDFGs5WClGtaZcibEiXNB0fRuhPAyZ/6JlJfm4WBfckCeupeigq9EY6dl
	mWqEhwKhNymwYGSAkpp7vnGiEXn8K8HNC4jVVdbifGph0NAjE4TwBBaClQqnWa2WVovLYq
	mZBpOIlYSGGg0hb/TleNeb3giUfHJbM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1708016129;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=HHI73AbiDsgFPpKe9TkJUmUEu7LiJywR0x6tJv++5SM=;
	b=WSXmafZ0ynuqlWv6uACXEuFrkDxjS/Gfy6KOGkN0ZNEa+YflSpYEZsCrYv8wN/E9FmLvAo
	UIxC/uLFDza3twDQ==
From: Michal Suchanek <msuchanek@suse.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests: powerpc: Add header symlinks for building papr character device tests
Date: Thu, 15 Feb 2024 17:55:21 +0100
Message-ID: <20240215165527.23684-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [4.55 / 50.00];
	 ARC_NA(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 R_MISSING_CHARSET(2.50)[];
	 MIME_GOOD(-0.10)[text/plain];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 BROKEN_CONTENT_TYPE(1.50)[];
	 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[12];
	 MID_CONTAINS_FROM(1.00)[];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 RCVD_COUNT_ZERO(0.00)[0];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 FREEMAIL_CC(0.00)[jostaberry-6.arch.suse.de,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com,suse.de,vger.kernel.org];
	 BAYES_HAM(-0.35)[76.37%]
X-Spam-Level: ****
X-Spam-Score: 4.55
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kselftest@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, root <root@jostaberry-6.arch.suse.de>, Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: root <root@jostaberry-6.arch.suse.de>

Without the headers the tests don't build.

Fixes: 9118c5d32bdd ("powerpc/selftests: Add test for papr-vpd")
Fixes: 76b2ec3faeaa ("powerpc/selftests: Add test for papr-sysparm")
Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 tools/testing/selftests/powerpc/include/asm/papr-miscdev.h | 1 +
 tools/testing/selftests/powerpc/include/asm/papr-sysparm.h | 1 +
 tools/testing/selftests/powerpc/include/asm/papr-vpd.h     | 1 +
 3 files changed, 3 insertions(+)
 create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-miscdev.h
 create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-sysparm.h
 create mode 120000 tools/testing/selftests/powerpc/include/asm/papr-vpd.h

diff --git a/tools/testing/selftests/powerpc/include/asm/papr-miscdev.h b/tools/testing/selftests/powerpc/include/asm/papr-miscdev.h
new file mode 120000
index 000000000000..0f811020354d
--- /dev/null
+++ b/tools/testing/selftests/powerpc/include/asm/papr-miscdev.h
@@ -0,0 +1 @@
+../../../../../../arch/powerpc/include/uapi/asm/papr-miscdev.h
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/include/asm/papr-sysparm.h b/tools/testing/selftests/powerpc/include/asm/papr-sysparm.h
new file mode 120000
index 000000000000..6355e122245e
--- /dev/null
+++ b/tools/testing/selftests/powerpc/include/asm/papr-sysparm.h
@@ -0,0 +1 @@
+../../../../../../arch/powerpc/include/uapi/asm/papr-sysparm.h
\ No newline at end of file
diff --git a/tools/testing/selftests/powerpc/include/asm/papr-vpd.h b/tools/testing/selftests/powerpc/include/asm/papr-vpd.h
new file mode 120000
index 000000000000..403ddec6b422
--- /dev/null
+++ b/tools/testing/selftests/powerpc/include/asm/papr-vpd.h
@@ -0,0 +1 @@
+../../../../../../arch/powerpc/include/uapi/asm/papr-vpd.h
\ No newline at end of file
-- 
2.43.0

