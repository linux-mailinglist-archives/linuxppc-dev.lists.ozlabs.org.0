Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE8D6D7AC8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 13:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps24L2bZRz3fBK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 21:10:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u8LvHGP+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=frederic@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=u8LvHGP+;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps23T4ZWLz3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 21:10:13 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99FA663CB4;
	Wed,  5 Apr 2023 11:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CBBC433D2;
	Wed,  5 Apr 2023 11:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680693010;
	bh=ooCH6+LbUpOMMrNQgOWug2YiY+jDptLepUBqEHzy38Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u8LvHGP+e+G/tSvmxikKj2fPXrrk0+3vQGP+KsaklvN9YmbUCHGANHWv3q6iC5HtS
	 fy9l0bjNgR3HG3KM+EASpjRNgn7dp0Q7ndpMhPFCq5T5lviAwsVYYN/imSlMEqcc7J
	 Pi0w5XFSLGZbOcOsH4lPOKZHWzTs10xmPVp5WHoBvKxxjhceqhX9MI5gQG81P+MTe7
	 LUV9T7LzQ/XDpFte7PNV4zDO5W1rZBSwLnn10QDPGf1MrC31gIz37yW68z2ShgDqIe
	 WrsUT0GI5Rjs9+Bf9sMLDspBq0Su2t5h8EXV4hbTo1QGErDk8Mc1BEdaH+mzYziPqY
	 DTUnzQSCU4SjA==
Date: Wed, 5 Apr 2023 13:10:07 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Yair Podemsky <ypodemsk@redhat.com>
Subject: Re: [PATCH 3/3] mm/mmu_gather: send tlb_remove_table_smp_sync IPI
 only to CPUs in kernel mode
Message-ID: <ZC1XD/sEJY+zRujE@lothringen>
References: <20230404134224.137038-1-ypodemsk@redhat.com>
 <20230404134224.137038-4-ypodemsk@redhat.com>
 <ZC1Q7uX4rNLg3vEg@lothringen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC1Q7uX4rNLg3vEg@lothringen>
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
Cc: geert+renesas@glider.be, peterz@infradead.org, linus.walleij@linaro.org, dave.hansen@linux.intel.com, sebastian.reichel@collabora.com, linux-mm@kvack.org, hpa@zytor.com, sparclinux@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, ardb@kernel.org, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, vschneid@redhat.com, arnd@arndb.de, paulmck@kernel.org, aneesh.kumar@linux.ibm.com, x86@kernel.org, linux@armlinux.org.uk, tony@atomide.com, mingo@redhat.com, samitolvanen@google.com, borntraeger@linux.ibm.com, keescook@chromium.org, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, rmk+kernel@armlinux.org.uk, bp@alien8.de, nick.hawkins@hpe.com, tglx@linutronix.de, jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org, alougovs@redhat.com, mtosatti@redhat.com, linux-kernel@vger.kernel.org, juerg.haefliger@canonical.com, svens@linux.ibm.com, dhildenb@redhat.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 12:44:04PM +0200, Frederic Weisbecker wrote:
> On Tue, Apr 04, 2023 at 04:42:24PM +0300, Yair Podemsky wrote:
> > +	int state = atomic_read(&ct->state);
> > +	/* will return true only for cpus in kernel space */
> > +	return state & CT_STATE_MASK == CONTEXT_KERNEL;
> > +}
> 
> Also note that this doesn't stricly prevent userspace from being interrupted.
> You may well observe the CPU in kernel but it may receive the IPI later after
> switching to userspace.
> 
> We could arrange for avoiding that with marking ct->state with a pending work bit
> to flush upon user entry/exit but that's a bit more overhead so I first need to
> know about your expectations here, ie: can you tolerate such an occasional
> interruption or not?

Bah, actually what can we do to prevent from that racy IPI? Not much I fear...

