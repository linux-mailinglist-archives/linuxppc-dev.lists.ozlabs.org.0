Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 624DF7A0E89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 21:51:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WSCrraD+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmny51Xs0z3cnT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 05:51:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=WSCrraD+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::e5; helo=out-229.mta0.migadu.com; envelope-from=kent.overstreet@linux.dev; receiver=lists.ozlabs.org)
Received: from out-229.mta0.migadu.com (out-229.mta0.migadu.com [IPv6:2001:41d0:1004:224b::e5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmnx94zcmz3c5P
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 05:50:35 +1000 (AEST)
Date: Thu, 14 Sep 2023 15:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1694721027;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AD74dBZMPN5nTOQPZv7AwjcNbf8/Vj6LO+ov4d9eSbY=;
	b=WSCrraD+4jCwReLqWOM4epCOhkZyNPrLDG3x+QUsdFCHXkEK0Pr4mseXLBw3Q+crry7f0J
	X+0QHjFW2YA7hFVErtSLZk2pSpL8QPYFh+vp8ZfKMwELa1imBxQG9g40JCFn3Oqnfv5uWd
	Recs+W3v/o8BVM9bkHYZ/0goH3Z7hV8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: Export kvm_guest static key, for bcachefs six
 locks
Message-ID: <20230914195025.cawo5wqzcmsbrxgj@moria.home.lan>
References: <20230914000115.1035594-1-kent.overstreet@linux.dev>
 <87a5tp8p76.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5tp8p76.fsf@mail.lhotse>
X-Migadu-Flow: FLOW_OUT
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
Cc: linux-bcachefs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 14, 2023 at 12:26:53PM +1000, Michael Ellerman wrote:
> Kent Overstreet <kent.overstreet@linux.dev> writes:
> > bcachefs's six locks need kvm_guest, via
> >  ower_on_cpu() ->  vcpu_is_preempted() -> is_kvm_guest()
> >
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > ---
> >  arch/powerpc/kernel/firmware.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> 
> I'm happy for you to take this via your tree.

Thanks!
