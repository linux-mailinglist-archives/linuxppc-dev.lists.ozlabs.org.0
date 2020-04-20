Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 587851B183C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Apr 2020 23:19:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 495fj54YCxzDqf3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 07:19:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=port70.net (client-ip=81.7.13.123; helo=port70.net;
 envelope-from=nsz@port70.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=port70.net
Received: from port70.net (port70.net [81.7.13.123])
 by lists.ozlabs.org (Postfix) with ESMTP id 495fg91Y6SzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 07:17:56 +1000 (AEST)
Received: by port70.net (Postfix, from userid 1002)
 id CC62DABEC0BA; Mon, 20 Apr 2020 23:17:51 +0200 (CEST)
Date: Mon, 20 Apr 2020 23:17:51 +0200
From: Szabolcs Nagy <nsz@port70.net>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
Message-ID: <20200420211751.GF23945@port70.net>
Mail-Followup-To: Nicholas Piggin <npiggin@gmail.com>,
 Rich Felker <dalias@libc.org>,
 Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>,
 libc-dev@lists.llvm.org, linuxppc-dev@lists.ozlabs.org,
 musl@lists.openwall.com
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
 <20200416095800.GC23945@port70.net>
 <1587341904.1r83vbudyf.astroid@bobo.none>
 <20200420012904.GY11469@brightrain.aerifal.cx>
 <1587348046.pwnfbo52iq.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587348046.pwnfbo52iq.astroid@bobo.none>
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
 Nicholas Piggin via Libc-alpha <libc-alpha@sourceware.org>,
 linuxppc-dev@lists.ozlabs.org, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Nicholas Piggin <npiggin@gmail.com> [2020-04-20 12:08:36 +1000]:
> Excerpts from Rich Felker's message of April 20, 2020 11:29 am:
> > Also, allowing patching of executable pages is generally frowned upon
> > these days because W^X is a desirable hardening property.
> 
> Right, it would want be write-protected after being patched.

"frowned upon" means that users may have to update
their security policy setting in pax, selinux, apparmor,
seccomp bpf filters and who knows what else that may
monitor and flag W&X mprotect.

libc update can break systems if the new libc does W&X.
