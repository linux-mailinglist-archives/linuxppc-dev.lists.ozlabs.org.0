Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5334E5A7070
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 00:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MHM851Mrgz3cdp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Aug 2022 08:15:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H4kEIIWy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=brauner@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H4kEIIWy;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MHBkf19Zdz2xJ2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Aug 2022 01:56:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0E8B8615EB;
	Tue, 30 Aug 2022 15:56:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47D16C433D6;
	Tue, 30 Aug 2022 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661874998;
	bh=4MfZ2CCn8fhHH/Gt5iirr/AOGINTw9QezerOet2l08g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H4kEIIWyxgOlguNNyyYoVWW9S5KnAAsJ+EbiyQQErMIK+stft/vi0m5cy1LomDk2L
	 h5VpgDwrWcXRd4Kt0Zxcu2QUgkZMPebEozFNt2ciI5hxfGK3QTONM94Bj8y4E8W0sM
	 qtONO/KZG8Gj4rAIvh084ZaWbp0KzPNvMyEkfPXcOXV9s+UfPa7REHR7Yq7sq5VSC/
	 c7CYrs0CM8tDqKQ9StIutf7uJEc2kqU+da1fxdoD3dMgrpTIk7JWsIPNpn/gNfah2C
	 nfj89MpvCJbSx2PXt9/k3zsgkUpcS5N1U6vsKmV8rNeKNQFs6rFZ+Y4VIwNRB6hra8
	 PeEiQsd2EITXw==
Date: Tue, 30 Aug 2022 17:56:22 +0200
From: Christian Brauner <brauner@kernel.org>
To: Christian =?utf-8?B?R8O2dHRzY2hl?= <cgzones@googlemail.com>
Subject: Re: [RFC PATCH 2/2] fs/xattr: wire up syscalls
Message-ID: <20220830155622.4hcj6dka5jswydrg@wittgenstein>
References: <20220830152858.14866-1-cgzones@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220830152858.14866-1-cgzones@googlemail.com>
X-Mailman-Approved-At: Wed, 31 Aug 2022 08:14:47 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, "Peter Zijlstra \(Intel\)" <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mips@vger.kernel.org, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Paul Moore <paul@paul-moore.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, linux-xtensa@linux-xtensa.org, =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Vasily Gorbik 
 <gor@linux.ibm.com>, selinux@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, linux-alpha@vger.kernel.org, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Suren Baghdasaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Wang Haojun <jiangliuer01@gmail.com>, linux-parisc@vger.kernel.org, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>, linux-audit@redhat.com, Arnd Bergmann <arnd@arndb.de>, Sven Schnelle <svens@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-fsdevel@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-d
 ev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 30, 2022 at 05:28:38PM +0200, Christian Göttsche wrote:
> Enable the new added extended attribute related syscalls.
> 
> Signed-off-by: Christian Göttsche <cgzones@googlemail.com>
> ---

Fwiw, I think a while ago it was pointed out that for most syscall
additions you can just fold the hookup patch in. It probably also
wouldn't hurt to trim that Cc list significantly down to mostly the
lists...
