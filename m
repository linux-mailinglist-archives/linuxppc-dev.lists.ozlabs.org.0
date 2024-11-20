Return-Path: <linuxppc-dev+bounces-3444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8639D34F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2024 09:03:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XtYlB0TZwz2y66;
	Wed, 20 Nov 2024 19:03:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732089797;
	cv=none; b=QKmOkWNf5tK33WJSD+3onkV1SuHyV7We/JCUivkTQgzBxzM28nOoz0zIUICTLKN2RtfRMrwgCL/8337H0WK62FrRVbhi48cFSNQUTkH4kHSnquFvlXCTBa21d/01KLZuUmOunlMTxxC3eUkxnQ8r9lu2RkPzk3rDE5Smei7lWzdw/w5dEHq/paaZOcD2EJSUvC+Zz8JC+bywmyvMdXXyTpkVShBV6pjAL96fEAFpjX4LDIIOFdluOjbzWwNNcFmFPLLxldADLWNpohBp++x09seZhVISKtrorr87urTgwKpHzG3RIsSHpRkrrq6EGxOgJpe3JILBwb2vJphpkNV2bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732089797; c=relaxed/relaxed;
	bh=kfV1WAQ9tmFqKF8zPT+eY9DsFIJS+PHexLAxTxwIsrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HmccSMDBjy0mfuasX4xMaJAGzxexknP8DqeytexA3nr3M36btqw7WADodArfBbzEp1+TwaWsyGvxjbkOm5skEWm+9OZ3SAsYudWbDKIyH4FuidsRSDr9CIjNzlcitsweTM0eEyLyv2RxlUK+ISfrVId53YQoRZaDMdU7KdcLWgQ1aRL/T0zz9zSAXk4o93yvGtSMoPnq+6S4+F4iVtJtNoayJGxH4h5Ijb6Vmiq3pSffI/8jitb4zDIqS5Er5cyMzNTEZi/RpFQByXNPebLfi+AMPwRBKNok2MhRis7emuD0rBPOU+0xubYjsK9OgNoVUaidq4sguxjyvPB1E1Li1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mx03TH2p; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pxmjKT1u; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Mx03TH2p;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=pxmjKT1u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XtYl836Qlz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2024 19:03:16 +1100 (AEDT)
Date: Wed, 20 Nov 2024 09:03:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1732089794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kfV1WAQ9tmFqKF8zPT+eY9DsFIJS+PHexLAxTxwIsrE=;
	b=Mx03TH2p320xy+t/qTvrlo4RP8VFO45m2CeHMwiBajsSg5zMkY+4EaICsE5pY9wZbdmyjZ
	BrdJdUAIfR/p2xL3nUKUuHqNqXJ6FC+MpfM9DZ9xIQzGIfi1nkZsmYBkSloYeAjlrYccCR
	DzDbzeVu7A9nr78xhiUTmKGwCavtN/dvT82VEs3JXNP2Ok2zd/ht8JZvzh1xdOEN+r0e5F
	JxGrZRYUUy6r75x/gDHzAUPvQQm3LTnXvdKfqdoywdqBwpbEg8tZHCG7kAzLof630SaZ4+
	WybMyFq4bSd1hPesQDL1jvrCAe3mub+47fP8kF/TCKnPhouJZu6aSyOJnU0U8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1732089794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kfV1WAQ9tmFqKF8zPT+eY9DsFIJS+PHexLAxTxwIsrE=;
	b=pxmjKT1un/fROvuJFiu3qBCmO9iUQ9pmgJASjRbrW2OVLlQLVpnJM90lWo+tM+pZTHJ+2G
	O+bdX2eLE/U0wlBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] powerpc: Large user copy aware of full:rt:lazy
 preemption
Message-ID: <20241120080312.uHw4eJcQ@linutronix.de>
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
 <20241116192306.88217-3-sshegde@linux.ibm.com>
 <874j43hqy8.fsf@oracle.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <874j43hqy8.fsf@oracle.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-11-19 13:08:31 [-0800], Ankur Arora wrote:
> 
> Shrikanth Hegde <sshegde@linux.ibm.com> writes:
> 
> > Large user copy_to/from (more than 16 bytes) uses vmx instructions to
> > speed things up. Once the copy is done, it makes sense to try schedule
> > as soon as possible for preemptible kernels. So do this for
> > preempt=full/lazy and rt kernel.
> 
> Note that this check will also fire for PREEMPT_DYNAMIC && preempt=none.
> So when power supports PREEMPT_DYNAMIC this will need to change
> to preempt_model_*() based checks.
> 
> > Not checking for lazy bit here, since it could lead to unnecessary
> > context switches.
> 
> Maybe:
> Not checking for lazy bit here, since we only want to schedule when
> a context switch is imminently required.

Isn't his behaviour here exactly what preempt_enable() would do?
If the LAZY bit is set, it is delayed until return to userland or an
explicit schedule() because it is done. If this LAZY bit turned into an
actual scheduling request then it is acted upon.

Sebastian

