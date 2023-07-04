Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB11747653
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jul 2023 18:19:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DP+7MVF9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwSfF1hmlz3blN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 02:19:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=DP+7MVF9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwSdL2RZcz2y9d
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 02:18:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D45BA6129E;
	Tue,  4 Jul 2023 16:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59F5C433C7;
	Tue,  4 Jul 2023 16:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1688487489;
	bh=plFnlH3PVa4WT7JKH0cCP1otEaPsygd1p/9DKGjnZlY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DP+7MVF9vnt3bFNlQkpF4LExsXEbROYu+xuyqDpBQzN9EIZJgYMCQ3rRO3qj64/s5
	 yd/IuW/oKpDL8zTX7u+j+d8QhVQkrxzzOdnvwaPICdLx+y4LQgCKjjqcZGrfHT6/zH
	 arQfP+r/qWPUZQdOu9jZZCWHKufOwfpShgZOVKCM=
Date: Tue, 4 Jul 2023 09:18:08 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Fwd: Memory corruption in multithreaded user space program
 while calling fork
Message-Id: <20230704091808.aa2ed3c11a5351d9bf217ac9@linux-foundation.org>
In-Reply-To: <2023070453-plod-swipe-cfbf@gregkh>
References: <facbfec3-837a-51ed-85fa-31021c17d6ef@gmail.com>
	<5c7455db-4ed8-b54f-e2d5-d2811908123d@leemhuis.info>
	<CAJuCfpH7BOBYGEG=op09bZrh1x3WA8HMcGBXXRhe6M5RJaen5A@mail.gmail.com>
	<CAJuCfpH7t7gCV2FkctzG2eWTUVTFZD7CtD14-WuHqBqOYBo1jA@mail.gmail.com>
	<2023070359-evasive-regroup-f3b8@gregkh>
	<CAJuCfpF=XPpPYqp2Y1Vu-GUL=RBj4fyhXoXzjBY4EKtBnYE_eQ@mail.gmail.com>
	<2023070453-plod-swipe-cfbf@gregkh>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Cc: Jacob Young <jacobly.alt@gmail.com>, Linux regressions mailing list <regressions@lists.linux.dev>, Linux PowerPC <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Memory Management <linux-mm@kvack.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghdasaryan <surenb@google.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jul 2023 09:00:19 +0100 Greg KH <gregkh@linuxfoundation.org> wrote:

> > > > > Thanks! I'll investigate this later today. After discussing with
> > > > > Andrew, we would like to disable CONFIG_PER_VMA_LOCK by default until
> > > > > the issue is fixed. I'll post a patch shortly.
> > > >
> > > > Posted at: https://lore.kernel.org/all/20230703182150.2193578-1-surenb@google.com/
> > >
> > > As that change fixes something in 6.4, why not cc: stable on it as well?
> > 
> > Sorry, I thought since per-VMA locks were introduced in 6.4 and this
> > patch is fixing 6.4 I didn't need to send it to stable for older
> > versions. Did I miss something?
> 
> 6.4.y is a stable kernel tree right now, so yes, it needs to be included
> there :)

I'm in wait-a-few-days-mode on this.  To see if we have a backportable
fix rather than disabling the feature in -stable.

