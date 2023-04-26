Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E8C6EF64E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:22:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q61KM19SVz3cjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 00:22:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=mYHgtFZf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q61JM4hkwz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 00:21:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UlGyOC+dZ9jM8uq2AbAYjxW/eRqy+SHHT/cj9czdtZA=; b=mYHgtFZffSP0zSxghYAqv/xYil
	LbxNzzdoBpuTahkiYD8MdM4WlZdvMxu5vz/B5ySvJTBOEVKtQQXTPQ4rM9uZdqv/7TVV8MtHUIxkd
	ZSM+w9gBfEGEkfZE5Jg21u6dO+S+kMJBhe84FuKb0XX5YrL9x4/4fDa84nt6MiaRsm6Xj6vMRD6G5
	Ilkh9WXFY8ZdF884WAH4JxOUayYPGI4S5K5NVjsEGEJWn0p/QYRyCe+dwg9P5KzISeKYtnfrk/9Gh
	cn1p5ejTDigTEQvM9YJtQc57z8baLO9YaSnUPfH/MqNX8eRVRaCcs3Z4t7sOss8mMFpzvPioxRenR
	UmgQ7hIw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1prg0v-002Xdk-RA; Wed, 26 Apr 2023 14:20:58 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id ABE86300244;
	Wed, 26 Apr 2023 16:20:54 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 828103240EFBA; Wed, 26 Apr 2023 16:20:54 +0200 (CEST)
Date: Wed, 26 Apr 2023 16:20:54 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Joel Fernandes <joel@joelfernandes.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <20230426142054.GA1381951@hirez.programming.kicks-ass.net>
References: <ZEXOMC2casTlobE1@boqun-archlinux>
 <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org>
 <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
 <877ctyzv08.fsf@mail.concordia>
 <CAEXW_YR4rmNY5JF-077EUpriF=PP9uML+_WMDSVi-L3G6_FOdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEXW_YR4rmNY5JF-077EUpriF=PP9uML+_WMDSVi-L3G6_FOdw@mail.gmail.com>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 26, 2023 at 09:44:22AM -0400, Joel Fernandes wrote:

> How could you control which code paths don't have the stack protector?
> Just curious.

https://lkml.kernel.org/r/20230412-no_stackp-v2-0-116f9fe4bbe7@google.com
