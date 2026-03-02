Return-Path: <linuxppc-dev+bounces-17482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOvKEG7cpGk0ugUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17482-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 01:40:14 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7EF1D224D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 01:40:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPKpF42wCz2xRq;
	Mon, 02 Mar 2026 11:40:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772412005;
	cv=none; b=cgjiSALqH/sASviYgLa1YCWlCKzoV4sVCMLo4Eq/TPu0ao22p+jNiIR6RGX1ps30ERTslmM2CfoU5AVxJ3FExCAA1tN97JBTYo8fCUuNSzJe09B93tnMPVC6G6erRTc46uIkUT3M5RlMS/vYxJBwJNCSqXgpu4gGme7acUxSxEsggWWEVdqCoAi5rKYKzMUr2nHxzyzbJW1WjmGYtvInbiAXlP/Av8M7SlkNn3RkuX9XM6L69y/CpIvLsereHn/jX5Bdk+BKEFVyn95QujasqxZrBglG4RZnBqPqPwM3LEtth7qzzsS2YV8T5iYrVNrsq7qeTjjpcrUSWBc2c1MkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772412005; c=relaxed/relaxed;
	bh=7GZ2RRx7O92LjCo7RxqkMuENtOBSVFiWMFDEjbnkLX0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kBeBHsMpN+PEQ98+DyZ0Qjc5r13pyMhxnqzrzdtqWACszHYh0e6Kyk1SS8BO7yjNbyF5ZRtzqNeRQwd5ha1rjoU4ODs7T/ntBlJMOapClw3Uuv6oMChXLNvx+m8GYQeK8Bnnyq+BaCQ9s6cqjMSXArEmaZHAcBY6hKWNRVMTSIuy4uXF1eXoIrFO016PJYxxjAc35koxxTqSu7nz8/owt5iDwyd7HmzMt08bslrHUvc+0QZ9KxTPyiSGpYSS74H9gsBv9AUi6RxQwvOkLC4CMrUYHbdRQ2KVRa7Jrt/8/B5cAjJ6/9aKuHEWfWYHc/mLry7upwgw8YZh6CbgYLWLTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2JMlHi+h; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6egGOTus; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2JMlHi+h;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6egGOTus;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPKpD3b3mz2xNC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 11:40:04 +1100 (AEDT)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772411998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7GZ2RRx7O92LjCo7RxqkMuENtOBSVFiWMFDEjbnkLX0=;
	b=2JMlHi+h0t9Dbgdx2J7d8ObJZx1v0a4AWjeAdgTVfxQ4HfIrkiLvRZqk1RXbucQnsemDiR
	4njdlphkHoX9JfhVOiy5rBiJMmQQkb3JNP0g+gRtjq5vvOf5/LzFFe6Vk+sqxWLyRZ6ayt
	jkKOZMZHHPG3u9LYSzILyWVMhomccIBhxQploe/YjHXjG31LrVfL7XBxvr4LuZKqA1HWue
	k/Zgo2Ft9cmWiuq4VFrtZv2dyrqV7DFAK1Ije9IUxpnQQF4nXD+TQROk5JHDagD7s6gp/y
	hFlZzFQy+sQKGpcqSoxi5skEDxF1IPLYHUWf0h9WTYnNGQMi3DlKgh8EG3njpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772411998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=7GZ2RRx7O92LjCo7RxqkMuENtOBSVFiWMFDEjbnkLX0=;
	b=6egGOTusrjdSyMRBH6TLMJT1V2sVbaNiavS+t9AT0IEQveMj8bV4q0UHUvU8jKZJkkPS9G
	IyssSQRslYqulTCQ==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Nilay Shroff <nilay@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/pseries: Correct MSI allocation tracking
Date: Mon,  2 Mar 2026 01:39:48 +0100
Message-ID: <20260302003948.1452016-1-namcao@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,lists.ozlabs.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-17482-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[namcao@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:nilay@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:stable@vger.kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[linutronix.de:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[namcao@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 5B7EF1D224D
X-Rspamd-Action: no action

The per-device MSI allocation calculation in pseries_irq_domain_alloc()
is clearly wrong. It can still happen to work when nr_irqs is 1.

Correct it.

Fixes: c0215e2d72de ("powerpc/pseries: Fix MSI-X allocation failure when qu=
ota is exceeded")
Cc: stable@vger.kernel.org
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/powerpc/platforms/pseries/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index 64ffc6476ad6..8285b9a29fbf 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -605,7 +605,7 @@ static int pseries_irq_domain_alloc(struct irq_domain *=
domain, unsigned int virq
 					      &pseries_msi_irq_chip, pseries_dev);
 	}
=20
-	pseries_dev->msi_used++;
+	pseries_dev->msi_used +=3D nr_irqs;
 	return 0;
=20
 out:
--=20
2.47.3


