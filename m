Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA722D5A8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 13:32:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsCwF2tz3zDqx1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 23:31:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXT2B8NzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXT0LmQz9sWx; Thu, 10 Dec 2020 22:29:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <829ae1aed1d2fc6b5fc5818362e573dee5d6ecde.1602489852.git.christophe.leroy@csgroup.eu>
References: <829ae1aed1d2fc6b5fc5818362e573dee5d6ecde.1602489852.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: Desintegrate MMU_FTR_PPCAS_ARCH_V2
Message-Id: <160756607081.1313423.15871737991465948250.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:44 +1100 (AEDT)
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

On Mon, 12 Oct 2020 08:04:24 +0000 (UTC), Christophe Leroy wrote:
> MMU_FTR_PPCAS_ARCH_V2 is defined in cpu_table.h
> as MMU_FTR_TLBIEL | MMU_FTR_16M_PAGE.
> 
> MMU_FTR_TLBIEL and MMU_FTR_16M_PAGE are defined in mmu.h
> 
> MMU_FTR_PPCAS_ARCH_V2 is used only in mmu.h and it is used only once.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mm: Desintegrate MMU_FTR_PPCAS_ARCH_V2
      https://git.kernel.org/powerpc/c/0e8ff4f8d2faa2e3381e774c9e2fb975e8b4598f

cheers
