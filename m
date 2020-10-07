Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2362A285707
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 05:24:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5fns1vkqzDqLY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 14:24:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5fkJ0JckzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 14:21:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C5fkH1lfVz9sTR; Wed,  7 Oct 2020 14:21:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20200820044512.7543-1-ajd@linux.ibm.com>
References: <20200820044512.7543-1-ajd@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/rtas: Restrict RTAS requests from userspace
Message-Id: <160204083771.257875.2183236339326581440.b4-ty@ellerman.id.au>
Date: Wed,  7 Oct 2020 14:21:11 +1100 (AEDT)
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
Cc: nathanl@linux.ibm.com, leobras.c@gmail.com, stable@vger.kernel.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Aug 2020 14:45:12 +1000, Andrew Donnellan wrote:
> A number of userspace utilities depend on making calls to RTAS to retrieve
> information and update various things.
> 
> The existing API through which we expose RTAS to userspace exposes more
> RTAS functionality than we actually need, through the sys_rtas syscall,
> which allows root (or anyone with CAP_SYS_ADMIN) to make any RTAS call they
> want with arbitrary arguments.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/rtas: Restrict RTAS requests from userspace
      https://git.kernel.org/powerpc/c/bd59380c5ba4147dcbaad3e582b55ccfd120b764
[2/2] selftests/powerpc: Add a rtas_filter selftest
      https://git.kernel.org/powerpc/c/dc9af82ea0614bb138705d1f5230d53b3b1dfb83

cheers
