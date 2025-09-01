Return-Path: <linuxppc-dev+bounces-11566-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB248B3DDF8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 11:20:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFjys6dNRz2xgp;
	Mon,  1 Sep 2025 19:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756718437;
	cv=none; b=Fbh5RB6W7POUEVuQanDlomQ4YOdi6wCUhLM+OrEw0E5qKj1yH3O575vKclyAXs+vjtMr9WPADXFZu8TunwOD2T8H7NklBo9lDv04eME1QIAUSh2DxQompneXXT9ZQ8yTkE5eXnpAExImuUetR7ATMCj9P8aMutR4SlEfRHgO7IE/Uq5GEFvmd4CeyGG7cekQJL6AQOGda3VW6hd+iJ2asIV3C7UQ7CcIB5eISuC7n6/WRGxafPj2YyNeEgCEQKrowRgByrv4cJgrdkMwmC4SH9l+LIl8HEiVNQ+KAaZ4V+sH64Tp0FEITfk/7qm9tH4vOCJ1k2+3Ya2xEfoyDcmlIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756718437; c=relaxed/relaxed;
	bh=2LfziKwwVpku3zsabK4QxVN1CHEV77VC6u4GCKoU6nY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N7vpfKN3iBuuhiKxTF08tRsMfMr58ehuU0XTWLdgRbf0/7zZZOiOFUQZc+GBo+zcbwwoUV1vX2zPXh3FWAdxfNGEhfjzKCFms2FKZBz9bqEGbmYyHDy0ZXg1pIVGob9SEmO9VlkEapXhC7yEgrBM8YAgT4UZcv0mPScCBE4W2VaPWWz8cRV5+l+dqYhfgTTKl3ulxoPP8fR5BETL5tEqH/r6pTHxPYoAY3Ks6TU++K6pmNdmvxtnSfiFVkmDMeCBstpzSf1BBOZ8H00Qj5Z+pCMnmE5Ss2Z6yLEO4AuU2k36J+k0Eik1BIo/3XEZnOSGjG5UB8Nzwf/dud7udP3fgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFjys0khHz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 19:20:36 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cFjlg27GYz9sSn;
	Mon,  1 Sep 2025 11:10:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3NZTwEC2xRh; Mon,  1 Sep 2025 11:10:55 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cFjlg1PMcz9sSm;
	Mon,  1 Sep 2025 11:10:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 17A0B8B78C;
	Mon,  1 Sep 2025 11:10:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 4ohyUc15GJ95; Mon,  1 Sep 2025 11:10:55 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DE2AF8B77B;
	Mon,  1 Sep 2025 11:10:54 +0200 (CEST)
Message-ID: <35c5cd6d-6929-42e5-9505-b38ed316da8b@csgroup.eu>
Date: Mon, 1 Sep 2025 11:10:54 +0200
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
Subject: Re: [PATCH] powerpc/pasemi: Add a null pointer check to the
 pas_setup_mce_regs
To: Kunwu Chan <chentao@kylinos.cn>, mpe@ellerman.id.au, npiggin@gmail.com,
 aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20240117091706.153431-1-chentao@kylinos.cn>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20240117091706.153431-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 17/01/2024 à 10:17, Kunwu Chan a écrit :
> kasprintf() returns a pointer to dynamically allocated memory
> which can be NULL upon failure. Ensure the allocation was successful
> by checking the pointer validity.
> 
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/platforms/pasemi/setup.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
> index 0761d98e5be3..8f98f3b58888 100644
> --- a/arch/powerpc/platforms/pasemi/setup.c
> +++ b/arch/powerpc/platforms/pasemi/setup.c
> @@ -165,6 +165,8 @@ static int __init pas_setup_mce_regs(void)
>   	while (dev && reg < MAX_MCE_REGS) {
>   		mce_regs[reg].name = kasprintf(GFP_KERNEL,
>   						"mc%d_mcdebug_errsta", reg);
> +		if (!mce_regs[reg].name)
> +			return -ENOMEM;

I think you will leak the reference taken with last call to 
pci_get_device() here. I think we need a call to pci_dev_put(dev) before 
bailing out.

By the way there will also be the same leak if the while loop ends when 
reg reaches MAX_MCE_REGS while dev is still not NULL.


>   		mce_regs[reg].addr = pasemi_pci_getcfgaddr(dev, 0x730);
>   		dev = pci_get_device(PCI_VENDOR_ID_PASEMI, 0xa00a, dev);
>   		reg++;


