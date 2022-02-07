Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 090B34AC804
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Feb 2022 18:58:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jsv5Q4pzsz30jP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 04:58:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gF83yQX+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org;
 envelope-from=srs0=t6ma=sw=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=gF83yQX+; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jsv4p6TXLz2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Feb 2022 04:58:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7C713B80D43;
 Mon,  7 Feb 2022 17:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E8AC004E1;
 Mon,  7 Feb 2022 17:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644256678;
 bh=Af7vNCJqPbi+5PT+nS8ivHQczXOnEjj97tRVGy4TrdA=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=gF83yQX+lXspiiF1I3dJQ4gHbWV9wPPR7PC35k5j/HEe+hE+6zcFwdUnHMff3Lmm1
 Acums+kU00Qmy0E464eYjGcglfaxY0s/ja7pAYke2fZAGJbPX8w8kgkieW47l/RUF0
 K2P7bCAQUaMTJ0EhUrRWy6qDcSduxiEqnh6TV7HcQ9746NlZ7SF82/rOl3aSn8QSby
 GwD0A72W5ZOuNarN4etAg2FSyOFOZbiDsx2oNaim2xZELGhHe10hVgwPA9kr5rP0Dc
 AYoDUP8XyCOyKypDRbAR0gO/xH4RYKINh79pWd31YpRPCsDJxqXVTT78sURgqYduwo
 gzqyPBiik7d6w==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 0539E5C04EC; Mon,  7 Feb 2022 09:57:58 -0800 (PST)
Date: Mon, 7 Feb 2022 09:57:57 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: ppc64le: rcutorture warns about improperly set
 `CONFIG_HYPERVISOR_GUEST` and `CONFIG_PARAVIRT`
Message-ID: <20220207175757.GE4285@paulmck-ThinkPad-P17-Gen-1>
References: <36ffe02f-b299-2085-108a-5a4551e620fb@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36ffe02f-b299-2085-108a-5a4551e620fb@molgen.mpg.de>
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
Reply-To: paulmck@kernel.org
Cc: rcu@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Josh Triplett <josh@joshtriplett.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 07, 2022 at 05:53:05PM +0100, Paul Menzel wrote:
> Dear Sebastian, dear Paul,
> 
> 
> In commit a6fda6dab9 (rcutorture: Tweak kvm options)
> `tools/testing/selftests/rcutorture/configs/rcu/CFcommon` was extended by
> the three selections below:
> 
>     CONFIG_HYPERVISOR_GUEST=y
>     CONFIG_PARAVIRT=y
>     CONFIG_KVM_GUEST=y
> 
> Unfortunately, `CONFIG_HYPERVISOR_GUEST` is x86 specific and
> `CONFIG_PARAVIRT` only available on x86 and ARM.
> 
> Thus, running the tests on a ppc64le system (POWER8 IBM S822LC), the script
> shows the warnings below:
> 
>     :CONFIG_HYPERVISOR_GUEST=y: improperly set
>     :CONFIG_PARAVIRT=y: improperly set
> 
> Do you have a way, how to work around that?

If you can tell me the Kconfig-option incantation for ppc64le, my thought
would be to make rcutorture look for a CFcommon.ppc64.  Then the proper
Kconfig options for each architecture could be supplied.

While we are thinking about this, here is the bash function that
figures out which architecture rcutorture is running on, which
is passed the newly built vmlinux file:

identify_qemu () {
	local u="`file "$1"`"
	if test -n "$TORTURE_QEMU_CMD"
	then
		echo $TORTURE_QEMU_CMD
	elif echo $u | grep -q x86-64
	then
		echo qemu-system-x86_64
	elif echo $u | grep -q "Intel 80386"
	then
		echo qemu-system-i386
	elif echo $u | grep -q aarch64
	then
		echo qemu-system-aarch64
	elif uname -a | grep -q ppc64
	then
		echo qemu-system-ppc64
	else
		echo Cannot figure out what qemu command to use! 1>&2
		echo file $1 output: $u
		# Usually this will be one of /usr/bin/qemu-system-*
		# Use TORTURE_QEMU_CMD environment variable or appropriate
		# argument to top-level script.
		exit 1
	fi
}

First, any better approach?

Second, we need to know the Kconfig options -before- the vmlinux
file is generated.  What is the best approach in that case?

							Thanx, Paul
