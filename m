Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B559514E90B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 08:03:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4887Th6fhszDqhs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2020 18:03:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=64.147.123.24;
 helo=wout1-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=WUnP55PU; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=eWMqdOV0; 
 dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4887S46C8gzDqZB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2020 18:01:40 +1100 (AEDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id B98E372C;
 Fri, 31 Jan 2020 02:01:37 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Fri, 31 Jan 2020 02:01:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 message-id:subject:from:to:cc:date:in-reply-to:references
 :content-type:mime-version:content-transfer-encoding; s=fm1; bh=
 t/GpK6YsM5srRFf7eFpXme57d41WlX9+o+qAquTPbfY=; b=WUnP55PUGNZUnNgg
 nCC6+Xby2ixN1VG0TnMXE0MGmvManZHvl4QjoRSIWlWn501h0A97hT86h/W3Vv0d
 /SyDesb9JQeXveIte5GJuz+jHsDasy459cDE+iAskHk1r1qnVNSZeMoNwU3K1hhR
 75g9mWhEQXTLd91Md+saO87sl9mnSkrPcM1+GGxzlhmL2gRIEn7fAy+GdqBPQv0n
 Y6ppTNw5CCLL2NQaOcrVVL48LW3MeoY1Li8UzZSTRwmppBv42rXqoMF5sspgfvBF
 5agO1T+IDNV+BnFtE4sy62gRy5DvPvTYcTMiZbQSrlSMJlD8BEOoEXxMNO1FYOyz
 iqlLwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=t/GpK6YsM5srRFf7eFpXme57d41WlX9+o+qAquTPb
 fY=; b=eWMqdOV0wHgRiduKdiglB1u/pBpJaQMLLyYLQ1mA2ovG2/QAoJ18iTR+c
 z2q5mVR5mdF3stI2oRU658zN3PMKmC0hMkhHEwbhvgwxCjHFCRdqlql55RwC1ADa
 l5ODIF4jsBWsiUslco2kQgWJN8xsHV0EMNuySn9cMf+Cz36HsXWo13JoeYCdStk8
 r8NmqBlFp93DSeApXK4zmj600vjkOR2jpT7Us2nEu43PEuomXlei7PMjYs7U/lYc
 r04jLCxy3xbG4jUDfJuXJ4S1n4Z/1Y6GaNSTTyU2pe8KlORAIcWkJwSeqNmSk4JS
 ecuXaUuHMgY5U/w/khTGLLmo2oivg==
X-ME-Sender: <xms:0NAzXqGzS9sO_L0E_NiIJt5SU0J2TR67rtnar_Yr_vDaq4yo1l64Wg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeelgdeljecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdeftddmnecujfgurhepkffuhffvffgjfhgtfggggfesthekredttder
 jeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhi
 iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllh
 drtggt
X-ME-Proxy: <xmx:0NAzXnYqT8QLiIlSkd5nmOajtCbm_lecNG9Ec6XF5MsF33FGiW57Ww>
 <xmx:0NAzXqHSQcXlNGODJm_uaD8wtvvWalJTXVQAv9dUJoGE0ZLJyxZO6Q>
 <xmx:0NAzXlBiAeGTCGIsyf9Cyn9yrL4OXtPQl43bxAt1R08nA_r5hpM6nA>
 <xmx:0dAzXjG8XyG67mG2BYnamOPEQ07UDA6GdP2sDeTAd0jX-r2WLqnc_Q>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 403D53060A08;
 Fri, 31 Jan 2020 02:01:34 -0500 (EST)
Message-ID: <9edd517d0238dc3319788a23d708b68102cdbc2f.camel@russell.cc>
Subject: Re: [PATCH] lkdtm: Test KUAP directional user access unlocks on
 powerpc
From: Russell Currey <ruscur@russell.cc>
To: Christophe Leroy <christophe.leroy@c-s.fr>, keescook@chromium.org, 
 mpe@ellerman.id.au
Date: Fri, 31 Jan 2020 18:01:32 +1100
In-Reply-To: <c05a4327-0c81-0e3e-d93a-9d62183b146c@c-s.fr>
References: <20200131053157.22463-1-ruscur@russell.cc>
 <1b40cea6-0675-731a-58b1-bdc65f1e495e@c-s.fr>
 <0b016861756cbe27e66651b5c21229a06558cb57.camel@russell.cc>
 <c05a4327-0c81-0e3e-d93a-9d62183b146c@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kernel-hardening@lists.openwall.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2020-01-31 at 07:58 +0100, Christophe Leroy wrote:
> 
> Le 31/01/2020 à 07:53, Russell Currey a écrit :
> > On Fri, 2020-01-31 at 07:44 +0100, Christophe Leroy wrote:
> > > Le 31/01/2020 à 06:31, Russell Currey a écrit :
> > > > +	pr_info("attempting bad read at %px with write
> > > > allowed\n",
> > > > ptr);
> > > > +	tmp = *ptr;
> > > > +	tmp += 0xc0dec0de;
> > > > +	prevent_write_to_user(ptr, sizeof(unsigned long));
> > > 
> > > Does it work ? I would have thought that if the read fails the
> > > process
> > > will die and the following test won't be performed.
> > 
> > Correct, the ACCESS_USERSPACE test does the same thing.  Splitting
> > this
> > into separate R and W tests makes sense, even if it is unlikely
> > that
> > one would be broken without the other.
> > 
> 
> Or once we are using user_access_begin() stuff, we can use 
> unsafe_put_user() and unsafe_get_user() which should return an error 
> instead of killing the caller.

Even better, and thanks for your work on all this stuff.

- Russell

> 
> Christophe

