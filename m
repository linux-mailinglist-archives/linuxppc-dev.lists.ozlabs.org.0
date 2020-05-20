Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1EF1DB0E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:02:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RqbR57bPzDqWR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:02:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RqX90kdyzDqdg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 20:59:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49RqX81vz0z9sT3; Wed, 20 May 2020 20:59:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
References: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
Subject: Re: [PATCH 1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
Message-Id: <158997212813.943180.8258248178215435632.b4-ty@ellerman.id.au>
Date: Wed, 20 May 2020 20:59:52 +1000 (AEST)
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 Apr 2020 18:36:34 +0000 (UTC), Christophe Leroy wrote:
> _ALIGN_UP() is specific to powerpc
> ALIGN() is generic and does the same
> 
> Replace _ALIGN_UP() by ALIGN()

Applied to powerpc/next.

[1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
      https://git.kernel.org/powerpc/c/7bfc3c84cbf5167d943cff9b3d2619dab0b7894c
[2/5] powerpc: Replace _ALIGN_DOWN() by ALIGN_DOWN()
      https://git.kernel.org/powerpc/c/e96d904ede6756641563d27daa746875b478a6c8
[3/5] powerpc: Replace _ALIGN_UP() by ALIGN()
      https://git.kernel.org/powerpc/c/b711531641038f3ff3723914f3d5ba79848d347e
[4/5] powerpc: Replace _ALIGN() by ALIGN()
      https://git.kernel.org/powerpc/c/d3f3d3bf76cfb04e73436a15e3987d3573e7523a
[5/5] powerpc: Remove _ALIGN_UP(), _ALIGN_DOWN() and _ALIGN()
      https://git.kernel.org/powerpc/c/4cdb2da654033d76e1b1cb4ac427d9193dce816b

cheers
