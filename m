Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FE12D4F61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 01:25:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrvpV65CgzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 11:25:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrvmG1h3PzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 11:23:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CrvmF6kJfz9sWL; Thu, 10 Dec 2020 11:23:57 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: akpm@linux-foundation.org, hch@lst.de,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, viro@zeniv.linux.org.uk,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <18bcb456d32a3e74f5ae241fd6f1580c092d07f5.1607360230.git.christophe.leroy@csgroup.eu>
References: <18bcb456d32a3e74f5ae241fd6f1580c092d07f5.1607360230.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/mm: Fix KUAP warning by providing
 copy_from_kernel_nofault_allowed()
Message-Id: <160755982586.1285738.12667869391229651303.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 11:23:57 +1100 (AEDT)
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 7 Dec 2020 16:58:01 +0000 (UTC), Christophe Leroy wrote:
> Since commit c33165253492 ("powerpc: use non-set_fs based maccess
> routines"), userspace access is not granted anymore when using
> copy_from_kernel_nofault()
> 
> However, kthread_probe_data() uses copy_from_kernel_nofault()
> to check validity of pointers. When the pointer is NULL,
> it points to userspace, leading to a KUAP fault and triggering
> the following big hammer warning many times when you request
> a sysrq "show task":
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/mm: Fix KUAP warning by providing copy_from_kernel_nofault_allowed()
      https://git.kernel.org/powerpc/c/5eedf9fe8db23313df104576845cec5f481b9b60

cheers
