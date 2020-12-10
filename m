Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC7D2D5AAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 13:40:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsD5q0m6xzDqF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 23:40:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXX05kFzDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXW44Hqz9sWr; Thu, 10 Dec 2020 22:29:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <d01d7613664fafa43de1f1ae89924075bc24241c.1602489931.git.christophe.leroy@csgroup.eu>
References: <d01d7613664fafa43de1f1ae89924075bc24241c.1602489931.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mm: MMU_FTR_NEED_DTLB_SW_LRU is only possible
 with CONFIG_PPC_83xx
Message-Id: <160756607062.1313423.10978525634640096668.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:47 +1100 (AEDT)
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

On Mon, 12 Oct 2020 08:05:49 +0000 (UTC), Christophe Leroy wrote:
> Only mpc83xx will set MMU_FTR_NEED_DTLB_SW_LRU and its
> definition is enclosed in #ifdef CONFIG_PPC_83xx.
> 
> Make MMU_FTR_NEED_DTLB_SW_LRU possible only when
> CONFIG_PPC_83xx is set.

Applied to powerpc/next.

[1/1] powerpc/mm: MMU_FTR_NEED_DTLB_SW_LRU is only possible with CONFIG_PPC_83xx
      https://git.kernel.org/powerpc/c/b68e3a3dff97bdc1cba79dc5f80cede8a2419cac

cheers
