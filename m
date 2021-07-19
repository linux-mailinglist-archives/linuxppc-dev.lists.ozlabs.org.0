Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD783CE730
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jul 2021 19:08:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GT7b13PH9z30HK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 03:08:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GT7ZZ5JHrz2yP2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 03:07:50 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 16JH4N2o028857;
 Mon, 19 Jul 2021 12:04:23 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 16JH4Mln028856;
 Mon, 19 Jul 2021 12:04:22 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 19 Jul 2021 12:04:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] replace if with min
Message-ID: <20210719170422.GO1583@gate.crashing.org>
References: <20210712204546.GA1492390@pc>
 <20210719181205.Horde.xU8C00MIRgjqhZQ3-RrANw8@messagerie.c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210719181205.Horde.xU8C00MIRgjqhZQ3-RrANw8@messagerie.c-s.fr>
User-Agent: Mutt/1.4.2.3i
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
Cc: herbert@gondor.apana.org.au, Salah Triki <salah.triki@gmail.com>,
 linux-kernel@vger.kernel.org, paulus@samba.org, linux-crypto@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 19, 2021 at 06:12:05PM +0200, Christophe Leroy wrote:
> Salah Triki <salah.triki@gmail.com> a écrit :
> >Replace if with min in order to make code more clean.

> >--- a/drivers/crypto/nx/nx-842.c
> >+++ b/drivers/crypto/nx/nx-842.c
> >@@ -134,8 +134,7 @@ EXPORT_SYMBOL_GPL(nx842_crypto_exit);
> > static void check_constraints(struct nx842_constraints *c)
> > {
> > 	/* limit maximum, to always have enough bounce buffer to decompress 
> > 	*/
> >-	if (c->maximum > BOUNCE_BUFFER_SIZE)
> >-		c->maximum = BOUNCE_BUFFER_SIZE;
> >+	c->maximum = min(c->maximum, BOUNCE_BUFFER_SIZE);
> 
> For me the code is less clear with this change, and in addition it  
> slightly changes the behaviour. Before, the write was done only when  
> the value was changing. Now you rewrite the value always, even when it  
> doesn't change.

In both cases the compiler can decide to either write it more often than
strictly needed, depending on what it thinks best (and it usually has
better estimates than the programmer).  The behaviour is identical (and
the generated machine code is as well, in my testing).

The field name "maximum" is not the best choice, which makes the code
read a bit funny ("the min of max"), but the comment makes things pretty
clear.


Segher
