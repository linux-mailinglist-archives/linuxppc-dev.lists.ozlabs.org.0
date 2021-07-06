Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EF63BC527
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 06:10:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJpxx0hqWz3bT7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 14:10:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=p/XvY8HZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.160;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=p/XvY8HZ; 
 dkim-atps=neutral
X-Greylist: delayed 176 seconds by postgrey-1.36 at boromir;
 Tue, 06 Jul 2021 14:10:16 AEST
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.160])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GJpxN0N4yz2yff
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 14:10:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1625544431;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=enpvCkBiv9mX2rhyRuPz7Q7xl2RtsUUw8ZpiwBewiMU=;
 b=p/XvY8HZDTgkyX7cdW+ufMxd0qNxOKHsPnx3CwiBcJRuZ5yKcLf/QTbDnQFjOC3fj+
 hLXbcTyTBjxU8nCm/exnZfIocTBj4v39h1d3/0QkoDDR1M5cJF+R+P8Zmr7gRu61HH+I
 frOP7paIhmC6FDs1JU1e4uAwoW5eR1+438+y0groGE5viMMFQ81f6tnKQtZ68QJwoync
 y15Fbj6Z7VzxMSAHFKJXqzfdk0XpndJljyL/Gqtz2Uyu6u3Vug2qqNnAkDDvv64/SwNt
 TFTFrKeelIObHAyOoE36bCHfV2X0tGsfb1KuqxYDdPhUlZGqWzFnFngQiuIuH4IZhUUo
 fizw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedV4hZQiYXCAp5NvAFQLZ6qz+82lPIQ+Kpiqc9QE4Dk="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a01:598:a836:4cf1:99aa:a47:c6b4:edee]
 by smtp.strato.de (RZmta 47.28.1 AUTH)
 with ESMTPSA id D02c3ax6647AOZP
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 6 Jul 2021 06:07:10 +0200 (CEST)
Subject: Re: [FSL P50xx] IRQ issues
To: Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <86de3024-c025-ec65-a45a-264585730c4a@xenosoft.de>
 <cc1b16c0-47d5-2c50-fba0-9e1aa014ee8a@xenosoft.de>
 <1625527692.m58rsysc62.astroid@bobo.none>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <8ba2f5a3-5fc8-042b-a738-7545f8fbcf4d@xenosoft.de>
Date: Tue, 6 Jul 2021 06:07:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1625527692.m58rsysc62.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: de-DE
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

Thanks a lot for your patch! We will test it as soon as possible. You're 
right that this issue doesn't exist in a virtual e5500 QEMU machine.

Have a nice day,
Christian

On 06 July 2021 at 01:36 am, Nicholas Piggin wrote:
> Excerpts from Christian Zigotzky's message of July 6, 2021 4:49 am:
>> Hi All,
>>
>> Our FSL P50xx machines don't boot anymore because of IRQ issues. [1]
>>
>> Please check the IRQ changes in the latest PowerPC updates 5.14-1. [2]
>>
>> Thanks,
>> Christian
>>
>> [1]
>> https://forum.hyperion-entertainment.com/download/file.php?id=2592&mode=view
>> [2]
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=019b3fd94ba73d3ac615f0537440b81f129821f6
> This looks like mtmsrd in the 64e code. I think this should fix it.
>
> QEMU does not seem to trap on this, maybe something to improve.
>
> Thanks,
> Nick
> --
>
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
> index 4063e8a3f704..d4212d2ff0b5 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -311,9 +311,13 @@ END_BTB_FLUSH_SECTION
>   	 * trace_hardirqs_off().
>   	 */
>   	li	r11,IRQS_ALL_DISABLED
> -	li	r12,-1 /* Set MSR_EE and MSR_RI */
>   	stb	r11,PACAIRQSOFTMASK(r13)
> +#ifdef CONFIG_PPC_BOOK3S
> +	li	r12,-1 /* Set MSR_EE and MSR_RI */
>   	mtmsrd	r12,1
> +#else
> +	wrteei	1
> +#endif
>   
>   	/* Calling convention has r9 = orig r0, r10 = regs */
>   	mr	r9,r0

