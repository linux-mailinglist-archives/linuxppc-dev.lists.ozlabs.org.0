Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5D41E105C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 16:20:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vzl36vNGzDqMd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 00:20:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=1LaOXVpx; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vzgr1spqzDqMB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 00:17:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Kr9buj3Bzk9juOwV9KAH42CouIIua7TPJ6CsB4FDIvo=; b=1LaOXVpxbh4kKq0WRwK771k5k+
 IFL66RFj2QvC04aQnG2UgDS6g2q4/9jSBXN9vYRSH9Lvv+WIGEtu9XIF6sbUnlGLoB+1Ex4Btc1ha
 KDeEetD7C/tNJJWw/yY6CfkHu22dmwWwUG12Sf4sl3e372SyF7Z9Xq9PZW596ONN1EBZPgBF8nyOF
 jPdH7j7JcyxfjEiqCllRK4JPte946n6+tBD6nRh1X35GPD8vEEe7iRMFByyGqEB+3CoTYVgHt1JE7
 TvUZSQTwMVSg8EVEt9ffMKMFrwRL3vnU04Tr2Tylxs4S7KaTSGkFbGcQSdmAUXaHtWEI5XGpQF+tv
 3GDKOqzg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdDuk-0000Ae-0B; Mon, 25 May 2020 14:17:14 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 94E6B300478;
 Mon, 25 May 2020 16:17:11 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 800832389FE09; Mon, 25 May 2020 16:17:11 +0200 (CEST)
Date: Mon, 25 May 2020 16:17:11 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200525141711.GI325303@hirez.programming.kicks-ass.net>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
 <20200521104937.GB325303@hirez.programming.kicks-ass.net>
 <20200521110027.GC325303@hirez.programming.kicks-ass.net>
 <20200521124113.GC15455@lenoir>
 <20200525132105.GW325280@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525132105.GW325280@hirez.programming.kicks-ass.net>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qian Cai <cai@lca.pw>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 25, 2020 at 03:21:05PM +0200, Peter Zijlstra wrote:
> -	flags = atomic_fetch_andnot(NOHZ_KICK_MASK, nohz_flags(this_cpu));
> -	if (!(flags & NOHZ_KICK_MASK))
> +	if (idle != CPU_IDLE)
>  		return false;
>  
>  	_nohz_idle_balance(this_rq, flags, idle);

Bah, I think I broke something there. Lemme go mend.
