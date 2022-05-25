Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (unknown [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB794533BD8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 13:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7TZM40Lgz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 21:37:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ZIakz9se;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=ZIakz9se; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7TYl30gBz2ywQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 21:36:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BtatFXJHwOsF1iN9MX4tcAeOtxNVAo5gxULQ5AIMb08=; b=ZIakz9seohAXW9BDPKhZq7RgEW
 WG+5PgpE+MFFpgPJT9GYaqhQEzm0PGEOaofnt9p53k70ThXN7i3PdncwedqqQQFTfPxY4jz0aLXCf
 8sfTMDmh/mBspt/a1Dboh+rLEkAesPZHw4HOlEc9QWttfl9D9Ai0+OlitMOzJv7w5/uKWekH+btNP
 1QklzOjtFoli9LnPFUN3aBtjEX1rMqYMq3yaUKUAnzCQWxRH6Tvzhn1vSprgAy5C140kEalGWnV8w
 x6MDk+6O9E/7SzZShfzZAULNj6A9RLe4sxNEhjGUgFnDPZll3QVgnhfQCTn4Ji/EpFu9ctTVwLUsW
 zMURbl0w==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntpJj-001bMC-I1; Wed, 25 May 2022 11:36:44 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id E6D0A30022C;
 Wed, 25 May 2022 13:36:42 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id C6FF3207693A1; Wed, 25 May 2022 13:36:42 +0200 (CEST)
Date: Wed, 25 May 2022 13:36:42 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH 1/4] objtool: Add --mnop as an option to --mcount
Message-ID: <Yo4UysC69UCwhlYp@hirez.programming.kicks-ass.net>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-2-sv@linux.ibm.com>
 <26c7bfc8-3089-034a-70c0-8857d7cd3a99@csgroup.eu>
 <1653386854.o7nss9hzc9.naveen@linux.ibm.com>
 <d45030be-3f6b-ebeb-3d63-bf7a96d3ff3b@csgroup.eu>
 <1653388084.w21cyb07gc.naveen@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653388084.w21cyb07gc.naveen@linux.ibm.com>
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 24, 2022 at 04:01:48PM +0530, Naveen N. Rao wrote:

> We need to know for sure either way. Nop'ing out the _mcount locations at
> boot allows us to discover existing long branch trampolines. If we want to
> avoid it, we need to note down those locations during build time.
> 
> Do you have a different approach in mind?

If you put _mcount in a separate section then the compiler cannot tell
where it is and is forced to always emit a long branch trampoline.

Does that help?
