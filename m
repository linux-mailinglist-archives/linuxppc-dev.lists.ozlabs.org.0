Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A09E18B1B96
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 09:11:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=MmasBUph;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQ6V02VVvz3vX6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 17:11:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=2a01:4f8:c010:41de::1; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [IPv6:2a01:4f8:c010:41de::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQ6T852Zsz3cTF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 17:10:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1714029027;
	bh=rmNCwj/QZXocvFu/SV+UsAbq1yc1Onrw5e/MM6tpI4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MmasBUphC0hDmcDselWsqNDchcFNLbtyyIXYaTEfQv4BLOsVbY80KeyHb5BvHn9uV
	 mXfX+53b9fklgAHnv4JHOlIL0SSIIXm5AmCALLJVlcCrmQacW/Cc+9xB5aBl8A7Dwb
	 B9LRLV8RKBn3hp3tvoCofURazzoY7NMe3hrGTd84=
Date: Thu, 25 Apr 2024 09:10:27 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH v3 00/11] sysctl: treewide: constify ctl_table argument
 of sysctl handlers
Message-ID: <9e657181-866a-4626-82d0-e0030051b003@t-8ch.de>
References: <20240423-sysctl-const-handler-v3-0-e0beccb836e2@weissschuh.net>
 <20240424201234.3cc2b509@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424201234.3cc2b509@kernel.org>
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
Cc: Joel Granados <j.granados@samsung.com>, Dave Chinner <david@fromorbit.com>, linux-mm@kvack.org, Eric Dumazet <edumazet@google.com>, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>, linux-sctp@vger.kernel.org, lvs-devel@vger.kernel.org, coreteam@netfilter.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, bridge@lists.linux.dev, apparmor@lists.ubuntu.com, linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org, netfilter-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024-04-24 20:12:34+0000, Jakub Kicinski wrote:
> On Tue, 23 Apr 2024 09:54:35 +0200 Thomas Weißschuh wrote:
> > The series was split from my larger series sysctl-const series [0].
> > It only focusses on the proc_handlers but is an important step to be
> > able to move all static definitions of ctl_table into .rodata.
> 
> Split this per subsystem, please.

Unfortunately this would introduce an enormous amount of code churn.

The function prototypes for each callback have to stay consistent.
So a another callback member ("proc_handler_new") is needed and users
would be migrated to it gradually.

But then *all* definitions of "struct ctl_table" throughout the tree need to
be touched.
In contrast, the proposed series only needs to change the handler
implementations, not their usage sites.

There are many, many more usage sites than handler implementations.

Especially, as the majority of sysctl tables use the standard handlers
(proc_dostring, proc_dobool, ...) and are not affected by the proposed
aproach at all.

And then we would have introduced a new handler name "proc_handler_new"
and maybe have to do the whole thing again to rename it back to
the original and well-known "proc_handler".


Of course if somebody has a better aproach, I'm all ears.


Thomas
