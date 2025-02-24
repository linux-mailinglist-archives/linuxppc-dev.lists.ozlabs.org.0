Return-Path: <linuxppc-dev+bounces-6428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B7A427DA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 17:25:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1mLq3GsQz305G;
	Tue, 25 Feb 2025 03:25:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740414355;
	cv=none; b=IJIAH7bSa/PSxZfMhqE7PjqLTkDdBRteYihbZ+DNLFW8B+FBGTcVefU2MSHZ31OryEvUpMZsa6eBab31wAIsYeUNumF57OoIo8JL8OFzTa08PLrqJKPJhdGH80GB9cxjYgj/L303Du6BxSSdqwhKjaYWgxBbbBIkvhwA5dVyTEUX17FXyWbVziqGv1+52MMlb/+4dBFjCPWxOn4/RFK9PBRRAYqKDKdqoYILjwirxq31vywkuhUBHPFMAOZAY1or4JET+BBsHAChsHFckqd1796XUOmSAoVecpTyEGCKJDFCXR0jU5BwOk6veAcuL+X0LfKTZi59hcH9UCsCOTu+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740414355; c=relaxed/relaxed;
	bh=RiG7Os1LzRvtBRc9A9ciPH//03aOnU7y29MQw49YdE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Th3ugBlU7xWB+scN748ZlR2WN+OEABopbiYRT2G4e6+IM1hkVWWX7I98d+OGAkD7RO/AVG6v9GWykRUsv+Z5dOi87GL0GNfThBYR7tOUrpKJwBeGTUPPE8q9H1yC8WBiPcpQA489AhLs4E+fstmwgHYqM5w7gU/AAvqhUxUs5agVwG2c5OhWCKy5cITics95rrDgEiG0PL+Q9ZSp92ysZ2SHOfnPL4f+2Xh2PU8cPwTR3U6fBmksXBgLG1Dw1w4Tys+T8KhUbfUs43mS2ph1QnI80etX+A74ohItgVjXSeQnG6Yghe7rysnaLwAFiY7rHJLi2o9XiKON4QoSvmNAWQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=etkeSBDc; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=etkeSBDc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1mLj6zzYz301n
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 03:25:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RiG7Os1LzRvtBRc9A9ciPH//03aOnU7y29MQw49YdE4=; b=etkeSBDcLsAiIlNT9AxClEHsb1
	BTAPC/kqapVVSvZKca4nASw7bU982HGQiIXBIzt10WGg+i7oyKO343cw7mCt68ptxsfUUc8JsBDxL
	KzYrt5bvEdqkuK9DL8G1NM52w43XpyOGviFBfTbbBoCtvOLNINxTMcc35QEcRRWR4tt7jQrLw7STi
	uy/7tA+d3s6X0sEJ4SJlWsuzgBD+mbBYRxCCBDkJqGwgIlYaQe3iM9DdubIE0EgDz+KhVbj4g0Fy4
	SzVJTEE0pdCA+qqRI1h7YgqH0soeBJn+pI/Fa9dsNEd+IcL66cABvhAiJuwmMj1o2AGaDFyigL5Cq
	iLXkDAJA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbH5-00000003DyP-0qcN;
	Mon, 24 Feb 2025 16:25:43 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6DD5530001B; Mon, 24 Feb 2025 17:25:42 +0100 (CET)
Date: Mon, 24 Feb 2025 17:25:42 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sathvika Vasireddy <sv@linux.ibm.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, christophe.leroy@csgroup.eu,
	npiggin@gmail.com, maddy@linux.ibm.com,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call
 warning for bl+mflr pattern
Message-ID: <20250224162542.GE11590@noisy.programming.kicks-ass.net>
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <20250220195940.ely2l2fpsozd2tuv@jpoimboe>
 <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bea75bc-d3f6-4972-b644-f9b5a4e8bb77@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 21, 2025 at 02:20:41PM +0530, Sathvika Vasireddy wrote:

> > > @@ -1625,6 +1626,11 @@ static int add_call_destinations(struct objtool_file *file)
> > >   		reloc = insn_reloc(file, insn);
> > >   		if (!reloc) {
> > >   			dest_off = arch_jump_destination(insn);
> > > +
> > > +			next_insn = next_insn_same_func(file, insn);
> > > +			if (next_insn && dest_off == next_insn->offset)
> > > +				continue;
> > > +
> > This won't work on x86, where an intra-function call is converted to a
> > stack-modifying JUMP.  So this should probably be checked in an
> > arch-specific function.
> 
> Thanks for letting me know, I'll introduce arch_skip_call_warning() to
> handle architecture specific cases in the next patch I send.

Can't you detect this pattern in decode and simpy not emit the call
instruction?

