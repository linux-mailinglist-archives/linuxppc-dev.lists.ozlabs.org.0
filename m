Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A86ED559
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 21:27:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4wBB3NXVz3f4K
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 05:27:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q7kqlzPw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b; helo=mail-qt1-x82b.google.com; envelope-from=boqun.feng@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Q7kqlzPw;
	dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4w9H6fFKz3bTJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 05:26:25 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-3ef34e948b1so23192671cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 12:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682364382; x=1684956382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5WcTX+EeaGsxdM7iEyZFoPrBHwjvydFJtcBq7twcJE=;
        b=Q7kqlzPwtnz9GHcfA3FamK1WCOGenrygc8tdrlX+VPt4u+vIyXEtNyjNZag0Csm8PI
         cBh06puZK8ynWwiyKDW0V7GpKQOoH4Zp5iB2ur0Th0zORUbDZU/gevLheLDMnv9716aF
         yE3Fvlb1ntmT2RsJK9CNVZ/yzOWB/gP/o+dZnbrY/NoDwB36uNYX8MSezk9960RuHBz3
         vq7UOlZROP4aWaMetE3961fITx3CMxFmwDOOyjVvr1jctSOMbDpd7f8mnrYQYeSTPlhr
         adf6cJnm4WmeItHzq1mnNaB9uus9imw4/FIHIV8j5tSGYSpPda7OWLCkHuftpscRqj8/
         KdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682364382; x=1684956382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j5WcTX+EeaGsxdM7iEyZFoPrBHwjvydFJtcBq7twcJE=;
        b=RueeFv+zr9ULXJzCwVSYU2Ac3vg4NKiKYnDpgst8r5H/k/moRjlEqtimWr8TzHVK/C
         k2dj1aKh8eDBGd/8WYWkvIKMsUoC9OWe6pkNQ64bV1U9BDOaYDQdk/lPS+5ZX9DAs0DI
         xXczQcqtA0bnrn/KEzWL4YZD2dhY1RMu8f4MtYajDUgoU2T3PMoBhiqChik5lqTosnT1
         6YcrWfy0zvoDt5m0ofeihEuiI5Yb2QXBilicENzQC9MFNgBHajRct6i05G8EomYzIcMm
         fg5m79IPTczXyurY+diyRO6pM/PANzQtwNL4akhCf5M4c1/Bu9EwRyfJUN3G90HWE3Zr
         y06A==
X-Gm-Message-State: AAQBX9dX+6vLtY4gav887fDZge+rcx3rliQ7/DghRl0FLDpPEsFf/d76
	O2PxVV2h40mNmu29qUWScf0=
X-Google-Smtp-Source: AKy350bkmGyFsKqtKrCOL6Bro0cXPDHYhK3ExLfdT6QYV5byUqQgandDIZ3XR0YL1G+aj+tjUupYvw==
X-Received: by 2002:ac8:5814:0:b0:3ef:57c1:ad7 with SMTP id g20-20020ac85814000000b003ef57c10ad7mr26361936qtg.30.1682364382044;
        Mon, 24 Apr 2023 12:26:22 -0700 (PDT)
Received: from auth1-smtp.messagingengine.com (auth1-smtp.messagingengine.com. [66.111.4.227])
        by smtp.gmail.com with ESMTPSA id x15-20020ac84d4f000000b003ef28a76a11sm3847395qtv.68.2023.04.24.12.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 12:26:21 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailauth.nyi.internal (Postfix) with ESMTP id D316927C0054;
	Mon, 24 Apr 2023 15:26:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Mon, 24 Apr 2023 15:26:20 -0400
X-ME-Sender: <xms:29dGZD3p8_jv5S_xCFIABhz7rg745wdKIg--C6b9B55Cy16iwAeTrA>
    <xme:29dGZCE5mVVFd_OP8h5mu0iFcheWWxvbBai6kas8GSL0I2e1ciSRo2YzutwwBqTDf
    YEJpsmvVikGd1_JuA>
X-ME-Received: <xmr:29dGZD5RXVv1dNTMMmO7BHxwPNFT8Xf1Crl7jxuFVqSnA6Yfna9srWb_g1Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgudefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepffehkeeuhfeigeevveejvefftdehueevfeetleevfefgudeitedvudev
    ieevkedunecuffhomhgrihhnpehgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:29dGZI23xKuWw0Egqe40sSpqBSF5fWDx1kbSsvHMacElPSTzlKgJrg>
    <xmx:29dGZGGZ6peQJ9TzZvlGDbuJihx5oy1wN1it-4ibgmzZ9m4tApjY-w>
    <xmx:29dGZJ8QA3nr1KuWgYA-6XsXm6xgnXqnMQE3g2cVLVGAfPrd2sMw8Q>
    <xmx:3NdGZEYFGzVKfJrYn71E_rlCfrtiQyoT5G8uEP4WQd1T0C-z5PBE_w>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 15:26:19 -0400 (EDT)
Date: Mon, 24 Apr 2023 12:25:42 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <ZEbXtmFUPKA5cl6P@boqun-archlinux>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux>
 <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org>
 <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <20230424172900.GR19790@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230424172900.GR19790@gate.crashing.org>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 24, 2023 at 12:29:00PM -0500, Segher Boessenkool wrote:
> On Mon, Apr 24, 2023 at 08:28:55AM -0700, Boqun Feng wrote:
> > On Mon, Apr 24, 2023 at 10:13:51AM -0500, Segher Boessenkool wrote:
> > > At what points can r13 change?  Only when some particular functions are
> > > called?
> > 
> > r13 is the local paca:
> > 
> > 	register struct paca_struct *local_paca asm("r13");
> > 
> > , which is a pointer to percpu data.
> 
> Yes, it is a global register variable.
> 
> > So if a task schedule from one CPU to anotehr CPU, the value gets
> > changed.
> 
> But the compiler does not see that something else changes local_paca (or

It's more like this, however, in this case r13 is not changed:

	CPU 0			CPU 1
	{r13 = 0x00}		{r13 = 0x04}

	<thread 1>
	<in interrupt>
	 _switch():
	  <switch to the stack of thread 2>
	  <no need to change r13>
	  <in thread 2>
	<thread 2>
				<thread 3>
				_switch():
				 <switch to the stack of thread 1>
				 <no need to change r13>
				 <in thread 1>
				<thread 1>

as you can see thread 1 schedules from CPU 0 to CPU 1 and neither CPU
changes its r13, but in the point of view for thread 1, its r13 changes.

> r13 some other way, via assembler code perhaps)?  Or is there a compiler
> bug?
> 

This looks to me a compiler bug, but I'm not 100% sure.

Regards,
Boqun


> If the latter is true:
> 
> Can you make a reproducer and open a GCC PR?  <https://gcc.gnu.org/bugs/>
> for how to get started doing that.  We need *exact* code that shows the
> problem, together with a compiler command line.  So that we can
> reproduce the problem.  That is step 0 in figuring out what is going on,
> and then maybe fixing the problem :-)
> 
> 
> Segher
