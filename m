Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 390C233B495
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:31:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzclJ1sYsz30KQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 00:31:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dzcl00NBlz30C5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:31:23 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Dzckr4XwZz9sWQ; Tue, 16 Mar 2021 00:31:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b231dfa040ce4cc37f702f5c3a595fdeabfe0462.1615378209.git.christophe.leroy@csgroup.eu>
References: <b231dfa040ce4cc37f702f5c3a595fdeabfe0462.1615378209.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Force inlining of cpu_has_feature() to avoid
 build failure
Message-Id: <161581505531.387233.15261946391055557763.b4-ty@ellerman.id.au>
Date: Tue, 16 Mar 2021 00:31:16 +1100 (AEDT)
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

On Wed, 10 Mar 2021 12:10:34 +0000 (UTC), Christophe Leroy wrote:
> The code relies on constant folding of cpu_has_feature() based
> on possible and always true values as defined per
> CPU_FTRS_ALWAYS and CPU_FTRS_POSSIBLE.
> 
> Build failure is encountered with for instance
> book3e_all_defconfig on kisskb in the AMDGPU driver which uses
> cpu_has_feature(CPU_FTR_VSX_COMP) to decide whether calling
> kernel_enable_vsx() or not.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Force inlining of cpu_has_feature() to avoid build failure
      https://git.kernel.org/powerpc/c/eed5fae00593ab9d261a0c1ffc1bdb786a87a55a

cheers
