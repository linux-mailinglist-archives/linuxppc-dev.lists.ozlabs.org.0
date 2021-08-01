Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 376943DCBC0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 15:15:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gd1pJ5XM4z3cRP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 23:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gd1nt5YXsz2yx2
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 23:14:58 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Gd1ns57MRz9sXk; Sun,  1 Aug 2021 23:14:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
In-Reply-To: <20210729060449.292780-1-srikar@linux.vnet.ibm.com>
References: <20210729060449.292780-1-srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Fix regression while building external
 modules
Message-Id: <162782363987.2951535.6223006855030878479.b4-ty@ellerman.id.au>
Date: Sun, 01 Aug 2021 23:13:59 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: marc.c.dionne@gmail.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, jforbes@redhat.com, yadayada@in.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Jul 2021 11:34:49 +0530, Srikar Dronamraju wrote:
> With Commit c9f3401313a5 ("powerpc: Always enable queued spinlocks for
> 64s, disable for others") CONFIG_PPC_QUEUED_SPINLOCKS is always
> enabled on ppc64le, external modules that use spinlock APIs are
> failing.
> 
> ERROR: modpost: GPL-incompatible module XXX.ko uses GPL-only symbol
> 'shared_processor'
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries: Fix regression while building external modules
      https://git.kernel.org/powerpc/c/333cf507465fbebb3727f5b53e77538467df312a

cheers
