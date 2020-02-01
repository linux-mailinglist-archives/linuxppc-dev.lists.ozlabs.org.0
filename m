Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C7F14F8CF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Feb 2020 17:20:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 488zpR3yTCzDqgb
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 03:20:31 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 488zlT154YzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 03:17:56 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 011GHdmS018483;
 Sat, 1 Feb 2020 10:17:39 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 011GHbUu018479;
 Sat, 1 Feb 2020 10:17:37 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Sat, 1 Feb 2020 10:17:37 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/32s: Don't flush all TLBs when flushing one page
Message-ID: <20200201161737.GO22482@gate.crashing.org>
References: <e31c57eb5308a5a73a5c8232454c0dd9f65f6175.1580485014.git.christophe.leroy@c-s.fr>
 <20200131155150.GD22482@gate.crashing.org>
 <27cef66b-df5b-0baa-abac-5532e58bd055@c-s.fr>
 <20200131193833.GF22482@gate.crashing.org>
 <248a3cf3-1b5e-a6e1-ceec-0e3904d1cf51@c-s.fr>
 <20200201140629.GM22482@gate.crashing.org>
 <96671e01-6206-8952-a498-942b42e98ef0@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96671e01-6206-8952-a498-942b42e98ef0@c-s.fr>
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

On Sat, Feb 01, 2020 at 03:53:12PM +0100, Christophe Leroy wrote:
> >>No, in end the low bits are set, that's a BIT OR with ~PAGE_MASK, so it
> >>sets all low bits to 1.
> >
> >Oh, wow, yes, I cannot read apparently.
> >
> >Maybe there are some ROUND_DOWN and ROUND_UP macros you could use?
> 
> Yes but my intention was to modify the existing code as less as possible.
> What do you think about version v2 of the patch ?

It looked fine to me.

Add my

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

if you want.


Segher
