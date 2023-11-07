Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E9F7E36C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 09:38:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cgxvWzSU;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=yQz1d1ZE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPhS65Vxzz3cSJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 19:37:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cgxvWzSU;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=yQz1d1ZE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.84; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPhRC1DWBz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 19:37:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699346215; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=eGd6C/hj4YT811t2TQkv3EZ9dMQK1sMajvhgVSs1Jiy+KQXVyrd6jI/sKF9GgcnaY2
    /pfyF9TPPjEoq/llAJY18XMmrCBColowrMQzkEJr4Tw0v7TtUg2bUpEtPQCAWIX376Z6
    5dcG7ncFrPIfgfvlkBsjBGF7XAohKiWEwfqIiku1Uom2vOOoJtxvKwByK2p/PNOk1Vkm
    m0ocE8ArtgzTVHVnMxOFjq/mo87QTpjxsv+t3kzLUyVtdASA60qg2k77r6ZOQr11krR1
    GroL3455bhJb5AbwxqjBkZMtzlqWVuS0M7J2AzgqGIAGOTYQxZC2EE+E9e9xHO40gcLX
    MxPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1699346215;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=/yTWXyUwphUHVWA8POMnJ2lhlu4tJMAoRMEae1MuHgg=;
    b=ts7rLXfeObIwW1Ts6ODlT/qXFJy1FvTmEiGcoLHOUWx5mE5XUM4eJnrUzt8z4wiNGC
    vdIUNdSVgig22sECRUfqgby2kkYMo4zLqtTCYaunwa7SbhfHSl56eN2YU/4UcUXAuMX+
    Od+Kqn5sra34SBx/1jEi8CAFovJq3P73g+HiBXs+Qybn/8mlPCC8uDcPP+TrMZgbpWBf
    X5OA8oEj4gvFZz3yRxeY649kRxxqXQZvw9B0XX4Yn/qtZ8w5tgi5XIwFUoskPcIDvlxX
    /IJtVeYQ9Lq3O8qfYLOTm3cpSbpf31eBBpOwqRUzTtt49JQDNi/wLr5NUeFJIX2sXMwq
    intw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1699346215;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=/yTWXyUwphUHVWA8POMnJ2lhlu4tJMAoRMEae1MuHgg=;
    b=cgxvWzSUmopRe20J6qWL9wbOvL5189L2Uh5hdCn4BqNxoi5BPuBmr9TxQ0TmkF7eFl
    kG3ZIchjkHcYfK+SIJDZL38v5vxNwmMVaqNmaBa4K3aiB1G5tSnR1jjRQhQ2PoarJ8VR
    DAvSbAKWbeZxrGXCrMNYaK5nCFvu9OfRrSJRMngX4R/5UEYviSKFCIbyUTkO9fxtcts4
    g+NxEu9n3c8gTfGtmFVTwxg0/EASZfU3NBbPGZDktRna1hM+uOtRIUFzYjqz9HysrAAW
    dGXLXw7EKCjnpFmZTqplIPKJNYZt0XvqLkvMQAsdTxgpdZvQxy9/5PzFNIrk2ejfUmiY
    klqQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1699346215;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=/yTWXyUwphUHVWA8POMnJ2lhlu4tJMAoRMEae1MuHgg=;
    b=yQz1d1ZEYB3ykKjgCFGA53xQoPxQMZkyYSED0fB8r1BU9FX1Q23n4Y41R5PRcB46nk
    4eahEG0qym5HI8dysJAw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfi4XXBswJY1yyhzarNQiH/eoGCtrCBurDxRVOQ=="
Received: from [IPV6:2a02:8109:8984:5d00:1c81:233f:a78d:3268]
    by smtp.strato.de (RZmta 49.9.1 AUTH)
    with ESMTPSA id m61756zA78aty6v
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 7 Nov 2023 09:36:55 +0100 (CET)
Message-ID: <0d89bcd0-9b68-4c0a-acd8-2c7532e62f6d@xenosoft.de>
Date: Tue, 7 Nov 2023 09:36:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fbdev issue after the drm updates 'drm-next-2023-10-31-1'
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>, airlied@gmail.com
References: <a1d9e09b-f533-5e2c-7a13-af96647e1a71@embeddedor.com>
 <10D1983F-33EF-46C3-976E-463D1CB5A6E9@xenosoft.de>
 <9bb5fcbd-daf5-1669-b3e7-b8624b3c36f9@xenosoft.de>
 <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
In-Reply-To: <c47fba21-3ae9-4021-9f4a-09c2670ebdbc@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I have found out that fbdev no longer works with virtio-gpu-pci and 
virtio-vga. It is not a problem with the penguin logos.

Could you please check fbdev in QEMU virtual machines with 
virtio-gpu-pci and virtio-vga graphics?

Many thanks in advance,

Christian


On 02 November 2023 at 03:45 pm, Christian Zigotzky wrote:
> Hello,
>
> There is a fbdev issue with the virtio-gpu-pci and virtio-vga. (The 
> penguins are not displayed at boot time)
>
> Error message:  [    0.889302] virtio-pci 0000:00:02.0: [drm] *ERROR* 
> fbdev: Failed to setup generic emulation (ret=-2)
>
> The kernel 6.6 final doesn't have this issue.
>
> Please check the fbdev changes in the drm updates 
> 'drm-next-2023-10-31-1'.
>
> Thanks,
> Christian

