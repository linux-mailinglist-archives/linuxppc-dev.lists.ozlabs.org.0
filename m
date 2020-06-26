Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C868D20AB7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 06:50:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPb02S2BzDqs6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 14:50:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTS4tjpzDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:45:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTS4P4lz9sSS; Fri, 26 Jun 2020 14:45:48 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Alexey Kardashevskiy <aik@ozlabs.ru>
In-Reply-To: <20200612043303.84894-1-aik@ozlabs.ru>
References: <20200612043303.84894-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel] powerpc/xive: Ignore kmemleak false positives
Message-Id: <159314672639.1150869.12250930261017520195.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:45:48 +1000 (AEST)
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Jun 2020 14:33:03 +1000, Alexey Kardashevskiy wrote:
> xive_native_provision_pages() allocates memory and passes the pointer to
> OPAL so kmemleak cannot find the pointer usage in the kernel memory and
> produces a false positive report (below) (even if the kernel did scan
> OPAL memory, it is unable to deal with __pa() addresses anyway).
> 
> This silences the warning.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xive: Ignore kmemleak false positives
      https://git.kernel.org/powerpc/c/f0993c839e95dd6c7f054a1015e693c87e33e4fb

cheers
