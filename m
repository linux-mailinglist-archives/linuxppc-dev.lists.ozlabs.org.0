Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 001EFBDCD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 13:16:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46db8g3n08zDqf3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 21:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46dZwL1GPVzDqdZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 21:05:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46dZwK6vZdz9sPn; Wed, 25 Sep 2019 21:05:21 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: c6fadabb2868f817299ddb338ac15885e25d12d2
In-Reply-To: <20190917004605.22471-1-alistair@popple.id.au>
To: Alistair Popple <alistair@popple.id.au>
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc: Fix definition of PCR bits to work with old
 binutils
Message-Id: <46dZwK6vZdz9sPn@ozlabs.org>
Date: Wed, 25 Sep 2019 21:05:21 +1000 (AEST)
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
Cc: jniethe5@gmail.com, linuxppc-dev@lists.ozlabs.org,
 Alistair Popple <alistair@popple.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-09-17 at 00:46:04 UTC, Alistair Popple wrote:
> Commit 388cc6e133132 ("KVM: PPC: Book3S HV: Support POWER6
> compatibility mode on POWER7") introduced new macros defining the PCR
> bits. When used from assembly files these definitions lead to build
> errors using older versions of binutils that don't support the 'ul'
> suffix. This fixes the build errors by updating the definitions to use
> the __MASK() macro which selects the appropriate suffix.
> 
> Signed-off-by: Alistair Popple <alistair@popple.id.au>

Series applied to powerpc fixes, thanks.

https://git.kernel.org/powerpc/c/c6fadabb2868f817299ddb338ac15885e25d12d2

cheers
