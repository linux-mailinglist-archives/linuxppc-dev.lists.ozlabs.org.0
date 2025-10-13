Return-Path: <linuxppc-dev+bounces-12801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B845BD4A58
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 17:59:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clhqV6FYMz30P3;
	Tue, 14 Oct 2025 02:59:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760371158;
	cv=none; b=Z/2zbbbwU1Ip7B1INzmFw645yJZpPrx+9WGb5rOEwdhcTZ4evO8xzzYJT92co+GslnVi29XB3MHxSOPyZkTM2jS3CASGley6caeCEMLc+xt/sHPRkKsdqcr7oYTDaBkio50Y6EYknUYl8MzRBe2rrVZiCAHs44SW7YEf7VVoVqvqrgnhnWvwVMLSCqrsxuu5IIrOywplH1Fztm6kaXnfLfafogkjmSJtWX1JrWoGJFC8vjlN/hsc5+aCE8bwQca75V3ksf2YDPuDvZqCK4ZLV3tVgoZtZvrUA6e3YqIL5ySmpDBvrhqz4EG0ImdjeFevmmutgVoTQZDHkk4PQSC6dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760371158; c=relaxed/relaxed;
	bh=y7zF+0dqhByWnxWH6TV9Y8pQP/9tXCTVDhqNJE681ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ns18wpReWxJKTqrey3YuzyijsKfI5cMST4L2MdhiKFLkvu6cJ5OkBdxHtApoHC6nshX14w/r0R4GN5C9fAwH7KXNWHJ7HkHZwxbk4EdQZ/e71v/GOwh7UNyyPmroPiNtfi3u16LmOpam/rjDVU6l2Db2SBqpz/nOGgOsWFcRrE5IPfpikS81ExUf3/Y/j9PkP3rHrxmGKzqKNaz7Gr4E/C9QjJF9I8fRaz21Q3SZPT3nQ5pSPURnIXfGzBu5h2OjYiFVzNynlyPL5o0uVzRpzt7F9QG8myW69jK0LFhR1UnoJNZz7+73HGWUH6EyYUstvQxgqm/HLyCmQTYXzQ55Ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CG4lmLNh; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CG4lmLNh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clhqT6X18z302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 02:59:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C36744E0B;
	Mon, 13 Oct 2025 15:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58933C4CEE7;
	Mon, 13 Oct 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760371155;
	bh=YzPXSc9lA79Qdx1+RbYOvpF5Hc02Jrnk2byrQTnsdio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CG4lmLNhQezyFadt+TIyiILI5E62iaE76Osv8KyQODyiT6ndsgdZTFdqmksAHRI4q
	 WG94uqN2xbCFr8pejgVrQTz9tsOaFf3ELTbUUngJBoXdNbX7qFy+WDdAr/OaNWpN93
	 498pQvp0uetu6l7gOx0vBl3/TFERJ1AQt1Jy4Hi9v2m1YW3Zt0aD8tJlQRQJVsPlCk
	 XfDDeomHGVteG9e+QEpwFsemnjomC1GHRDehPGQihr51Iw/5FErSCHNNnm3qveEoe8
	 WgG7eRXhoVnlJKDlgf8LStK62bOxQf9WcyOMwbTHF+UdjMLRyKOsCllacgvVXhQKc/
	 MMi+lL3+eeFyQ==
Date: Mon, 13 Oct 2025 21:28:59 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>, 
	debian-powerpc@lists.debian.org
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <mg2ahzgcwgm6h5mtgs4tsel3yrphrfqgfcjydfxgzgxq5h7kot@jtealdt6vvcz>
References: <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
 <7FB0AB81-AD0F-420D-B2CB-F81C5E47ADF3@xenosoft.de>
 <3fba6283-c8e8-48aa-9f84-0217c4835fb8@xenosoft.de>
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
In-Reply-To: <3fba6283-c8e8-48aa-9f84-0217c4835fb8@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 13, 2025 at 04:50:31PM +0200, Christian Zigotzky wrote:
> On 13 October 2025 at 07:23 am, Christian Zigotzky wrote:
> > Better for testing (All AMD graphics cards):
> > 
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 214ed060ca1b..e006b0560b39 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> > */
> > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> > 
> > +
> > +static void quirk_disable_aspm_all(struct pci_dev *dev)
> > +{
> > +       pci_info(dev, "Disabling ASPM\n");
> > +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> > +}
> > +
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, quirk_disable_aspm_all);
> > +
> > /*
> > * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> > * Link bit cleared after starting the link retrain process to allow this
> This patch has solved the boot issue but I get the following error messages
> again and again:
> 
> [  186.765644] pcieport 0001:00:00.0: AER: Correctable error message
> received from 0001:00:00.0 (no details found
> [  187.789034] pcieport 0001:00:00.0: AER: Correctable error message
> received from 0001:00:00.0
> [  187.789052] pcieport 0001:00:00.0: PCIe Bus Error: severity=Correctable,
> type=Data Link Layer, (Transmitter ID)
> [  187.789058] pcieport 0001:00:00.0:   device [1957:0451] error
> status/mask=00001000/00002000
> [  187.789066] pcieport 0001:00:00.0:    [12] Timeout
> [  187.789120] pcieport 0001:00:00.0: AER: Correctable error message
> received from 0001:00:00.0 (no details found
> [  187.789169] pcieport 0001:00:00.0: AER: Correctable error message
> received from 0001:00:00.0 (no details found
> [  187.789218] pcieport 0001:00:00.0: AER: Correctable error message
> received from 0001:00:00.0 (no details found
> [  188.812514] pcieport 0001:00:00.0: AER: Correctable error message
> received from 0001:00:00.0
> 
> I don't get these messages with the revert patch. [1]
> 

Either the Root Port could be triggering these AER messages due to ASPM issue or
due to the endpoint connected downstream.

If possible, please share the whole dmesg log instead of the snippet so that we
can be sure from where the AER messages are coming from.

You can also add the below quirk and check:

DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FSL, 0x0451, quirk_disable_aspm_all);

But it would be better to get the whole dmesg.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

