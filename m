Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571D2D5E1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 15:41:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsGnT0959zDr22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 01:41:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBYC0ck3zDqvh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBYB2C9zz9sfR; Thu, 10 Dec 2020 22:30:21 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Oleg Nesterov <oleg@redhat.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <20201119160154.GA5183@redhat.com>
References: <20201119160154.GA5183@redhat.com>
Subject: Re: [PATCH v3 0/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in
 gpr_get() too
Message-Id: <160756604623.1313423.4426620918837892938.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:21 +1100 (AEDT)
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Jan Kratochvil <jan.kratochvil@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 19 Nov 2020 17:01:54 +0100, Oleg Nesterov wrote:
> Can we finally fix this problem? ;)
> 
> My previous attempt was ignored, see
> 
> 	https://lore.kernel.org/lkml/20190917121256.GA8659@redhat.com/
> 
> Now that gpr_get() was changed to use membuf API we can make a simpler fix.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/ptrace: Simplify gpr_get()/tm_cgpr_get()
      https://git.kernel.org/powerpc/c/640586f8af356096e084d69a9909d217852bde48
[2/2] powerpc/ptrace: Hard wire PT_SOFTE value to 1 in gpr_get() too
      https://git.kernel.org/powerpc/c/324a69467f12652b21b17f9644faa967d3d8bbdf

cheers
