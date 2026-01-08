Return-Path: <linuxppc-dev+bounces-15406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B46FCD01431
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 07:41:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmwL11tNNz2yG7;
	Thu, 08 Jan 2026 17:41:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.81
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767854505;
	cv=none; b=V6U0KCWgaZ91Ty2YRhH/UwmY7ekG4RO2+7AKDQwH1duz2nwFV45A/lcks0hCCn3f3XVePHoKss/nqD7u7K1ytcLOZHRWZEJv2vvqwW2rad0xmVx2Ajl1wTi93e1KNSq/Cx14TGnmdpYEF9RfsxbeYB6Jin1LOWu5unqLZ68nAdoJi6rmnhRY6L+jFtRHueVN3CLtgOb0SNe10WcCFLFFUzkffwO8HYN4Yo4+r0xKOGeZ4I9AKeJq3BouhEpFJUu02NdH1VJ0xfRMsXzvuxyS/ROGLjsy80uW9z7WHulbLRvGRTGU6cGJEHNQ3wZM0z94t5rBrmXmEtd1iuTPIjvx0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767854505; c=relaxed/relaxed;
	bh=YDbc+qZOZtf5UNx5Pi4nUjCnY9RB8u7XrJSj4+AvA7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h71WPwrFeYebSQc9ShqMjNivlWWJ0M3VpZH/roE32p+zqpDHdpzhm9Cj+4+NtdEjhNri9+OSHRDKtllHnsdKYbvThouI39F1g+DNuGECSCsW8+R4cV3ISFvVeJYYOZRkFAan9lD/W/RPW0rNbhYnRj6ggc+QOO96fy8Ay8co11g+hxd50nsoVmahh1IGY/1/BlPM/lpR0YJsf6Rkz616tlBdM75zQDwcpWR9ViOXKEb6Dn4PgVA+F7kBNbwkmN63H3VsAk0oVyNvX2juvQW4hv+ZENCuaU0OARjxX4qRTvpf0vwWBjRLOgQmRGAQywlwbdCdy2nRckpjbjax4Sqluw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.81; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmwKz6Nwbz2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 17:41:42 +1100 (AEDT)
Received: from [192.168.0.105] (unknown [114.241.82.145])
	by APP-03 (Coremail) with SMTP id rQCowACXtt2SUV9pJAwYBA--.18933S2;
	Thu, 08 Jan 2026 14:41:23 +0800 (CST)
Message-ID: <8c16931b-8637-43c3-a2db-5c66d8865124@iscas.ac.cn>
Date: Thu, 8 Jan 2026 14:41:22 +0800
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
Subject: Re: [PATCH 3/5] drm/radeon: Raise msi_addr_mask to 40 bits for
 pre-Bonaire
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Brett Creeley <brett.creeley@amd.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
 <20251224-pci-msi-addr-mask-v1-3-05a6fcb4b4c0@iscas.ac.cn>
 <15ec03f3-f0cf-45f7-b7f6-98b075533d3e@amd.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <15ec03f3-f0cf-45f7-b7f6-98b075533d3e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACXtt2SUV9pJAwYBA--.18933S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uFy5KrWUGFyUtw18Jr1rCrg_yoW8Cw4Upa
	y8Ga98KrZIy34jkay7u39rZF1Yya10kayrWrZrK343u34Yvry2gFZIv3WUJa4kXr1ktw4j
	vFyUG3W8ZFn5CaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRNJ5oDUUUU
X-Originating-IP: [114.241.82.145]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 1/7/26 23:20, Christian König wrote:
> On 12/24/25 04:10, Vivian Wang wrote:
>> The code was originally written using no_64bit_msi, which restricts the
>> device to 32-bit MSI addresses.
>>
>> Since msi_addr_mask is introduced, use DMA_BIT_MASK(40) instead of
>> DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
>> precisely and allowing these devices to work on platforms with MSI
>> doorbell address above 32-bit space, as long as it is within the
>> hardware restriction of 40-bit space.
>>
>> Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
>> ---
>>  drivers/gpu/drm/radeon/radeon_irq_kms.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> index d550554a6f3f..ea519d43348b 100644
>> --- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> +++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
>> @@ -251,8 +251,8 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
>>  	 * IBM POWER servers, so we limit them
>>  	 */
>>  	if (rdev->family < CHIP_BONAIRE) {
>> -		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
>> -		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
>> +		dev_info(rdev->dev, "radeon: MSI limited to 40-bit\n");
>> +		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(40);
> Well, that is not even remotely correct.
>
> Please move that close to the dma_set_mask_and_coherent() call in radeon_device_init() (file radeon_device.c).
>
> The check there is most likely already what you need. Should be pretty straight forward.

Thanks. In that case, maybe this msi_addr_mask thing was overcomplicated
after all. Maybe coherent_dma_mask is just the right thing to check anyway.

I'll see if I can figure something out. Of course I need to keep the
logic for Power still working...

Vivian "dramforever" Wang


