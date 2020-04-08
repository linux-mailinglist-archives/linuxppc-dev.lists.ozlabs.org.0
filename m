Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D7B1A2842
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 20:12:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yC740K0RzDr6W
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 04:12:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 48yC5L5K2czDr3r
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 04:11:17 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 038IB2N5014718;
 Wed, 8 Apr 2020 13:11:02 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 038IB1lA014717;
 Wed, 8 Apr 2020 13:11:01 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 8 Apr 2020 13:11:01 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v5 18/21] powerpc64: Add prefixed instructions to
 instruction data type
Message-ID: <20200408181101.GG26902@gate.crashing.org>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-19-jniethe5@gmail.com> <7182352.hY56U9iWWN@townsend>
 <4a8cf8b1-63e7-0b68-dede-48454bf5a4a7@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a8cf8b1-63e7-0b68-dede-48454bf5a4a7@c-s.fr>
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
Cc: Alistair Popple <alistair@popple.id.au>, npiggin@gmail.com,
 bala24@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 06, 2020 at 12:25:27PM +0200, Christophe Leroy wrote:
> >	if (ppc_inst_prefixed(x) != ppc_inst_prefixed(y))
> >		return false;
> >	else if (ppc_inst_prefixed(x))
> >		return !memcmp(&x, &y, sizeof(struct ppc_inst));
> 
> Are we sure memcmp() is a good candidate for the comparison ? Can we do 
> simpler ? Especially, I understood a prefixed instruction is a 64 bits 
> properly aligned instruction, can we do a simple u64 compare ? Or is GCC 
> intelligent enough to do that without calling memcmp() function which is 
> heavy ?

A prefixed insn is *not* 8-byte aligned, it is 4-byte aligned, fwiw.

memcmp() isn't as heavy as you fear, not with a non-ancient GCC at least.
But this could be written in a nicer way, sure :-)


Segher
