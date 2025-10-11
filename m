Return-Path: <linuxppc-dev+bounces-12776-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3CBCF7D5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Oct 2025 17:11:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ckRsf4z7Tz2yr9;
	Sun, 12 Oct 2025 02:11:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760195510;
	cv=none; b=NSf0Uj8EdCh0HMZoyaiaEenJbVMMi7wEfDutJNu/SuI2sDSZrlwPee8OC4iCI7yBuA+xz0ogYqHG6e1QPfvUOxJx37lxYSAUTZ7QR5ekyd8/8Dh2MI7oF+V69szzSMrj/BZ6xWunsucm3yl/+ZiyiCsntHGUDwsygw20FkaIEpvpBVPjH+bzxEKNgs01u3PtT5JsQavGheWO1h/9oxJ5wxsOQYvc6K0/lUtVNWH1dwlDt8YYSup83YaZbAdwlO4di3WthzvDjk6BRnM5Pce1Y6gMx994Hi96h30VeLpdclaaaYUktLytH0UvisIt63060Lyy05+rqgNxZhh7hj27rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760195510; c=relaxed/relaxed;
	bh=1MtqKh60v3Kf0kUs145CWXila2D/9kqLwcgEhAOUwAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G9HodxMgiFrQ6m7j9OoU1idJTkLUGitTw5V15IFVYoosDWekjAlKkhFpkSy7oKywSiSzDPebMPeWC4C9rPGClix9tFAguWeTKcrG9BapOvYHDe2PSPoVGObJL4ftSTbYEHbpAFZCNaTb6+1PFGmvXEzNIpyyqJlzrjweLNwAF2mFNZt5uRGC7XXn1ygX2lBsQkAF183YyCeCpmuvvIwluEu36D6kywwyyeKDs5bKOxQ65de14r2s2dkpfHcQ5yoWY80KWLlkhswXOQBJRWq3/d4Zf6S05hfyZ2c8d02iJDsTKYU2HMmnAYJjIzAyCBGDp75aehNrKJfqAniTeQSC4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A2x5znN7; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=A2x5znN7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ckRsd4qCPz2xWc
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Oct 2025 02:11:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E6D160439;
	Sat, 11 Oct 2025 15:11:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B7C5C4CEF4;
	Sat, 11 Oct 2025 15:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760195506;
	bh=f6EzabMMXoOQsotr0KWsqDyZLbL9AhyRLF7+49XQgs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A2x5znN7lQkr7UUmqoiMyPby0FQ/F18J+FG5unYVX+jja6AQIB7MLOQil1BjxurJy
	 6+vweowkwJPMW/bHnqhJUFQDsqcqiW+bNRZfWakZNvwkLB5Jw//Pc80PGgwshpbPMW
	 U9FKKrx0zeuSiJFyK53pa+wfvBQa3ZVYskO8LdW2UKSLQQO1kyuOqIH84Lw7pbcpTI
	 aCjEdsuEqnMBjUp3il3KyTZER4Ra5zqWkk9rBljCvttzGtRR6/pA0ZaCxeURnSuNts
	 c3I0XtwxOdXN09yRTWSKAvt29jfBY/2fzvXfo912pch1/5rXwwhBYUJ1/nk6adN9lu
	 cqtAkd4Ii1zEg==
Date: Sat, 11 Oct 2025 08:11:42 -0700
From: Manivannan Sadhasivam <mani@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, 
	Christian Zigotzky <info@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>, 
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <iv63quznjowwaib5pispl47gibevmmbbhl67ow2abl6s7lziuw@23koanb5uy22>
References: <20251008195136.GA634732@bhelgaas>
 <bf9ca58b-b54a-42fc-99f7-4edaa7e561f3@xenosoft.de>
 <aOdKAp8P0WwVfjbv@wunner.de>
 <d89576ac-c34c-4832-b51b-cf6f60c5c85c@xenosoft.de>
 <aOnqRqmHfaguJqyS@wunner.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aOnqRqmHfaguJqyS@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Oct 11, 2025 at 07:25:26AM +0200, Lukas Wunner wrote:
> [cc += Mani]
> 
> On Sat, Oct 11, 2025 at 07:12:49AM +0200, Christian Zigotzky wrote:
> > On 09 October 2025 at 07:37 am, Lukas Wunner wrote:
> > > On Thu, Oct 09, 2025 at 06:54:58AM +0200, Christian Zigotzky wrote:
> > > > On 08 October 2025 at 09:51 pm, Bjorn Helgaas wrote:
> > > > > On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
> > > > > > Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
> > > > > > 
> > > > > > Without the pci-v6.18-changes, the PPC boards boot without any problems.
> > > > > > 
> > > > > > Boot log with error messages:
> > > > > > https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
> > > > > > 
> > > > > > Further information: https://github.com/chzigotzky/kernels/issues/17
> > > > > Do you happen to have a similar log from a recent working kernel,
> > > > > e.g., v6.17, that we could compare with?
> > > > Thanks for your answer. Here is a similar log from the kernel 6.17.0:
> > > > https://github.com/user-attachments/files/22789946/Kernel_6.17.0_Cyrus_Plus_board_P5040.log
> > > These lines are added in v6.18:
> > > 
> > >    pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> > >    pci 0000:01:00.0: ASPM: DT platform, enabling ClockPM
> > >    pci 0001:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> > >    pci 0001:01:00.0: ASPM: DT platform, enabling ClockPM
> > >    pci 0001:03:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2
> > >    pci 0001:03:00.0: ASPM: DT platform, enabling ClockPM
> > > 
> > > Possible candidate:
> > > 
> > > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> > 
> > After reverting the commit f3ac2ff14834, the kernel boots without any
> > problems.
> > 
> > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> > platforms") is the bad commit.
> 
> Hi Mani, your commit f3ac2ff14834 is causing a regression on certain
> powerpc machines.  Any ideas?
> 

Hi Lukas,

Thanks for looping me in. The referenced commit forcefully enables ASPM on all
DT platforms as we decided to bite the bullet finally.

Looks like the device (0000:01:00.0) doesn't play nice with ASPM even though it
advertises ASPM capability.

Christian, could you please test the below change and see if it fixes the issue?

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..e006b0560b39 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
 
+
+static void quirk_disable_aspm_all(struct pci_dev *dev)
+{
+       pci_info(dev, "Disabling ASPM\n");
+       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
+}
+
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, 0x6738, quirk_disable_aspm_all);
+
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
  * Link bit cleared after starting the link retrain process to allow this


Going forward, we should be quirking the devices if they behave erratically.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

