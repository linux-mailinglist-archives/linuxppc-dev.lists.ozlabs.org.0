Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04620376B63
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 May 2021 23:02:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FcNDq71Gbz2ym5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 May 2021 07:02:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FcNDQ3qjZz2yXp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 May 2021 07:01:57 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 147KxVpM030459;
 Fri, 7 May 2021 15:59:31 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 147KxS5E030446;
 Fri, 7 May 2021 15:59:28 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Fri, 7 May 2021 15:59:28 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: UBSAN: array-index-out-of-bounds in
 arch/powerpc/kernel/legacy_serial.c:359:56
Message-ID: <20210507205928.GR10366@gate.crashing.org>
References: <9f1e8f9a-9ccd-fc96-04cc-30137dbe9011@molgen.mpg.de>
 <a7467e08-1e53-e974-d14b-13e6ff558dae@molgen.mpg.de>
 <3b1febc1-3635-fb5f-1ff3-6f9f0c8feb12@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b1febc1-3635-fb5f-1ff3-6f9f0c8feb12@csgroup.eu>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linuxppc-dev@lists.ozlabs.org,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 07, 2021 at 10:31:42AM +0200, Christophe Leroy wrote:
> The function is as follows, so when legacy_serial_console == -1 as in your 
> situation, the pointers are just not used.

And it is still undefined behaviour.  C11 6.5.6/8 has
  If both the pointer operand and the result point to elements of the
  same array object, or one past the last element of the array object,
  the evaluation shall not produce an overflow; otherwise, the behavior
  is undefined.
(this is for adding an integer to a pointer).

> When I look into the generated code (UBSAN not selected), we see the 
> verification and the bail-out is done prior to any calculation based on 
> legacy_serial_console.

Yes, you got lucky.  Generating the code you wanted is one of the things
the compiler is allowed to do for UB.

> So, is it normal that UBSAN reports an error here ?

Yes.  It detected undefined behaviour just fine, it did exactly its
job :-)


Segher
