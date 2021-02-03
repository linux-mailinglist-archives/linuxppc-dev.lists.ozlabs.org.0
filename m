Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB15D30D9FC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:43:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW1Z75P3czDyxD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 23:43:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09k6dqjzDwv6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:42 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09h1qQFz9vFx; Wed,  3 Feb 2021 22:40:39 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Mike Rapoport <rppt@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Markus Elfring <Markus.Elfring@web.de>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <5b62379e-a35f-4f56-f1b5-6350f76007e7@web.de>
References: <5b62379e-a35f-4f56-f1b5-6350f76007e7@web.de>
Subject: Re: [PATCH] powerpc/setup: Adjust six seq_printf() calls in
 show_cpuinfo()
Message-Id: <161235201005.1516112.10488411245763781267.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:39 +1100 (AEDT)
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
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jul 2019 14:56:46 +0200, Markus Elfring wrote:
> A bit of information should be put into a sequence.
> Thus improve the execution speed for this data output by better usage
> of corresponding functions.
> 
> This issue was detected by using the Coccinelle software.

Applied to powerpc/next.

[1/1] powerpc/setup: Adjust six seq_printf() calls in show_cpuinfo()
      https://git.kernel.org/powerpc/c/675b963e2b6007818fe1b0a64b47be40c125246e

cheers
