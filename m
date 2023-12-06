Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B728074E7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 17:28:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SljWZ0Hx8z3dK1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Dec 2023 03:28:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SljW463dbz3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Dec 2023 03:28:00 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 3B6GPvZL030148;
	Wed, 6 Dec 2023 10:25:57 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 3B6GPuau030147;
	Wed, 6 Dec 2023 10:25:56 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Wed, 6 Dec 2023 10:25:56 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 4/4] powerpc/Makefile: Auto detect cross compiler
Message-ID: <20231206162556.GK19790@gate.crashing.org>
References: <20231206115548.1466874-1-mpe@ellerman.id.au> <20231206115548.1466874-4-mpe@ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206115548.1466874-4-mpe@ellerman.id.au>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 06, 2023 at 10:55:48PM +1100, Michael Ellerman wrote:
> Look for various combinations, matching:
>   powerpc(64(le)?)?(-unknown)?-linux(-gnu)?-
> 
> There are more possibilities, but the above is known to find a compiler
> on Fedora and Ubuntu (which use linux-gnu-), and also detects the
> kernel.org cross compilers (which use linux-).

$ sh ../config.sub powerpc64-linux
powerpc64-unknown-linux-gnu

I am very very lazy, so buildall uses short names everywhere :-)

Btw, can you build the kernel for a config that differs in 32/64 or
BE/LE with the default your compiler uses?  There is no reason this
shouldn't work (you don't use any system libraries), but you need to
use the correct compiler command-line flags for that always.

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
