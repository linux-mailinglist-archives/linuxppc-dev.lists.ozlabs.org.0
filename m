Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2A30D945
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 12:56:58 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW0XS0Q3bzF00S
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 22:56:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0944vQTzDwvS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:08 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09312NWz9tlc; Wed,  3 Feb 2021 22:40:06 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <2fed79b1154c872194f98bac4422c23918325e61.1611128938.git.christophe.leroy@csgroup.eu>
References: <2fed79b1154c872194f98bac4422c23918325e61.1611128938.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/2] powerpc/47x: Disable 256k page size
Message-Id: <161235200635.1516112.16234407332530214324.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:06 +1100 (AEDT)
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

On Wed, 20 Jan 2021 07:49:13 +0000 (UTC), Christophe Leroy wrote:
> PPC47x_TLBE_SIZE isn't defined for 256k pages, so
> this size of page shall not be selected for 47x.

Applied to powerpc/next.

[1/2] powerpc/47x: Disable 256k page size
      https://git.kernel.org/powerpc/c/910a0cb6d259736a0c86e795d4c2f42af8d0d775
[2/2] powerpc/44x: Remove STDBINUTILS kconfig option
      https://git.kernel.org/powerpc/c/4eeef098b43242ed145c83fba9989d586d707589

cheers
