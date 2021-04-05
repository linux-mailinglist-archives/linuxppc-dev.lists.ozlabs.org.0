Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D88B3354220
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 14:41:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDVdK6MXHz3bvH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 22:41:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FDVd01x7rz2xZy
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 22:40:51 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 135CcSjg014265;
 Mon, 5 Apr 2021 07:38:28 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 135CcRoo014264;
 Mon, 5 Apr 2021 07:38:27 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 5 Apr 2021 07:38:27 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32: Remove powerpc specific definition of
 'ptrdiff_t'
Message-ID: <20210405123827.GM13863@gate.crashing.org>
References: <e43d133bf52fa19e577f64f3a3a38cedc570377d.1617616601.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e43d133bf52fa19e577f64f3a3a38cedc570377d.1617616601.git.christophe.leroy@csgroup.eu>
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

On Mon, Apr 05, 2021 at 09:57:27AM +0000, Christophe Leroy wrote:
> For unknown reason, old commit d27dfd388715 ("Import pre2.0.8")
> changed 'ptrdiff_t' from 'int' to 'long'.
> 
> GCC expects it as 'int' really,

It isn't actually defined in the ABI as far as I can see (neither the
old document or the new one), but GCC has defined it as "int" since
forever (which was in 1995), for anything using the SYSV ABI (which
includes powerpc-linux).

> <asm-generic/uapi/posix-types.h> defines it as 'int', and
> defines 'size_t' and 'ssize_t' exactly as powerpc do, so
> remove the powerpc specific definitions and fallback on
> generic ones.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Thanks!

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
