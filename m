Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F13712DACFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 13:21:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwHRJ1pVrzDqTL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 23:21:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFlj3F3dzDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 22:05:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CwFlj1hbkz9sSn; Tue, 15 Dec 2020 22:05:05 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201208031539.84878-1-aneesh.kumar@linux.ibm.com>
References: <20201208031539.84878-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/book3s64/kuap: Improve error reporting with KUAP
Message-Id: <160803027300.521010.3922898328310522332.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 22:05:05 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 08:45:39 +0530, Aneesh Kumar K.V wrote:
> This partially reverts commit eb232b162446 ("powerpc/book3s64/kuap: Improve
> error reporting with KUAP") and update the fault handler to print
> 
> [   55.022514] Kernel attempted to access user page (7e6725b70000) - exploit attempt? (uid: 0)
> [   55.022528] BUG: Unable to handle kernel data access on read at 0x7e6725b70000
> [   55.022533] Faulting instruction address: 0xc000000000e8b9bc
> [   55.022540] Oops: Kernel access of bad area, sig: 11 [#1]
> ....
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/book3s64/kuap: Improve error reporting with KUAP
      https://git.kernel.org/powerpc/c/475c8749d9542392d7e0855097d29ed14877ad0a

cheers
