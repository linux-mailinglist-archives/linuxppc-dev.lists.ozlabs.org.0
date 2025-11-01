Return-Path: <linuxppc-dev+bounces-13665-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B14C283B9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 01 Nov 2025 18:07:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4czPQx1cQ2z2yPS;
	Sun,  2 Nov 2025 04:07:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762016825;
	cv=none; b=moRuTyyC5rcbZAiNmTRzZRtdyTbt5OBIWYZ+Bicgh+sjfp4fgdoFeL6M4o1fDh6lu5FVWLmOjfFUhhdr98uw9aohsRXeBtscHyUOpfWmm8EzrmJcwdfJCjgVB1Al9By4r0UxxSwH4gvje7HkTMovorjgEHipwmNMz0IOejlq+Ud8FfwFZa3ufjIVs+rwnfzWhkrQdxkvqvPFP7axH/ZC9TfLFi4NOrmkpaFeJaRcdzC69o7C82Jh5CIFIocVTvvsI4GLaP1r2ZevC52bcXFkOTsVZJNsV3MlT8eW/e+t5Ys/n/c6VijTjK+2WW+tGCNnHA7Mmwsq8LAPgKXmsWzKow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762016825; c=relaxed/relaxed;
	bh=KDM9DodExH5azF4aIFw6cMQum9QwIRMLYv8WEDDBOow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7blTEAEhoCkqb4KDF91NS2dlEtcwrbQ54sITNYeMt9Rnr+YufgmnOl7klcSrzBUCl0Qd0jgboiEt931v/ypBsaUx9QF1kTyo/Z/BoJ4EnVFvY032KgmRLHmf/O77MrtYw+6Cw60sgrSDN48trpIADdKXKUPzJDpLOq/6nm31LwLwuCbyJ5K9pNsAMOH5QqAHdjv6pOgXGGLIjetVFUTIfm6zR6pQ1a4z/NQPFnFJ4aVN+f92Gi0PzKlGw4oKEC/AnEe6QQSrolEQ+YEKIqGDIA1BB8oXxabNjbPUcyup+kXGqwm8AjPz0RSs9j0wmrTRBnrjhpv6omLCHnk/MF92A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gnscWgdp; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gnscWgdp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4czPQw1J20z2xR2
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Nov 2025 04:07:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33340601D9;
	Sat,  1 Nov 2025 17:07:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50E46C4CEF1;
	Sat,  1 Nov 2025 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762016821;
	bh=Cv0pDJgDXyEUXqhIfLl1vBzkj96NpdjHrGVf8PIaWTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gnscWgdppKpnsIcg2bmV4SQBJ7rKAnseaFXV7RupPGd/rEY4jXOobWNUKtGpzpDIN
	 x+PRjYP+QSFUFSYusKVvgjCPuReKEORsiIEHvrpVrmvqKiwPyhvPX3FReeEiiJ153t
	 6zuw5NTHyJQrTXS9+pPYYdwt+7RnFc5Ig54eWqCz63BwV7b31SQtDjUT2IZK1na4Fe
	 42JtAWjRKYTrbsfdSxZHzy0Jfvttgs83qEafcPymdp/qA7dqZMNY2J7dTKWdUogpg0
	 wME2CJCD7lhk0htL7p+aTlrbiWfsyjnFG8/pJNbXuuxktO5spzuk10+NnJCO8bivh9
	 ZkAr51BnEYwhA==
Date: Sat, 1 Nov 2025 22:36:49 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>, 
	debian-powerpc@lists.debian.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Lukas Wunner <lukas@wunner.de>, regressions@lists.linux.dev
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <emjne6l33e3hukef5ms7kubv6kkuvesqkw6ozojnzzdgvso7ma@rbpg2l5i3nno>
References: <545ac5c9-580c-5cf7-dd22-10dd79e6aabf@xenosoft.de>
 <AEBA92BD-B46D-4D1B-A4D1-645B276E34CF@xenosoft.de>
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
In-Reply-To: <AEBA92BD-B46D-4D1B-A4D1-645B276E34CF@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 01, 2025 at 08:59:37AM +0100, Christian Zigotzky wrote:
> 
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> Oops, I made that fixup run too late.  Instead of the patch above, can
> you test the one below?
> 
> You'll likely see something like this, which is a little misleading
> because even though we claim "default L1" for 01:00.0 (or whatever
> your Radeon is), the fact that L0s and L1 are disabled at the other
> end of the link (00:00.0) should prevent us from actually enabling it:
> 
> pci 0000:00:00.0: Disabling ASPM L0s/L1
> pci 0000:01:00.0: ASPM: default states L1
> 
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index 214ed060ca1b..27777ded9a2c 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> * disable both L0s and L1 for now to be safe.
> */
> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> +DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1);
> 
> /*
> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> 
> —
> 
> Hi Bjorn,
> 
> Thanks for your patch. I patched the RC3 of kernel 6.18 with your new patch and compiled it again. Unfortunately the FSL Cyrus+ board doesn't boot with your new patch.
> 
> Sorry,
> 
> Christian
> 
> --
> Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)
> 
> —-
> 
> What about with 
> 
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, quirk_disable_aspm_l0s_l1);
> 

The issue is most likely with your Root Port rather than with the Radeon device.
So the quirk for Radeon won't fix the issue properly as it will affect other
host systems as well.

I guess Bjorn's change didn't help because the fixup ran before
pcie_aspm_init_link_state(). So even though the fixup disabled the ASPM link
state for Root Port, it got enabled by the default ASPM states enabled in
pcie_aspm_init_link_state().

Can you try doing fixup final as below?

```
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index d97335a40193..74d8596b3f62 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  * disable both L0s and L1 for now to be safe.
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1);
 
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
```

Sorry, I guess we are asking for too many experiments to be done which might be
of trouble for you. But without direct access to the device, we had to do these
:(

Thanks for your help in debugging.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

