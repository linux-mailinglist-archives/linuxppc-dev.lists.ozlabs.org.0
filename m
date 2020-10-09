Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A81502881F8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 08:09:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6yMP09Z8zDqbp
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Oct 2020 17:09:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6yFC2KJ3zDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Oct 2020 17:03:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4C6yFB6zx9z9sTc; Fri,  9 Oct 2020 17:03:58 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <94dc68d3d9ef9eb549796d4b938b6ba0305a049b.1601556145.git.christophe.leroy@csgroup.eu>
References: <94dc68d3d9ef9eb549796d4b938b6ba0305a049b.1601556145.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/6] powerpc/time: Rename mftbl() to mftb()
Message-Id: <160222339491.867048.15263486614184650478.b4-ty@ellerman.id.au>
Date: Fri,  9 Oct 2020 17:03:58 +1100 (AEDT)
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

On Thu, 1 Oct 2020 12:42:39 +0000 (UTC), Christophe Leroy wrote:
> On PPC64, we have mftb().
> On PPC32, we have mftbl() and an #define mftb() mftbl().
> 
> mftb() and mftbl() are equivalent, their purpose is to read the
> content of SPRN_TRBL, as returned by 'mftb' simplified instruction.
> 
> binutils seems to define 'mftbl' instruction as an equivalent
> of 'mftb'.
> 
> [...]

Applied to powerpc/next.

[1/6] powerpc/time: Rename mftbl() to mftb()
      https://git.kernel.org/powerpc/c/15c102153e722cc6e0729764a7068c209a7469cd
[2/6] powerpc/time: Make mftb() common to PPC32 and PPC64
      https://git.kernel.org/powerpc/c/ff125fbcd45d1706861579dbe66e31f5b3f1e779
[3/6] powerpc/time: Avoid using get_tbl() and get_tbu() internally
      https://git.kernel.org/powerpc/c/942e89115b588b4b5df86930b5302a5c07b820ba
[4/6] powerpc/time: Remove get_tbu()
      https://git.kernel.org/powerpc/c/e8d5bf30eafc37e31ce68bc7ccf1db970fe3cd04
[5/6] powerpc/time: Make get_tbl() common to PPC32 and PPC64
      https://git.kernel.org/powerpc/c/1156a6285cd38e5a6987ddee3758e7954c56cb3d
[6/6] powerpc/time: Make get_tb() common to PPC32 and PPC64
      https://git.kernel.org/powerpc/c/9686e431c683ee7b8aca0f3985c244aee3d9f30d

cheers
