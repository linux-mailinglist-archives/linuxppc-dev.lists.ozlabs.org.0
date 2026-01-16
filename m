Return-Path: <linuxppc-dev+bounces-15891-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 924D1D317FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 14:05:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt0Sc57bYz2xnj;
	Sat, 17 Jan 2026 00:05:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768568704;
	cv=none; b=GGrW51naAXpC6B4yC+wLoxMqm+Kn+zXBspmBiUgkPbVZV9TQrNInyD2nnKO/GReD7Kmp4yT6IfpwKzhUhoe76jXOTHleuQotWwilYJlvZ4bJMWaVltnjfbkuXFQzJP0uYq6ll0JemrK7PrSuHjAL/WUsKOSlJVXa7BeV6dI+E7xRq6ptFiPW3QytQs/CtektjujSTumEJKpmEWIr8nHF8Z0EPUqpvnyMHx2VDnq4Pq392Zd6+L9cwD/Y6j0c9YM2XG0wPikiZWilLSW7TSDhUQ7s3XDY3GQhDEY6+pmCJnBgt7M6aR0UUFfMhNSgrQmobByAVbHYhXYRUTkwJpn34A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768568704; c=relaxed/relaxed;
	bh=CbAFMWQxaWN4gPfzGHNuSzDAtPQQxKBaf65k7R7yp5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gulGokD0Rq3zT7JJUgiH2xpi+d5/y7yOaEYJuh5SrJPgWYhsMj0bTddK1ds9wj8CpnJNuzbFYBpQ4+Y0C838xA1Fti1uU4/SLGIal+N88v/MflK0+xO0zxSqI987TEzXgZVFZysxxSnKxuDKqT+N2FA9qoXqCA/hIgw6SSvvhBcYdotBwj26Fo4DTi7ML5600J9StRyCC2R8rCqYKHJamef969CEWVJO7OVXAweaXRHX0baWINjAP5KoTFm8GKYwVHYp7BjF0iZXIZd6ttYwIxhyGwmaPl6Rc/NYFQ0SRH8LORMGpvzKN/FAuNeNU2uO5ks1yor2dr0e8daK3rjGZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bpph2mAQ; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=alexander.shishkin@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bpph2mAQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=alexander.shishkin@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt0SY0Ttkz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 00:04:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768568701; x=1800104701;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=CbAFMWQxaWN4gPfzGHNuSzDAtPQQxKBaf65k7R7yp5g=;
  b=bpph2mAQqF3GSYQmwdg3cbt+9ZS9oUxaXXDWHkTyDQXykRGoMQvsm0CZ
   WNAm3qZ/xAntkuXnnq94HcqWo3L8o+wI7YLPj9WsIwft2qzlpx1BrqGDx
   PMi6B78YQmicB2kYUfE04uiUpfUy85BtngOa2udBsmL1C4IxaYU6QFnwv
   diATp8JH6qgpcI6PVj05p+84kpZNHTwCb9D+I1eZQ5mPhPclAkrlQSsFH
   dEilzCLSlXvduuF8ANK7++INKOKf/E9ovPsXIXVgdNsFR2ZU/lmOfAn8v
   8lb/2TlOOEubCJ3miRR4O4ZIJFEHZfYRRAwP/Gbv+9wK2Lxwoodg7BIwD
   A==;
X-CSE-ConnectionGUID: 5Sl1cn6sTVahNLQ3Jx6+7A==
X-CSE-MsgGUID: 2jGDlTOxTf2PIWKcdoPGKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="68892474"
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="68892474"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:04:56 -0800
X-CSE-ConnectionGUID: KQRblK2aQjW0DOA9Jboafg==
X-CSE-MsgGUID: pX6S6faKQwuORaUhAmfo+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,231,1763452800"; 
   d="scan'208";a="209733228"
Received: from black.igk.intel.com (HELO black) ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2026 05:04:48 -0800
From: Alexander Shishkin <alexander.shishkin@linux.intel.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>, Richard Weinberger
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes
 Berg <johannes@sipsolutions.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, Douglas Anderson
 <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Sergey
 Senozhatsky <senozhatsky@chromium.org>, Jiri Slaby <jirislaby@kernel.org>,
 Breno Leitao <leitao@debian.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Kees Cook
 <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Andreas Larsson
 <andreas@gaisler.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jacky Huang
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Laurentiu
 Tudor <laurentiu.tudor@nxp.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
 netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 Marcos Paulo de Souza <mpdesouza@suse.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH 14/19] drivers: hwtracing: stm: console.c: Migrate to
 register_console_force helper
In-Reply-To: <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-14-21a291bcf197@suse.com>
Date: Fri, 16 Jan 2026 14:04:45 +0100
Message-ID: <83zf6daetu.fsf@black.igk.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Marcos Paulo de Souza <mpdesouza@suse.com> writes:

> The register_console_force function was introduced to register consoles
> even on the presence of default consoles, replacing the CON_ENABLE flag
> that was forcing the same behavior.
>
> No functional changes.
>
> Signed-off-by: Marcos Paulo de Souza <mpdesouza@suse.com>

Acked-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>

Should I pick this up or will you send this with the rest of the series?

Cheers,
--
Alex

