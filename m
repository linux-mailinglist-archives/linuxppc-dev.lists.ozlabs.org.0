Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3D62C400F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 13:25:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch0V63ch5zDqGT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 23:25:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgzsl6DMmzDqdb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 22:57:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Cgzsh1mWhz9sVH; Wed, 25 Nov 2020 22:57:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <7719261b0a0d2787772339484c33eb809723bca7.1604854583.git.christophe.leroy@csgroup.eu>
References: <7719261b0a0d2787772339484c33eb809723bca7.1604854583.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 1/3] powerpc/64s: Replace RFI by RFI_TO_KERNEL and
 remove RFI
Message-Id: <160630540395.2174375.17643495756840274633.b4-ty@ellerman.id.au>
Date: Wed, 25 Nov 2020 22:57:44 +1100 (AEDT)
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

On Sun, 8 Nov 2020 16:57:35 +0000 (UTC), Christophe Leroy wrote:
> In head_64.S, we have two places using RFI to return to
> kernel. Use RFI_TO_KERNEL instead.
> 
> They are the two only places using RFI on book3s/64, so
> the RFI macro can go away.

Applied to powerpc/next.

[1/3] powerpc/64s: Replace RFI by RFI_TO_KERNEL and remove RFI
      https://git.kernel.org/powerpc/c/879add7720172ffd2986c44587510fabb7af52f5
[2/3] powerpc: Replace RFI by rfi on book3s/32 and booke
      https://git.kernel.org/powerpc/c/120c0518ec321f33cdc4670059fb76e96ceb56eb
[3/3] powerpc: Remove RFI macro
      https://git.kernel.org/powerpc/c/62182e6c0faf75117f8d1719c118bb5fc8574012

cheers
