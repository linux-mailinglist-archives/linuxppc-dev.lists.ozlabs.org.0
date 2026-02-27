Return-Path: <linuxppc-dev+bounces-17330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIe/AM4qoWkcqwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17330-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 06:25:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDC81B2D71
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 06:25:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMcGx36Sgz2xMt;
	Fri, 27 Feb 2026 16:25:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772169929;
	cv=none; b=W7syKDOlyC8TDpUAdtccyr9ENJejpeW9E0V9RvPRExiQ+DSPaDOJGATDixYWhObCJ4fPnSjC7LjTiFCHPqTqOmfn1Hc8VCo/FUMQdzI92Eva3bYgytGmn6MLVulilOomPuy6wTSfUurd/sFn1Xz9H05bkgyaE/h22Q7acIQEXoQX7yMyEaOc8iQOhoKxq7SRvjBPHV6AkBBd2OLE9JjbANGL0H5x33OOHKA//WC8Clg/lpDq/QoCjESLyT7Q8qAiJtIr5kulFWDXvxAO3E5VlER1U/ogNfUk7fnwe5LjnHLr792HLqeTN8/Y63S0ET5OilIaO07Qnx3X4386yEpQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772169929; c=relaxed/relaxed;
	bh=UrQTgr8Z2Zj/VgbjC2bHNzR3OxdGv7iQW5hB/FUCfvU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MJQgtrv18iimCwB+SAJV+c/pLbbWbPyjjE9VExK7kefcJku4hS5ipZfX5rEN/nHekGfqpf3FgHZI4KfeHsCn3X/s+xKy2EJZqLLU6uqfmvmRY+8wsG0++rwsXPQOcRl9Pm5I8l7p5uOy7R99NVMDNG7H/+o5qwd9Tu+s7eLmAU2IEDSdNeBvpldpv515R1vPs+a/ZK7aYue4uN0MAcIOru5SJ10V8Glh6JjUVFMspbL094Jtm3QwtZXAf8SpIplucfdLfJlg483maUIascTA14wogozcuyVV5ZKTDlJaCyeOjWWTgE52anFFQkPr3hXvj/yHBxj76Xw871F60DyZAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMcGw03vrz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 16:25:26 +1100 (AEDT)
Received: from [192.168.0.103] (unknown [123.118.222.47])
	by APP-01 (Coremail) with SMTP id qwCowABH72qvKqFp4fXQCA--.7323S2;
	Fri, 27 Feb 2026 13:25:04 +0800 (CST)
Message-ID: <c9329ae2-721d-4127-9380-b1ea454bd8f2@iscas.ac.cn>
Date: Fri, 27 Feb 2026 13:25:03 +0800
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
Subject: Re: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
To: Mark Bloch <mbloch@nvidia.com>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Brett Creeley <brett.creeley@amd.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Thomas Gleixner <tglx@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
 Maor Gottlieb <maorg@nvidia.com>
References: <20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn>
 <20260129-pci-msi-addr-mask-v4-1-70da998f2750@iscas.ac.cn>
 <fb23d54a-fca0-43a2-ae1d-03ae52112192@nvidia.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <fb23d54a-fca0-43a2-ae1d-03ae52112192@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:qwCowABH72qvKqFp4fXQCA--.7323S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrykArWkCrW7tr1xAr48tFb_yoW8Gr4fpF
	WDWF4rtF4UKry7t39Fvw1DZF45Zws5Z3s3Wry5twnakan0v3W2qr1qyr4aga42gr48Jw4Y
	kryjgw1vqrs8Z37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvE14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka
	0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
	evJa73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [123.118.222.47]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:mbloch@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:brett.creeley@amd.com,m:gaohan@iscas.ac.cn,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:tiwai@suse.de,m:maorg@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_TO(0.00)[nvidia.com,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17330-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.807];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2DDC81B2D71
X-Rspamd-Action: no action

On 2/27/26 02:25, Mark Bloch wrote:

> On 29/01/2026 3:56, Vivian Wang wrote:
>> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
>> implement less than 64 address bits. This breaks on platforms where such
>> a device is assigned an MSI address higher than what's reachable.
>>
>> Currently, the no_64bit_msi bit is set for these devices, meaning that
>> only 32-bit MSI addresses are allowed for them. However, on some
>> platforms the MSI doorbell address is above the 32-bit limit but within
>> the addressable range of the device.
>>
>> As a first step to enabling MSI on those combinations of devices and
>> platforms, conservatively generalize the single-bit flag no_64bit_msi
>> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
>> with msi_mask.)
>>
>> The translation is essentially:
>>
>> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
>> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
>> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
>>
> Hey Vivian,
>
> We are seeing issues while reloading mlx5 on a PPC64 platform.

Mea culpa. There's a fix on the list [1] since last Friday. I'm not sure
why it hasn't moved yet, but please take a look.

Vivian "dramforever" Wang

[1]: https://lore.kernel.org/all/20260220070239.1693303-1-nilay@linux.ibm.com/


