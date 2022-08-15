Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D914C59292C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 07:47:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5jwJ4zpgz2xjh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 15:47:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jWYtvhUQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5jvg0kGYz2xG8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 15:46:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=jWYtvhUQ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M5jvX75Z8z4x1P;
	Mon, 15 Aug 2022 15:46:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1660542394;
	bh=xjW48oFcQsQOFiXcpzHjYMTpjM5xsTjxRkql1X/sLgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jWYtvhUQmFzSNRL7ewx8eqvEqHMcNQS9vuHCyMShPf+PHFld92WTfRl70GYP/osJr
	 LmmWKxbNvu0E4EOo1FEEPskOMfi/91v/5jY+lv1saYTbd+zxfxotBH8pC2hJsnxxkU
	 lkcJjMvQWObnyN5AY+Uc0Q8w12+8L37mukutKU3/TyvEsxa7Bd6Yv0WXNu/Cguesif
	 B3hZpH1XcqUwBv9ueolyZW9P4q058V6oT1yJ7w5rPeB6DuPyimppneWoiwHfivEnc4
	 blfWCcZbixMNDYh+iF8hkG/CtQfPX2b4DLg9DPyMNCqXQU2tIhCpGv9vB7ABZLgPWl
	 QgZdmr9Kj2NoQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Pali =?utf-8?Q?Roh=C3=A1r?=
 <pali@kernel.org>
Subject: Re: [PATCH v2 2/2] powerpc/pci: Prefer PCI domain assignment via DT
 'linux,pci-domain' and alias
In-Reply-To: <20220813135735.GA3413265@roeck-us.net>
References: <20220706102148.5060-1-pali@kernel.org>
 <20220706102148.5060-2-pali@kernel.org>
 <20220813135735.GA3413265@roeck-us.net>
Date: Mon, 15 Aug 2022 15:46:31 +1000
Message-ID: <874jyevz2g.fsf@mpe.ellerman.id.au>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Guowen Shan <gshan@redhat.com>, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On Wed, Jul 06, 2022 at 12:21:48PM +0200, Pali Roh=C3=A1r wrote:
>> Other Linux architectures use DT property 'linux,pci-domain' for specify=
ing
>> fixed PCI domain of PCI controller specified in Device-Tree.
>>=20
>> And lot of Freescale powerpc boards have defined numbered pci alias in
>> Device-Tree for every PCIe controller which number specify preferred PCI
>> domain.
>>=20
>> So prefer usage of DT property 'linux,pci-domain' (via function
>> of_get_pci_domain_nr()) and DT pci alias (via function of_alias_get_id())
>> on powerpc architecture for assigning PCI domain to PCI controller.
>>=20
>> Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on devi=
ce-tree properties")
>> Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
>
> This patch results in a number of boot warnings with various qemu
> boot tests.

Thanks for the report.

I have automated qemu boot tests to catch things like this, they even
have DEBUG_ATOMIC_SLEEP enabled ... but I inadvertantly broke my script
that checks for "BUG:" in the console log. Sometimes you just can't
win.

cheers
