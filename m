Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245757FEF2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 14:25:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrzlB2Z6Fz3cdH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 22:25:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z1DvviqP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lrzkb53l2z2xD4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 22:24:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Z1DvviqP;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lrzkb3ML7z4x1N;
	Mon, 25 Jul 2022 22:24:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658751879;
	bh=y+UzVL8kGSqCUz9xn5lz5WfJemKYihBdD0xz8EVTC0o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Z1DvviqPDZM3kXdh6qx5DKZLAJwkCLKRe6kMJcBt6Dgy3QOS3nKZEToJrFofWf6Be
	 Dsz2gLQz+XA2Shv1fQQoZCrpOK7vFZugs4ixemxh0eaKul3nKFHz5/8KsepR/Ne78d
	 /Ff1pNZTj3LH6VVMa0kGIGGnpxPP9ybGDfc3r/uSXqlflQIhav7gL6q70jUOI3/SsN
	 Q+q1lNadpqFZ0f6UixOZh2vc53xVdJl8gOPVmHv4K/TwRhqVAzztUBNqLX3uSxejZD
	 0theMhbpkPIjw+f0bvlYVQctYSQa7uFW6B0NKBeMgM4Cc9DlH/6CWhgm7ZCDDO8Du5
	 rfznUEDWqDjMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>, Pali =?utf-8?Q?Roh=C3=A1r?=
 <pali@kernel.org>
Subject: Re: [PATCH] powerpc/fsl-pci: Fix Class Code of PCIe Root Port
In-Reply-To: <20220722194226.GA1927257@bhelgaas>
References: <20220722194226.GA1927257@bhelgaas>
Date: Mon, 25 Jul 2022 22:24:39 +1000
Message-ID: <87r129bcs8.fsf@mpe.ellerman.id.au>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Wed, Jul 06, 2022 at 12:10:43PM +0200, Pali Roh=C3=A1r wrote:
>> By default old pre-3.0 Freescale PCIe controllers reports invalid PCI Cl=
ass
>> Code 0x0b20 for PCIe Root Port. It can be seen by lspci -b output on P20=
20
>> board which has this pre-3.0 controller:
>>=20
>>   $ lspci -bvnn
>>   00:00.0 Power PC [0b20]: Freescale Semiconductor Inc P2020E [1957:0070=
] (rev 21)
>>           !!! Invalid class 0b20 for header type 01
>>           Capabilities: [4c] Express Root Port (Slot-), MSI 00
>>=20
>> Fix this issue by programming correct PCI Class Code 0x0604 for PCIe Root
>> Port to the Freescale specific PCIe register 0x474.
>>=20
>> With this change lspci -b output is:
>>=20
>>   $ lspci -bvnn
>>   00:00.0 PCI bridge [0604]: Freescale Semiconductor Inc P2020E [1957:00=
70] (rev 21) (prog-if 00 [Normal decode])
>>           Capabilities: [4c] Express Root Port (Slot-), MSI 00
>>=20
>> Without any "Invalid class" error. So class code was properly reflected
>> into standard (read-only) PCI register 0x08.
>>=20
>> Same fix is already implemented in U-Boot pcie_fsl.c driver in commit:
>> http://source.denx.de/u-boot/u-boot/-/commit/d18d06ac35229345a0af80977a4=
08cfbe1d1015b
>>=20
>> Fix activated by U-Boot stay active also after booting Linux kernel.
>> But boards which use older U-Boot version without that fix are affected =
and
>> still require this fix.
>>=20
>> So implement this class code fix also in kernel fsl_pci.c driver.
>>=20
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
>
> I assume the powerpc folks will take care of this.

Will do.

cheers
