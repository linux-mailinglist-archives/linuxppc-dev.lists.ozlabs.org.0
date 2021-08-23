Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA8D3F4DEE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 18:01:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtcRx6pmfz2xsr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 02:01:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GtcRT5fDSz2xrT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 02:01:09 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 17NFwj45016805;
 Mon, 23 Aug 2021 10:58:45 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 17NFwbGZ016793;
 Mon, 23 Aug 2021 10:58:37 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 23 Aug 2021 10:58:37 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/booke: Avoid link stack corruption in several
 places
Message-ID: <20210823155837.GX1583@gate.crashing.org>
References: <d7435e616336fd5f07bb19ec61e97d71e5c53568.1629705153.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7435e616336fd5f07bb19ec61e97d71e5c53568.1629705153.git.christophe.leroy@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 23, 2021 at 07:53:01AM +0000, Christophe Leroy wrote:
>  /* Be careful, this will clobber the lr register. */
>  #define LOAD_REG_ADDR_PIC(reg, name)		\
> -	bl	0f;				\
> +	bcl	20,31,0f			\
>  0:	mflr	reg;				\
>  	addis	reg,reg,(name - 0b)@ha;		\
>  	addi	reg,reg,(name - 0b)@l;

The code ended each line with a semicolon before, for absolutely no
reason that I can see, but still.  Fixing that would be nice, but only
doing it on one line isn't good.

Btw.  Both the 7450 and the modern cores implementing this really need
this to be $+4, so it is a lot clearer to write that instead of 1f or
a named label.


Segher
