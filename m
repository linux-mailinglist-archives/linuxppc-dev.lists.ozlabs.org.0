Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 770D2178624
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 00:11:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XCSf3BdDzDqWn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 10:11:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XCQb1lP8zDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 10:09:55 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 023N9oJc032388;
 Tue, 3 Mar 2020 17:09:50 -0600
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 023N9ou4032387;
 Tue, 3 Mar 2020 17:09:50 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Tue, 3 Mar 2020 17:09:50 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64: BE option to use ELFv2 ABI for big endian
 kernels
Message-ID: <20200303230950.GM22482@gate.crashing.org>
References: <20200303014527.39377-1-npiggin@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303014527.39377-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Tue, Mar 03, 2020 at 11:45:27AM +1000, Nicholas Piggin wrote:
> Provide an option to use ELFv2 ABI for big endian builds. This works on
> GCC and clang (since 2014). it is is not officially supported by the GNU
> toolchain, but it can give some useful advantages of the ELFv2 ABI for
> BE (e.g., less stack usage). Some distros build BE ELFv2 userspace.

It is not officially supported in the sense that a) as a host config,
it does not exist *at all* (this isn't relevant for the kernel, it does
not use a libc or other libraries, of course); and b) as a target config,
it is not supported in the sense that no one tests it, so we cannot say
anything about what quality code it generates, if it works at all, etc.

But we *do* allow "-mbig -mabi=elfv2", it's just a chicken-and-egg
problem to have this properly tested.  If someone would regularly test
it (incl. sending the test results to gcc-testresults@), I don't see why
it would not become a supported platform.

> +override flavour := linux-ppc64v2

That isn't a good name, heh.  This isn't "v2" of anything...  Spell out
the name "ELFv2"?  Or as "elfv2"?  It is just a name after all, it is
version 1 in all three version fields in the ELF headers!


Anyway, looks like it will work, let's see where this goes :-)

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
