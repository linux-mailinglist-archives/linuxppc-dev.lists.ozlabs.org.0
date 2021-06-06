Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D37E39CED2
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:14:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb5x5py2z3dCJ
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:14:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3F1dfTz307X
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:09 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3D30H9z9sXL; Sun,  6 Jun 2021 22:12:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <62743846cbd493e5d9a02e197c2672a1d30df149.1620366342.git.christophe.leroy@csgroup.eu>
References: <62743846cbd493e5d9a02e197c2672a1d30df149.1620366342.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/mmu: Don't duplicate radix_enabled()
Message-Id: <162298131640.2353459.1671497661726891156.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:36 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Fri, 7 May 2021 05:45:52 +0000 (UTC), Christophe Leroy wrote:
> mmu_has_feature(MMU_FTR_TYPE_RADIX) can be evaluated regardless of
> CONFIG_PPC_RADIX_MMU.
> 
> When CONFIG_PPC_RADIX_MMU is not set, mmu_has_feature(MMU_FTR_TYPE_RADIX)
> will evaluate to 'false' at build time because MMU_FTR_TYPE_RADIX
> wont be included in MMU_FTRS_POSSIBLE.

Applied to powerpc/next.

[1/1] powerpc/mmu: Don't duplicate radix_enabled()
      https://git.kernel.org/powerpc/c/fe3dc333d2ed50c9764d281869d87bae0d795ce5

cheers
