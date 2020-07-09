Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD1C2194E3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 02:16:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2GtM35zYzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 10:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Grj0ngVzDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 10:14:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B2Grh0JTCz9sQt; Thu,  9 Jul 2020 10:14:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20200708074942.1713396-1-npiggin@gmail.com>
References: <20200708074942.1713396-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s/exception: Fix 0x1500 interrupt handler crash
Message-Id: <159425380826.2803424.3761513331962391892.b4-ty@ellerman.id.au>
Date: Thu,  9 Jul 2020 10:14:44 +1000 (AEST)
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 8 Jul 2020 17:49:42 +1000, Nicholas Piggin wrote:
> A typo caused the interrupt handler to branch immediately to the common
> "unknown interrupt" handler and skip the special case test for denormal
> cause.
> 
> This does not affect KVM softpatch handling (e.g., for POWER9 TM assist)
> because the KVM test was moved to common code by commit 9600f261acaa
> ("powerpc/64s/exception: Move KVM test to common code") just before this
> bug was introduced.

Applied to powerpc/fixes.

[1/1] powerpc/64s/exception: Fix 0x1500 interrupt handler crash
      https://git.kernel.org/powerpc/c/4557ac6b344b8cdf948ff8b007e8e1de34832f2e

cheers
