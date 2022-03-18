Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4554DE01B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 18:41:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KKrsn2Klcz3bh1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Mar 2022 04:41:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=NONTVbUi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=NONTVbUi; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KKrs620Wpz2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Mar 2022 04:40:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=UnwUchRztZx67XW2Wtg1p3jNoABacVhXYIkA4iPmYBY=; b=NONTVbUiR71+d0XeEcUfDpp0vP
 MD45EexewpUEUT12NhXyk4l9VOCb8yLfi+bcTQEWXsMpckaEb5xChedWfPc5fTjh1h2fK129+/85J
 Hm6FR3HNVdlvUi0F8DR4eW9s8pGpgqzWUO+fQGa31kyz/uvvTyJdE9/olTzVv69mADm7ilhVw1Brg
 AQzsAGv9FQeZ/kJ/CkQxgaFNjZDnuzXpKvg1MlyiZQVuH5pNRndlIxKG2D1AQbjmJzSMGOKH3YEtU
 bmLflbLqjsYd3ir/edfDfNhnm9cull9gwj+kle9CAxHUvu8tv3Tc9szD51ViCjMB6xaJ8PSmFGwly
 bTW7Rhzw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVGaT-002GNw-QN; Fri, 18 Mar 2022 17:40:29 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 01ACF98841D; Fri, 18 Mar 2022 18:40:27 +0100 (CET)
Date: Fri, 18 Mar 2022 18:40:27 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] static_call: Don't make __static_call_return0 static
Message-ID: <20220318174027.GS8939@worktop.programming.kicks-ass.net>
References: <30821468a0e7d28251954b578e5051dc09300d04.1647258493.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30821468a0e7d28251954b578e5051dc09300d04.1647258493.git.christophe.leroy@csgroup.eu>
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
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Jason Baron <jbaron@akamai.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 14, 2022 at 12:49:36PM +0100, Christophe Leroy wrote:
> System.map shows that vmlinux contains several instances of
> __static_call_return0():
> 
> 	c0004fc0 t __static_call_return0
> 	c0011518 t __static_call_return0
> 	c00d8160 t __static_call_return0
> 
> arch_static_call_transform() uses the middle one to check whether we are
> setting a call to __static_call_return0 or not:
> 
> 	c0011520 <arch_static_call_transform>:
> 	c0011520:       3d 20 c0 01     lis     r9,-16383	<== r9 =  0xc001 << 16
> 	c0011524:       39 29 15 18     addi    r9,r9,5400	<== r9 += 0x1518
> 	c0011528:       7c 05 48 00     cmpw    r5,r9		<== r9 has value 0xc0011518 here
> 
> So if static_call_update() is called with one of the other instances of
> __static_call_return0(), arch_static_call_transform() won't recognise it.
> 
> In order to work properly, global single instance of __static_call_return0() is required.
> 
> Fixes: 3f2a8fc4b15d ("static_call/x86: Add __static_call_return0()")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks! I've transferred Josh' ack from v1 in the presumption he's fine
with this one too :-)
