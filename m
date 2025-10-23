Return-Path: <linuxppc-dev+bounces-13238-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A51BC0394E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 23:44:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ct00d15qBz2yFx;
	Fri, 24 Oct 2025 08:44:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761249954;
	cv=none; b=E4lzQpLwWmTshvZDjO+Gn+snqBDH+mggXV29g6cSi/LtOQi5ic1RwO+4z4JfoAaxZdmeGj3QCt+zIq2YaYFYTauqEdR2VANpJXyiK7qpoxgXcIaSatpTpzgsxO3658hVFCxRwV5w9qI88ouXKwqXXn/tcHKP0H6NfIOTX9DietVfQnh2qn39UD4X44i7jSuOLH46EzHfUT3KhEOMnC8QTb1IJXy/L/SHEWhoV8Z07Vn/MGolo+NogfSt8S5b9z3WDPK2p5ZsxQM0djzIpthwTRBsQtUtJCI5dL/6FAdbSEq7XiUFP4wkGbS9hl1uec4sfFNjuTHCRwk4jYiNRyQ9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761249954; c=relaxed/relaxed;
	bh=NgxdqITMBs00FQyE9iN8057v5JaTnH//cBeV6brPCVM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=KRKKx0gxLiiTG1PNcYymnyrb7f6BIyf+kgguE1wm1jBHTKiJkoJvpUFYo4BYspVbLl80ZlcSfg4p9HiNRcy5ApcG1Yy2Qcw2zanvpjhtczFIC70k8WP6CEna/w1ds+9t8eXRh/NPejPWEGLkgdysXMiXpzPRZELAvg5yep996SqVc2tQOO+yHWcPRLzsnJWdAV3eHJNZT6yVziIky7SNwZg8/AswKr9N+Qv2XzI2Q+2yEnna9utUASsTU5hCKymkyvSK3XxpnSMxRwCE0Epfiw6w0PS7kup37oRFlHbvm9XH8V9rFD8SZoaAmM87cU7RIL/nqqNdD/9Bq04gJpQ0rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; dkim=pass (2048-bit key; unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=FAx83wLm; dkim-atps=neutral; spf=pass (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=diederik@cknow-tech.com; receiver=lists.ozlabs.org) smtp.mailfrom=cknow-tech.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=FAx83wLm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cknow-tech.com (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=diederik@cknow-tech.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 342 seconds by postgrey-1.37 at boromir; Fri, 24 Oct 2025 07:05:50 AEDT
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csxqL68rvz3ckc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:05:50 +1100 (AEDT)
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
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1761249586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NgxdqITMBs00FQyE9iN8057v5JaTnH//cBeV6brPCVM=;
	b=FAx83wLmSxmeeIh8xhbvx7NV8H8ME4sOm04wFh3yX8CqoDb+JR3rVgdw9ByzAc5dcW2uuw
	sWHbz82IkCTUIT6NDRiwI2ip6gppXSBenLAoXg47wiiB3GzrNEVbexknCYvbeKU1vuFAJ7
	QbA0Lnf8gVovdiudJUXytMghBck2gu+emD1Sxzpom7YRfJQ3F6Cn0SAyn0QHMc9TdvQfIW
	jSWzWYX3bwoMY+QUNW5XByBQTh7eu0rk/rhDkFPVRbC52T63eHoZFZWrLVWeef3SY0nDQn
	60A5YIkLV8furs5XZ9kZHtjzkaHURWLlMoppLrW0dQs+dP1bIsua4w/xJ9+0Xw==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Oct 2025 21:59:41 +0200
Message-Id: <DDPYVBSYR01V.1OSGKL2X8LT82@cknow-tech.com>
Cc: "Manivannan Sadhasivam" <manivannan.sadhasivam@oss.qualcomm.com>,
 "Christian Zigotzky" <chzigotzky@xenosoft.de>, "FUKAUMI Naoki"
 <naoki@radxa.com>, "Herve Codina" <herve.codina@bootlin.com>, "Diederik de
 Haas" <diederik@cknow-tech.com>, "Dragan Simic" <dsimic@manjaro.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-rockchip@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, "Bjorn Helgaas" <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree
 platforms
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Bjorn Helgaas" <helgaas@kernel.org>, <linux-pci@vger.kernel.org>
References: <20251023180645.1304701-1-helgaas@kernel.org>
 <20251023182525.GA1306699@bhelgaas>
In-Reply-To: <20251023182525.GA1306699@bhelgaas>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bjorn,

Thanks for the patch :-)

On Thu Oct 23, 2025 at 8:25 PM CEST, Bjorn Helgaas wrote:
> On Thu, Oct 23, 2025 at 01:06:26PM -0500, Bjorn Helgaas wrote:
>> From: Bjorn Helgaas <bhelgaas@google.com>
>>=20
>> f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetr=
ee
>> platforms") enabled Clock Power Management and L1 PM Substates, but thos=
e
>> features depend on CLKREQ# and possibly other device-specific
>> configuration.  We don't know whether CLKREQ# is supported, so we should=
n't
>> blindly enable Clock PM and L1 PM Substates.
>>=20
>> Enable only ASPM L0s and L1, and only when both ends of the link adverti=
se
>> support for them.
>>=20
>> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for d=
evicetree platforms")
>> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xen=
osoft.de/
>> Reported-by: FUKAUMI Naoki <naoki@radxa.com>
>> Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353-98=
18-3bb2b311da0b@radxa.com/
>> Reported-by: Herve Codina <herve.codina@bootlin.com>
>> Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
>> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
>> Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.com=
/
>> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
>> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
>
> Provisionally applied to pci/for-linus, hoping to make v6.18-rc3.
>
> Happy to add any testing reports or amend as needed.

My build with your patch (on top of 6.18-rc2) just finished, so I
installed it and rebooted into it.
Happy to report that everything seems to be working fine and I can't
find any errors, warnings or other messages with 'nvme' in dmesg that
indicate sth could be wrong. IOW: it does indeed fix the issue I
reported earlier. So feel free to add my:

Tested-by: Diederik de Haas <diederik@cknow-tech.com>

Cheers,
  Diederik

>> ---
>> I intend this for v6.18-rc3.
>>=20
>> I think it will fix the issues reported by Diederik and FUKAUMI Naoki (b=
oth
>> on Rockchip).  I hope it will fix Christian's report on powerpc, but don=
't
>> have confirmation.  I think the performance regression Herve reported is
>> related, but this patch doesn't seem to fix it.
>>=20
>> FUKAUMI Naoki's successful testing report:
>> https://lore.kernel.org/r/4B275FBD7B747BE6+a3e5b367-9710-4b67-9d66-3ea34=
fc30866@radxa.com/
>> ---
>>  drivers/pci/pcie/aspm.c | 34 +++++++++-------------------------
>>  1 file changed, 9 insertions(+), 25 deletions(-)
>>=20
>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>> index 7cc8281e7011..79b965158473 100644
>> --- a/drivers/pci/pcie/aspm.c
>> +++ b/drivers/pci/pcie/aspm.c
>> @@ -243,8 +243,7 @@ struct pcie_link_state {
>>  	/* Clock PM state */
>>  	u32 clkpm_capable:1;		/* Clock PM capable? */
>>  	u32 clkpm_enabled:1;		/* Current Clock PM state */
>> -	u32 clkpm_default:1;		/* Default Clock PM state by BIOS or
>> -					   override */
>> +	u32 clkpm_default:1;		/* Default Clock PM state by BIOS */
>>  	u32 clkpm_disable:1;		/* Clock PM disabled */
>>  };
>> =20
>> @@ -376,18 +375,6 @@ static void pcie_set_clkpm(struct pcie_link_state *=
link, int enable)
>>  	pcie_set_clkpm_nocheck(link, enable);
>>  }
>> =20
>> -static void pcie_clkpm_override_default_link_state(struct pcie_link_sta=
te *link,
>> -						   int enabled)
>> -{
>> -	struct pci_dev *pdev =3D link->downstream;
>> -
>> -	/* For devicetree platforms, enable ClockPM by default */
>> -	if (of_have_populated_dt() && !enabled) {
>> -		link->clkpm_default =3D 1;
>> -		pci_info(pdev, "ASPM: DT platform, enabling ClockPM\n");
>> -	}
>> -}
>> -
>>  static void pcie_clkpm_cap_init(struct pcie_link_state *link, int black=
list)
>>  {
>>  	int capable =3D 1, enabled =3D 1;
>> @@ -410,7 +397,6 @@ static void pcie_clkpm_cap_init(struct pcie_link_sta=
te *link, int blacklist)
>>  	}
>>  	link->clkpm_enabled =3D enabled;
>>  	link->clkpm_default =3D enabled;
>> -	pcie_clkpm_override_default_link_state(link, enabled);
>>  	link->clkpm_capable =3D capable;
>>  	link->clkpm_disable =3D blacklist ? 1 : 0;
>>  }
>> @@ -811,19 +797,17 @@ static void pcie_aspm_override_default_link_state(=
struct pcie_link_state *link)
>>  	struct pci_dev *pdev =3D link->downstream;
>>  	u32 override;
>> =20
>> -	/* For devicetree platforms, enable all ASPM states by default */
>> +	/* For devicetree platforms, enable L0s and L1 by default */
>>  	if (of_have_populated_dt()) {
>> -		link->aspm_default =3D PCIE_LINK_STATE_ASPM_ALL;
>> +		if (link->aspm_support & PCIE_LINK_STATE_L0S)
>> +			link->aspm_default |=3D PCIE_LINK_STATE_L0S;
>> +		if (link->aspm_support & PCIE_LINK_STATE_L1)
>> +			link->aspm_default |=3D PCIE_LINK_STATE_L1;
>>  		override =3D link->aspm_default & ~link->aspm_enabled;
>>  		if (override)
>> -			pci_info(pdev, "ASPM: DT platform, enabling%s%s%s%s%s%s%s\n",
>> -				 FLAG(override, L0S_UP, " L0s-up"),
>> -				 FLAG(override, L0S_DW, " L0s-dw"),
>> -				 FLAG(override, L1, " L1"),
>> -				 FLAG(override, L1_1, " ASPM-L1.1"),
>> -				 FLAG(override, L1_2, " ASPM-L1.2"),
>> -				 FLAG(override, L1_1_PCIPM, " PCI-PM-L1.1"),
>> -				 FLAG(override, L1_2_PCIPM, " PCI-PM-L1.2"));
>> +			pci_info(pdev, "ASPM: default states%s%s\n",
>> +				 FLAG(override, L0S, " L0s"),
>> +				 FLAG(override, L1, " L1"));
>>  	}
>>  }
>> =20
>> --=20
>> 2.43.0
>>=20


