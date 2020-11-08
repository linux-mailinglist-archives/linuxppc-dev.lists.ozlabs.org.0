Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C90AD2AAA95
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 11:34:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CTVq26VxWzDrBm
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Nov 2020 21:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CTVjv1lpJzDqdT
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Nov 2020 21:29:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CTVjr60s3z9sTL; Sun,  8 Nov 2020 21:29:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, schwab@linux-m68k.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, erhard_f@mailbox.org,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <9e225a856a8b22e0e77587ee22ab7a2f5bca8753.1604740029.git.christophe.leroy@csgroup.eu>
References: <9e225a856a8b22e0e77587ee22ab7a2f5bca8753.1604740029.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Use relocation offset when setting early
 hash table
Message-Id: <160483134461.1400561.5111956119334566016.b4-ty@ellerman.id.au>
Date: Sun,  8 Nov 2020 21:29:36 +1100 (AEDT)
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

On Sat, 7 Nov 2020 09:07:40 +0000 (UTC), Christophe Leroy wrote:
> When calling early_hash_table(), the kernel hasn't been yet
> relocated to its linking address, so data must be addressed
> with relocation offset.
> 
> Add relocation offset to write into Hash in early_hash_table().

Applied to powerpc/fixes.

[1/1] powerpc/32s: Use relocation offset when setting early hash table
      https://git.kernel.org/powerpc/c/01776f070ffcbf336be3bf1672bd3c589548d6c4

cheers
