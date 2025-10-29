Return-Path: <linuxppc-dev+bounces-13483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1796C185A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 06:48:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxGWY4Lckz3bsC;
	Wed, 29 Oct 2025 16:48:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761716921;
	cv=pass; b=Bs2RWwyRkNBxaxbzBvb22L8zqXUr5hrgdDRLhg9F4NeZa6pep3jTwTg6cdQfLacERH9nPauZyditHU6OIqAS9q6JLkw+1+0Ajk2uKnizxOw35Tt3h1+/qVGH+J+A0/deX7f0QjvUP0ncDP6HvUQljvMXyMJullz8Nt/bO1ufDve9weHi5MDUuSZ/3jIyqSbgCTqwf+eRMfeJo/B8NU5pSOWUiUfmnXdhLC3HR321KD5B5U5iLucizO8z27cqHNG2klXwz/48pfKIXIC2GWHthApOE2DmQXkoBjhA6OJH+wtvGi57jEVOSSWT6yI1mpbVYDllN0clVgDMmeaupZIyfg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761716921; c=relaxed/relaxed;
	bh=nD/A1p+RHILMKnhWKlqaPG26jSHuFQvORVwKQeVq9QM=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=HHTezE6H/iXQSVWz2ZpgMLbFf+1Lj0hSTGQuuGEQLfhaQDCEi1nqZQoyYqpF4BSs0uSOiN2Rsq4idWuqt8BQN43tC9yJmr9CGrQ3qK6fbwq971LA8v8sEEAd5EEpzeBs33kE+MKhjJ9V8jvK1oLrfJ7scJtgvtOGnmDGtUBVveY31LVIrB2vWM9UAJKWUNl/9CJvmCTi90TCW0edsIUHhIqp9YTAyrNqR1bA7YjmTzNum9mcen2DAvuO0FrrdRR/X0DZ6z2dU4cZdlsiUBwXv3l68mFdA0gZjWi/5cfbaYdKNnCRRnQnrtxx79mrrNPltRA8Fav7N/mt2CiBYecqaQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oiQiwl21; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=oiQiwl21;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxGWV4Jp0z2yG3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 16:48:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1761716850; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=LmyknPLfvLXZ7H52EM5uhqfvm1eK6WkbCWoIB/CW8zbmNGbdoS7oanTle64VMH8thK
    zD9iTzsMHVpezGEiB3u/kSIK7UQ9u9yYp1w6TSXv6MTJXX3BqzolaPL9TZ+jzBUXkgNa
    Wew8o9I6RHEsx9vLihi99BS8ohKFD7I2pVP/DYKWtVIdaI88YhO8ti8umbj9+6CjWEn1
    DY1KT/xi5/0ycLtehOFwq2q//sZzj54lojYkP1u2NGUyOJ0Ho0RhGYsDL0HYbpy2blwD
    Y4CiOAugsAJfsXrPHMqfdkS1o+y6yIjDmTE13cb9RTv2VA3TokKLRWKEpX+Gn4TEwXy0
    y3Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1761716850;
    s=strato-dkim-0002; d=strato.com;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=nD/A1p+RHILMKnhWKlqaPG26jSHuFQvORVwKQeVq9QM=;
    b=Q3FsSnYMK9Q2DprNlObuSZwhgle36gcihx0tUQIh5L9BuU4VAQfyPES38nVadP1/hp
    Rj5x5aAZXZvsY85c6SlLBVp95eklDRx2JZMRYEKztB9/jo8zJnMOa/YxcFHQVzIeaMm3
    DhTOv22yO/RzjMjHtDEdyUohJf2ydAWsfJlZkbxP1t5bB/zr3UtGUiG5ywarCFLo+pK/
    n1AvYYD/OwFDJ8ayuWMA35NM0haOdlq4rR0LrAQ81/5dz16aSpRsATaLIgbOY5UIV7Xd
    WHrOf/uMAsxIekSMD4kTdPtoQBnrRk4qFlFbUrPg94tzc7xY2xvoM7UjcYVWPNV0ixJe
    nxVw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1761716850;
    s=strato-dkim-0002; d=xenosoft.de;
    h=To:In-Reply-To:Cc:References:Message-Id:Date:Subject:From:Cc:Date:
    From:Subject:Sender;
    bh=nD/A1p+RHILMKnhWKlqaPG26jSHuFQvORVwKQeVq9QM=;
    b=oiQiwl21GIHVb9ekxrdiMAzqgTpILqkbDIVX0SvRTe00Qh/KKHawOFY3gGT0Nkd6il
    P+5raq2zPaeDkAq7oioSkol1Y6KRkIbShLMjKXX3nlwIGd/FZrYDmsw3Xg7nX0crG96T
    SE7/6VQyUndnvh5lYWe6fcpPmh+bXyBKObqV1tXXYXTtB4hyRdag4sl+YepUdItuBwSL
    WLPUExPRznsT0AMpXocW84NDnjuIloT2kDzuzP5BDKC3xMEA8TTYZyjtmbGMvgizq2Tl
    kcS+H1JBeavYmjHcEIug6JlNMnCa7eOn3bwk5FuSI7k191qkpcg0DAGV4jA72RPgdALQ
    LSrA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6P1rfO5KiO55fErqkryEafkCftK8YxNMWLn7nZHB4Eq/hCSkR9o2/A=="
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id e2886619T5lTHFv
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 29 Oct 2025 06:47:29 +0100 (CET)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Christian Zigotzky <chzigotzky@xenosoft.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Date: Wed, 29 Oct 2025 06:47:19 +0100
Message-Id: <D6280EFB-08D7-41EC-BAC6-FD7793A98A16@xenosoft.de>
References: <20251028233333.GA1467459@bhelgaas>
Cc: Johan Hovold <johan@kernel.org>, linux-pci@vger.kernel.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 Naoki FUKAUMI <naoki@radxa.com>, Herve Codina <herve.codina@bootlin.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Dragan Simic <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Frank Li <Frank.li@nxp.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
 Christian Zigotzky <info@xenosoft.de>
In-Reply-To: <20251028233333.GA1467459@bhelgaas>
To: Bjorn Helgaas <helgaas@kernel.org>
X-Mailer: iPhone Mail (23A355)
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 29 October 2025 at 00:33 am, Bjorn Helgaas <helgaas@kernel.org> wrote:
>=20
> =EF=BB=BFOn Mon, Oct 27, 2025 at 06:12:24PM +0100, Christian Zigotzky wrot=
e:
>> Hi All,
>>=20
>> I activated CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT again for the RC3=
 of
>> kernel 6.18. Unfortunately my AMD Radeon HD6870 doesn't work with the lat=
est
>> patches.
>>=20
>> But that doesn't matter because we disable the above kernel options by
>> default. We don't need power management for PCI Express because of boot
>> issues and performance issues.
>=20
> If you have a chance, could you try the patch below on top of
> v6.18-rc3 with CONFIG_PCIEASPM=3Dy?
>=20
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..2b6d4e0958aa 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev=
 *dev)
>  * disable both L0s and L1 for now to be safe.
>  */
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_=
l0s_l1);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_as=
pm_l0s_l1);
>=20
> /*
>  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain

Thanks for the patch.=20

I will test it on my FSL Cyrus+ board over the weekend.
BTW, I also tested my PASemi Nemo board with the RC3 of kernel 6.18 and with=
 power management for PCI Express enabled. Unfortunately, the installed AMD R=
adeon HD5870 does not work with power management for PCI Express enabled eit=
her.

Power management for PCI Express is not interesting for our machines because=
 it is somewhat slower and we do not want power management to impair perform=
ance.
But it is a good thing for 24/7 servers.

- Christian=


