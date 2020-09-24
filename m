Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE38A2771A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 14:54:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bxw3B28gjzDqfj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 22:53:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxvT21Jf9zDqYq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 22:27:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BxvSz74R6z9sVM; Thu, 24 Sep 2020 22:27:47 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BxvSz2kTdz9sVK; Thu, 24 Sep 2020 22:27:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20200916115637.3100484-1-mpe@ellerman.id.au>
References: <20200916115637.3100484-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/mm/64s: Fix slb_setup_new_exec() sparse
 warning
Message-Id: <160094999766.26280.12331046118096322093.b4-ty@ellerman.id.au>
Date: Thu, 24 Sep 2020 22:27:46 +1000 (AEST)
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

On Wed, 16 Sep 2020 21:56:36 +1000, Michael Ellerman wrote:
> Sparse says:
>   symbol slb_setup_new_exec was not declared. Should it be static?
> 
> No, it should have a declaration in a header, add one.

Applied to powerpc/next.

[1/2] powerpc/mm/64s: Fix slb_setup_new_exec() sparse warning
      https://git.kernel.org/powerpc/c/ef1edbba52883907caf02ab85e0d00a2e4648f05
[2/2] powerpc/perf: Add declarations to fix sparse warnings
      https://git.kernel.org/powerpc/c/d10ebe79dfae7dc59b6cf77ffa615f0b8dae21bf

cheers
