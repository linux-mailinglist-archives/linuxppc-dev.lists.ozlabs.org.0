Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9358C13DCE2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 15:03:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z5WY4zl2zDqKS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 01:03:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z5TD1HvRzDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 01:01:19 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 00GE11kf011998;
 Thu, 16 Jan 2020 08:01:01 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 00GE11aZ011997;
 Thu, 16 Jan 2020 08:01:01 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 16 Jan 2020 08:01:01 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: z constraint in powerpc inline assembly ?
Message-ID: <20200116140101.GQ3191@gate.crashing.org>
References: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d72263a1-fe17-3192-6930-35ec8394c699@c-s.fr>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Jan 16, 2020 at 07:11:36AM +0100, Christophe Leroy wrote:
> I'm trying to see if we could enhance TCP checksum calculations by 
> splitting inline assembly blocks to give GCC the opportunity to mix it 
> with other stuff, but I'm getting difficulties with the carry.
> 
> As far as I can read in the documentation, the z constraint represents 
> '‘XER[CA]’ carry bit (part of the XER register)'
> 
> I've tried the following, but I get errors. Can you help ?
> 
> unsigned long cksum(unsigned long a, unsigned long b, unsigned long c)
> {
> 	unsigned long sum;
> 	unsigned long carry;
> 
> 	asm("addc %0, %2, %3" : "=r"(sum), "=z"(carry) : "r"(a), "r"(b));
> 	asm("adde %0, %0, %2" : "+r"(sum), "+z"(carry) : "r"(c));
> 	asm("addze %0, %0" : "+r"(sum) : "z"(carry));
> 
> 	return sum;
> }

The only register allowed by "z" is a fixed register.  You cannot use "z"
in inline asm.

Just write this as C?  It should do a reasonable job of it.  If you want
*good* code, you need to write it in *actual* assembler code, anyway (hand
scheduled and everything).


Segher
