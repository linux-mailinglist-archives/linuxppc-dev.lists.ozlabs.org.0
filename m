Return-Path: <linuxppc-dev+bounces-12797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF306BD3D23
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 17:02:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clgYr5YGJz30P3;
	Tue, 14 Oct 2025 02:02:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=81.169.146.170 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760367744;
	cv=pass; b=dpeYugZiEegC8zg+XYPG2rSdcmYscuGhveQqtmwbVyIjHPrP/CulB8pjKAjq0Ul/5DPPDv9xKDDrwPyuGT4FybMfAmpINdCBuUf2qExGcumXggjlNawRcYu30a5/61pnoY2Gyb4Wl8zLAfvTC3zwlD5wv5mY0pK4hrzKT1zRw4TW8Amd/0cDWDelxdEtXxkoEebFGZ2450CCUdHJ2KH3TgehT6AYHUu7aH3+sLwnDK/jbOXXn5cnngLQ4JZEhp4uf7QjSGq+7qpRo05tlAH8aNJ9379Uky8iBWIjIJ8i7or3HNQTZb9cDj5Bjuh4KfKDm1MKwT9kBLeGhGc21K50pw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760367744; c=relaxed/relaxed;
	bh=uY2fNInm6Zu7yzwA41y25JDUSAObpmzOUrktGJdE+80=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LV2SmfYcEY/I8hloKpYHVDUE5Y45rF/bQEkKFallodMxDj1van/TgqY6Awg3Ydl6/G8tcinvOX29FHRS8++eEPpQ26hPo+h0VPhj4rtr1OL13RERS8INHOoznClWHkl0q2RXwQAIshZcyEL4tK6ayM9Tho1M8Ut01p4NT8J0f80e8Vq/VJ4zCosOa+d0sWrUqq6N0Ev+h5YZrOIC2a0cCqfX1IqrPGbreIAoiHA94Sz3HEzhjWxSAO+7se9bqyPjX6wqKuWWRWTFchRZRIqaaP3BLeyGnkPcMA4m+dVxskCFIvg83yh9OBOsU/euIUinPqqYkhpE5qvDSAZmBi+AXw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fD4/l5mv; dkim-atps=neutral; spf=pass (client-ip=81.169.146.170; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p02-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=fD4/l5mv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=81.169.146.170; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clgYp64R2z302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 02:02:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1760367733; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=XDcg45LdL9UOoHGPj3yKwSpReA8hFz7kURW0dD1NU4Wn1MqNyykB0UJ+EsuPtADKW7
    vC2V5Q7GNDST8nfCVZeCNwNvLy/QyDckP/BRJDIjpWOzbkHa6zf1HqZIiyOPOUkJx2UG
    FpO7J3VCQRZMRMMAzz473tng2NYQ06nmwnAhdSgVE4FYDl3aPn9gVDpfUB17BO3TlFxF
    XsEp8TrUVdGwvnwNYEiR+K4CghikTIDY3lrQvvIm8ZpcrWaTz9Je0BOoyliw4znsVFNb
    MIbDGvQUjkvpF2lEJfjmCmwfyQjSCB2NLyMqczORDYhuyjsqj09qZxmhxjzPdHOhCOh3
    lYVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1760367733;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=uY2fNInm6Zu7yzwA41y25JDUSAObpmzOUrktGJdE+80=;
    b=SRq4amle2tY3PJNIqnqvPG6T1za8/2Bp4kQ9IvjGpx5SJZY48eHO25FM3r7zyKnnes
    DLFsxDccjLe1bJPZGf7+Qi9m+sCwJ4gqoHeB5Gregws+ZcSw/LBOmVwXqG5cVVKuNzM4
    IDhAO8OR2K4ccaEQd0xXvuH283oIWIc3i4Sj9kS5MKxqQBADoTgFI9ml6vx0UEGzHWr7
    JSImu3BdpfU1f7pge/QuMwxU8a2H7kdieX3mJZ3ARJ905QyifetNdEds7SyhoJTk7o8E
    xL6+kcwRjU1O08qk9JsxbgSdGiGFOuORic1pTTBE4BqnpHGuQmVvEMVNVe5qRJJXUcEn
    euKQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1760367733;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=uY2fNInm6Zu7yzwA41y25JDUSAObpmzOUrktGJdE+80=;
    b=fD4/l5mv5dur5e8+dzNWzMBOY45CuuU7z/F5Nj6tFZy+RY/R0fyivZHQn21xswCAJQ
    5HusbJuhh3/g7p2vNWuHqSfq/V4DrvOOcYmxVuFgaqp6p2pVPF7H6O/ERjiXmUgKZJRi
    o3wqWHH29QCg1A8MZAnA7pgGf1gSzHV2uLA1bWeTj38Q+77/8p9rC2T79/slA9guADOO
    9t20wfdueDbdwsxwcFJcuUJF8J25Pj5iOQeqk+UiFsezsdPmIhetZ5d6m/aTMQZhG09r
    QXCL+B7NTN0vFuJ6m4WiCnFnFvOTW3HjzGEV+qv3WV6Dzf8Js3L3uS0AoHOT7ZamCoGP
    hyFw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIS+m7hvg"
Received: from [192.168.178.48]
    by smtp.strato.de (RZmta 53.4.2 DYNA|AUTH)
    with ESMTPSA id e2886619DF2CPQF
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 13 Oct 2025 17:02:12 +0200 (CEST)
Message-ID: <69dc773c-e059-4a2d-96de-5e2952dc165c@xenosoft.de>
Date: Mon, 13 Oct 2025 17:02:12 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Lukas Wunner <lukas@wunner.de>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
 Darren Stevens <darren@stevens-zone.net>, debian-powerpc@lists.debian.org
References: <2E40B1CD-5EDA-4208-8914-D1FC02FE8185@xenosoft.de>
 <7FB0AB81-AD0F-420D-B2CB-F81C5E47ADF3@xenosoft.de>
 <3fba6283-c8e8-48aa-9f84-0217c4835fb8@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <3fba6283-c8e8-48aa-9f84-0217c4835fb8@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 13 October 2025 at 04:50 pm, Christian Zigotzky wrote:
> On 13 October 2025 at 07:23 am, Christian Zigotzky wrote:
>> Better for testing (All AMD graphics cards):
>>
>> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
>> index 214ed060ca1b..e006b0560b39 100644
>> --- a/drivers/pci/quirks.c
>> +++ b/drivers/pci/quirks.c
>> @@ -2525,6 +2525,15 @@ static void quirk_disable_aspm_l0s_l1(struct 
>> pci_dev *dev)
>> */
>> DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, 
>> quirk_disable_aspm_l0s_l1);
>>
>> +
>> +static void quirk_disable_aspm_all(struct pci_dev *dev)
>> +{
>> +       pci_info(dev, "Disabling ASPM\n");
>> +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
>> +}
>> +
>> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ATI, PCI_ANY_ID, 
>> quirk_disable_aspm_all);
>> +
>> /*
>> * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
>> * Link bit cleared after starting the link retrain process to allow this
> This patch has solved the boot issue but I get the following error 
> messages again and again:
>
> [  186.765644] pcieport 0001:00:00.0: AER: Correctable error message 
> received from 0001:00:00.0 (no details found
> [  187.789034] pcieport 0001:00:00.0: AER: Correctable error message 
> received from 0001:00:00.0
> [  187.789052] pcieport 0001:00:00.0: PCIe Bus Error: 
> severity=Correctable, type=Data Link Layer, (Transmitter ID)
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
> -- Christian
>
> [1] 
> https://github.com/chzigotzky/kernels/blob/main/patches/e5500/pci.patch
>
>
0001:00:00.0 PCI bridge: Freescale Semiconductor Inc Device 0451 (rev 21)

