Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B366673F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 00:50:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nskty50V7z3cgy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 10:50:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o2sBrft+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nskt04P9zz3c6s
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Jan 2023 10:49:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o2sBrft+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Nsksv2jQhz4xwq;
	Thu, 12 Jan 2023 10:49:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1673480948;
	bh=TO/ocmhMcHhsC/mqRwZMtfMXh7M3wWSE08jEbN0UeLg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=o2sBrft+so5KCuv0rKQ2RDo0CxlMgp5/wA1agHH5jMAmc0z8DK2QaB14Zt9Zh4TA8
	 lA0ZD+uPhEV7I7fXYlPAL+8oJ3TlP0KvnaNadhGAnJYQa2LkxFh4wtyuN3MBKAFyu+
	 Y78Zr6oIECFdgxscUQzixUKK3fyeE4vrHYDmj+POR2jlkvT+Gpvlxyabcb5Tlo4wrR
	 lFI4NaI3C5EA1PW3t8PJM0jvKPRGY2Rm4bUtJvIkmWuMn/5ApkMN08LIGzCo+JTa+y
	 AGlTSbK1KdoPzk6jF+PSPM+sx5iOO3KKHucOS1dtf79iX+LOLgX5b4CPnPwJSX/s7i
	 mllhGHAOrh8Yg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org
Subject: Re: [PATCH rcu 04/27] arch/powerpc/kvm: Remove "select SRCU"
In-Reply-To: <20230105003813.1770367-4-paulmck@kernel.org>
References: <20230105003759.GA1769545@paulmck-ThinkPad-P17-Gen-1>
 <20230105003813.1770367-4-paulmck@kernel.org>
Date: Thu, 12 Jan 2023 10:49:04 +1100
Message-ID: <87h6wwhbtb.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, kernel-team@meta.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, rostedt@goodmis.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Paul E. McKenney" <paulmck@kernel.org> writes:
> Now that the SRCU Kconfig option is unconditionally selected, there is
> no longer any point in selecting it.  Therefore, remove the "select SRCU"
> Kconfig statements.
>
> Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: <linuxppc-dev@lists.ozlabs.org>
> ---
>  arch/powerpc/kvm/Kconfig | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index a9f57dad6d916..902611954200d 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -22,7 +22,6 @@ config KVM
>  	select PREEMPT_NOTIFIERS
>  	select HAVE_KVM_EVENTFD
>  	select HAVE_KVM_VCPU_ASYNC_IOCTL
> -	select SRCU
>  	select KVM_VFIO
>  	select IRQ_BYPASS_MANAGER
>  	select HAVE_KVM_IRQ_BYPASS
> -- 
> 2.31.1.189.g2e36527f23
