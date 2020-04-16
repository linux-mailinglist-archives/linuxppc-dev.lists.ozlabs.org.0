Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B0D1AC720
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 16:50:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4932G72MdhzDr9S
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 00:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=port70.net (client-ip=81.7.13.123; helo=port70.net;
 envelope-from=nsz@port70.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=port70.net
Received: from port70.net (port70.net [81.7.13.123])
 by lists.ozlabs.org (Postfix) with ESMTP id 49327d3TwGzDrPY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 00:44:58 +1000 (AEST)
Received: by port70.net (Postfix, from userid 1002)
 id 79BA6ABEC0BA; Thu, 16 Apr 2020 11:58:00 +0200 (CEST)
Date: Thu, 16 Apr 2020 11:58:00 +0200
From: Szabolcs Nagy <nsz@port70.net>
To: Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200416095800.GC23945@port70.net>
Mail-Followup-To: Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>, 
 Rich Felker <dalias@libc.org>, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586994952.nnxigedbu2.astroid@bobo.none>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: libc-dev@lists.llvm.org, Rich Felker <dalias@libc.org>,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org> [2020-04-16 10:16:54 +1000]:
> Well it would have to test HWCAP and patch in or branch to two 
> completely different sequences including register save/restores yes.
> You could have the same asm and matching clobbers to put the sequence
> inline and then you could patch the one sc/scv instruction I suppose.

how would that 'patch' work?

there are many reasons why you don't
want libc to write its .text
