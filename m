Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5F82C3FBF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:18:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0KV2WxgzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:18:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzsj5YYYzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:57:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsf37flz9sVD; Wed, 25 Nov 2020 22:57:41 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 jakub@redhat.com, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, segher@kernel.crashing.org
In-Reply-To: <348c2d3f19ffcff8abe50d52513f989c4581d000.1603375524.git.christophe.leroy@csgroup.eu>
References: <348c2d3f19ffcff8abe50d52513f989c4581d000.1603375524.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/bitops: Fix possible undefined behaviour with
 fls() and fls64()
Message-Id: <160630540248.2174375.3049361746995827520.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:41 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 22 Oct 2020 14:05:46 +0000 (UTC), Christophe Leroy wrote:
> fls() and fls64() are using __builtin_ctz() and _builtin_ctzll().
> On powerpc, those builtins trivially use ctlzw and ctlzd power
> instructions.
> 
> Allthough those instructions provide the expected result with
> input argument 0, __builtin_ctz() and __builtin_ctzll() are
> documented as undefined for value 0.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/bitops: Fix possible undefined behaviour with fls() and fls64()
      https://git.kernel.org/powerpc/c/1891ef21d92c4801ea082ee8ed478e304ddc6749

cheers
