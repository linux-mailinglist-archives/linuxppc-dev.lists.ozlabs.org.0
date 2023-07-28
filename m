Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C72766FDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 16:52:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SBoI1IVx;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=u14Jh2+q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC9bG1kpcz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 00:52:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=SBoI1IVx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=u14Jh2+q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RC9ZP0GvXz2y1j
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 00:51:41 +1000 (AEST)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1690555896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WgtQnEvcjnIA6OssBWgWKQGQOlpPGr/TktCgM5MH5Qk=;
	b=SBoI1IVxgnSSvXQ53cwYA0wdV8l1C4rCtG7kkuwOvN6012sDhiLL9KCMJBi5HjGQOSF+4H
	4pejiklppMcfhRh9HnciknpMEPPfqnFG05C0APcyVpXHpb2QRymBZwt01P2uUR+UeHLe9u
	ugyKnml+vlZYRWbrOW2CZUdApiF+swXL9wq5BKGF5sE6B9AImZ8PyBcwnImSCFh55F8Vmi
	+xZAPlVpjcsxHiAmmDwQvRWPK8+L5JcFftr+4QojEv7PR8rffM6LJlcM/5s2yEezxgePff
	C7yLcajuIjVqmvBxnWDanSkGbz9jPsGVYO3wdjiLW0/3riMseGclzQJ6+rf6oA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1690555896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WgtQnEvcjnIA6OssBWgWKQGQOlpPGr/TktCgM5MH5Qk=;
	b=u14Jh2+qN17+TLZ3MIa91VdBRZUZrJLtBzQEvavFoM4fEhUDc/1OAgVhNqxa11WRLuDlSR
	+RGQ3niR5V8SrBCA==
To: "Zhang, Rui" <rui.zhang@intel.com>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, "ldufour@linux.ibm.com"
 <ldufour@linux.ibm.com>
Subject: Re: [PATCH v4 00/10] Introduce SMT level and add PowerPC support
In-Reply-To: <beaab9ae25de92bace2f2e30dff5e0d2e7774e56.camel@intel.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
 <c66e3e800a7d257ef7a90749fe567f056f4c3ace.camel@intel.com>
 <87wmykqyam.ffs@tglx>
 <beaab9ae25de92bace2f2e30dff5e0d2e7774e56.camel@intel.com>
Date: Fri, 28 Jul 2023 16:51:36 +0200
Message-ID: <87edksqebr.ffs@tglx>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 28 2023 at 14:23, Rui Zhang wrote:
> On Fri, 2023-07-28 at 09:40 +0200, Thomas Gleixner wrote:
>> On Sun, Jul 09 2023 at 15:25, Rui Zhang wrote:
>> > I ran into a boot hang regression with latest upstream code, and it
>> > took me a while to bisect the offending commit and workaround it.
>> 
>> Where is the bug report and the analysis? And what's the workaround?
>
> As it is an iwlwifi regression, I didn't paste the link here.
>
> The regression was reported at
> https://lore.kernel.org/all/b533071f38804247f06da9e52a04f15cce7a3836.camel@intel.com/
>
> And it was fixed later by below commit in 6.5-rc2.

Ah, ok. I was worried that you ran into issues with the parallel bootup
muck.
