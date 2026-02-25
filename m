Return-Path: <linuxppc-dev+bounces-17140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GgcgEWCOnmmxWAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 06:53:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 492EA1922F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 06:53:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLP0C0sT1z3dKc;
	Wed, 25 Feb 2026 16:53:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771998811;
	cv=none; b=ofjyiDE/l/fZ81bhb4UPCmujomTelhQMB4xtaeqNiuAk9q5GhQrw6jmc48cWnmSc/qcvqjZtRqKoNnM+BwVyt3hJ+jLql6taYOEr7yqltMvqkfHUe18AKuciDXNz0jSkK6SxgM5q7T+wgvzH2P4x5FithMj1bN5Cl5CdR0N0ewihPMY84FzxB4VrR54Np5PAySLTrecW2Rw9PRQuuzIIqYEX8FZ+xA1mf3M+nlutvLm8cE2Qu2RcgP37110pv5N+DapGsOhEv2W/yuppE4fwpLAwuY516Z96gA/hPeoBLTNffcu5fgCFPVXHaZvUr5Ad3GeI1uHuPDhn348pSRiSaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771998811; c=relaxed/relaxed;
	bh=cV8g4tsvZocUTBNUnjG1UwoNol+mtoZh+bM8514d3RE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CFcF4VFiRalecM0FnzI9TSh5r/620j2hIZ8vFOBjPT+TT1x2Hilr7SFL/ti4LymD3i5YwQhcT/ZsmbqmOMTTY4FTNt4C2jH7TUE9F3KRYSSItfvvOYoeN1hzKZf7FxUm4O9AnU15f+K1712TXQyk2QA1DdNFcTF3flKeREq/Nwcp1EMv3cRA//lKLq8F9WG4E+z8uvunlSlnTOBSSQjtg9k1iH5qG/V9jT+wqEqasbCNicOxXnN9Ycqx+5+9+lrch7RXxnsN03k2g7bVaNiPGTephLKWKKeF3WRMX3KR5JhpvyLdhlIWG3QRpJvAZAB3hKkXSZYIjOjnVl2xFzhEjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zgbP7wSP; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zgbP7wSP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLP064vlmz3dK9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 16:53:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=cV8g4tsvZocUTBNUnjG1UwoNol+mtoZh+bM8514d3RE=; b=zgbP7wSP/CF6RNWJY1DjA35Pr7
	Bb3azU9Raf3KMgIXSZb+4sJ1Rkx6PI5SPtKQKeP5RHQ0hvkQ67xFWehl+Aw7KDQsWGyiqHsl9YgIU
	TWrLa2iIh+4VVbuAzHXqhNoYASOShNcIerJlE+IJZvWSwnUsr5Yp9Ra8+N+HxTFwBL+Au5q/31Qf2
	jwfYHBnVykBPOZnhZhluUMzGKhaX+H2RgrCK+XmgqDa8LgY2i63dDZHP9UbEDkkHgO3rAJKJ2gUFz
	0yDzeeomtmHS+XhP1d3WYaZku4sxQcSWKk/YiXgKdK4eLiTvEdduxM1Ah03Y+Wx6Dzy5qYI1jGYFJ
	U3hTIxNw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv7pj-00000003GPT-3RKW;
	Wed, 25 Feb 2026 05:53:15 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Tiejun Chen <tiejun.chen@windriver.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc: kgdb: fix kernel-doc warnings
Date: Tue, 24 Feb 2026 21:53:14 -0800
Message-ID: <20260225055314.247966-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[infradead.org,windriver.com,kernel.crashing.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17140-lists,linuxppc-dev=lfdr.de];
	DKIM_TRACE(0.00)[infradead.org:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[rdunlap@infradead.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[windriver.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 492EA1922F8
X-Rspamd-Action: no action

Remove empty comment line at the beginning of a kernel-doc function
block. Add a "Return:" section for this function.

These changes prevent 2 kernel-doc warnings:

Warning: ../arch/powerpc/kernel/kgdb.c:103 Cannot find identifier on line:
 *
Warning: kgdb.c:113 No description found for return value of 'kgdb_skipexception'

Fixes: 949616cf2d30 ("powerpc/kgdb: Bail out of KGDB when we've been triggered")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Tiejun Chen <tiejun.chen@windriver.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/kgdb.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- linux-next-20251210.orig/arch/powerpc/kernel/kgdb.c
+++ linux-next-20251210/arch/powerpc/kernel/kgdb.c
@@ -101,7 +101,6 @@ static int computeSignal(unsigned int tt
 }
 
 /**
- *
  *	kgdb_skipexception - Bail out of KGDB when we've been triggered.
  *	@exception: Exception vector number
  *	@regs: Current &struct pt_regs.
@@ -109,6 +108,8 @@ static int computeSignal(unsigned int tt
  *	On some architectures we need to skip a breakpoint exception when
  *	it occurs after a breakpoint has been removed.
  *
+ *	Return: return %1 if the breakpoint for this address has been removed,
+ *		otherwise return %0
  */
 int kgdb_skipexception(int exception, struct pt_regs *regs)
 {

