Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B553770F2F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 11:36:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR5fS4pJxz3f8s
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 19:36:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=K6jPGfF6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR5dV0QBmz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 19:35:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Dq2/xPmnodnbbQMnix8EKRleSU9lxflCTwZrdL+JKew=; b=K6jPGfF6XEoTSx04m1/lrNA0O/
	W0D3Pw7nMrLVxg9xhcQOVW99G4D5puN3UW/Q4hnGPTETNIhbvdQR1RZ+HWtpeiZH6huHuuvFmC/nx
	BtEk5HGeyISrr3+bZVW4cdHEHob4FUtzfTpnP6u+9jRibOdTsMj/JEsU3jYZoVXhj/PB2CwXo7mU4
	J8wjaCXEXMtB9Ey6j/q9sM5hZnhu041JIXHrpJDkuWB2KNuEVKFjPHjEaQx2TFn7f7Jqmvy2QkNso
	eLv1R9YLuX6uolUpKpTK0p0m/ab7PiZEzSbNNsaQOGosfG+Kb/QfIMM0SGr75SFe3WsCKuEsZS+L0
	QJkY//jw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1q1ktT-00B4En-MM; Wed, 24 May 2023 09:34:55 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E603D3001AE;
	Wed, 24 May 2023 11:34:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id CCA312435C811; Wed, 24 May 2023 11:34:54 +0200 (CEST)
Date: Wed, 24 May 2023 11:34:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: boot failure after merge of the tip tree
Message-ID: <20230524093454.GI4253@hirez.programming.kicks-ass.net>
References: <20230524154459.48cda184@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230524154459.48cda184@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, PowerPC <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 24, 2023 at 03:44:59PM +1000, Stephen Rothwell wrote:
> Hi all,
>=20
> After merging the tip tree, today's linux-next build (powerpc
> pseries_le_defconfig) failed to boot like this:
>=20
>  Built 1 zonelists, mobility grouping on.  Total pages: 32736
>  Policy zone: Normal
>  mem auto-init: stack:all(zero), heap alloc:off, heap free:off
>  Memory: 2027392K/2097152K available (17984K kernel code, 3328K rwdata, 1=
4784K rodata, 6080K init, 1671K bss, 69760K reserved, 0K cma-reserved)
>=20
> *crickets*
>=20
> Bisected to commit
>=20
>   f4ab23558310 ("slub: Replace cmpxchg_double()")
>=20
> I have reverted that commit (and the following one) for today.

Sorry about that; turns out I forgot to test the case where cmpxchg128
wasn't available.

Please see:

  https://lkml.kernel.org/r/20230524093246.GP83892@hirez.programming.kicks-=
ass.net

As stated there, I'm going to zap tip/locking/core for a few days and
let this fixed version run through the robots again before re-instating
it.
