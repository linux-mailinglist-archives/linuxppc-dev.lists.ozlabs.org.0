Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3607F16A379
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 11:06:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QyQd73cqzDqSj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 21:06:49 +1100 (AEDT)
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
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QyNM1FyrzDqTd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 21:04:50 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 01OA4hxv000623;
 Mon, 24 Feb 2020 04:04:44 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 01OA4gci000622;
 Mon, 24 Feb 2020 04:04:42 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 24 Feb 2020 04:04:42 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH 1/2] powerpc/powernv: Treat an empty reboot string as
 default
Message-ID: <20200224100442.GE22482@gate.crashing.org>
References: <20200217024833.30580-1-oohall@gmail.com>
 <767d85e7-7d8f-4a88-b16e-a4d69fb51343@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <767d85e7-7d8f-4a88-b16e-a4d69fb51343@ozlabs.ru>
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
Cc: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 24, 2020 at 01:32:28PM +1100, Alexey Kardashevskiy wrote:
> On 17/02/2020 13:48, Oliver O'Halloran wrote:
> > Treat an empty reboot cmd string the same as a NULL string. This squashes a
> > spurious unsupported reboot message that sometimes gets out when using
> > xmon.

> > -		if (!cmd)
> > +		if (!cmd || !strlen(cmd))
> 
> nit: this does not matter here in practice but
> 
> if (!cmd || cmd[0] == '\0')
> 
> is faster (you do not care about the length anyway) and safer (@cmd can
> potentially be endless) ;)

No it isn't, this compiles to identical machine code.  (I tested with
GCC 9, and going back until 4.6 -- the generated code becomes
progressively worse (unrelated to this code, fwiw), but identical for
both cases all the time).


Segher
