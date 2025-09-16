Return-Path: <linuxppc-dev+bounces-12289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40689B59BEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 17:21:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR5G26cdYz30NF;
	Wed, 17 Sep 2025 01:21:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a07:de40:b251:101:10:150:64:1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758003554;
	cv=none; b=Dl2c98rkxfkMeh82ehl5WJfF8/CHhJyW15Z7Sz7lqCcHY1pts/l6ZzxYAeUU7IHgpR2KkZTtUlmyh9QPPNJ7vBfx5KLMgTgUbmXZXQKUGDwLvXi3yHLB3PN0iUXwn46eO09K7WgzW7QbDhPIf9vRLU17pEdiJcHSQSg/1HCX6woNWDI16YQP7CJuGX9yP725h7OcQqxLhwKjgD4euCvV1kJkVOqrsCWi8R3Zx2rONbx4eYbmBBqqJrWwhk2iQ9g9fOepj1twc3QaZv3b9KfCIAsQekNdKfjHFVkkkyOI98PC7qzV4z3OWpFiMcQirIu6oxSG+dVwIxPbBIkWD6ResQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758003554; c=relaxed/relaxed;
	bh=7O6H4yncJtI6jRPxDIzl6fb1efR8GujWZKD7CmF704s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KNeo57Eu7R/NHYihU0wua1Qeeqd9j0y15vXkd61nxGX8gHdL/44GQ1jM8Iac0U8AMIB/EpGWIdGQ+V+4iKFmt3nGSndr1tX4XmG1k0znzRRVPlLZCTlqw6Y7d6Tq/vwMP9n43s57Y3baZuOO1Zc/gt3jG8ZtH9M0beoPxuH7rQ7Y5mb8MqBVGJIDiM6xOFmxB12VOv6DmxzdxGs4ifzos6aIChExBfKnL1Fm0aMksyJHY05ID4CFqVZgmpMVwRD2Eu69UPGIhYfFJiHgIxywoitOAfxWXzisoXg9uWoqUUZH9bvVFc9coi+oM8axtNqHz5rCDhwl8W7aMGuhymrl/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=c8tCVTSS; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rz0qvUIy; dkim-atps=neutral; spf=pass (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=c8tCVTSS;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=rz0qvUIy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 53197 seconds by postgrey-1.37 at boromir; Tue, 16 Sep 2025 16:19:13 AEST
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2a07:de40:b251:101:10:150:64:1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQsDd3Ns9z2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 16:19:13 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EAFF822603;
	Tue, 16 Sep 2025 06:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758003550; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7O6H4yncJtI6jRPxDIzl6fb1efR8GujWZKD7CmF704s=;
	b=c8tCVTSSzRZCrEUhqi2pqQ231hFrThJXU+n1WJ676Eer9O+DPXRjj5D2e4Be0BN04zLHCf
	8P63lmit8RtcMGI5lR8wjbikazo6fDhfqAXRd8RVRWJvMfkUukZKCw3QDQ0bJ2urD0ZnFH
	uPSQ1TycJVS5khhSEtnO14qI5Fl4kFs=
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1758003549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7O6H4yncJtI6jRPxDIzl6fb1efR8GujWZKD7CmF704s=;
	b=rz0qvUIycmzF6N6796sh0znHJRJL6Ut8qIdwGTrbuAXIsPSJtlaqj6TUys3jJK31gG0FB6
	VWUxQI6ckGxFQ6p0rRr91Vw+Cy0pUb+bRM2eZ3ZkUzoxE8HhtVp9SRuAM5cyFi6H9u6yQC
	FUIC/68WxFqnU3FYU+tOcl0gTEZ2EG8=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 61B4113A63;
	Tue, 16 Sep 2025 06:19:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xe1MFF0ByWijdAAAD6G6ig
	(envelope-from <antonio.feijoo@suse.com>); Tue, 16 Sep 2025 06:19:09 +0000
From: Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
Subject: [PATCH RESEND] powerpc/boot: Add missing compression methods to usage
Date: Tue, 16 Sep 2025 08:18:40 +0200
Message-ID: <20250916061840.5492-1-antonio.feijoo@suse.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.com:mid,suse.com:email];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,csgroup.eu,vger.kernel.org,lists.ozlabs.org,suse.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -2.80
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

lzma and lzo are also supported.

Signed-off-by: Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
---
 arch/powerpc/boot/wrapper | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 3d8dc822282a..50607bc47d05 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -21,7 +21,7 @@
 #		(default ./arch/powerpc/boot)
 # -W dir	specify working directory for temporary files (default .)
 # -z		use gzip (legacy)
-# -Z zsuffix    compression to use (gz, xz or none)
+# -Z zsuffix    compression to use (gz, xz, lzma, lzo or none)
 
 # Stop execution if any command fails
 set -e
@@ -69,7 +69,7 @@ usage() {
     echo 'Usage: wrapper [-o output] [-p platform] [-i initrd]' >&2
     echo '       [-d devtree] [-s tree.dts] [-e esm_blob]' >&2
     echo '       [-c] [-C cross-prefix] [-D datadir] [-W workingdir]' >&2
-    echo '       [-Z (gz|xz|none)] [--no-compression] [vmlinux]' >&2
+    echo '       [-Z (gz|xz|lzma|lzo|none)] [--no-compression] [vmlinux]' >&2
     exit 1
 }
 
-- 
2.51.0


