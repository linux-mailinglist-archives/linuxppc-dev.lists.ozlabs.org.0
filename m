Return-Path: <linuxppc-dev+bounces-12247-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2AEB5825C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Sep 2025 18:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cQW8n0QhFz3fQR;
	Tue, 16 Sep 2025 02:44:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757950250;
	cv=none; b=DNi5oVxEFmhDn7USrEwrbIar7wa7yd1ECTYXPK82gABWzZwJ8sC/9uPeHwhuG150CLCUBGVW6VGEula3Rlws/QH1yRt0e0G87ZbhNmK/wOe2+Mlc+dquc5EukFdZwpQ44BCoYySjVC8zVi3C4idf4eXenEsWrm95gPe37gvstJdbY0joVMQo9HGyqdgN3qyNcoETRII/t/vkBYvKrQsJIygA8ssOpe7cxHA7C8Pq7sBoezTQFPqOBgwjBN347ENo5IuH5Fhh5CAENxvz6kzYyTRcySklfUtTr6dpXn/OsicgbR1oOaqikYkeh0cweAncNICt8GfcUMG3JpraR8A+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757950250; c=relaxed/relaxed;
	bh=gnpp7yykBMu415Och8szW/n2ntzL+rYn469m57fFnFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gf6FmpLZ4+e3YvXOHKAOmCNL7lpGJ3KxOI8NIWtUg2EJ/4Wt2PEShveUpmTF1u50wBHg36p/Y14dyYjsJqNyCVWjvu0W5UhaIQJFM85RXlstybl4nXwAST+lHpbEdp4gtsxWCGAGeHVye+QKcWpD/f9nL5BPS/jPSj78BVszFxEO1x5xgAlBw3Qilj/O9F4CHGHgoAZ7eCcWli18i/j54nENyI18dM4buf/aumDOm7Ezei1VaCUIUH0tec4Xt2tT1aldwPYoqSGMRY9Si0bIbyI5Vz0PusFe+Zn8rxOhzBxQKAmOnxAyzdpWzdvkukye2kYgdR0fRvCsLJWWpdF+tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=bCJY872m; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=FV50nokF; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=bCJY872m;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=FV50nokF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=antonio.feijoo@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cQTWY4V7Pz3dTY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 01:30:49 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D4DDE1FBAB;
	Mon, 15 Sep 2025 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757950246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gnpp7yykBMu415Och8szW/n2ntzL+rYn469m57fFnFs=;
	b=bCJY872mXHDXETNHNhDYQsrjwuBnkcN5HPTxf6UmJPoANlDiNMLKh4XOWtK7jItX3Cp0VF
	k9wH7XyPk6m33poMqh8grve+dFcXum023rO/aJLLEscoLZ20wT9r7seHrWeQdI4TcBJG5X
	huwNPcWXSAoKqQoCMFHgF0gt8cb4DSk=
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.com header.s=susede1 header.b=FV50nokF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757950245; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=gnpp7yykBMu415Och8szW/n2ntzL+rYn469m57fFnFs=;
	b=FV50nokFLmUNK60m6RPXfupYsn4T5PZ/I+9ut6WJaddVBvMAUGk9FRVkA6NYC9IoQPxDBQ
	HKpNwyVBPJ4VXxRnK1XKdqQuT69vklitz7D3asOt1ZLVouyMETKLIuGromhGJwVpT+TyT1
	LX+5YVgVX448m/j81XFhAKQoRnfjZtI=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 312481368D;
	Mon, 15 Sep 2025 15:30:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jcQ6CCUxyGhNdwAAD6G6ig
	(envelope-from <antonio.feijoo@suse.com>); Mon, 15 Sep 2025 15:30:45 +0000
From: Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
Subject: [PATCH] powerpc/boot: Fix check of supported compression methods
Date: Mon, 15 Sep 2025 17:25:30 +0200
Message-ID: <20250915152530.40256-1-antonio.feijoo@suse.com>
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
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.com:s=susede1];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,csgroup.eu,vger.kernel.org,lists.ozlabs.org,suse.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Rspamd-Queue-Id: D4DDE1FBAB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.01
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The current check is bogus and would allow to pass any value with the -Z
option.

Signed-off-by: Antonio Alvarez Feijoo <antonio.feijoo@suse.com>
---
 arch/powerpc/boot/wrapper | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index 50607bc47d05..8fbc4b98cfce 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -148,7 +148,7 @@ while [ "$#" -gt 0 ]; do
     -Z)
 	shift
 	[ "$#" -gt 0 ] || usage
-        [ "$1" != "gz" -o "$1" != "xz" -o "$1" != "lzma" -o "$1" != "lzo" -o "$1" != "none" ] || usage
+        [ "$1" = "gz" -o "$1" = "xz" -o "$1" = "lzma" -o "$1" = "lzo" -o "$1" = "none" ] || usage
 
 	compression=".$1"
 	uboot_comp=$1
-- 
2.51.0


