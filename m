Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D544B4E35B5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 01:46:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMt8N5sWvz3bTs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Mar 2022 11:46:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FjhBV/tZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMt7k3g24z2y6K
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Mar 2022 11:45:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FjhBV/tZ; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KMt7c59Xkz4xNq;
 Tue, 22 Mar 2022 11:45:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1647909935;
 bh=Bz/qcPUjp+xnV7sXCh9T8SQ8nU42UdydAMwhj8Gidog=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FjhBV/tZn1kcZ4dWO/m6PQ4NBY/1TmhFEco/B6C53AQXstdUeha5I3IejnddSEuPw
 is6OQZ5OPzJD0frfPMkGWDb3eETKdrp4Phzu6WIMqCWxNtJuXm32JFDN9w7WHGaJPd
 LOj8kLeRGOos/QGUfYETYnfKRTYxm7AriiEQT9ptxv9v7RXkmaWITrML+1IyUJllQQ
 nJKHY9MKhuZZ6RfRVPyLlh7g5AEz/2Pbl+zIFYHd6tQhOU+CbtuaMCK6z2L7GFPr89
 pRRWHI83Ck69gZWjOTV7MTCKu3wA/Fpet2YGTJREXUm2zWg0AAgxSAL3g2+ec3+Cnd
 r2F6/D4d6PrYg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Docs: admin/kernel-parameters: edit a few boot options
In-Reply-To: <20220321012216.23724-1-rdunlap@infradead.org>
References: <20220321012216.23724-1-rdunlap@infradead.org>
Date: Tue, 22 Mar 2022 11:45:28 +1100
Message-ID: <87ils6hl1z.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-ia64@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Pavel Machek <pavel@ucw.cz>, sparclinux@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Len Brown <lenb@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>, linux-pm@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, Steven Rostedt <rostedt@goodmis.org>,
 Randy Dunlap <rdunlap@infradead.org>, Sven Schnelle <svens@linux.ibm.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> Clean up some of admin-guide/kernel-parameters.txt:
>
> a. "smt" should be "smt=" (S390)
> b. add "smt-enabled" for POWERPC

I'd rather you didn't. It's not well tested and we ignore it entirely on
some platforms because it causes bugs. Eventually I'd like to remove it.

If we ever get time we'd want to support the generic `nosmt` argument
instead.

cheers
