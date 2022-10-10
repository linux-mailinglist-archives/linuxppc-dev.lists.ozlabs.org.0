Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2532B5FA42B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 21:26:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmTRw0FpXz3dqd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 06:26:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Ls1X9Stp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=yjjh=2l=zx2c4.com=jason@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=Ls1X9Stp;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmTQx3LcKz3bhv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 06:25:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 053F760EF8;
	Mon, 10 Oct 2022 19:25:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8805EC433B5;
	Mon, 10 Oct 2022 19:25:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="Ls1X9Stp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1665429935;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u1dau1ILq4K1SLnMV7OfJT4Jf3QTq6a9M8PPwHLNsEw=;
	b=Ls1X9StpbNO6Y5c59ai+kQ7fG+JCCnVXI9pmnNhJ+Io0XoT7MV+JA5+oasLz63JrfLli0F
	ptFNxcuDQnHTpSufmIMkxiagGnHWOsXPXV9ulqRtSgLTxHjd7EmIRZkH+TVTrpW7Vmgs7i
	m13L0jWi3bWALMhvFPi9kqeBMj9RdVw=
Received: 	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0121947c (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 10 Oct 2022 19:25:34 +0000 (UTC)
Date: Mon, 10 Oct 2022 13:25:25 -0600
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <Y0RxpSFyn9m68zIb@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87edvhntv0.fsf@mpe.ellerman.id.au>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, aneesh.kumar@linux.ibm.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, linux@roeck-us.net, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Sun, Oct 09, 2022 at 10:01:39PM +1100, Michael Ellerman wrote:
> powerpc updates for 6.1
> 
>  - Remove our now never-true definitions for pgd_huge() and p4d_leaf().
> 
>  - Add pte_needs_flush() and huge_pmd_needs_flush() for 64-bit.
> 
>  - Add support for syscall wrappers.
> 
>  - Add support for KFENCE on 64-bit.
> 
>  - Update 64-bit HV KVM to use the new guest state entry/exit accounting API.
> 
>  - Support execute-only memory when using the Radix MMU (P9 or later).
> 
>  - Implement CONFIG_PARAVIRT_TIME_ACCOUNTING for pseries guests.
> 
>  - Updates to our linker script to move more data into read-only sections.
> 
>  - Allow the VDSO to be randomised on 32-bit.
> 
>  - Many other small features and fixes.

FYI, something in here broke the wireguard test suite, which runs the
iperf3 networking utility. The full log is here [1], but the relevant part
is: 

[+] NS1: iperf3 -Z -t 3 -c 192.168.241.2
Connecting to host 192.168.241.2, port 5201
iperf3: error - failed to read /dev/urandom: Bad address

I'll see if I can narrow it down a bit more and bisect. But just FYI, in
case you have an intuition.

Jason


[1] https://build.wireguard.com/linux/4de65c5830233e7a4adf2e679510089ec4e210c7/powerpc.log
