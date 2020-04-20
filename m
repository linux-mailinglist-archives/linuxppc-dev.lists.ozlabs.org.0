Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FDB1AFF82
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 03:31:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4958LF4LQdzDqkB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 11:31:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=libc.org
 (client-ip=216.12.86.13; helo=brightrain.aerifal.cx;
 envelope-from=dalias@libc.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=libc.org
Received: from brightrain.aerifal.cx (216-12-86-13.cv.mvl.ntelos.net
 [216.12.86.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4958HY2hQrzDqc8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Apr 2020 11:29:10 +1000 (AEST)
Date: Sun, 19 Apr 2020 21:29:04 -0400
From: Rich Felker <dalias@libc.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200420012904.GY11469@brightrain.aerifal.cx>
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416095800.GC23945@port70.net>
 <1587341904.1r83vbudyf.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587341904.1r83vbudyf.astroid@bobo.none>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
Cc: libc-dev@lists.llvm.org, Szabolcs Nagy <nsz@port70.net>,
 Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 20, 2020 at 10:27:58AM +1000, Nicholas Piggin wrote:
> Excerpts from Szabolcs Nagy's message of April 16, 2020 7:58 pm:
> > * Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org> [2020-04-16 10:16:54 +1000]:
> >> Well it would have to test HWCAP and patch in or branch to two 
> >> completely different sequences including register save/restores yes.
> >> You could have the same asm and matching clobbers to put the sequence
> >> inline and then you could patch the one sc/scv instruction I suppose.
> > 
> > how would that 'patch' work?
> > 
> > there are many reasons why you don't
> > want libc to write its .text
> 
> I guess I don't know what I'm talking about when it comes to libraries. 
> Shame if there is no good way to load-time patch libc. It's orthogonal
> to the scv selection though -- if you don't patch you have to 
> conditional or indirect branch however you implement it.

Patched pages cannot be shared. The whole design of PIC and shared
libraries is that the code("text")/rodata is immutable and shared and
that only a minimal amount of data, packed tightly together (the GOT)
has to exist per-instance.

Also, allowing patching of executable pages is generally frowned upon
these days because W^X is a desirable hardening property.

Rich
