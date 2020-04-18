Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7BA1AF530
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 23:42:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 494RHv4NV3zDs09
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Apr 2020 07:42:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTP id 494RFc6K5PzDrgv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Apr 2020 07:40:03 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03ILdsF2020160;
 Sat, 18 Apr 2020 16:39:54 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03ILdr0X020159;
 Sat, 18 Apr 2020 16:39:53 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 18 Apr 2020 16:39:53 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: How to use "y" constraint in GCC inline powerpc assembly ?
Message-ID: <20200418213953.GO26902@gate.crashing.org>
References: <9fd93f18-652e-c301-f110-d9f07201330d@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9fd93f18-652e-c301-f110-d9f07201330d@c-s.fr>
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

On Sat, Apr 18, 2020 at 08:28:53AM +0000, Christophe Leroy wrote:
> I'd like to use cr instead of gpr to return error condition from 
> __get_user().
> 
> I saw in GCC doc 
> (https://gcc.gnu.org/onlinedocs/gcc/Machine-Constraints.html) that it is 
> possible to use "y" as constraint to refer to "Any condition register 
> field, cr0…cr7".
> 
> I tried the test below, but it fails with "error: impossible register 
> constraint in 'asm'"
> 
> How does "y" has to be used ?

The same as "x".  You cannot really use these constraints in asm, it's
internal only.  I'll remove it from the inline asm documentation.  Thanks!

(You should put the cr fields you use in an inline asm in its clobber
list, i.e. "cr0" or "cr7").


Segher
