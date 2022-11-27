Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FF5639A93
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 13:41:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NKpBC5CzNz3f3R
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Nov 2022 23:41:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tG6JfF9G;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/rsDEyIP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=tG6JfF9G;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/rsDEyIP;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NKp9G5rQ2z2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 23:40:34 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1669552828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EB/53VcoNSyoAbWn3SJg3+Ux/MQhVRpr/mqLNU0o7js=;
	b=tG6JfF9GryBdY5R1ayDhFW5nVcj8BNhfdr0APEKiJba1hQz6qIiOe5efb58RfrjIUOwt5+
	RugHbJd3u8HkXb/ai/VxhC6/hCxeh3ST002BnKf/61ZC1YlVr+luurAddWDJpKonqY08u5
	G6wDSaoK8gzLbH05rJK7EnLlO4ZPF1zQrBKPTpnJRVnmy5BInef7LZ89XaXIae7ktv+2GN
	9gK9TF4uM5I+E3SgXO0k5zWyqsAOu+ZeTn2arHQiEEUtqXSz9QY6QgQf68GZuEJanLslt2
	zYmML/fl0TgfyLMdkAslGLznJWKaAl50FVGekChjqc6HJ/3z1yOLZQdy/OaK0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1669552828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EB/53VcoNSyoAbWn3SJg3+Ux/MQhVRpr/mqLNU0o7js=;
	b=/rsDEyIP1zkZFV+paA9RKRugWWLeuR7RpzdUbBmFNIrfaI1E7mu2cmLePwxTvbwFW0vLz8
	cV9QL3HaPKBt0RDA==
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
In-Reply-To: <CAABZP2xNTbrx9iV+KH3VZx1c9Yi97+izNA=XSJQBuOJ4WENFZg@mail.gmail.com>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
 <87y1rxwsse.ffs@tglx>
 <CAABZP2xNTbrx9iV+KH3VZx1c9Yi97+izNA=XSJQBuOJ4WENFZg@mail.gmail.com>
Date: Sun, 27 Nov 2022 13:40:28 +0100
Message-ID: <87v8n0woxv.ffs@tglx>
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
Cc: dave@stgolabs.net, paulmck@kernel.org, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Zhouyi,

On Sun, Nov 27 2022 at 10:45, Zhouyi Zhou wrote:
> On Sun, Nov 27, 2022 at 1:05 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> So, I should construct my patch as:
> We avoid ... by ...

Not "We avoid".

Avoid this behaviour by ....

>> No. We are not exporting this just to make a bogus test case happy.
>>
>> Fix the torture code to handle -EBUSY correctly.
> I am going to do a study on this, for now, I do a grep in the kernel tree:
> find . -name "*.c"|xargs grep cpuhp_setup_state|wc -l
> The result of the grep command shows that there are 268
> cpuhp_setup_state* cases.
> which may make our task more complicated.

Why? The whole point of this torture thing is to stress the
infrastructure.

There are quite some reasons why a CPU-hotplug or a hot-unplug operation
can fail, which is not a fatal problem, really.

So if a CPU hotplug operation fails, then why can't the torture test
just move on and validate that the system still behaves correctly?

That gives us more coverage than just testing the good case and giving
up when something unexpected happens.

I even argue that the torture test should inject random failures into
the hotplug state machine to achieve extended code coverage.

Thanks,

        tglx



