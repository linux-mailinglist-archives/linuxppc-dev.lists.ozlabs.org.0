Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F58A74EF24
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:39:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Gyep6a1g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0gRc1yYsz3c51
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:39:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Gyep6a1g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0gDj4MXDz2y3Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 22:29:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Hu/F5cIunoMaT6a9kqfbZcMI7NNurFOLxchc3V/T840=; b=Gyep6a1gLgAdGC/Vi+oGeCj6t2
	IKyL5/1RD8Tt4FNIzAW4j/atfGUaAPjhcTyA3GXH97IiwjxIU7Y/8B0fe9w8Muqivjaw/yL4bo5D4
	5ZB6Z3jktax9ZhaYYlnpZ/6Oq2ASsc4zeolrABZ2MM6Kdwl61InYH3P9Iq/clR9bEshpkcTPgt83a
	HcgfknEVHsZHsbDQUQVwhK7+voDCXknT2H10c2k4CU3PIKN/myEz2CoJrRiGA1cFSqntUv8vLlRLZ
	MsgcNgtIOxR6kAkYIn3W2vzZiImwsqNNg3I5cIwMsUw6LmokGgjjMBQXCL8w1O5cla/0aNYRbdjkx
	RH8+Ud9g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qJCTM-00FiF8-9q; Tue, 11 Jul 2023 12:28:04 +0000
Date: Tue, 11 Jul 2023 13:28:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Alexey Gladkov <legion@kernel.org>
Subject: Re: [PATCH v3 2/5] fs: Add fchmodat4()
Message-ID: <ZK1K1BOf43JOJWMx@casper.infradead.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11b93ad8e3b669afaff942e25c3fca65c6a983c.1689074739.git.legion@kernel.org>
X-Mailman-Approved-At: Tue, 11 Jul 2023 22:37:01 +1000
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, Palmer Dabbelt <palmer@sifive.com>, heiko.carstens@de.ibm.com, stefan@agner.ch, ldv@altlinux.org, dhowells@redhat.com, kim.phillips@arm.com, paulus@samba.org, deepa.kernel@gmail.com, hpa@zytor.com, sparclinux@vger.kernel.org, will@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, hare@suse.com, fweimer@redhat.com, ysato@users.sourceforge.jp, deller@gmx.de, x86@kernel.org, linux@armlinux.org.uk, borntraeger@de.ibm.com, mingo@redhat.com, firoz.khan@linaro.org, linux-arm-kernel@lists.infradead.org, jhogan@kernel.org, geert@linux-m68k.org, mattst88@gmail.com, linux-mips@vger.kernel.org, gor@linux.ibm.com, fenghua.yu@intel.com, Arnd Bergmann <arnd@arndb.de>, peterz@infradead.org, glebfm@altlinux.org, tycho@tycho.ws, acme@kernel.org, schwidefsky@de.ibm.com, linux-m68k@lists.linux-m68k.org, bp@alien8.de, viro@zeniv.linux.org.uk, luto@kerne
 l.org, namhyung@kernel.org, tglx@linutronix.de, christian@brauner.io, rth@twiddle.net, axboe@kernel.dk, James.Bottomley@hansenpartnership.com, monstr@monstr.eu, tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org, ink@jurassic.park.msu.ru, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 01:25:43PM +0200, Alexey Gladkov wrote:
> -static int do_fchmodat(int dfd, const char __user *filename, umode_t mode)
> +static int do_fchmodat4(int dfd, const char __user *filename, umode_t mode, int lookup_flags)

This function can still be called do_fchmodat(); we don't need to
version internal functions.

