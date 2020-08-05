Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A7E23C2BF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 02:46:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLtGJ10gYzDqNg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 10:46:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLtBC0TjKzDqXZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 10:42:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BLtBC02Drz9sPC; Wed,  5 Aug 2020 10:42:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BLtBB6KrTz9sT6; Wed,  5 Aug 2020 10:42:26 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200803020719.96114-1-mpe@ellerman.id.au>
References: <20200803020719.96114-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2] selftests/powerpc: Skip vmx/vsx/tar/etc tests on older
 CPUs
Message-Id: <159658812635.351125.100298740346288319.b4-ty@ellerman.id.au>
Date: Wed,  5 Aug 2020 10:42:26 +1000 (AEST)
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

On Mon, 3 Aug 2020 12:07:19 +1000, Michael Ellerman wrote:
> Some of our tests use VSX or newer VMX instructions, so need to be
> skipped on older CPUs to avoid SIGILL'ing.
> 
> Similarly TAR was added in v2.07, and the PMU event used in the stcx
> fail test only works on Power8 or later.

Applied to powerpc/next.

[1/1] selftests/powerpc: Skip vmx/vsx/tar/etc tests on older CPUs
      https://git.kernel.org/powerpc/c/872d11bca9c29ed19595c993b9f552ffe9b63dcb

cheers
