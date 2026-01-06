Return-Path: <linuxppc-dev+bounces-15297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B0DCF7173
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 08:42:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dljn51pM4z2yMJ;
	Tue, 06 Jan 2026 18:42:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767685353;
	cv=none; b=YdQ8+6zRci4ZLgUhsIl+O3EeF8MpV1r0jqoNLN+romkE5FrzAbBe6R1pvzPg8Km6sQQAjNIhxx7eK2CYc/AanNIwMrUIQTqfU8ba/ZIdg7QBFeGtDJeSq54xs5HAzBRD4blWB53WMGst7lUj38O9y/2m2BlXAxRPkNfeexhpUguc9J4jvweBXKPmEjolxJkgvDfkSB64zykL0XNH/ivrx11tfYkbMIVOoQXVIIY6fCM9U2QwW2f8iOBT1+kXjTkVIP/q85bKm9jzU+1fRDUHZnwpJvJhfE4Rv0wjH9mPS3cwlWVJyjFhuBuYiAdw12T3Iabr83UuBgeOQBhfNgz4Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767685353; c=relaxed/relaxed;
	bh=42Za0mJdUXFI5KgbkuVhKybdOu15+XkbIkHZYuOVt+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=heOx8NqxtGHIMTpKAf+NTz6f13cjmkOI1i9NAjxmRD+whAGZ520T9BDqX4eKebUWLCf2dNVqJWsHxRgmApzEXrl93j1muS1HLwJl+Ce1ARMbyxh5I3mQqop9ZkpEg8Vt8wOm8VzIpHoaat4O0qQDWlkLV23cSuoBerO/W4GDgf6JyUXYhW1EJP1IVftd+8wj/WpTHdIAJQ7xQiaU5isLwa1CuVBpFqTatQFPfL1OS8E+ZC4M1tUdVDkFct7GkAm7sFddZ0cHSykZPmJHthz2OU+CRPx4R/nVCh6C9qKJ0HOH+BCK9jYjZd2CrcS61Y43gyh6Nh45DTfRbscYlZ3Z7A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dljn40J7Pz2y7c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 18:42:29 +1100 (AEDT)
Received: from [192.168.0.114] (unknown [114.241.82.145])
	by APP-05 (Coremail) with SMTP id zQCowABX6AvAvFxpa_ebAw--.32437S2;
	Tue, 06 Jan 2026 15:41:52 +0800 (CST)
Message-ID: <c652e45c-fedc-4bcd-9310-fc428e0e6c57@iscas.ac.cn>
Date: Tue, 6 Jan 2026 15:41:52 +0800
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
Subject: Re: [PATCH 1/5] PCI/MSI: Conservatively generalize no_64bit_msi into
 msi_addr_mask
To: "Creeley, Brett" <bcreeley@amd.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
 <20251224-pci-msi-addr-mask-v1-1-05a6fcb4b4c0@iscas.ac.cn>
 <641c55d4-5c18-4b81-be04-404e6bb3fbb1@amd.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <641c55d4-5c18-4b81-be04-404e6bb3fbb1@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:zQCowABX6AvAvFxpa_ebAw--.32437S2
X-Coremail-Antispam: 1UD129KBjvJXoWxtF17AF4DGF4UKr1ruF43trb_yoWxAw4fpa
	ykGFWSyFW8K3yUta9Fy3WUZF1Yva1qgrWrWrW7K3sa93ZIvFy8JFnayry3Gwn7Xr4kCF40
	qr1jgw1jgFnIk3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvC14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7sRidbbtUUUUU==
X-Originating-IP: [114.241.82.145]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/6/26 02:05, Creeley, Brett wrote:
> On 12/23/2025 7:10 PM, Vivian Wang wrote:
>> Caution: This message originated from an External Source. Use proper c=
aution when opening attachments, clicking links, or responding.
>>
>>
>> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
>> implement less than 64 address bits. This breaks on platforms where su=
ch
>> a device is assigned an MSI address higher than what's reachable.
>>
>> Currently, we deal with this with a single no_64bit_msi flag, and
>> (notably on powerpc) use 32-bit MSI address for these devices. However=
,
>> on some platforms the MSI doorbell address is above 32-bit but within
>> device ability.
>>
>> As a first step, conservatively generalize the single-bit flag
>> no_64bit_msi into msi_addr_mask. (The name msi_addr_mask is chosen to
>> avoid confusion with msi_mask.)
>>
>> The translation is essentially:
>>
>> - no_64bit_msi =3D 1    ->    msi_addr_mask =3D DMA_BIT_MASK(32)
>> - no_64bit_msi =3D 0    ->    msi_addr_mask =3D DMA_BIT_MASK(64)
>> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
>>
>> Since no values other than DMA_BIT_MASK(32) and DMA_BIT_MASK(64) is
>> used, no functional change is intended. Future patches that make use o=
f
>> intermediate values of msi_addr_mask will follow, allowing devices tha=
t
>> cannot use full 64-bit addresses for MSI to work on platforms with MSI=

>> doorbell above 32-bit address space.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>>
>> ---
>>
>> checkpatch complains about the comment include/linux/pci.h, which I ha=
ve
>> formatted similarly with other comments in the vicinity.
>> ---
>>   arch/powerpc/platforms/powernv/pci-ioda.c           | 2 +-
>>   arch/powerpc/platforms/pseries/msi.c                | 4 ++--
>>   drivers/gpu/drm/radeon/radeon_irq_kms.c             | 2 +-
>>   drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 2 +-
>>   drivers/pci/msi/msi.c                               | 2 +-
>>   drivers/pci/msi/pcidev_msi.c                        | 2 +-
>>   drivers/pci/probe.c                                 | 7 +++++++
>>   include/linux/pci.h                                 | 8 +++++++-
>>   sound/hda/controllers/intel.c                       | 2 +-
>>   9 files changed, 22 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/=
platforms/powernv/pci-ioda.c
>> index b0c1d9d16fb5..1c78fdfb7b03 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -1666,7 +1666,7 @@ static int __pnv_pci_ioda_msi_setup(struct pnv_p=
hb *phb, struct pci_dev *dev,
>>                  return -ENXIO;
>>
>>          /* Force 32-bit MSI on some broken devices */
>> -       if (dev->no_64bit_msi)
>> +       if (dev->msi_addr_mask < DMA_BIT_MASK(64))
>>                  is_64 =3D 0;
>>
>>          /* Assign XIVE to PE */
>> diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platf=
orms/pseries/msi.c
>> index a82aaa786e9e..7473c7ca1db0 100644
>> --- a/arch/powerpc/platforms/pseries/msi.c
>> +++ b/arch/powerpc/platforms/pseries/msi.c
>> @@ -383,7 +383,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *p=
dev, int nvec_in, int type,
>>           */
>>   again:
>>          if (type =3D=3D PCI_CAP_ID_MSI) {
>> -               if (pdev->no_64bit_msi) {
>> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64)) {
>>                          rc =3D rtas_change_msi(pdn, RTAS_CHANGE_32MSI=
_FN, nvec);
>>                          if (rc < 0) {
>>                                  /*
>> @@ -409,7 +409,7 @@ static int rtas_prepare_msi_irqs(struct pci_dev *p=
dev, int nvec_in, int type,
>>                  if (use_32bit_msi_hack && rc > 0)
>>                          rtas_hack_32bit_msi_gen2(pdev);
>>          } else {
>> -               if (pdev->no_64bit_msi)
>> +               if (pdev->msi_addr_mask < DMA_BIT_MASK(64))
>>                          rc =3D rtas_change_msi(pdn, RTAS_CHANGE_32MSI=
X_FN, nvec);
>>                  else
>>                          rc =3D rtas_change_msi(pdn, RTAS_CHANGE_MSIX_=
FN, nvec);
>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm=
/radeon/radeon_irq_kms.c
>> index 9961251b44ba..d550554a6f3f 100644
>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> @@ -252,7 +252,7 @@ static bool radeon_msi_ok(struct radeon_device *rd=
ev)
>>           */
>>          if (rdev->family < CHIP_BONAIRE) {
>>                  dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n"=
);
>> -               rdev->pdev->no_64bit_msi =3D 1;
>> +               rdev->pdev->msi_addr_mask =3D DMA_BIT_MASK(32);
>>          }
>>
>>          /* force MSI on */
>> diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/dri=
vers/net/ethernet/pensando/ionic/ionic_bus_pci.c
>> index 70d86c5f52fb..0671deae9a28 100644
>> --- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
>> +++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
>> @@ -331,7 +331,7 @@ static int ionic_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>>
>>   #ifdef CONFIG_PPC64
>>          /* Ensure MSI/MSI-X interrupts lie within addressable physica=
l memory */
>> -       pdev->no_64bit_msi =3D 1;
>> +       pdev->msi_addr_mask =3D DMA_BIT_MASK(32);
> I know this is just an intermediate commit in the series, but does this=

> retain the original intent?
I do believe so, yes. The no_64bit_msi bit's meaning is the negation of
this bit found in the MSI capability:

=C2=A0 =C2=A0 #define=C2=A0 PCI_MSI_FLAGS_64BIT=C2=A0 =C2=A0 0x0080=C2=A0=
 =C2=A0 /* 64-bit addresses allowed */

PCI_MSI_FLAGS_64BIT is set if this function handles PCI_MSI_ADDRESS_HI
and cleared if doesn't handle=C2=A0PCI_MSI_ADDRESS_HI. So=C2=A0with "no 6=
4bit",
only PCI_MSI_ADDRESS_LO is usable, and MSI is limited to 32 bits. See
also old handling here:

>> diff --git a/drivers/pci/msi/pcidev_msi.c b/drivers/pci/msi/pcidev_msi=
=2Ec
>> index 5520aff53b56..0b0346813092 100644
>> --- a/drivers/pci/msi/pcidev_msi.c
>> +++ b/drivers/pci/msi/pcidev_msi.c
>> @@ -24,7 +24,7 @@ void pci_msi_init(struct pci_dev *dev)
>>          }
>>
>>          if (!(ctrl & PCI_MSI_FLAGS_64BIT))
>> -               dev->no_64bit_msi =3D 1;
>> +               dev->msi_addr_mask =3D DMA_BIT_MASK(32);
>>   }
>>
>>   void pci_msix_init(struct pci_dev *dev)
=2E.. and the old definition of the flag here, where the comment
explicitly says no_64bit_msi means 32-bit:
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index 41183aed8f5d..a2bff57176a3 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>>
>> [...]
>>
>> @@ -441,7 +448,6 @@ struct pci_dev {
>>
>>          unsigned int    is_busmaster:1;         /* Is busmaster */
>>          unsigned int    no_msi:1;               /* May not use MSI */=

>> -       unsigned int    no_64bit_msi:1;         /* May only use 32-bit=
 MSIs */
>>          unsigned int    block_cfg_access:1;     /* Config space acces=
s blocked */
>>          unsigned int    broken_parity_status:1; /* Generates false po=
sitive parity */
>>          unsigned int    irq_reroute_variant:2;  /* Needs IRQ reroutin=
g variant */
Vivian "dramforever" Wang


