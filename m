Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CAD39EEF5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 08:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzgnj0Mwrz3bs6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 16:49:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm2 header.b=o1q6X1Oe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ksSsurzS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.19;
 helo=wout3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm2 header.b=o1q6X1Oe; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=ksSsurzS; 
 dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzgnC4dVkz2xvZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 16:48:47 +1000 (AEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id A4F5316E5;
 Tue,  8 Jun 2021 02:48:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 08 Jun 2021 02:48:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm2; bh=1x73rjujmY5Y8URd48wDZMmmXS
 LTxHO+zFGtsooBY6Y=; b=o1q6X1Oe0hzoG3sNTP2Nm5h3zI0m/Jb0oN/M4BiWjY
 u6RfpAAOrszRkYSwe+BUMmhgbEYMPlzdPQWsv67kIQDM5bqr3i9sAB8QSv0Vtm40
 JIvjSe/r9kQbr6fY5N7ZZ959gFRT8NZXYTnhd95ZQhADeeClBEV6Jw+8rYF8gZTz
 uuR1LFzBlf1Mb+UZnOnMxsKkwWY0a24lobiPpbGIEHtQjT3Ib4HXoNrCxRCsYZ76
 xnE3IMp7wgnck8vwpeg5faP6CJ/Ml6EoF7qmoPE/i+C7r2J7cT3MZ1elGf/z+jva
 Bz4OY1pp/jHIv34rLbtBnQsNMUjLFLg/Ld3nXsNJmpFQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=1x73rjujmY5Y8URd4
 8wDZMmmXSLTxHO+zFGtsooBY6Y=; b=ksSsurzSslZtt8AZwcIcm/zuPF067JsdR
 cEzyv53LsJ29jFwjjEnxJQHWTocEWAIDQ+oj9JWgxr0LKwnhZibXqQczhgguftl/
 10tT3CQ7ITPfMJTHmGsw+xAUnoRYmU/DOyv+x1dicL+wxXtXKFA+QcB+a6nuanXh
 PKCw9zBldTW956OZph0uQzIi4TzyUTKM6LG8aC4aM86qFUz9NXH2OtsQlfQX2gbC
 1MmgZNz3jOydGw4gof9qb7hOdHQ3gG+/cpzcMyyvWFRVbbh27gh+N9XMphNusl4w
 cwb/nIpcOQyxGLpcOKerxiGHbTuaAobj8N0pRIMTfc6sw81U1fsRw==
X-ME-Sender: <xms:yxK_YHnmvqFy9v9tfIZ6fVcpd5hGsFqZ6tDpal7cNLFugFS1ls4SMQ>
 <xme:yxK_YK3z2g5eZKoRjcguQmAc3knUrD4g120o_mDhy3iJYgxKuGerQafQO976n1v90
 oSl3hZfZUqWd-pvww>
X-ME-Received: <xmr:yxK_YNqGA6v7YMunXzeprJTkuoXvApNphsCXqYKvh3bVf9fL0OBGIBNv9XLJ6Wx10HTW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfedtkedguddtfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecufghrlhcuvffnffculdeftddmnecujfgurhephf
 fvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgv
 hicuoehruhhstghurhesrhhushhsvghllhdrtggtqeenucggtffrrghtthgvrhhnpeelge
 elfedvffekgeevfeelveeftdeilefgudegkeeuhefhvefgffekuefgffekfeenucevlhhu
 shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrh
 hushhsvghllhdrtggt
X-ME-Proxy: <xmx:yxK_YPmyg53Bf96gg6hFCMA19inaUINzCYu4Az0yooL8GdL9KZXlCg>
 <xmx:yxK_YF2urosGD0zFOOz6stCV5bgM19gB3Ydrvamev-x0xWfa4pDOQg>
 <xmx:yxK_YOtnqk6qU5lixJhCkkRQhZVu9n0cKiRZemG0KFe1Os2xaB4aJw>
 <xmx:zBK_YG_EdroGVtvogPELyx9bB2SdUibigJdiavhK3V6sKrWVVJfBwA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jun 2021 02:48:42 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] selftests/powerpc: Handle more misreporting cases in
 spectre_v2
Date: Tue,  8 Jun 2021 16:48:09 +1000
Message-Id: <20210608064809.199116-1-ruscur@russell.cc>
X-Mailer: git-send-email 2.32.0
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
Cc: cascardo@canonical.com, Russell Currey <ruscur@russell.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit f3054ffd71b5 ("selftests/powerpc: Return skip code for
spectre_v2"), the spectre_v2 selftest is updated to be aware of cases
where the vulnerability status reported in sysfs is incorrect, skipping
the test instead.

This happens because qemu can misrepresent the mitigation status of the
host to the guest.  If the count cache is disabled in the host, and this
is correctly reported to the guest, then the guest won't apply
mitigations.  If the guest is then migrated to a new host where
mitigations are necessary, it is now vulnerable because it has not
applied mitigations.

That commit only checks for the "Vulnerable" state, but this can apply
to any mitigation status.  The hardware accelerated flush is a good
example, because the instruction is a nop on systems with the count
cache disabled - so the only downside is an inaccurate sysfs entry.

Update the selftest to instead check for excessive misses, indicative of
the count cache being disabled.  Return the skip code so that the
selftest is not considered failed.

If software flushing is enabled, also warn that these flushes are
just wasting performance.

Signed-off-by: Russell Currey <ruscur@russell.cc>
---
 .../selftests/powerpc/security/spectre_v2.c   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/tools/testing/selftests/powerpc/security/spectre_v2.c b/tools/testing/selftests/powerpc/security/spectre_v2.c
index e66f66bc482e..eaa3e0231a7d 100644
--- a/tools/testing/selftests/powerpc/security/spectre_v2.c
+++ b/tools/testing/selftests/powerpc/security/spectre_v2.c
@@ -184,17 +184,23 @@ int spectre_v2_test(void)
 	case COUNT_CACHE_FLUSH_HW:
 		// These should all not affect userspace branch prediction
 		if (miss_percent > 15) {
+			if (miss_percent > 95) {
+				/*
+				 * Such a mismatch may be caused by a system being unaware
+				 * the count cache is disabled.  This may be to enable
+				 * guest migration between hosts with different settings.
+				 * Return skip code to avoid detecting this as an error.
+				 * We are not vulnerable and reporting otherwise, so
+				 * missing such a mismatch is safe.
+				 */
+				printf("Branch misses > 95%% unexpected in this configuration.\n");
+				printf("Count cache likely disabled without Linux knowing.\n");
+				if (state == COUNT_CACHE_FLUSH_SW)
+					printf("WARNING: Kernel performing unnecessary flushes.\n");
+				return 4;
+			}
 			printf("Branch misses > 15%% unexpected in this configuration!\n");
 			printf("Possible mis-match between reported & actual mitigation\n");
-			/*
-			 * Such a mismatch may be caused by a guest system
-			 * reporting as vulnerable when the host is mitigated.
-			 * Return skip code to avoid detecting this as an error.
-			 * We are not vulnerable and reporting otherwise, so
-			 * missing such a mismatch is safe.
-			 */
-			if (state == VULNERABLE)
-				return 4;
 
 			return 1;
 		}
-- 
2.32.0

