Return-Path: <linuxppc-dev+bounces-12881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DC6BDD5BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 10:22:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmkbK4155z3chq;
	Wed, 15 Oct 2025 19:22:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760516541;
	cv=none; b=JkXIHHjZXdZvRTCPYw1GemSsnS+d4UgDRnHoiPHmumjc5H6DwKWdqphZt9BBRXdtMdGavPWV7SgEEiCYneUAgkA1PgJrEavTLXA+cMspdeX7CIX4hblzCOvU3TWU9xTNpr6Wlvx+df5jmgnekMXxK7Nx8jUg9V8zl1ZlmBBOkp8UoZNEWIjy7K9I0OKMg9A7twBDfvQVxDYkLPSt5eFNfwdBxy2fFufSQxxnOzBDi5jfNzXYhPGpajmNbi8rujywCkFMX+He7gGoMK6/Ij/0OR1T9uJ3oFQVutQ96pzRJotPuX3W0MH9F3uNOkXQA+6ZY6psUSBoo+yZEudnqdTFgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760516541; c=relaxed/relaxed;
	bh=guIgTqlE1MX6Uj+pHcjUldxzxmkYW6PEutEnz+hsySk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V5x1rK/MoQy86grmQBQ0nsjw+Ad6LquQXt7+QL3e+teE8pLZeKu9tzolixfrtjuwFH21olavRSFAfDirzcGKgVq91rHHHYCx4nTcjC05cnuF7DWjHMyeRtBiFMYLHKGNs37nTtkRNbznj4isJgOT23S2rg59/l6kZILiRJKKoru5rYcbYbycR1FP21NjylfoYWGMrweX2WnHJSzeCDxCf71PPgbIjsSeDfTfHinKlFeUc+RyfB64eYYz6vnRLgJAg7cY+Q2r76Bzd9nzZ1BwZKZ7QJyXQv0yR0KJxKXPnB8jqBr3zGy7IkRfrKhOKKoOeR5JebSK1a0IHXSQBDY4pQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GVfkYJlc; dkim-atps=neutral; spf=pass (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GVfkYJlc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.84.56; helo=smtpout-02.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 524 seconds by postgrey-1.37 at boromir; Wed, 15 Oct 2025 19:22:20 AEDT
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmkbJ08H6z3cgB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 19:22:18 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 18C3B1A13B4;
	Wed, 15 Oct 2025 08:13:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E01C8606F9;
	Wed, 15 Oct 2025 08:13:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4266E102F22AF;
	Wed, 15 Oct 2025 10:13:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760516009; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=guIgTqlE1MX6Uj+pHcjUldxzxmkYW6PEutEnz+hsySk=;
	b=GVfkYJlcs9BOwFQ7OtTpf629hMWeFLNGHMmxvG1O5ZEsxeDyV68t7w3Mql/Q6+cWyw7+Lo
	tzTaQwwIS56di29+o86EWca/KWQKOxZkGbFshWNNZQ65HM3sx+pkZ3h3pIIl1eDCniVtBN
	FkSLYdoKy7xcxv9hiJ9Mx6z7DmwMOpN6MlzYJ/MS6oyhrF7dAd71OgBSjaaeQTMJoYyuSh
	8c1/3/8vdv4FoFh5WNnRbAIRW/ffpeeE+MXGs0XvROHtG8qhht69Op9CUNFtPWWFU8koxx
	Zu/JsqF/AWiw+AxgQaryH2xoD3ujJSuSPJ8d9C1kOS+i3muNUcvUr8t4mEixjw==
Date: Wed, 15 Oct 2025 10:13:04 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <helgaas@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>, Christian Zigotzky
 <chzigotzky@xenosoft.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, mad skateman <madskateman@gmail.com>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au, Darren
 Stevens <darren@stevens-zone.net>, "debian-powerpc@lists.debian.org"
 <debian-powerpc@lists.debian.org>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251015101304.3ec03e6b@bootlin.com>
In-Reply-To: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
References: <20251008195136.GA634732@bhelgaas>
	<bf9ca58b-b54a-42fc-99f7-4edaa7e561f3@xenosoft.de>
	<aOdKAp8P0WwVfjbv@wunner.de>
	<d89576ac-c34c-4832-b51b-cf6f60c5c85c@xenosoft.de>
	<aOnqRqmHfaguJqyS@wunner.de>
	<iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi All,

On Sat, 11 Oct 2025 08:11:42 -0700
Manivannan Sadhasivam <mani@kernel.org> wrote:

> On Sat, Oct 11, 2025 at 07:25:26AM +0200, Lukas Wunner wrote:
> > [cc += Mani]
> > 
> > On Sat, Oct 11, 2025 at 07:12:49AM +0200, Christian Zigotzky wrote:  
> > > On 09 October 2025 at 07:37 am, Lukas Wunner wrote:  
> > > > On Thu, Oct 09, 2025 at 06:54:58AM +0200, Christian Zigotzky wrote:  
> > > > > On 08 October 2025 at 09:51 pm, Bjorn Helgaas wrote:  
> > > > > > On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:  
> > > > > > > Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
> > > > > > > 
> > > > > > > Without the pci-v6.18-changes, the PPC boards boot without any problems.
> > > > > > > 
> > > > > > > Boot log with error messages:
> > > > > > > https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
> > > > > > > 
> > > > > > > Further information: https://github.com/chzigotzky/kernels/issues/17  
> > > > > > Do you happen to have a similar log from a recent working kernel,
> > > > > > e.g., v6.17, that we could compare with?  
> > > > > Thanks for your answer. Here is a similar log from the kernel 6.17.0:
> > > > > https://github.com/user-attachments/files/22789946/Kernel_6.17.0_Cyrus_Plus_board_P5040.log  
> > > > These lines are added in v6.18:
> > > > 
> > > >    pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> > > >    pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
> > > >    pci 0001:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> > > >    pci 0001:01:00.0: ASPM: DT platform, enabling ClockPM
> > > >    pci 0001:03:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> > > >    pci 0001:03:00.0: ASPM: DT platform, enabling ClockPM
> > > > 
> > > > Possible candidate:
> > > > 
> > > > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")  
> > > 
> > > After reverting the commit f3ac2ff14834, the kernel boots without any
> > > problems.
> > > 
> > > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> > > platforms") is the bad commit.  
> > 
> > Hi Mani, your commit f3ac2ff14834 is causing a regression on certain
> > powerpc machines.  Any ideas?
> >   
> 
> Hi Lukas,
> 
> Thanks for looping me in. The referenced commit forcefully enables ASPM on all
> DT platforms as we decided to bite the bullet finally.
> 
> Looks like the device (0000:01:00.0) doesn't play nice with ASPM even though it
> advertises ASPM capability.
> 
> Christian, could you please test the below change and see if it fixes the issue?
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..e006b0560b39 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
>   */
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
>  
> +
> +static void quirk_disable_aspm_all(struct pci_dev *dev)
> +{
> +       pci_info(dev, "Disabling ASPM\n");
> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> +}
> +
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all);
> +
>  /*
>   * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>   * Link bit cleared after starting the link retrain process to allow this
> 
> 
> Going forward, we should be quirking the devices if they behave erratically.
> 
> - Mani
> 

I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
ClockPM and ASPM states for devicetree platforms")

My system is an ARM board (Marvel Armada 3720 DDB)
  https://elixir.bootlin.com/linux/v6.17.1/source/arch/arm64/boot/dts/marvell/armada-3720-db.dts

I use an LAN966x PCI board
  https://elixir.bootlin.com/linux/v6.17.1/source/drivers/misc/lan966x_pci.c

Usually, when I did a ping using the PCI board, I have more or less the
following timings:
   # ping 192.168.32.100
   PING 192.168.32.100 (192.168.32.100): 56 data bytes
   64 bytes from 192.168.32.100: seq=0 ttl=64 time=3.328 ms
   64 bytes from 192.168.32.100: seq=1 ttl=64 time=2.636 ms
   64 bytes from 192.168.32.100: seq=2 ttl=64 time=2.928 ms
   64 bytes from 192.168.32.100: seq=3 ttl=64 time=2.649 ms

But with a vanilla v6.18-rc1 kernel, those timings become awful:
   # ping 192.168.32.100
   PING 192.168.32.100 (192.168.32.100): 56 data bytes
   64 bytes from 192.168.32.100: seq=0 ttl=64 time=656.634 ms
   64 bytes from 192.168.32.100: seq=1 ttl=64 time=551.812 ms
   64 bytes from 192.168.32.100: seq=2 ttl=64 time=702.966 ms
   64 bytes from 192.168.32.100: seq=3 ttl=64 time=725.904 ms

Reverting commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states
for devicetree platforms") fixes my timing issues.

Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
an the quirk also fixes the timing issue.

I used the same PCI board on an x86 system and no timing issues were
observed.

I am not sure the quirk_disable_aspm_all quirk is the solution. Indeed,
the issue could be at the PCIe controller level and not the PCIe device.

What should be the best solution ?
Is something missing on device-tree based systems to have the commit
f3ac2ff14834 applied without regressions ?

Best regards,
Hervé

