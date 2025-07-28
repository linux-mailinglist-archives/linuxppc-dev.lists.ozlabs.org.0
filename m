Return-Path: <linuxppc-dev+bounces-10421-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B489B1337E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jul 2025 05:56:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4br4Qn3W4bz307K;
	Mon, 28 Jul 2025 13:56:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.21.126.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753667385;
	cv=none; b=J986Ym3Jv8K9NCUudjkRLfD/rTD7XLW2algaOOw9Qhe+lZC+5UDuTLpMC93Uy1e4KDhv7wHl+X/2vwV1YEtSQFc7OUT2vnDZw8C61SNaV40M4pXsSGJRliFu8j6xv9eoSlpn0BspZOTDEeXxISrBZh9aoQwsflfkKu+BmULO4tXlk+H0h0xv5oh3V1p3Z/4lHFEN10GugIGqQB5wOeQ5ce6Dj6anNda3kfV4Ctxam6zL/xiGa5LrYhGIviYJBCOUG67OKH7pzqEzQQBWUHPePpLeHQTIbPoS9u3tWziSK2z1nA1Ist9KwfpTIu1DdjqgwNOElPgwxLuMImtFwdDl4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753667385; c=relaxed/relaxed;
	bh=ti31xmwGZ1MN5x9vPPFg6aGJUrXry4ziyUyrFjUORIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncZXBgUovPgjn+FIkvncttIjz5eNgsKn2VUaQJzS7yNkW7kFNHclFME0ew6jg2J/dZUm0AEFdHlvaOJYYWR0g/M1myn7T01Az6n8Fm7vsn5XdCfKYXhIAoU8sphtTW2HlWotJq2uA08NvYu/8Im3Bf4glM8mLtdBKsoCBgJQePWt2gZ8YPDbBWvM0vb6Sukcwtq8kGyz95zx+Me3qizEEbOPSUFmfUEdk8cKVyGpkb9RbuwnhYqUgNPlBOevJFNvWjq1wCfcJ+RgDeCpEYJe0P2liAOevhbn7g/Sf8ZWVSwBbzoeot6QqvyN+6MVKIqyxsLrgOlYRVZlsB2Naln4Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in; dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.a=rsa-sha256 header.s=mail header.b=HSkvjIAj; dkim-atps=neutral; spf=pass (client-ip=103.21.126.57; helo=smtp1.iitb.ac.in; envelope-from=akhilesh@ee.iitb.ac.in; receiver=lists.ozlabs.org) smtp.mailfrom=ee.iitb.ac.in
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=ee.iitb.ac.in
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=iitb.ac.in header.i=@iitb.ac.in header.a=rsa-sha256 header.s=mail header.b=HSkvjIAj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ee.iitb.ac.in (client-ip=103.21.126.57; helo=smtp1.iitb.ac.in; envelope-from=akhilesh@ee.iitb.ac.in; receiver=lists.ozlabs.org)
X-Greylist: delayed 302 seconds by postgrey-1.37 at boromir; Mon, 28 Jul 2025 11:49:42 AEST
Received: from smtp1.iitb.ac.in (smtpd2.iitb.ac.in [103.21.126.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4br1ck402Kz307K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 11:49:42 +1000 (AEST)
Received: from ldns1.iitb.ac.in (ldns1.iitb.ac.in [10.200.12.1])
	by smtp1.iitb.ac.in (Postfix) with SMTP id 63E9E104D00A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 07:14:35 +0530 (IST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.iitb.ac.in 63E9E104D00A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=iitb.ac.in; s=mail;
	t=1753667075; bh=3vlZGc/DHNfl1nX+4w/9/X0vKZTTie393s6G3A8xs7c=;
	h=Date:From:To:Cc:Subject:From;
	b=HSkvjIAj0FH9lAPypfS+1zGszzrC0pimomPqngMfp1bHxDkCeNwe/gQoHUxlLunls
	 BLXI+tP2XiZjJHfNHXijAHJHv4Q2u+9mdDHQVv7ubE4vfVddLoQS7Rbp1+I61v5tFe
	 WqUQXrjD4a0QETW0BNZocPts/xs7C60SJvUkTwmY=
Received: (qmail 10676 invoked by uid 510); 28 Jul 2025 07:14:35 +0530
X-Qmail-Scanner-Diagnostics: from 10.200.1.25 by ldns1 (envelope-from <akhilesh@ee.iitb.ac.in>, uid 501) with qmail-scanner-2.11
 spamassassin: 3.4.1. mhr: 1.0. {clamdscan: 0.101.4/26439} 
 Clear:RC:1(10.200.1.25):SA:0(0.0/7.0):. Processed in 3.718594 secs; 28 Jul 2025 07:14:35 +0530
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Pyzor: Reported 0 times.
X-Envelope-From: akhilesh@ee.iitb.ac.in
X-Qmail-Scanner-Mime-Attachments: |
X-Qmail-Scanner-Zip-Files: |
Received: from unknown (HELO ldns1.iitb.ac.in) (10.200.1.25)
  by ldns1.iitb.ac.in with SMTP; 28 Jul 2025 07:14:31 +0530
Received: from bhairav.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	by ldns1.iitb.ac.in (Postfix) with ESMTP id CF33B36003B;
	Mon, 28 Jul 2025 07:14:30 +0530 (IST)
Received: from bhairav-test.ee.iitb.ac.in (bhairav.ee.iitb.ac.in [10.107.1.1])
	(Authenticated sender: akhilesh)
	by bhairav.ee.iitb.ac.in (Postfix) with ESMTPSA id 900A31E8128E;
	Mon, 28 Jul 2025 07:14:30 +0530 (IST)
Date: Mon, 28 Jul 2025 07:14:25 +0530
From: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
To: gregkh@linuxfoundation.org, jirislaby@kernel.org,
	andriy.shevchenko@linux.intel.com, john.ogness@linutronix.de,
	pmladek@suse.com, johan@kernel.org, namcao@linutronix.de,
	timur@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, akhileshpatilvnit@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH] tty: serial: ucc_uart: use WARN_ON() instead of BUG()
Message-ID: <aIbV+WbhFMDamaiW@bhairav-test.ee.iitb.ac.in>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Replace BUG() with WARN_ON() as recommended in
Documentation/process/deprecated.rst
Fix system entering into unstable/break/undebuggable state due to use
of BUG(). Follow strict suggestions as per [1] [2].

Link: https://lore.kernel.org/lkml/CA+55aFy6jNLsywVYdGp83AMrXBo_P-pkjkphPGrO=82SPKCpLQ@mail.gmail.com/ [1]
Link: https://lore.kernel.org/lkml/CAHk-=whDHsbK3HTOpTF=ue_o04onRwTEaK_ZoJp_fjbqq4+=Jw@mail.gmail.com/ [2]
Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
---
 drivers/tty/serial/ucc_uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index 0613f8c11ab1..6214ab1b67cb 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -223,7 +223,7 @@ static inline dma_addr_t cpu2qe_addr(void *addr, struct uart_qe_port *qe_port)
 
 	/* something nasty happened */
 	printk(KERN_ERR "%s: addr=%p\n", __func__, addr);
-	BUG();
+	WARN_ON(1);
 	return 0;
 }
 
@@ -242,7 +242,7 @@ static inline void *qe2cpu_addr(dma_addr_t addr, struct uart_qe_port *qe_port)
 
 	/* something nasty happened */
 	printk(KERN_ERR "%s: addr=%llx\n", __func__, (u64)addr);
-	BUG();
+	WARN_ON(1);
 	return NULL;
 }
 
-- 
2.34.1


