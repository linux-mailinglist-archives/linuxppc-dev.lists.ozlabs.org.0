Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C32486A3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 16:03:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWCL26Q9SzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 00:03:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWCDV4wfTzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 23:58:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BWCDV0lgsz9sTR; Tue, 18 Aug 2020 23:58:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <07884ed033c31e074747b7eb8eaa329d15db07ec.1596641219.git.christophe.leroy@csgroup.eu>
References: <07884ed033c31e074747b7eb8eaa329d15db07ec.1596641219.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix is_module_segment() when MODULES_VADDR
 is defined
Message-Id: <159775907962.1766076.11931243751061238558.b4-ty@ellerman.id.au>
Date: Tue, 18 Aug 2020 23:58:17 +1000 (AEST)
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

On Wed, 5 Aug 2020 15:27:28 +0000 (UTC), Christophe Leroy wrote:
> When MODULES_VADDR is defined, is_module_segment() shall check the
> address against it instead of checking agains VMALLOC_START.

Applied to powerpc/fixes.

[1/1] powerpc/32s: Fix is_module_segment() when MODULES_VADDR is defined
      https://git.kernel.org/powerpc/c/7bee31ad8e2f6c276f36993346ac70f4d4c80e45

cheers
