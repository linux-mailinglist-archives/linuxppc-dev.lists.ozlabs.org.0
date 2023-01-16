Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA566C359
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 16:11:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nwb7v4LRNz3cGm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 02:11:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=E7mc3QbK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=E7mc3QbK;
	dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nwb6x1K5Wz30gk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 02:10:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JYw4vYNo6I8ONL1oEHQpMq0Clr6CFL2bXHpSXpJOtI0=; b=E7mc3QbKC7DPlTHSAjTqru6OUZ
	Kcs0+09JF2aMv6SI5wQOt5rSq0BM8ct5mlPnirn/4I6QRcjS0hfJBo+x3Ny3hfq1FoEia6+CcSw4d
	Ln3RqowsC/MpEce8Kaq588urT3GLTAs6FzQ7UQfh7+V2rdRQYSJ1zK5+bWn6CaJPOBY5p4U4BOzV6
	OtOBMBvR44bGeLU2GMbt0MEeofc23vH+kjnBDDkuASHVjacOFQrEzK+xeBE2UyppGDUIV5I1CfgzX
	a2UFVC3h1+gI1FCNORS0EaQAVLf46ZAG4YoN1e0EblBtA+2QEp5Fu/0Q/Wk4pK4A2ckvbUgUn9jWZ
	B2kGePaw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHR7V-008puo-Vx; Mon, 16 Jan 2023 15:09:58 +0000
Date: Mon, 16 Jan 2023 15:09:57 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: Memory transaction instructions
Message-ID: <Y8Voxald4aGck3fA@casper.infradead.org>
References: <CAHk-=wiRm+Z613bHt2d=N1yWJAiDiQVXkh0dN8z02yA_JS-rew@mail.gmail.com>
 <CAGudoHHx0Nqg6DE70zAVA75eV-HXfWyhVMWZ-aSeOofkA_=WdA@mail.gmail.com>
 <CAHk-=wjthxgrLEvgZBUwd35e_mk=dCWKMUEURC6YsX5nWom8kQ@mail.gmail.com>
 <CPQQLU1ISBIJ.2SHU1BOMNO7TY@bobo>
 <1966767.1673878095@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1966767.1673878095@warthog.procyon.org.uk>
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, tony.luck@intel.com, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Jan Glauber <jan.glauber@gmail.com>, Will Deacon <will@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 16, 2023 at 02:08:15PM +0000, David Howells wrote:
> Hi Linus,
> 
> I'm not sure how relevant it is to the topic, but I seem to remember you
> having a go at implementing spinlocks with x86_64 memory transaction
> instructions a while back.  Do you have any thoughts on whether these
> instructions are ever likely to become something we can use?

Ever is a long time, but not while they're still buggy:

https://en.wikipedia.org/wiki/Transactional_Synchronization_Extensions

and not while they're not actually available on a vast majority of
x86 hardware.  ie AMD needs to implement them, make them available as
standard, forcing Intel to enable them globally instead of restricting
them to those who pay the $2.50/month subscription fee.
