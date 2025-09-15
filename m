Return-Path: <linuxppc-dev+bounces-12246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0966B58257
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 18:44:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQW8J3srbz3fBK;
	Tue, 16 Sep 2025 02:44:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757950359;
	cv=none; b=cUgJ7q6GZgzUpHx5/nSLGCOlK1Gezsyc5dMqLd37+rPzDQByiIKdYREbTsX+TrLGXCXber7tEmwx+n4ABGfm5D4VIrK3swtOt/4/lqI0EG0NJ5PeyQaHZjqoCjTa0mmjYCjDFjczlDzkjg5sIiTsGG6Ip2mE04tt+EYIXXiaehbdpduDGbSevziQ40Ik+ptuoPFJXi4WsPXac5JS3N2r/OFJ4NpWGFMsClmvE6UbHPx76zutIjiAIkpYJAonZ9qtumavsv4EnczutTkOVMQ1qa6gbmuvOEdG8qD10iHXsveNiM7aDoPnv79NNtI4Je10nv6/zm6cCzN7KAmpNuKPYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757950359; c=relaxed/relaxed;
	bh=7O6H4yncJtI6jRPxDIzl6fb1efR8GujWZKD7CmF704s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aSjWEdEoxmdn4fF7iVfnobHrlVw25chjFOwEh2gjbhj3tQcKkiti4O5nZcbh4zBE8Tcu97xUL+0O5ssIoNeQZX+DT9dZxXd2762OeSGeHfINIw8iNdMIS1AOdM5lteXF9yHy8g0yi3mSVzcBC9hKPK2iEurKvWqxitTQjcsNqhPGmMYLxAc5chaDPLnoLDKlOVF3oUbx6KKM/BbH5d3o60Mf+u1n38p+TFH4lPUB9rEXawpaWtiPFyZeH7a1E/rhFzyWNxrZIVBF8M0PGYF6LORxw8ax8+jWuX8DVudllfImfNZuSxOyr5jD4PNKLozfm7CWb9cMhm/hpf7458BTjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=JuKhUUpb; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=JuKhUUpb; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=JuKhUUpb;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=JuKhUUpb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQTYg1gnsz3dVJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:32:39 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id BB6F91FBAB;
	Mon, 15 Sep 2025 15:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757950351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7O6H4yncJtI6jRPxDIzl6fb1efR8GujWZKD7CmF704s=;
	b=JuKhUUpbXUa1W7YY+T5rdcwhDB/7E13XHKiW4CfOyWC87oUWcFiS62vFZZBZsc0Fw/2wCK
	5/5n1tTDzrOjXG0t9lNaB8pxbkDTFf0GWj1FxY/6K4WaTrPDUpOImweNs+ltILsrhoH5nf
	4qKfqWggHCttYdzup5Hb82ydICXMrUQ=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=JuKhUUpb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757950351; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=7O6H4yncJtI6jRPxDIzl6fb1efR8GujWZKD7CmF704s=;
	b=JuKhUUpbXUa1W7YY+T5rdcwhDB/7E13XHKiW4CfOyWC87oUWcFiS62vFZZBZsc0Fw/2wCK
	5/5n1tTDzrOjXG0t9lNaB8pxbkDTFf0GWj1FxY/6K4WaTrPDUpOImweNs+ltILsrhoH5nf
	4qKfqWggHCttYdzup5Hb82ydICXMrUQ=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2C8A31368D;
	Mon, 15 Sep 2025 15:32:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id U8grB48xyGjVdwAAD6G6ig
	(envelope-from <antonio.feijoo@suse.com>); Mon, 15 Sep 2025 15:32:31 +0000
From: Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
Subject: [PATCH 1/2] powerpc/boot: Add missing compression methods to usage
Date: Mon, 15 Sep 2025 17:31:14 +0200
Message-ID: <20250915153114.40578-1-antonio.feijoo@suse.com>
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
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,csgroup.eu,vger.kernel.org,lists.ozlabs.org,suse.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Rspamd-Queue-Id: BB6F91FBAB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
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


