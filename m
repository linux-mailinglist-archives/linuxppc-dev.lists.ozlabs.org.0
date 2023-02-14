Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DB1696D1D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 19:40:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGVPs5zVbz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 05:40:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lpZhSArq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lpZhSArq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGVP02SCxz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 05:39:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3CF8561825;
	Tue, 14 Feb 2023 18:39:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09A56C433EF;
	Tue, 14 Feb 2023 18:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676399969;
	bh=VUyVoBOPBRmm9kWmhRlnQ1dgekqLXP/lAdmRs2vUMTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lpZhSArqYygzNfbZKNGcjvcTwNhca/C7bB1TE9FeTvJzAGZ57uFNUzzPGzNzsq1aM
	 4IwTbCrGHlO+gqUw6Cp2q/T2qzl7oKte7MwDQz3JJi48nhvnLQCL1v829eNQdq9Aor
	 LJVTO1gCw8Wqh+EF1lyZn0MKGT3Ec/hk02S8MnRgX0DmrxuAmOlKntBx/Pr6tIPS3P
	 UaoMve8gjEVjIQnN7Xv3/b6rQXg6ophd0y2EU0ZaIVvjRNs9aPXNsY3eMvCBJTI6nZ
	 dK8MWYE95qwTxoUjEPw8XF0TFH3j6Cs9OS5l4B44f43ifxIJVskUOqIj8+/+LqMtdo
	 WhjmwIG948hmQ==
Date: Tue, 14 Feb 2023 10:39:26 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v2 03/24] arm/cpu: Make sure arch_cpu_idle_dead() doesn't
 return
Message-ID: <20230214183926.46trlpdror3v5sk5@treble>
References: <cover.1676358308.git.jpoimboe@kernel.org>
 <ed361403b8ee965f758fe491c47336dddcfb8fd5.1676358308.git.jpoimboe@kernel.org>
 <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y+ttS0japRCzHoFM@shell.armlinux.org.uk>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-kernel@vger.kernel.org, lin
 ux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 11:15:23AM +0000, Russell King (Oracle) wrote:
> On Mon, Feb 13, 2023 at 11:05:37PM -0800, Josh Poimboeuf wrote:
> > arch_cpu_idle_dead() doesn't return.  Make that more explicit with a
> > BUG().
> > 
> > BUG() is preferable to unreachable() because BUG() is a more explicit
> > failure mode and avoids undefined behavior like falling off the edge of
> > the function into whatever code happens to be next.
> 
> This is silly. Just mark the function __noreturn and be done with it.
> If the CPU ever executes code past the "b" instruction, it's already
> really broken that the extra instructions that BUG() gives will be
> meaningless.
> 
> This patch does nothing except add yet more bloat the kernel.
> 
> Sorry, but NAK.

Problem is, the compiler can't read inline asm.  So you'd get a 
"'noreturn' function does return" warning.

We can do an unreachable() instead of a BUG() here if you prefer
undefined behavior.

-- 
Josh
