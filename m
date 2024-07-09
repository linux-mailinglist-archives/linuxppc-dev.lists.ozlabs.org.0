Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB13792BC49
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 15:59:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Koo4514l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJN0D6cyXz3cZ6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jul 2024 23:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Koo4514l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJMzK0c1Qz3cbL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jul 2024 23:58:53 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09B2B6145C;
	Tue,  9 Jul 2024 13:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7927CC4AF14;
	Tue,  9 Jul 2024 13:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720533529;
	bh=IV7zdIApBfCvWaPWbDflGVgSlxzXBapr2avJvbK/Z0s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Koo4514lTYDqu8/pzyTQ0wWq4zSS88GpD3U6KIZLcKdysKjRXWAEphVwTgnDRpkqG
	 8kMKgOpgeJZlWIttaEuepWKfnVNQRG5CZ3LixWAEVYtT8H70vwbE2CkOOLg6rFpE4T
	 YY6tQ3NF2OzuCYKONEVyfMHNV8S5y4TgF4XXODK9QhKyRbVfx61HcoDopZhj0Z28IW
	 VF9z3Cw4Lu9k/ub8x64Wol2TzJ+ybyedRubcAL82nRWt9jhxeAoBPf1PYhgklbQ0FE
	 keHKfI4XdWYnBnFfFMjJJIaZsJuZYGDGjB132Q6UIru14eUWfr3dSBf6a82ZjW1tOe
	 xc93TwOc2Qa7w==
Date: Tue, 9 Jul 2024 22:58:45 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Naveen N Rao <naveen@kernel.org>
Subject: Re: [PATCH v3] PowerPC: Replace kretprobe with rethook
Message-Id: <20240709225845.43cc72b8b691217ec428d3a0@kernel.org>
In-Reply-To: <1720508281.2dd5hnh2rv.naveen@kernel.org>
References: <20240627132101.405665-1-adubey@linux.ibm.com>
	<20240702085302.90ab3214b8b6e39614bb8d11@kernel.org>
	<1720508281.2dd5hnh2rv.naveen@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, Abhishek Dubey <adubey@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 09 Jul 2024 12:28:29 +0530
Naveen N Rao <naveen@kernel.org> wrote:

> Masami Hiramatsu wrote:
> > On Thu, 27 Jun 2024 09:21:01 -0400
> > Abhishek Dubey <adubey@linux.ibm.com> wrote:
> > 
> >> +/* rethook initializer */
> >> +int __init arch_init_kprobes(void)
> >> +{
> >> +	return register_kprobe(&trampoline_p);
> >> +}
> > 
> > No, please don't use arch_init_kprobes() for initializing rethook, since
> > rethook is used from fprobe too (at this moment).
> > 
> > If you want to make it relays on kprobes, you have to make a dependency
> > in powerpc's kconfig, e.g.
> > 
> > select HAVE_RETHOOK if KPROBES
> > 
> > But I don't recommend it.
> 
> Given that kretprobe has always worked this way on powerpc, I think this
> is a fair tradeoff. We get to enable fprobes on powerpc only if kprobes
> is also enabled.
> 
> Longer term, it would certainly be nice to get rid of that probe, and to
> expand the trampoline to directly invoke the rethook callback.

OK. In longer term, rethook will be only for kretprobe, and kretprobe
will be replaced by fprobe[1]. So please comment it and add that 

[1] https://lore.kernel.org/all/172000134410.63468.13742222887213469474.stgit@devnote2/

Thank you,

> 
> 
> Thanks,
> Naveen


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
