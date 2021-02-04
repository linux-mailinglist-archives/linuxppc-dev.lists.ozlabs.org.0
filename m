Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F330F121
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 11:46:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWZwy5q7gzDwwY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 21:46:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWZtx4R23zDwpC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 21:44:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=aeithg5X; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DWZtr4RvTz9sXV;
 Thu,  4 Feb 2021 21:44:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612435496;
 bh=7gUDiKUJsUlnyL1hzNVaMIZFOrtzUH+RnQewMgPBJXA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=aeithg5XbYtGR3+3M0J2fWWh+BH4YzO0m/tpovXY4JTNI34gGy0ZFPKzi6lAxzbdt
 p4lAuxnwJYSnrDXZnLVdsh8F0iA2jhQ4lDRw7p1Ocl/U6Q0wMnDs23z3/QrU4Q+lno
 vB6Wm/ETnQGaQPRkmOAk+Cg4eN2q25qRCTLtm9IPEiw22Jg7kttOdCnyq2xIB3d3Mu
 W6uJuZIKbssUj6v53+5imSR9JR3l28/X1jC6TANDAQeGIAHjg+1q4qg9hrQPw8eQ5U
 eF+le40oSyflT3D2CclEO5XCqDqyoXIurBtwcjRAc2Wf+Tc0nSes3mnm+UAEcPnkf7
 5fFb3xrUGnKIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Yu <jeyu@kernel.org>, Josh
 Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav
 Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>
Subject: Re: [PATCH 01/13] powerpc/powernv: remove get_cxl_module
In-Reply-To: <20210202121334.1361503-2-hch@lst.de>
References: <20210202121334.1361503-1-hch@lst.de>
 <20210202121334.1361503-2-hch@lst.de>
Date: Thu, 04 Feb 2021 21:44:51 +1100
Message-ID: <87h7msp0ws.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, live-patching@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:
> The static inline get_cxl_module function is entirely unused since commit
> 8bf6b91a5125a ("Revert "powerpc/powernv: Add support for the cxl kernel
> api on the real phb"), so remove it.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/pci-cxl.c | 22 ----------------------
>  1 file changed, 22 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
