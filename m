Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5699022EBC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 14:12:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFdwQ59Y4zDr5V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 22:12:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFdq66l2XzF0fc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 22:07:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 4BFdq64Y5kz9sRN; Mon, 27 Jul 2020 22:07:46 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BFdq61rzJz9sRk; Mon, 27 Jul 2020 22:07:45 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200724004109.1461709-1-mpe@ellerman.id.au>
References: <20200724004109.1461709-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/test_emulate_sstep: Fix build error
Message-Id: <159585165726.634388.5058185242937477858.b4-ty@ellerman.id.au>
Date: Mon, 27 Jul 2020 22:07:45 +1000 (AEST)
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

On Fri, 24 Jul 2020 10:41:09 +1000, Michael Ellerman wrote:
> ppc64_book3e_allmodconfig fails with:
> 
>   arch/powerpc/lib/test_emulate_step.c: In function 'test_pld':
>   arch/powerpc/lib/test_emulate_step.c:113:7: error: implicit declaration of function 'cpu_has_feature'
>     113 |  if (!cpu_has_feature(CPU_FTR_ARCH_31)) {
>         |       ^~~~~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/test_emulate_sstep: Fix build error
      https://git.kernel.org/powerpc/c/70cc062c47e7851335ff4c44ba9b362174baf7d4

cheers
