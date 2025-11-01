Return-Path: <linuxppc-dev+bounces-13650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA59C27895
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 06:40:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cz6Bf08mdz30hP;
	Sat,  1 Nov 2025 16:40:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.170 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761975625;
	cv=pass; b=WTYFL/zbRmjZ6tq4opCN8TdyKgPq4Oej/fRZdkAz3BOOerbPWNDbtonDkLYbRoXwyo75XxwBouAsBI2UzxgiaIvB4HBf8jz2MmfCXdy2K620iI5Qu+0rVVeBc/XLsaVRjwRJepGPW7gcp1tLTReBjVxrFTqg2BKvHnXJ1ZMNkh670Eth7WhdkIXGxZAUEKU3BMj15IJXS1lFYXzXLxtolKphWCx9pry1obdBllvn6WrZ3wYerZyTgWUUhwCm8qRVGvBjcNTGWZtbfz5z2fi9aD4aqPBogeGG7l+JiZQgNh7Cs+DHbxrAhleCTDxEhowBiQ6fhUHky+VXMnWjCohVLw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761975625; c=relaxed/relaxed;
	bh=GF4ohs13vWVVo07uWo2mZ+yvO9ChORyA1Qr2aqT6rH4=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=XxTzmIpue6CHJnNzPp065lrPA/+Z4cOhZiXgW+5Uu40ybYNMIvz1Ddsfp8uxd5kzMH1UFdZtkJD8kepD4XQdQPWVcon/BtO7/b+lzdIjJjTPcuDAfW+PzxHTHZRbDE7iPufhbXbRoBD87wRA8v/tX5hpKKtxFU51oK49lzPnCuR4P753fMruUUqctoJvWLPoEDtw/tbeJ+nNo4Dud9gwu8zErY/YfKz248mNvPzbcODPXgYcnHvMPQ+8uiiWUPRHGFNV8I/nToGTHUeSbyEhgexPvkR4uGU8OinV3xkIJ0KODNOwEi219IY55iPkzAhZ0RP8uA52IgJ1R8kVyImWHQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RvoF42sR; dkim-atps=neutral; spf=pass (client-ip=81.169.146.170; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RvoF42sR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.170; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cz6BZ5kJZz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Nov 2025 16:40:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1761975598; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nIa14/CT/+D8+pApFaXlrOvTyoFV7EFb5j97TpcupG3QVsMcD6ovVZmoLgatQk3DgY
    VOPbnQou2Y4faf4U3TixfVlV3GhB8sHlPuueNren6a9guqbWVxUTLdv4MlGWEXgxAsq8
    WdjLb8lcAUVYg/AcWtZprOrwJMCSz+A8PFx1elN+s01cMGegWTVLmKBh8bwYxcVLRJVT
    mPVm4BB8urRpPgjktDcIsA31NNx+9acHNquBrOv4xt1KAWaAgQpinx0gdc65vo+HXjGS
    OXYGDUUr7LORcxoIIJy4pwbWPTECsw5+x0V3bym5gNOALEvZWBXieFPkzOz8aJY0qG4e
    VDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1761975598;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=GF4ohs13vWVVo07uWo2mZ+yvO9ChORyA1Qr2aqT6rH4=;
    b=bAsVwZCioue77OJAshYDrDWEUjphx/m6Nap7OrCMeIT23LSdjtWaj+kF19TnX/EEa0
    AKZcQ+znQRh9rO2WBHgRoEOJ3KISO3YovVCPTbjGJ6gJ7Gnpwn9ZIKrFE+AZmbsqDjYu
    kacTAN0Mp0dNUFEo39Ts5nyx0vce5zevdl1dNoTuxKN0EZW6e4i2bRjrshtsoUGikLIY
    vv6pW6syWNsm6RhEBX2cCI29eVaRIJq31gTXgN8DhL58OiQCGHD3u2l8ITSRK2kmyk0E
    HoWctiEmhZkUd2IBz+HcJPBrNZ6Q9K9CW3SCNelumTqJ5XMpzoC0cp+tiqVX3OwazwCR
    scSw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1761975598;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=GF4ohs13vWVVo07uWo2mZ+yvO9ChORyA1Qr2aqT6rH4=;
    b=RvoF42sRzfGNwow1QEwFDhTFHEt6yPxh0S2hotrojb1mfvcdJ75ALcUefJS/jfhkva
    NRx7FsvzZqbuHCj3K08Xoa71ccpNpnjKuHoFHJqGxbxrdtopCm0jSX+CTYESzF4gXBtS
    kqSk9HJGMgIGCM9UoKcLLOH9CoBPHNIKyWlaRexhCOqM+/7/oXPZzFF4VDPsJdOBusUU
    KBmRBgzyFvsnMBPFz1bnigjMW7sbox6sCAPSEAso0spD7tOorNiDqSpfetx4OSluLXSt
    47LGvopycyOThtmayZcSn1gbZelM6sGGjn7E44Vd389bpoVedKCzlL13pJg/thwSTG4n
    ZQ5g==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIC+m6Bvg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e288661A15dvVv0
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 1 Nov 2025 06:39:57 +0100 (CET)
Subject: [PPC] Boot problems after the pci-v6.18-changes
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam <mani@kernel.org>,
 regressions@lists.linux.dev
References: <20251030221156.GA1656310@bhelgaas>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <545ac5c9-580c-5cf7-dd22-10dd79e6aabf@xenosoft.de>
Date: Sat, 1 Nov 2025 06:39:56 +0100
X-Mailer: BrassMonkey/33.9.1
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
MIME-Version: 1.0
In-Reply-To: <20251030221156.GA1656310@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


 > Bjorn Helgaas <helgaas@kernel.org> wrote:
 >
 > Oops, I made that fixup run too late.  Instead of the patch above, can
 > you test the one below?
 >
 > You'll likely see something like this, which is a little misleading
 > because even though we claim "default L1" for 01:00.0 (or whatever
 > your Radeon is), the fact that L0s and L1 are disabled at the other
 > end of the link (00:00.0) should prevent us from actually enabling it:
 >
 >  pci 0000:00:00.0: Disabling ASPM L0s/L1
 >  pci 0000:01:00.0: ASPM: default states L1
 >
 > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
 > index 214ed060ca1b..27777ded9a2c 100644
 > --- a/drivers/pci/quirks.c
 > +++ b/drivers/pci/quirks.c
 > @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct 
pci_dev *dev)
 >  * disable both L0s and L1 for now to be safe.
 >  */
 > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, 
quirk_disable_aspm_l0s_l1);
 > +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, 
quirk_disable_aspm_l0s_l1);
 >
 > /*
 >  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain

Hi Bjorn,

Thanks for your patch. I patched the RC3 of kernel 6.18 with your new 
patch and compile it again. Unfortunately the FSL Cyrus+ board doesn't 
boot with your new patch.

Sorry,

Christian

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


