Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4072AAD52
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 21:03:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTlSX0VSZzDqld
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 07:03:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.145; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=iram.es
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=igIw24xm; dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound4mad.lav.puc.rediris.es
 [130.206.19.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTlQn103qzDqgd
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 07:02:21 +1100 (AEDT)
Received: from mta-out02.sim.rediris.es (mta-out02.sim.rediris.es
 [130.206.24.44])
 by mx01.puc.rediris.es  with ESMTP id 0A8K26Uo025394-0A8K26Uq025394
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Sun, 8 Nov 2020 21:02:06 +0100
Received: from mta-out02.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPS id 7B688C143EC;
 Sun,  8 Nov 2020 21:02:06 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out02.sim.rediris.es (Postfix) with ESMTP id 2F717C5FB2A;
 Sun,  8 Nov 2020 21:02:06 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out02.sim.rediris.es
Received: from mta-out02.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out02.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Kc2ZYWnwDKP0; Sun,  8 Nov 2020 21:02:06 +0100 (CET)
Received: from lt-gp.iram.es (237.149.223.87.dynamic.jazztel.es
 [87.223.149.237])
 by mta-out02.sim.rediris.es (Postfix) with ESMTPA id 293C3C143EC;
 Sun,  8 Nov 2020 21:02:03 +0100 (CET)
Date: Sun, 8 Nov 2020 21:01:52 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: add compile-time support for lbarx, lwarx
Message-ID: <20201108200152.GA16446@lt-gp.iram.es>
References: <20201107032328.2454582-1-npiggin@gmail.com>
 <20201107071213.GA30735@lt-gp.iram.es>
 <0810564117125.202011.20201107114257.GG2672@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0810564117125.202011.20201107114257.GG2672@gate.crashing.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-FE-Policy-ID: 2:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=zep+CVKm09ADCpr3jxIcLPxN4rduQBbn12KleOW8iK8=;
 b=igIw24xmTWfhrO7Aw5OkNcRJAaQEh0tVT/AyIMFNSmseX03EmQyx2AoKfGHS2Q2x+LZSSgjYfSPT
 NCqG0lx8aN6Gnc7q+DkXTFyFmSmhfVKePbOco97jYfP4d6neGmnhNn/d0YF2ARt6GMV/byFUO85o
 GFZZBtxZouDmQy6G9qXtxzT1497MbYSL1d/jpXaifngNxScqOdRUr6g6rlt9D8soU8Pwhxs6IFmR
 u3c4BJWVH4bPiYaqHga8nRPjxzi3/tUg7nbsPLsMNGFh8O8hWo/Sj4mWSya7Q6CDHzTnD6Gc45gk
 Zou/z86Bt+DYM3lGheKT58sDt3el1Jn6ho94PQ==
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 07, 2020 at 05:42:57AM -0600, Segher Boessenkool wrote:
> On Sat, Nov 07, 2020 at 08:12:13AM +0100, Gabriel Paubert wrote:
> > On Sat, Nov 07, 2020 at 01:23:28PM +1000, Nicholas Piggin wrote:
> > > ISA v2.06 (POWER7 and up) as well as e6500 support lbarx and lwarx.
> > 
> > Hmm, lwarx exists since original Power AFAIR,
> 
> Almost: it was new on PowerPC.

I stand corrected. Does this mean that Power1 (and 2 I believe) had 
no SMP support?

	Gabriel
 

