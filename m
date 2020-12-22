Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1363C2E0A88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 14:17:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0cM42hBNzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 00:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0cDG01DSzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 00:11:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4D0cDC566zz9sWX; Wed, 23 Dec 2020 00:11:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <bc77d61d1c18940e456a2dee464f1e2eda65a3f0.1608621048.git.christophe.leroy@csgroup.eu>
References: <bc77d61d1c18940e456a2dee464f1e2eda65a3f0.1608621048.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix RTAS machine check with VMAP stack
Message-Id: <160864266272.1929899.11524659820203744470.b4-ty@ellerman.id.au>
Date: Wed, 23 Dec 2020 00:11:23 +1100 (AEDT)
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

On Tue, 22 Dec 2020 07:11:18 +0000 (UTC), Christophe Leroy wrote:
> When we have VMAP stack, exception prolog 1 sets r1, not r11.

Applied to powerpc/fixes.

[1/1] powerpc/32s: Fix RTAS machine check with VMAP stack
      https://git.kernel.org/powerpc/c/9c7422b92cb27369653c371ad9c44a502e5eea8f

cheers
