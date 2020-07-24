Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465322C855
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 16:46:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCsV01q8NzDrP1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 00:46:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgS2zclzDr9w
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:24:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BCqgQ6l37z9sTv; Fri, 24 Jul 2020 23:24:50 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgQ3dmTz9sTK; Fri, 24 Jul 2020 23:24:49 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200602052728.18227-1-jniethe5@gmail.com>
References: <20200602052728.18227-1-jniethe5@gmail.com>
Subject: Re: [PATCH 1/4] powerpc: Add a ppc_inst_as_str() helper
Message-Id: <159559697070.1657499.3975265893050959590.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:24:49 +1000 (AEST)
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
Cc: alistair@popple.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jun 2020 15:27:25 +1000, Jordan Niethe wrote:
> There are quite a few places where instructions are printed, this is
> done using a '%x' format specifier. With the introduction of prefixed
> instructions, this does not work well. Currently in these places,
> ppc_inst_val() is used for the value for %x so only the first word of
> prefixed instructions are printed.
> 
> When the instructions are word instructions, only a single word should
> be printed. For prefixed instructions both the prefix and suffix should
> be printed. To accommodate both of these situations, instead of a '%x'
> specifier use '%s' and introduce a helper, __ppc_inst_as_str() which
> returns a char *. The char * __ppc_inst_as_str() returns is buffer that
> is passed to it by the caller.
> 
> [...]

Patches 1-2 applied to powerpc/next.

[1/4] powerpc: Add a ppc_inst_as_str() helper
      https://git.kernel.org/powerpc/c/50428fdc53ba48f6936b10dfdc0d644972403908
[2/4] powerpc/xmon: Improve dumping prefixed instructions
      https://git.kernel.org/powerpc/c/8b98afc117aaf825c66d7ddd59f1849e559b42cd

cheers
