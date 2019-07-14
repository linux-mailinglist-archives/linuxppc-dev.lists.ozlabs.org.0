Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EBC68175
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 00:50:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45n2144qmbzDqSJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 08:50:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45n1zM3WTlzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 08:48:31 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6EMm5Bu008487;
 Sun, 14 Jul 2019 17:48:07 -0500
Message-ID: <1c6ed554525d419d71dbe3e0a06b98b7a33eeb5c.camel@kernel.crashing.org>
Subject: Re: [RFC PATCH kernel] powerpc/xive: Drop deregistered irqs
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 15 Jul 2019 08:48:05 +1000
In-Reply-To: <1ab709c5-b6b6-c153-a8e9-5340cb77443a@kaod.org>
References: <20190712082036.40440-1-aik@ozlabs.ru>
 <abbee9db2fa0abdaa2e01bb92bab920773a2ad8d.camel@kernel.crashing.org>
 <3a34190f-560e-0b42-af38-0e39cef0beea@ozlabs.ru>
 <d735f761b3d1cc1cd6df5fd566c75cae661fe4e7.camel@kernel.crashing.org>
 <9b1fbde4-0884-223e-446c-373f73c366e0@ozlabs.ru>
 <67befaf7d091ff684534e027bd303d80c752466d.camel@kernel.crashing.org>
 <1ab709c5-b6b6-c153-a8e9-5340cb77443a@kaod.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
Cc: Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Alistair Popple <alistair@popple.id.au>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 2019-07-14 at 21:44 +0200, Cédric Le Goater wrote:
> > Well, best is probably to do just that though, but call it something
> > like ppc_md.orphan_irq() or something like that instead. Another option
> > as you mention is to try to scrub queues, but that's trickier to do due
> > to the lockless nature of the queue handling.
> 
> When the IRQ is shutdown, couldn't we cleanup the CPU EQ by filtering 
> all the dangling entries, and replacing them with zeroes ? That would
> be alternative 1, but I don't think we need to scan all cpus. The last
> target should be enough.

It's a bit tricky due to the lockless nature of the queues...

Cheers,
Ben.


