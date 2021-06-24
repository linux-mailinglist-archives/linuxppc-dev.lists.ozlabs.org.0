Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D43B2997
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 09:43:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9XDl2fx4z3bwt
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 17:43:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=sHE9ossE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=sHE9ossE; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9XDK29srz2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 17:42:56 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G9XDG02mrz9sVm;
 Thu, 24 Jun 2021 17:42:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624520574;
 bh=S1Cri0CEl9/i+BGSepfeIcNSlu74micR6LxhlLlCkIs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=sHE9ossEakf8tudRi4Rf4pwgV+b1HCjsF4tgWfKBNSAK+u7DLD1u4WwEYbtzfwgKg
 YG1ByszBDzY35PNZ6NEzVllJPNFx0aMD9vMfUlYnSgK1y7DEDrvOfIbpw2NvqmJHGj
 XDdCsyTzWCQf0C553MDZh6dFFRkTFZy6TO6AmHFRqVtWiJhmLQEmNFNDHz7rW9C3u0
 fqIsjGfp9fjm8J48r/ybl4Fv5OLwCHKH7dRmvrN9oIsffZCXJ/VGadwUx+bIzrtBQ8
 itBNIz0ub6bT0c1hLTcP6HCaKJgg85F6sTbDi9Vo6vULxToMSjzkl0YqFMSifTgllG
 8+GAFB9K44mEg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the powerpc tree
In-Reply-To: <20210622074622.4e483a33@canb.auug.org.au>
References: <20210622074622.4e483a33@canb.auug.org.au>
Date: Thu, 24 Jun 2021 17:42:50 +1000
Message-ID: <878s2z1zet.fsf@mpe.ellerman.id.au>
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Commit
>
>   77bbbc0cf848 ("KVM: PPC: Book3S HV: Fix TLB management on SMT8 POWER9 and POWER10 processors")
>
> is missing a Signed-off-by from its author.

That was actually deliberate.

Suraj wrote the patch when he was at IBM, but never sent it.

Paul & Nick then resurrected it from some internal tree, and are now
submitting it on behalf of IBM.

So they are asserting option b) of the DCO AIUI:

  (b) The contribution is based upon previous work that, to the best
      of my knowledge, is covered under an appropriate open source
      license and I have the right under that license to submit that
      work with modifications, whether created in whole or in part
      by me, under the same open source license (unless I am
      permitted to submit under a different license), as indicated
      in the file


cheers
