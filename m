Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C673A771B12
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 09:04:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SpNvqN9W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RK6l84SGwz3c5Q
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 17:04:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=SpNvqN9W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=mhocko@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RK6k84l2dz2yW7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 17:04:00 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6CB1C2189B;
	Mon,  7 Aug 2023 07:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691391824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qBVvdfQ+7uAuAbXARcqoglYVEWjC2ubdJ2O+ToyhcnU=;
	b=SpNvqN9W8w6c37IfcNk3eNCCy+0l0bY2sLCvSbaXXbOq+nOiCcs5cLMdA3n9BIlH9vi8jv
	8ByLlL96TK8WiF7qhIOzvIwWLjdpbTOwSIgsMSMdc2Zhix/B3WxC9HUozdEXzDUtH3HOia
	ikj4S2h/luSXV1azSnZY+DCjxmABQiQ=
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43F6D13910;
	Mon,  7 Aug 2023 07:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2asJEFCX0GQwWAAAMHmgww
	(envelope-from <mhocko@suse.com>); Mon, 07 Aug 2023 07:03:44 +0000
Date: Mon, 7 Aug 2023 09:03:43 +0200
From: Michal Hocko <mhocko@suse.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
Message-ID: <ZNCXT+nRHnTKJX0y@dhcp22.suse.cz>
References: <20230803160649.v3.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
 <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
 <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
 <ZM0S9gKBBiu83kFq@dhcp22.suse.cz>
 <CAD=FV=XhksUsBKjkD08YxdmxvvbgoZH-va7WnPptkYA6EOpPsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XhksUsBKjkD08YxdmxvvbgoZH-va7WnPptkYA6EOpPsg@mail.gmail.com>
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

On Fri 04-08-23 09:06:07, Doug Anderson wrote:
> Hi,
> 
> On Fri, Aug 4, 2023 at 8:02 AM Michal Hocko <mhocko@suse.com> wrote:
> >
> > > > It would have been slightly safer to modify arch_trigger_cpumask_backtrace
> > > > by switching arguments so that some leftovers are captured easier.
> > >
> > > I'm not sure I understand. Oh, you're saying make the prototype of
> > > arch_trigger_cpumask_backtrace() incompatible so that if someone is
> > > directly calling it then it'll be a compile-time error?
> >
> > exactly. bool to int promotion would be too easy to miss while the
> > pointer to int would complain loudly.
> >
> > > I guess the
> > > hope is that nobody is calling that directly and they're calling
> > > through the trigger_...() functions.
> >
> > Hope is one thing, being preventive another.
> >
> > > For now I'm going to leave this alone.
> >
> > If you are going to send another version then please consider this. Not
> > a hard requirement but better.
> 
> If I do send another version, do you have any suggestions for how to
> change this to make it incompatible?

I would swap parameters as this seems simplest.

> I guess swapping the order of the
> parameters would be best? I considered doing that for v4 but I felt
> like long term the current order of the parameters was better.

Yes the current ordering is better but having it other way around is not
really horrendous either.

> I also
> considered a rename, but that different problems. ;-) If I rename both
> the #define and the function then if someone has an out-of-tree patch
> adding arch_trigger_cpumask_backtrace() for another architecture, like
> say arm64, then there would be no compile-time failure indicating that
> the out-of-tree patch needs updating. I could rename the functions but
> _not_ the #define, I guess?

I think that swapping would be simplest as the type mismatch should
catch also pending out-of-tree potential implementations.

-- 
Michal Hocko
SUSE Labs
