Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB862C68F5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 16:51:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjJyt2SKKzDrvF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 02:51:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=9qbq=fb=paulmck-thinkpad-p72.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=E5Te/uyt; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjJxG0dSrzDrfP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 02:50:25 +1100 (AEDT)
Received: from paulmck-ThinkPad-P72.home (50-39-104-11.bvtn.or.frontiernet.net
 [50.39.104.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BE3D21D7A;
 Fri, 27 Nov 2020 15:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606492223;
 bh=lFiIw0D3fVkvZN+kwaJU8yol6xsvIi3hwx+kgZeJzR8=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=E5Te/uyt5FDsuLpbuGsvviqKnHX2ykovtoNPBfnv9Kna7lQkB8an5QxXsioQUB++D
 Q95I9POCZCK28Ghx0NLIJRMN6uP+D+0gBZpb431MHnOpMlK7LH7R768bYIFemYwb6z
 hw6kTq0hNxt4Um6Gr6xxxZkQlLmVenfIxk1kPNjg=
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
 id DF6373520430; Fri, 27 Nov 2020 07:50:22 -0800 (PST)
Date: Fri, 27 Nov 2020 07:50:22 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Daniel Axtens <dja@axtens.net>
Subject: Re: powerpc 5.10-rcN boot failures with RCU_SCALE_TEST=m
Message-ID: <20201127155022.GV1437@paulmck-ThinkPad-P72>
References: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eekfh80a.fsf@dja-thinkpad.axtens.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: rcu@vger.kernel.org, mark.rutland@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 27, 2020 at 01:02:29PM +1100, Daniel Axtens wrote:
> Hi all,
> 
> I'm having some difficulty tracking down a bug.
> 
> Some configurations of the powerpc kernel since somewhere in the 5.10
> merge window fail to boot on some ppc64 systems. They hang while trying
> to bring up SMP. It seems to depend on the RCU_SCALE/PERF_TEST option.
> (It was renamed in the 5.10 merge window.)

Adding Mark Rutland on CC in case his similarly mystifying experience
obtaining a fix for ARM has relevance.  From what I could see, that
was a delayed consequence of the x86/entry rewrite.  It was similarly
difficult to bisect.

							Thanx, Paul

> I can reproduce it as follows with qemu tcg:
> 
> make -j64 pseries_le_defconfig
> scripts/config -m RCU_SCALE_TEST
> scripts/config -m RCU_PERF_TEST
> make -j 64 vmlinux CC="ccache gcc"
> 
> qemu-system-ppc64 -cpu power9 -M pseries -m 1G -nographic -vga none -smp 4 -kernel vmlinux
> 
> ...
> [    0.036284][    T0] Mount-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> [    0.036481][    T0] Mountpoint-cache hash table entries: 8192 (order: 0, 65536 bytes, linear)
> [    0.148168][    T1] POWER9 performance monitor hardware support registered
> [    0.151118][    T1] rcu: Hierarchical SRCU implementation.
> [    0.186660][    T1] smp: Bringing up secondary CPUs ...
> <hangs>
> 
> I have no idea why RCU_SCALE/PERF_TEST would be causing this, but that
> seems to be what does it: if I don't set that, the kernel boots fine.
> 
> I've tried to git bisect it, but I keep getting different results:
> always a random merge of a seemingly-unrelated subsystem tree - things
> like armsoc or integrity or input.
> 
> It appears to also depend on the way the kernel is booted. Testing with
> a Canonical kernel, so a slightly different config but including
> RCU_SCALE_TEST=m, I see:
> 
> Power8 host + KVM + grub         -> boots
> Power9 host bare metal (kexec)   -> fails
> Power9 host + KVM + grub         -> fails
> Power9 host + KVM + qemu -kernel -> boots
> qemu TCG + power9 cpu            -> fails
> qemu TCG + power8 cpu            -> fails
> 
> Any ideas?
> 
> Kind regards,
> Daniel
> 
> $ qemu-system-ppc64 -version
> QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.9)
> 
> $ gcc --version
> gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0
> 
> It also happens when compiling with GCC 7 and 10.
> 
> 
