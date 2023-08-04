Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF97A7703D2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 17:03:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lk1XMNHd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHTVS4bYsz3cW3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 01:03:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lk1XMNHd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHTTX2b8Vz2yDL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 01:02:24 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id E6C0921888;
	Fri,  4 Aug 2023 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691161334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VNWjSzFu/PyMqv6O223Z6nS9JKkdr9V4bRYfAQix7nk=;
	b=lk1XMNHdUBmmPgv2SbCy1HPgNADs5W9jPaKQk5f95D0ji/Kgs8ioTEuIp8biBXwjs1qmZ1
	DiFaVY7HQOUrW/Ni/kuVUUuHlF9fOwxllYFqY0tab1QiufzfgVh4ZneVj/CAfbnw8UZCx8
	C9Flw2p3O6/4ZMw5+YhH870Kk2vgfAg=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B586B133B5;
	Fri,  4 Aug 2023 15:02:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id o4i3K/YSzWSpRwAAMHmgww
	(envelope-from <mhocko@suse.com>); Fri, 04 Aug 2023 15:02:14 +0000
Date: Fri, 4 Aug 2023 17:02:14 +0200
From: Michal Hocko <mhocko@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
Message-ID: <ZM0S9gKBBiu83kFq@dhcp22.suse.cz>
References: <20230803160649.v3.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
 <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
 <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>, Pingfan Liu <kernelfans@gmail.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Gaosheng Cui <cuigaosheng1@huawei.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Schneider <vschneid@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>, Arnd Ber
 gmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 04-08-23 06:56:51, Doug Anderson wrote:
> Hi,
> 
> On Fri, Aug 4, 2023 at 12:50 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Thu 03-08-23 16:07:57, Douglas Anderson wrote:
> > > The APIs that allow backtracing across CPUs have always had a way to
> > > exclude the current CPU. This convenience means callers didn't need to
> > > find a place to allocate a CPU mask just to handle the common case.
> > >
> > > Let's extend the API to take a CPU ID to exclude instead of just a
> > > boolean. This isn't any more complex for the API to handle and allows
> > > the hardlockup detector to exclude a different CPU (the one it already
> > > did a trace for) without needing to find space for a CPU mask.
> > >
> > > Arguably, this new API also encourages safer behavior. Specifically if
> > > the caller wants to avoid tracing the current CPU (maybe because they
> > > already traced the current CPU) this makes it more obvious to the
> > > caller that they need to make sure that the current CPU ID can't
> > > change.
> >
> > Yes, this looks like the best way forward.
> >
> > It would have been slightly safer to modify arch_trigger_cpumask_backtrace
> > by switching arguments so that some leftovers are captured easier.
> 
> I'm not sure I understand. Oh, you're saying make the prototype of
> arch_trigger_cpumask_backtrace() incompatible so that if someone is
> directly calling it then it'll be a compile-time error? 

exactly. bool to int promotion would be too easy to miss while the
pointer to int would complain loudly.

> I guess the
> hope is that nobody is calling that directly and they're calling
> through the trigger_...() functions.

Hope is one thing, being preventive another.

> For now I'm going to leave this alone.

If you are going to send another version then please consider this. Not
a hard requirement but better.
 

-- 
Michal Hocko
SUSE Labs
