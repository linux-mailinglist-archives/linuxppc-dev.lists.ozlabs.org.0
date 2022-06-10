Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9FD545D9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 09:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKCQD0jfpz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:34:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XZpuxytf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKCPZ6TpTz305H
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 17:33:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XZpuxytf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LKCPY2k9Hz4xZ7;
	Fri, 10 Jun 2022 17:33:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1654846417;
	bh=ZwuNMyeEn4/k09HgbzyRNNQPwPmbjayEkiANCys25H0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=XZpuxytflZ9rOzutXEJeY1hrf7cGPBRASffqsC+RY8GkqWOE1YRr35BrNOudZcwVC
	 6KS++Uxq/eQjykz/AsvPc3QJ//mam7lfobCTOprGE9zrIObqcBhV6c5KjubpNOF3Px
	 g3QMdsMfxMZf+eO2TZbRAvOmsDN0SWhYtFdkI516JFPgRbHs52z2zCL1Otpk7amP/e
	 hf8aZh7abJTWfCb8yeA8YWPGyAqeA6KxfNlQ2hLmkNxdIWTcQSVDCQShlJ4D4IfIPS
	 mHg1NzqfoDGSAQklujgnHHK84B5snoRpangujWi0B8OqyWqNx/SBAJogXWiS+ZpaT6
	 0NuEzFmRt6Ubw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Pali =?utf-8?Q?Roh=C3=A1r?= <pali@kernel.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Bjorn
 Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for
 PCI domain
In-Reply-To: <20220504175718.29011-1-pali@kernel.org>
References: <20220504175718.29011-1-pali@kernel.org>
Date: Fri, 10 Jun 2022 17:33:32 +1000
Message-ID: <87edzxc6r7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pali Roh=C3=A1r <pali@kernel.org> writes:
> Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on
> device-tree properties"), powerpc kernel always fallback to PCI domain
> assignment from OF / Device Tree 'reg' property of the PCI controller.
>
> PCI code for other Linux architectures use increasing assignment of the P=
CI
> domain for individual controllers (assign the first free number), like it
> was also for powerpc prior mentioned commit.
>
> Upgrading powerpc kernels from LTS 4.4 version (which does not contain
> mentioned commit) to new LTS versions brings a regression in domain
> assignment.

I'm sorry this broke your system. But I don't really consider it a
regression, the kernel provides no guarantee about the PCI domain
numbering across LTS releases.

Prior to the change the numbering was just based on the order the PHBs
were discovered in the device tree, which is not robust. A cosmetic
refactor of the device tree source could cause PHBs to be discovered in
a different order.

Similarly a change in firmware PCI discovery or device tree generation
could cause the numbering to change.

If you have scripts that are looking for certain devices they can use
the vendor/device fields in sysfs to find the actual devices they want,
not just whatever happens to be at 0000:01:00.0.

> Fix this issue by introducing a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_=
REG
> When this options is disabled then powerpc kernel would assign PCI domains
> in the similar way like it is doing kernel for other architectures and al=
so
> how it was done prior that commit.

I really don't want a config option for that.

There is a device tree property "linux,pci-domain", described in
Documentation/devicetree/bindings/pci/pci.txt.

Can you try adding that to your device tree and updating
get_phb_number() to look for it?

cheers
