Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B237BA96
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 12:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgB0G3R24z302g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 20:31:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Fg9zv2hDHz2yRW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 20:30:50 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 14CAQgOQ001475;
 Wed, 12 May 2021 05:26:42 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 14CAQe4i001474;
 Wed, 12 May 2021 05:26:40 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 12 May 2021 05:26:40 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] powerpc/makefile: Do not redefine $(CPP) for
 preprocessor
Message-ID: <20210512102640.GT10366@gate.crashing.org>
References: <20210511044812.267965-1-aik@ozlabs.ru>
 <20210511112019.GK10366@gate.crashing.org>
 <1795b9efa40.27bb.1ca38dd7e845b990cd13d431eb58563d@ozlabs.ru>
 <20210511231635.GR10366@gate.crashing.org>
 <80ae1561-ed8d-cf3a-f3bb-d89cd07bfc24@ozlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <80ae1561-ed8d-cf3a-f3bb-d89cd07bfc24@ozlabs.ru>
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 12, 2021 at 01:48:53PM +1000, Alexey Kardashevskiy wrote:
> >Oh!  I completely missed those few lines.  Sorry for that :-(
> 
> Well, I probably should have made it a separate patch anyway, I'll 
> repost separately.

Thanks.

> >To compensate a bit:
> >
> >>It still puzzles me why we need -C
> >>(preserve comments in the preprocessor output) flag here.
> >
> >It is so that a human can look at the output and read it.  Comments are
> >very significant to human readers :-)
> 
> I seriously doubt anyone ever read those :)

I am pretty sure whoever wrote it did!

> I suspect this is to pull 
> all the licenses in one place and do some checking but I did not dig deep.

I don't see the point in that, but :-)


Segher
