Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE22892CFC7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 12:51:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gNkQsN12;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WJvmY44cwz3cBd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 20:51:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gNkQsN12;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WJvlq2v4Kz30Tv
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jul 2024 20:50:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1720608644;
	bh=Sq7A/5BKly+8nmwJr6uA8HAvkZyan3OjiLaHZGsUBSs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gNkQsN1224trz3k4ZWtlSM1G2KLEdd/BtBlc5HWriCQ8icpbMXsA06qGyoYX4LDO2
	 NM5UWiPY1/r02uvgFChIZnKZ2prBo6qFY9ruKG91mEbhpfuXQD3PlXTjZOI4XgJyEk
	 ILwDsYRxvQDkAzvSTWdTntj6Tq1wTT5JdQzkOekLokSjdDUi9DaaMfQ/P/E0P7Xhcm
	 eYChzWePjRQLpsfH51QBI6UjFNwfh5r/5Bpu6wwMI0m5rd2VkbGwthVyBlJImTVXq5
	 gHDSg22GwdMTWhYmoyHbUFJXVapTWqKd6suvRvPKpyQ6seUhUf1s+tu2v4XaOQjA8g
	 arChLBtLNmvaw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WJvlk6F7Lz4wZx;
	Wed, 10 Jul 2024 20:50:42 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jonathan Corbet
 <corbet@lwn.net>
Subject: Re: [PATCH] Documentation/powerpc: Remove retired CPUs from list of
 supported CPUs
In-Reply-To: <e33ba7b242a104259fbcf1a4d4bdb0f1d1db6882.1720539170.git.christophe.leroy@csgroup.eu>
References: <e33ba7b242a104259fbcf1a4d4bdb0f1d1db6882.1720539170.git.christophe.leroy@csgroup.eu>
Date: Wed, 10 Jul 2024 20:50:41 +1000
Message-ID: <877cdt5xmm.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 601, power4, 401, 403, 405, e200 and IBM-A2 support was removed by
> by following commits:
> - Commit 8b14e1dff067 ("powerpc: Remove support for PowerPC 601")
> - Commit 471d7ff8b51b ("powerpc/64s: Remove POWER4 support")
> - Commit 1b5c0967ab8a ("powerpc/40x: Remove support for IBM 403GCX")
> - Commit 39c8bf2b3cc1 ("powerpc: Retire e200 core (mpc555x processor)")
> - Commit fb5a515704d7 ("powerpc: Remove platforms/wsp and associated
> pieces")

There was also: 468a33028edd ("powerpc: Drop support for pre-POWER4 cpus")

> Remove them from the list of supported CPUs.

The CPU families doc is not intended to be a list of supported CPUs,
it's more of a family tree which includes the currently supported CPUs.

Even when I first added it there were CPUs mentioned that weren't
supported. (I realise the paragraph at the top of the file doesn't make
that clear)

I don't mind removing cores that are unsupported and unconnected to
other things, eg. A2, e200 and the 40x.

But for 601 and the early POWER cores I'd rather we marked the
unsupported ones with an asterisk or something. That way the family tree
still connects and includes all the history, otherwise I think it risks
being confusing.

Or maybe we use a different box outline (~) for unsupported cores? eg:

   +~~~~~~~~~~~~~~+                 +~~~~~~~~~~~~~~~~+
   |  Old POWER   | --------------> | RS64 (threads) |
   +~~~~~~~~~~~~~~+                 +~~~~~~~~~~~~~~~~+
          |
          |
          v
   +~~~~~~~~~~~~~~+                 +----------------+      +------+
   |     601      | --------------> |      603       | ---> | e300 |
   +~~~~~~~~~~~~~~+                 +----------------+      +------+
          |                                 |
          |                                 |
          v                                 v
   +--------------+    +-----+      +----------------+      +-------+
   |     604      |    | 755 | <--- |    750 (G3)    | ---> | 750CX |
   +--------------+    +-----+      +----------------+      +-------+
          |                                 |                   |
          |                                 |                   |
          v                                 v                   v
   +~~~~~~~~~~~~~~+                 +----------------+      +-------+
   | 620 (64 bit) |                 |      7400      |      | 750CL |
   +~~~~~~~~~~~~~~+                 +----------------+      +-------+
          |                                 |                   |
          |                                 |                   |
          v                                 v                   v
   +~~~~~~~~~~~~~~+                 +----------------+      +-------+
   |  POWER3/630  |                 |      7410      |      | 750FX |
   +~~~~~~~~~~~~~~+                 +----------------+      +-------+


cheers
