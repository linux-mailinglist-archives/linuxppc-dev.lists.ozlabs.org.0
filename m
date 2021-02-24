Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A26323BCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 13:16:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dlvym6zR9z3cjp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Feb 2021 23:16:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=FKJn/ZVr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.23;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=FKJn/ZVr; 
 dkim-atps=neutral
X-Greylist: delayed 52314 seconds by postgrey-1.36 at boromir;
 Wed, 24 Feb 2021 23:15:36 AEDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlvyK00tnz30LJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 23:15:34 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1614168913; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=NjOwdTC3y7mHi7d1WTx4rtO152kaXrUG6ARAOcKerVv0/O+LsmHy12ypA4TqaECN4k
 TEab177ZvpgI5ISoXuYO+2BBXpBUr5bmHoLCNoLNwRi9L8SfxuhWOoPuKFmyqAn5pwFW
 K0l+u328tgOgzMOoBbndNQ8UpRu1bjABXoX+rW5GfEqUPBppwJCOvv/5lOVcuzXFJuSW
 71VzrDdmhmggb2r7SAVx9RgWEnmM6RmcGbpLjpoj+cMlFhOjpRR0dYcnQUi3WvBgPBsA
 2lrPdYSrtqRId6Rx0rEJ3XGKiVJ8on5pMiR3JBNGbLpewkqZTCvsejKjnHbEa+Xs6Snu
 hbqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1614168913;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=FSmnO5s6nBV5/jrhSMAw39ReHlzJfT0Mqt7KDAzFP6s=;
 b=gNznM7NJmkBmav+IU0+xW58B/3y36jlv2f+qh12mR4plCeIXxf1nVpdcfJSZ3OKlfd
 kPJ9jPJMe2aui/zg6w04ld7CPlFpP/UfSoUM63n0rqziZh9W3X9DE0Mg0SnnP5Q2+CVC
 fciTpS23AxT85zv9oVsC/MEIKMIJML0R6dM97+L1BJqu1lZS0Y3oaxJQIA21AsP0IFwW
 Pxiqjv5pSGXTSqSBi7b4ujM5Eq7vcYpM4VMDOZr2Df/beVNrzPOTQpEqXn7qfmRnXf9O
 fzxkqtZIghAZ4xPKkDber1vtf7Ow8Bt3F9lhcIGys4R7DYcI8cHaopMejNAn/K/066XZ
 lYgw==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1614168913;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=FSmnO5s6nBV5/jrhSMAw39ReHlzJfT0Mqt7KDAzFP6s=;
 b=FKJn/ZVrxDazVxpow586w01hV4QfY+e/88N8/CoybdUcaagP7cNjV0Y8LJX5OlBBvb
 Wg+DilKkxPRFNks5Dde58lQxWS2tUYyB9kiibvvtTW7Rq04uWeX15kKGFdP9d7PyLGtF
 Iq+tIQB0+lLXDvPJUfHrVjS24GDEC2Bs7ps5Vk2Mxwc5ex08Gpc7pzuCbVeMTCA4j1sH
 MNUpl5OKwjnfj/UEKdCG7o/hwGUCEAsOw2/wmEwR2iG5vyPh7gXQSEUP1cc4oJSU0dsz
 qRK+mvUbuEwl5NmQhtuwpnAgHrdaiIysR8NNLH4UFJPPfKWVGNzQBnlCNVsONWsIzzb7
 IjMQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV43ZxwY3C1Spg8Oq37/jXJ1pqyqLIgnFN2ecSzKFw6"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:90a4:4a88:a0a0:edf8:71bb:8e4c]
 by smtp.strato.de (RZmta 47.19.0 AUTH)
 with ESMTPSA id a070ddx1OCFBEZk
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 24 Feb 2021 13:15:11 +0100 (CET)
Subject: Re: [PASEMI] Nemo board doesn't boot anymore because of moving
 pas_pci_init
To: Oliver O'Halloran <oohall@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
References: <13741214-bafc-1ee5-4157-854c14dae17c@xenosoft.de>
 <CAOesGMgtAXPQRThhkF5QR25R+F68F5C_HSUvFPW0Wk1DcpCwvA@mail.gmail.com>
 <877dmythcr.fsf@mpe.ellerman.id.au>
 <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <4d561d04-0b71-0635-05eb-50629fe965b4@xenosoft.de>
Date: Wed, 24 Feb 2021 13:15:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAOSf1CHQ=QDwH=J4kLYqboe481poa7EdbC6gzq29W7KYHhn1YQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Olof Johansson <olof@lixom.net>, Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24 February 21 at 03:17am, Oliver O'Halloran wrote:
> On Wed, Feb 24, 2021 at 11:55 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>> Olof Johansson <olof@lixom.net> writes:
>>> Hi,
>>>
>>> On Tue, Feb 23, 2021 at 1:43 PM Christian Zigotzky
>>> <chzigotzky@xenosoft.de> wrote:
>>>> Hello,
>>>>
>>>> The Nemo board [1] with a P.A. Semi PA6T SoC doesn't boot anymore
>>>> because of moving "pas_pci_init" to the device tree adoption [2] in the
>>>> latest PowerPC updates 5.12-1 [3].
>>>>
>>>> Unfortunately the Nemo board doesn't have it in its device tree. I
>>>> reverted this commit and after that the Nemo board boots without any
>>>> problems.
>>>>
>>>> What do you think about this ifdef?
>>>>
>>>> #ifdef CONFIG_PPC_PASEMI_NEMO
>>>>           /*
>>>>            * Check for the Nemo motherboard here, if we are running on one
>>>>            * then pas_pci_init()
>>>>            */
>>>>           if (of_machine_is_compatible("pasemi,nemo")) {
>>>>                   pas_pci_init();
>>>>           }
>>>> #endif
>>> This is not a proper fix for the problem. Someone will need to debug
>>> what on the pas_pci_init() codepath still needs to happen early in the
>>> boot, even if the main PCI setup happens later.
>> I looked but don't see anything 100% obvious.
>>
>> Possibly it's the call to isa_bridge_find_early()?
> Looks like it. I think the problem stems from the use of the PIO
> helpers (mainly outb()) in i8259_init() which is called from
> nemo_init_IRQ(). The PIO helpers require the ISA space to be mapped
> and io_isa_base to be set since they take a PIO register address
> rather than an MMIO address. It looks like there's a few other legacy
> embedded platforms that might have the same problem.
>
> I guess the real fix would be to decouple the ISA base address
> discovery from the PHB discovery. That should be doable since it's all
> discovered via DT anyway and we only support one ISA address range,
> but it's a bit of work.
Sorry because of the false statement of the boot issue. It was too late 
yesterday. If I understand it correctly then the position of the PCIE 
devices scan is at a new place. Therefore it doesn't work anymore. It 
hasn't nothing to do with the device tree adoption. We will use the 
following patch for reverting this commit for further testing the new 
kernels.

--- a/arch/powerpc/platforms/pasemi/setup.c     2021-02-23 
21:40:04.835999708 +0100
+++ b/arch/powerpc/platforms/pasemi/setup.c     2021-02-23 
21:46:04.560667045 +0100
@@ -144,6 +144,7 @@ static void __init pas_setup_arch(void)
         /* Setup SMP callback */
         smp_ops = &pas_smp_ops;
  #endif
+       pas_pci_init();

         /* Remap SDC register for doing reset */
         /* XXXOJN This should maybe come out of the device tree */
@@ -444,7 +445,6 @@ define_machine(pasemi) {
         .name                   = "PA Semi PWRficient",
         .probe                  = pas_probe,
         .setup_arch             = pas_setup_arch,
-       .discover_phbs          = pas_pci_init,
         .init_IRQ               = pas_init_IRQ,
         .get_irq                = mpic_get_irq,
         .restart                = pas_restart,
