Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCB3292D47
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 20:00:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFPg83brPzDqby
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 05:00:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CFPcy3dDVzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 04:58:23 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 09JHt4hN012442;
 Mon, 19 Oct 2020 12:55:05 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 09JHt2nP012434;
 Mon, 19 Oct 2020 12:55:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 19 Oct 2020 12:55:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] asm-generic: Force inlining of get_order() to work around
 gcc10 poor decision
Message-ID: <20201019175502.GO2672@gate.crashing.org>
References: <96c6172d619c51acc5c1c4884b80785c59af4102.1602949927.git.christophe.leroy@csgroup.eu>
 <CACPK8XfgK0Bj3sLjKCi80jS6vK34FN5BTkU8FvBGcMR=RQn4Xw@mail.gmail.com>
 <0bd0afae-f043-2811-944b-c94d90e231d2@csgroup.eu>
 <20201019083225.GN2672@gate.crashing.org>
 <188e00e1-ae41-693e-1d05-f8d87e7ee696@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <188e00e1-ae41-693e-1d05-f8d87e7ee696@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 19, 2020 at 10:54:40AM +0200, Christophe Leroy wrote:
> Le 19/10/2020 à 10:32, Segher Boessenkool a écrit :
> >The kernel should just use __always_inline if that is what it *wants*;
> >that is true here most likely.  GCC could perhaps improve its heuristics
> >so that it no longer thinks these functions are often too big for
> >inlining (they *are* pretty big, but not after basic optimisations with
> >constant integer arguments).
> 
> Yes I guess __always_inline is to be added on functions like this defined 
> in headers for exactly that, and that's the purpose of this patch.
> 
> However I find it odd that get_order() is outlined by GCC even in some 
> object files that don't use it at all, for instance in fs/pipe.o

It is (arguably) too big too always inline if you do not consider that
__builtin_constant_p will remove half of the function one way or
another.  Not sure if that is what happens here, but now we have a PR
(thanks!) and we will find out.


Segher
