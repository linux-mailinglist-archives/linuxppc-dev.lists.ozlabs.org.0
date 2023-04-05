Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 360106D7BC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 13:43:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps2p310TJz3cjN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 21:43:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=idnRPt7g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps2n66HT4z3bTJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 21:42:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DQKKqvngu6XrRzj+GHyns7zyGuc6jnX9ARbttsuRzGk=; b=idnRPt7gzQIUPNNaD/IneFbHZm
	Hm/M7lAn3X4M4YAYJsQgsjTurXZhVLP+iiZ9DLmmlDgK6Ty2FAY7CRFNNpqMni4zQbFYv3FtAENxu
	rNPAKqNkSHWeLDWiAjKwNyv5my/aHd3mnPLCSOHTHa9T7oJzr+m9d08KJcsOsdQQx5jQUsB9UhhSb
	RLcTiqExcEOHERblZmxKkZC4oD4bnhiuRkWSqwuebLcFLkMDvh1IOWxDvijroXsSnIf9/EcuRxJFg
	DXJ4LPSdwxCbUqwIBrua3JDo72zyVBMFh6D4PI6IsCPV+XocyHo3f1L25Z3MBwKSoBQ7MBQZtcEmr
	6DcJWnTw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pk1WT-009tua-07;
	Wed, 05 Apr 2023 11:41:53 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id F3173300274;
	Wed,  5 Apr 2023 13:41:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9417320B6A7D6; Wed,  5 Apr 2023 13:41:48 +0200 (CEST)
Date: Wed, 5 Apr 2023 13:41:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <20230405114148.GA351571@hirez.programming.kicks-ass.net>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
 <ZC1XD/sEJY+zRujE@lothringen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC1XD/sEJY+zRujE@lothringen>
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
Cc: geert+renesas@glider.be, tony@atomide.com, linus.walleij@linaro.org, dave.hansen@linux.intel.com, Yair Podemsky <ypodemsk@redhat.com>, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 01:10:07PM +0200, Frederic Weisbecker wrote:
> On Wed, Apr 05, 2023 at 12:44:04PM +0200, Frederic Weisbecker wrote:
> > On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
> > > +	int state = atomic_read(&ct->state);
> > > +	/* will return true only for cpus in kernel space */
> > > +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> > > +}
> > 
> > Also note that this doesn't stricly prevent userspace from being interrupted.
> > You may well observe the CPU in kernel but it may receive the IPI later after
> > switching to userspace.
> > 
> > We could arrange for avoiding that with marking ct->state with a pending work bit
> > to flush upon user entry/exit but that's a bit more overhead so I first need to
> > know about your expectations here, ie: can you tolerate such an occasional
> > interruption or not?
> 
> Bah, actually what can we do to prevent from that racy IPI? Not much I fear...

Yeah, so I don't think that's actually a problem. The premise is that
*IFF* NOHZ_FULL stays in userspace, then it will never observe the IPI.

If it violates this by doing syscalls or other kernel entries; it gets
to keep the pieces.


