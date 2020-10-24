Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D25297BD6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 12:33:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CJHWK4Dl3zDr15
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Oct 2020 21:33:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJHNv1c8SzDqlR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Oct 2020 21:27:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CJHNv1LNKz9sVH; Sat, 24 Oct 2020 21:27:59 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20201021232554.1434687-1-oohall@gmail.com>
References: <20201021232554.1434687-1-oohall@gmail.com>
Subject: Re: [PATCH] powerpc/eeh: Fix eeh_dev_check_failure() for PE#0
Message-Id: <160353524026.3419015.7292966014896302736.b4-ty@ellerman.id.au>
Date: Sat, 24 Oct 2020 21:27:59 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Oct 2020 10:25:54 +1100, Oliver O'Halloran wrote:
> In commit 269e583357df ("powerpc/eeh: Delete eeh_pe->config_addr") the
> following simplification was made:
> 
> -       if (!pe->addr && !pe->config_addr) {
> +       if (!pe->addr) {
>                 eeh_stats.no_cfg_addr++;
>                 return 0;
>         }
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/eeh: Fix eeh_dev_check_failure() for PE#0
      https://git.kernel.org/powerpc/c/99f6e9795a68fe23f96a2b5b0be07a3dd9457f99

cheers
