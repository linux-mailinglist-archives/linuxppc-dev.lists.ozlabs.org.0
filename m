Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C97EE74EC54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 13:10:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0ctGuSk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0dT852Qvz3bvd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 21:10:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N0ctGuSk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dSJ46g4z2y9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:09:52 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9A51C61477;
	Tue, 11 Jul 2023 11:09:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4288FC433C7;
	Tue, 11 Jul 2023 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689073790;
	bh=IHPGTpFNkJxjHd3j16Zp70SLf28Ex3L77RYopTx73vw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0ctGuSk3DmmruB+WZyZ7fdwiXQcBQy9J5r3j2ak9JiXtDOh5iv1ZbpXz7qM041es
	 ixEMi9ew/4iNZk5ZpKcOsgOK37mZJsMtBJJkluoFOAi25JuHUA3xOG/L4BoULPlW2Q
	 7AufnLkjlD+s8RBcLb7tzQBbWNSzqIqcfU3DEK6RnRCtm+XHGMrSQ+QUVQOM4L30mn
	 Tf3o1tsGiNzd0WP+FErjYIl8UVrOmxU3cA6pf0Pcfoe7jCU4W67tAkUCyQjsg/lY38
	 091e6SbuNhv7Aps+Az+9f0ciPBFBnGgeFHNJYdbY8kiuVdCFn8AKk7h29xGWhMYFAV
	 BWid01Yq4G9tg==
Date: Tue, 11 Jul 2023 14:09:45 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v4 00/33] Per-VMA locks
Message-ID: <20230711110945.GO41919@unreal>
References: <20230227173632.3292573-1-surenb@google.com>
 <20230711103541.GA190975@unreal>
 <53676850-539f-2813-d55d-a8bc0ec88092@suse.cz>
 <20230711110141.GN41919@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711110141.GN41919@unreal>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, Sachin Sant <sachinp@linux.ibm.com>, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, sergeyy@nvidia.com, will@kernel.org, arjunroy@google.com, Linux kernel regressions list <regressions@lists.linux.dev>, chriscli@google.com, dave@stgolabs.net, minchan@google.com, gal@nvidia.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, maorg@nvidia.com, ranro@nvidia.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, regressions@leemhuis.info, shakeelb@google.com, drort@nvidia.com, luto@kernel.org, gthelen@google.com, Laurent Dufour <ldufour@linux.ibm.com>, Suren Baghd
 asaryan <surenb@google.com>, linux-arm-kernel@lists.infradead.org, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, idok@nvidia.com, hannes@cmpxchg.org, Andrew Morton <akpm@linux-foundation.org>, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023 at 02:01:41PM +0300, Leon Romanovsky wrote:
> On Tue, Jul 11, 2023 at 12:39:34PM +0200, Vlastimil Babka wrote:
> > On 7/11/23 12:35, Leon Romanovsky wrote:
> > > 
> > > On Mon, Feb 27, 2023 at 09:35:59AM -0800, Suren Baghdasaryan wrote:
> > > 
> > > <...>
> > > 
> > >> Laurent Dufour (1):
> > >>   powerc/mm: try VMA lock-based page fault handling first
> > > 
> > > Hi,
> > > 
> > > This series and specifically the commit above broke docker over PPC.
> > > It causes to docker service stuck while trying to activate. Revert of
> > > this commit allows us to use docker again.
> > 
> > Hi,
> > 
> > there have been follow-up fixes, that are part of 6.4.3 stable (also
> > 6.5-rc1) Does that version work for you?
> 
> I'll recheck it again on clean system, but for the record:
> 1. We are running 6.5-rc1 kernels.
> 2. PPC doesn't compile for us on -rc1 without this fix.
> https://lore.kernel.org/all/20230629124500.1.I55e2f4e7903d686c4484cb23c033c6a9e1a9d4c4@changeid/

Ohh, I see it in -rc1, let's recheck.

> 3. I didn't see anything relevant -rc1 with "git log arch/powerpc/mm/fault.c".
> 
> Do you have in mind anything specific to check?
> 
> Thanks
> 
