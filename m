Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5643167CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 14:19:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbL1z6THpzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 00:19:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKY40xv3zDrfK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:28 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKY26GsFz9sW3; Wed, 10 Feb 2021 23:57:26 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <ad782af87a222efc79cfb06079b0fd23d4224eaf.1612515180.git.christophe.leroy@csgroup.eu>
References: <ad782af87a222efc79cfb06079b0fd23d4224eaf.1612515180.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/8xx: Fix software emulation interrupt
Message-Id: <161296172333.3178259.7272491290910741468.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:26 +1100 (AEDT)
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

On Fri, 5 Feb 2021 08:56:13 +0000 (UTC), Christophe Leroy wrote:
> For unimplemented instructions or unimplemented SPRs, the 8xx triggers
> a "Software Emulation Exception" (0x1000). That interrupt doesn't set
> reason bits in SRR1 as the "Program Check Exception" does.
> 
> Go through emulation_assist_interrupt() to set REASON_ILLEGAL.

Applied to powerpc/next.

[1/1] powerpc/8xx: Fix software emulation interrupt
      https://git.kernel.org/powerpc/c/903178d0ce6bb30ef80a3604ab9ee2b57869fbc9

cheers
