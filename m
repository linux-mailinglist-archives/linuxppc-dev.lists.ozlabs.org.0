Return-Path: <linuxppc-dev+bounces-4353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 144269F91F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 13:11:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YF5r93tJ1z2ykn;
	Fri, 20 Dec 2024 23:11:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734696713;
	cv=pass; b=cG+aSOkbs07TXZLbVFyj+sisUMEmH4kJ8s7YUsaQ6MXIE59rKLvYIqpiwnAe4hwvef98vZq0E/59CFmzzZFs7DR0Q2OuJanyhCS/EqoyJeR1Cn5M+5VxDdanJm0Tb3W7hKYlPxmEzN2G+PRcCybyJRUPIjF0cMND+ZWGh11KrfTlEA2WzVVLehxFcx/Z6gejmy3CJqjB45llC1uIxzofmu0gF+16Q6oyf7EpUGKI6ll8SH7WlRfXKG+P3YP0sxHESlXzlHAuVZZyeWQPp7lsIK27qCqIDXDHSZlsd5O5bTiyJTtRTfC0EwwvPJERHEEY3W301ywxo4sKB6wgYcGWaA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734696713; c=relaxed/relaxed;
	bh=PvQP4sxCWxo00pvojkQVj6E88DwL5HA3nvNOrPCEIe8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ftwfLaDRTlqxZwgvBT71XviX5rJuZNNwXFM7jbplvfHj1MOobAcaBjvmivmBHHQogmX+/2DlEL+k5IE7RqeF8NIvloijUjtHrx2DXthAlg6lzhkPIh5aX1axVpn8SLfiHD1CJju3k5YZEVKAGlsBAjteX1V/RU1mFrwP11fbzIPkhfme4FD8erFeyDkgEckZLnsN1mcXYWMMscniSx3Kzpge5RXg4djWBA3JB75g2+2Qh7Vx8KocCJVSXQIXE1JS25VxK7eMn99tCYTF9Rpa+vTGlOfMSXGcencl7qies1zcxFhFdBUAdD258pf9H9Wb/q1dwz4FNLnXVxaWihVG9w==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Uvr2MwAs; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=oQGBnigI; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Uvr2MwAs;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=oQGBnigI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YF5r46g0Zz2yL0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Dec 2024 23:11:48 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1734696522; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=l0elB04EA1pgcgDAcpNQvzIXVlJPd43c6rMLHd9UWMtEb1HV7qIRKLh9nv8aQUO76K
    kgSBvGA4LKcSOqqS0gFMZuYceBsbxU0WSSvYNoBg7Ko8+Ur2T+wMKoh9er45FjnD8nFe
    HwLNQbpZ10eYSTqiYIrkUSWF7epSm+ZSia00JgdbCGerlnVK6MbySxd/qjuPE/ImLu/J
    l2OwQNBSE1qQvm4pyDJi7+Px4JtHCCiISPNg39qOIFKSFxrnVNirnBaWmt1idV4+tqv1
    NEXJW+VOxFZplfATR7oycDidwdzTrIWxUHhpSQf1KMBZ/pzg74uHFU/vNN5zrppOlLuB
    zO4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1734696522;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=PvQP4sxCWxo00pvojkQVj6E88DwL5HA3nvNOrPCEIe8=;
    b=UeVL0Fk5AFqOfayUfKoiq9h/tVvlMoTZrcjKqEdCirt4jgMDB06E35wwWCzpwuMMjZ
    ZwM0wxT2ipj6eaQdoieUp0onLFp4vk8+ikyXS2MeciSO0HCvtxGnhgvU0JKnEgDzqBlX
    mlsdWX2XI+YgKRmjzXrd5kzBf7mnVd6qnoAx1GcRltkvaZcKMLJ9Jz6+rfuuo+0O5o2W
    2p5j8fIN7keFWGIa4023hGZfLMLK7A0Y8iY85MLsEOytFvVXhFPwT8rQK0rQ3ogO43Kh
    lmjIwAWVEnyopNYCcMi5cs6wRi79ntoU0PeQxE+AkMKl9Tj6EuTg45N43kg9RibFk0/c
    +5Cw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1734696522;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=PvQP4sxCWxo00pvojkQVj6E88DwL5HA3nvNOrPCEIe8=;
    b=Uvr2MwAs/oZ3eZLbHdDxmlAdSllgIrTilA3QR/PntW97Q3/TZ3BjHN0MmFw2lbWUPA
    LkNIszLz1Q1zjRMlRzXtP+C/HeiF13+cqHFkZfksXsZ0su7Y13KwiJxbYqwManEbGb8L
    dBnTQKcdXLhVpWiKzaYN1FxTZze9auY5qLZSVnjG/MdYSh/ZiyRcASvWjy19UiUI1UaU
    5qAktDlCV6D/ubkEvrmzy3kLBO9Vi2G5N+fT7mINTZEKr9z7y8woelfgpaqHxaqsxLR/
    5hBxRaujYAbCo2q22JJtTyxzHlV3LBg9ojxQ5vDQrUWDGw/BSmdjzPFquUoRLkPFw+PN
    hXwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1734696522;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:To:From:Subject:Date:Message-ID:Cc:Date:From:
    Subject:Sender;
    bh=PvQP4sxCWxo00pvojkQVj6E88DwL5HA3nvNOrPCEIe8=;
    b=oQGBnigIWr7nnXTLEFvd5rWomyQm7nllFmVtn6LXZRnvx3Z2tPwSkf8A/PTEM1XdcW
    sIaYFLNnnr5bmElNatCA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr44+gKidpmhkOpz09kpM="
Received: from [192.168.178.136]
    by smtp.strato.de (RZmta 51.2.16 DYNA|AUTH)
    with ESMTPSA id ebe9c90BKC8f6V1
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Fri, 20 Dec 2024 13:08:41 +0100 (CET)
Message-ID: <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
Date: Fri, 20 Dec 2024 13:08:40 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
Content-Language: de-DE
In-Reply-To: <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 18/12/24 15:41, Christian Zigotzky wrote:
> On 18/12/24 12:10, Christian Zigotzky wrote:
>> Hello,
>>
>> The KVM HV host module doesn't work anymore since the PowerPC updates 
>> 6.13-1 [1] and PowerPC MM updates [2].
>>
>> We have tested it with our FSL P5020/P5040 boards [3].
>>
>> The guest kernel doesn't boot. There is no output via the serial 
>> connection and no output via the graphics card. (QEMU)
>>
>> It boots without the PowerPC updates 6.13-1 [1] and PowerPC MM 
>> updates [2].
>>
>> Is the problem already known? Is there already a solution? I have 
>> seen many Book3S KVM HV updates. Have you perhaps forgotten Book3E?
>>
>> Thanks,
>> Christian
>>
>> [1] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=42d9e8b7ccddee75989283cf7477305cfe3776ff
>> [2] 
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c00ff742bf5caf85f60e1c73999f99376fb865d
>> [3] http://wiki.amiga.org/index.php?title=X5000
>>
>
> I tried to bisect but without success. Link: 
> https://github.com/chzigotzky/kernels/issues/4#issuecomment-2551460323
>
> -- Christian
>
It seems, that the PowerPC updates 6.13-1 aren't responsible for this 
issue. I had to test the PowerPC updates 6.13-1 during the bisect. [1]

Bisecting: 428 revisions left to test after this (roughly 9 steps)
[42d9e8b7ccddee75989283cf7477305cfe3776ff] Merge tag 'powerpc-6.13-1' of 
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux

Result:  git bisect good

There aren't any changes in the PowerPC MM updates [2].

Do you have another idea? I like KVM HV on my FSL P5040 system and use 
it very often for testing. However, KVM HV is hardly used by our users, 
so we could remove it from our kernels if it were not fixed. It would 
save space to remove it.

-- Christian

[1] https://github.com/chzigotzky/kernels/issues/4
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5c00ff742bf5caf85f60e1c73999f99376fb865d

