Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D834C926BD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:30:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46BxDK2508zDqY4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:30:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Bx630z42zDqDs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:25:14 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x7JEOx1K022323;
 Mon, 19 Aug 2019 09:25:00 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x7JEOxlG022322;
 Mon, 19 Aug 2019 09:24:59 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 19 Aug 2019 09:24:59 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v3 3/3] powerpc/64: optimise LOAD_REG_IMMEDIATE_SYM()
Message-ID: <20190819142459.GJ31406@gate.crashing.org>
References: <be2b971c89b1af30d680cedd14e99a83138ef40a.1566223054.git.christophe.leroy@c-s.fr>
 <92bf50b31f5f78cc76ed055b11a492e8e9e2c731.1566223054.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <92bf50b31f5f78cc76ed055b11a492e8e9e2c731.1566223054.git.christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 19, 2019 at 01:58:12PM +0000, Christophe Leroy wrote:
> -#define LOAD_REG_IMMEDIATE_SYM(reg,expr)	\
> -	lis     reg,(expr)@highest;		\
> -	ori     reg,reg,(expr)@higher;	\
> -	rldicr  reg,reg,32,31;		\
> -	oris    reg,reg,(expr)@__AS_ATHIGH;	\
> -	ori     reg,reg,(expr)@l;
> +#define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
> +	lis	reg, (expr)@highest;		\
> +	lis	tmp, (expr)@__AS_ATHIGH;	\
> +	ori	reg, reg, (expr)@higher;	\
> +	ori	tmp, reg, (expr)@l;		\
> +	rldimi	reg, tmp, 32, 0

That should be

#define LOAD_REG_IMMEDIATE_SYM(reg, tmp, expr)	\
	lis	tmp, (expr)@highest;		\
	ori	tmp, tmp, (expr)@higher;	\
	lis	reg, (expr)@__AS_ATHIGH;	\
	ori	reg, reg, (expr)@l;		\
	rldimi	reg, tmp, 32, 0

(tmp is the high half, reg is the low half, as inputs to that rldimi).


Segher
