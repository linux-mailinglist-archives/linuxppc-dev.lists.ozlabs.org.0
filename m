Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267FA5AFF52
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 10:40:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMwg55nrYz3c96
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 18:40:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l8YXm+fh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMwfV5MSjz2yS0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 18:39:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=l8YXm+fh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MMwfP3sR6z4x1d;
	Wed,  7 Sep 2022 18:39:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662539966;
	bh=LMFv2xGBamlZNgdv82LnID2YJO0solc/CaQWjo6B/ik=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l8YXm+fhEcXxAR7xSOQ7WDnZo9SvZoackLkm8QdgjfiQZ/quhef6Q5trfceRSeqGm
	 q8cna6u93u2gigVMhvWh4vLHdD2Ww3huEHwYpVXraw6UU/gMUnnM10r0DZqNJ3ROmk
	 79f2D7tDyFe4Ur1wNBodcE5ZDcaSFNtN9A/3ByT0GCdsDRRn38XLOqQ047OT+G9a9F
	 kuSET98nMrmPPWMGuC/mKnIb7yJCJhWCUqYyh1+RKKl5mpbUagKEW3izQuvjKASvHw
	 LErhOz/e/TfolFNe1nbPiK9rF5fJdt65KUT7uK8NMvchlORTgp9qyFXpifblAlCw45
	 /fVZT4J/Qt8Mw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: define driver for Platform
 KeyStore
In-Reply-To: <YxfYnLw6R30pvZ8l@dev-arch.thelio-3990X>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
 <20220723113048.521744-2-nayna@linux.ibm.com>
 <Yxe06fbq18Wv9y3W@dev-arch.thelio-3990X>
 <875yi0t7e1.fsf@mpe.ellerman.id.au>
 <YxfYnLw6R30pvZ8l@dev-arch.thelio-3990X>
Date: Wed, 07 Sep 2022 18:39:17 +1000
Message-ID: <871qsnfuiy.fsf@mpe.ellerman.id.au>
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
Cc: bjking1@us.ibm.com, gjoyce@linux.vnet.ibm.com, erichte@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>, npiggin@gmail.com, muriloo@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> On Wed, Sep 07, 2022 at 09:23:02AM +1000, Michael Ellerman wrote:
>> Nathan Chancellor <nathan@kernel.org> writes:
>> > On Sat, Jul 23, 2022 at 07:30:46AM -0400, Nayna Jain wrote:
>> >> PowerVM provides an isolated Platform Keystore(PKS) storage allocation
>> >> for each LPAR with individually managed access controls to store
>> >> sensitive information securely. It provides a new set of hypervisor
>> >> calls for Linux kernel to access PKS storage.
>> >> 
>> >> Define POWER LPAR Platform KeyStore(PLPKS) driver using H_CALL interface
>> >> to access PKS storage.
>> >> 
>> >> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>> >
>> > This commit is now in mainline as commit 2454a7af0f2a ("powerpc/pseries:
>> > define driver for Platform KeyStore") and I just bisected a crash while
>> > boot testing Fedora's configuration [1] in QEMU to it. I initially
>> > noticed this in ClangBuiltLinux's CI but this doesn't appear to be clang
>> > specific since I can reproduce with GCC 12.2.1 from Fedora. I can
>> > reproduce with just powernv_defconfig + CONFIG_PPC_PSERIES=y +
>> > CONFIG_PSERIES_PLPKS=y. Our firmware and rootfs are available in our
>> > boot-utils repository [2].
>> 
>> Thanks, classic bug I should have spotted.
>> 
>> I didn't catch it in my testing because PLPKS isn't enabled in
>> our defconfigs.
>> 
>> Does your CI enable new options by default? Or are you booting
>> allyesconfig?
>
> Neither actually. We just test a bunch of in-tree and distribution
> configurations. The distribution configurations are fetched straight
> from their URLs on gitweb so we get any updates that they do, which is
> how we noticed this (CONFIG_PSERIES_PLPKS was recently enabled in
> Fedora):
>
> https://src.fedoraproject.org/rpms/kernel/c/a73f6858a2cbd16bbcc6d305d6c43aab6f59d0b1

Aha, neat trick.

>> I'll send a fix.
>
> Thanks for the quick response!

Thanks for the bug report :)

cheers
