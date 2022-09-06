Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CC5AF85B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 01:23:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMhK83Q6sz3c5w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 09:23:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XIIHwlE4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMhJY4V1Jz2xHk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 09:23:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XIIHwlE4;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MMhJR5wbDz4xD3;
	Wed,  7 Sep 2022 09:23:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1662506584;
	bh=6eHoHAa3uPpYz4x29ZLdXdGax4L/7T8bxljMPdi9qkw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XIIHwlE4gu+zX6hV3+I8C7cQtY+GLonLhNq1Qq8P9EojgGhJoxa7zuzFQwoivXUes
	 X7kLwVh10FMgFbQExH8k8nDfGm7C6lqJZfQkdIslkx3hQdFCk/retj+DTAErBqynJC
	 md1S84sckO5vXcO4ujc+Nm2qepMBvKqsfvk9c9lGQ/GjcBwaXQzGFM3h9yy6B609r3
	 8u683z4lylmWJk3eSVJCHk8FmbtgecFA6cNN5jH+EOJmdWl8i+XrznvzDSr8x+mOh0
	 05mnq/g9VUk/1sdr4K9fhdUSgFtvMPuVV32v3ASJgVYDUPIxD+FkmspiW+ch75J/sM
	 gx6rXTDmlbUVg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: define driver for Platform
 KeyStore
In-Reply-To: <Yxe06fbq18Wv9y3W@dev-arch.thelio-3990X>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
 <20220723113048.521744-2-nayna@linux.ibm.com>
 <Yxe06fbq18Wv9y3W@dev-arch.thelio-3990X>
Date: Wed, 07 Sep 2022 09:23:02 +1000
Message-ID: <875yi0t7e1.fsf@mpe.ellerman.id.au>
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
Cc: bjking1@us.ibm.com, gjoyce@linux.vnet.ibm.com, erichte@linux.ibm.com, npiggin@gmail.com, muriloo@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> Hi all,
>
> On Sat, Jul 23, 2022 at 07:30:46AM -0400, Nayna Jain wrote:
>> PowerVM provides an isolated Platform Keystore(PKS) storage allocation
>> for each LPAR with individually managed access controls to store
>> sensitive information securely. It provides a new set of hypervisor
>> calls for Linux kernel to access PKS storage.
>> 
>> Define POWER LPAR Platform KeyStore(PLPKS) driver using H_CALL interface
>> to access PKS storage.
>> 
>> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
>
> This commit is now in mainline as commit 2454a7af0f2a ("powerpc/pseries:
> define driver for Platform KeyStore") and I just bisected a crash while
> boot testing Fedora's configuration [1] in QEMU to it. I initially
> noticed this in ClangBuiltLinux's CI but this doesn't appear to be clang
> specific since I can reproduce with GCC 12.2.1 from Fedora. I can
> reproduce with just powernv_defconfig + CONFIG_PPC_PSERIES=y +
> CONFIG_PSERIES_PLPKS=y. Our firmware and rootfs are available in our
> boot-utils repository [2].

Thanks, classic bug I should have spotted.

I didn't catch it in my testing because PLPKS isn't enabled in
our defconfigs.

Does your CI enable new options by default? Or are you booting
allyesconfig?

I'll send a fix.

cheers
