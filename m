Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D49A108C65
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 11:59:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47M3vc0K4jzDqCF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 21:59:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47M3d068sMzDqY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 21:47:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 47M3d05Phdz9sR3; Mon, 25 Nov 2019 21:47:00 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 44448640dd0df98891c5ea4695d89a4972cb4c1f
In-Reply-To: <dd82934ad91aab607d0eb7e626c14e6ac0d654eb.1567068137.git.christophe.leroy@c-s.fr>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, segher@kernel.crashing.org,
 npiggin@gmail.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v3 1/2] powerpc: permanently include 8xx registers in reg.h
Message-Id: <47M3d05Phdz9sR3@ozlabs.org>
Date: Mon, 25 Nov 2019 21:47:00 +1100 (AEDT)
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

On Thu, 2019-08-29 at 08:45:12 UTC, Christophe Leroy wrote:
> Most 8xx registers have specific names, so just include
> reg_8xx.h all the time in reg.h in order to have them defined
> even when CONFIG_PPC_8xx is not selected. This will avoid
> the need for #ifdefs in C code.
> 
> Guard SPRN_ICTRL in an #ifdef CONFIG_PPC_8xx as this register
> has same name but different meaning and different spr number as
> another register in the mpc7450.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/44448640dd0df98891c5ea4695d89a4972cb4c1f

cheers
