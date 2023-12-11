Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF3D80C6FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 11:46:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ivbtaq0S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Spdhj5zV3z3c1g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 21:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ivbtaq0S;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Spdgx2Xctz2yVh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 21:45:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1702291548;
	bh=nJNJSRAPiHel+faBaicrqJd87X81ec133qYhZnzAXxg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ivbtaq0SZy/g2+D8pO1Byfa/UEjgT+0RGADp20ko/xVskJDfzj9PmP7ZtWOmFl1up
	 CLeDOr3ewsmppclL0RJVzuBxwQfFhOvk+6Ucrj0GlvQWezsR3FN2ua8PcblqQHMBaL
	 b71gcpcQ3Kj+ea9l4bs45fOMWW7nMmzFJgfht6y9hgn8BYJnxcQ3+RtSeV11S2POv+
	 1Cyyfm+hglHWP+pCFhHXAop86485DYbEWsJQ1xhtfY8Wk0fFnr9sngkZFqApCygPp5
	 gOOtgxqA80SdsGbcwjMwIpgDvrBrXgfwQWqJGW54qq6kXrkILZ4/8itqPc/2kabdUZ
	 Zqjk0Rn4ISprQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Spdgv6mLNz4wdC;
	Mon, 11 Dec 2023 21:45:47 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 0/5] powerpc/smp: Topology and shared processor
 optimizations
In-Reply-To: <20231211025656.4lqrhnic5gynkuzq@linux.vnet.ibm.com>
References: <20231109054938.26589-1-srikar@linux.vnet.ibm.com>
 <20231211025656.4lqrhnic5gynkuzq@linux.vnet.ibm.com>
Date: Mon, 11 Dec 2023 21:45:44 +1100
Message-ID: <87msuhdnl3.fsf@mail.lhotse>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Rohan McLure <rmclure@linux.ibm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> * Srikar Dronamraju <srikar@linux.vnet.ibm.com> [2023-11-09 11:19:28]:
>
> Hi Michael,
>
>> PowerVM systems configured in shared processors mode have some unique
>> challenges. Some device-tree properties will be missing on a shared
>> processor. Hence some sched domains may not make sense for shared processor
>> systems.
>> 
>> 
>
> Did you get a chance to look at this patchset?
> Do you see this getting pulled into your merge branch?
> I havent seen any comments that requires a change from the current patchset.

I was assuming you'd send another version to at least incorporate the
clarifications you posted.

And I wasn't really sure the discussion about the prink_once() change
was resolved. Anyway I'll check with Aneesh.

cheers
