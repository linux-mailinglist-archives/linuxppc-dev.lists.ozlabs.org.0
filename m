Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C643092D565
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 17:54:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mB0b2hv2;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=s9tWOi+0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK2V946Dsz3cXB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 01:54:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=mB0b2hv2;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=s9tWOi+0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK2TQ4Plfz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 01:53:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1720626794; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=dhyLrJQzKZA7DetdcIkoUYtZlOXNv9rpWJSMJ1R8xg3HZ17NsO/MiB7gNWrRq4AQsR
    Yjo4Hzoa8yiHhcXYa7fHcMvPFMWY1iWzcWhPF6PrUb7VupUhq/i6AYU7xayzNk6Jusmn
    YCRMg2FnwtEZQGQSa7gCBiWh+XRSNll2h4TLtx3SR5Mt+f7Hag30zFNzQl6D49eJOxMM
    8ftPOku0iqPE4mt+7mIPMHaxPBE6HtS6MFGlR2J3Kfnil/Rj7nKMDpaCYP2iVMQ2tTDW
    TJJW6WAnAG3dBTyFXR9rFjzFhn3vPZ3zOBMudrqGC/+1/1YxnLkn5HmJfSPlp/Za4hgz
    lO5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1720626794;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=PfucqSUYS+2Wqh2OLAbjFuyLzje/ymDp4Oy7t2u0uA0=;
    b=lBpxtWNEWFrbQreyJFuFetyh8+Xzg2YZmlmdGeJv+GadRZTKuQ1oPXMvJF5fSPriun
    9U+Qmx9GEVKBm+GYdAZVAqy9cAo636MY57EyiFTEFOWifdHBS46CK1IyfVR/61hxFY0Q
    yPWma5hStpR8ZB0/5e+CrdW2/GPip0UVTk5JttHnwWbEeAnHnbqD21p1Z2eqy7hkRGeM
    BIXCwlOvDuPPsSI8xg/VGbm7sR8JPJJ4OZQO+hrPd2wFVEWTF4gBCfDfkuyssOKzVlOp
    dCi0GzrKehgSNexdBlrYu5ckQ0OVlj2xS3DUoOkOL2RORjnxuFOXdwZjIodGs1GVUwQF
    apAg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1720626794;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=PfucqSUYS+2Wqh2OLAbjFuyLzje/ymDp4Oy7t2u0uA0=;
    b=mB0b2hv2DF7m2tJU8+UeYYjmV1OWNT3FOg7UskOUsY9kG5UD+YRN6a/NbDuqV6lnJe
    EAsLJTOZB5MOQ/g0SUx4GScLEWFIyjOK81hHuaIFjek46OXtoivmxnZ9x9m7+yPAIjeO
    3X+aSnN9XzBB67BG4AkJXnzuA6NFigknCWsx2aoNz5umCnkBBNNJwVw0QUoX8b7uVvIA
    YfafM+btmLzLMmYMZNe7+zpJ7x8neS2tvUUR+DzA9R1u3pVckp+3PgwNTNhkIKCtc4qd
    c/Xwjx4LzBj0bkGlqug+4ySGweA1Yr7EwU9yvM/mYNfB9ltJYMMgyx6h0d+Dwbwet1Dq
    3aEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1720626794;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=PfucqSUYS+2Wqh2OLAbjFuyLzje/ymDp4Oy7t2u0uA0=;
    b=s9tWOi+05jDhMZ4ulq0O7cTH5q6ijzd2PTvo/v6DMvg9kuaq2O0DEE8bJuHkTmJtcJ
    IN8tv3s9q3j0NQSg4tAw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43JwmbXmfCciixhc6PQvMamQd/ks6Pmy/QEdWPbg="
Received: from [IPV6:2a01:599:807:3814:9744:3840:d777:9185]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e0838906AFrClkR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 10 Jul 2024 17:53:12 +0200 (CEST)
Message-ID: <56b743eb-7d21-4432-b44d-909a5ce0f259@xenosoft.de>
Date: Wed, 10 Jul 2024 17:53:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
To: Rob Herring <robh@kernel.org>
References: <aeaa9b78-5853-473e-b985-b10241e88e0d@xenosoft.de>
 <8FDD860C-4DA4-46EF-BAD6-8F68837DA993@xenosoft.de>
 <c8010a06-9d8d-466a-9a83-ee25950f1885@xenosoft.de>
 <CAL_JsqJE+YZY3h+MZ0wzT2SZ5dLq_zR1iteNcdLUOoVPwKkxRw@mail.gmail.com>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <CAL_JsqJE+YZY3h+MZ0wzT2SZ5dLq_zR1iteNcdLUOoVPwKkxRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: apatel@ventanamicro.com, DTML <devicetree@vger.kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Marc Zyngier <maz@kernel.org>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10.07.24 17:05, Rob Herring wrote:
> On Tue, Jul 9, 2024 at 9:53 PM Christian Zigotzky
> <chzigotzky@xenosoft.de> wrote:
>> Hi All,
>>
>> The RC7 of kernel 6.10 boots without any problems [1] if we use the
>> second irq patch [2]. Is it possible to add this patch to the mainline
>> kernel?
> Yes, sent it to Linus yesterday.
>
> Rob
Great! Thank you very much! :-)

Christian
