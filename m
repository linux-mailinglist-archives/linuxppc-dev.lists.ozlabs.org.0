Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 587FC645E3E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 17:00:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NS27M23Kcz3bhY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 03:00:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1zKXe1Qo;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dAtZVool;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1zKXe1Qo;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dAtZVool;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NS26N3vWGz3bYD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 02:59:40 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 601791FFCE;
	Wed,  7 Dec 2022 15:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1670428768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0aSEvHISruuzZjqWWn22P3im5JpJKTcXGdCgqL9wuw=;
	b=1zKXe1Qo9B6atEkE/L5w5iyaXuwH0HhnMMco1Hr9Z8UYZEBsybMX8CjCb+DbYbZj6CoVjU
	566QvxrpAiAOhLdTL+wY1wqPPQImPFHIojk26X9O5CdYa/CfgrGaLMdU3y8r/zvqyjWpS7
	jiSBwFgwmQVhKE8l03YY+PBrbaN3YnQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1670428768;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p0aSEvHISruuzZjqWWn22P3im5JpJKTcXGdCgqL9wuw=;
	b=dAtZVoold3ZIR/nXrY0RvEbRkjpvcMO0Y4cocApzlSsfeFG3v9Hu8HsXftHUjYcteYVYpU
	B3BbZCybHnBfv1Cg==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 01A0F2C141;
	Wed,  7 Dec 2022 15:59:25 +0000 (UTC)
Date: Wed, 7 Dec 2022 16:59:24 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] powerpc/ftrace: fix syscall tracing on PPC64_ELF_ABI_V1
Message-ID: <20221207155924.GG28810@kitsune.suse.cz>
References: <20221201161442.2127231-1-mjeanson@efficios.com>
 <87pmcys9ae.fsf@mpe.ellerman.id.au>
 <d5dd1491-5d59-7987-9b5b-83f5fb1b29ee@efficios.com>
 <219580de-7473-f142-5ef2-1ed40e41d13d@csgroup.eu>
 <323f83c7-38fe-8a12-d77a-0a7249aad316@efficios.com>
 <dfe0b9ba-828d-e1a5-f9a3-416c6b5b1cf3@efficios.com>
 <87mt81sbxb.fsf@mpe.ellerman.id.au>
 <484763aa-e77b-b599-4786-ef4cdf16d7bd@efficios.com>
 <87cz8wrmm6.fsf@mpe.ellerman.id.au>
 <6db50470-ac37-0328-37a2-760665668b5f@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6db50470-ac37-0328-37a2-760665668b5f@efficios.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicholas Piggin <npiggin@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>, Michael Jeanson <mjeanson@efficios.com>, Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Dec 07, 2022 at 10:18:13AM -0500, Mathieu Desnoyers wrote:
> On 2022-12-06 21:09, Michael Ellerman wrote:
> > Mathieu Desnoyers <mathieu.desnoyers@efficios.com> writes:
> > > On 2022-12-05 17:50, Michael Ellerman wrote:

> > 
> > Relatedly we have a patch in next to optionally use ABIv2 for 64-bit big
> > endian builds.
> 
> Interesting. Does it require a matching user-space ? (built with PPC64 ABIv2

No, the kernel and userspace ABI is separate.

> ?) Does it handle legacy PPC32 executables ?

Theoretically it should. No idea if anybody has tested it.

Thanks

Michal
