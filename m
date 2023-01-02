Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDDB65ACF9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 04:34:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NlhLM0b2Lz3bby
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Jan 2023 14:34:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cuyVOCGQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=cuyVOCGQ;
	dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NlhKM4NRrz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Jan 2023 14:33:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672630364;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=wH6ZUO7J0AcIxk2tWtudQmGG68BDM/GwIGysI7jFImo=;
    b=cuyVOCGQmhucqHo2nu4OSy99epbVxEov/5GuYvP8X7D6eWyz6ESBcG9FoDJQXo0SJj
    OB8gk1QueDdrgPkOmOCe2hNwBGNrvTqevFKl1f8todOs8fiLaStLvpnf4PY+hlRDsQhT
    E4saWVErlqi3pKDoYX9rRW3a+4hJQfq9PbKrqWLF53plBtluYeJ0emWFFNfYIdO0mX9c
    7aXUeeM2dji9yI9lqEm4b4Y6AIh7JUXfb8FC6rr+/3doT/IHydDVbk0b2BBTGld37xN0
    +C4ck51Gwu6ZOMPz0BBwQv4npNYW1KOinJ1tFKx37Dii2QvmqKbmVOsGah6yhGxW2DvI
    onDQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjX4M5RB1pvK++FgVycZqCWMJGghA=="
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:29da:718a:6882:44e8]
    by smtp.strato.de (RZmta 48.2.1 AUTH)
    with ESMTPSA id e28afdz023WgFTc
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 2 Jan 2023 04:32:42 +0100 (CET)
Message-ID: <8be26a07-3f48-cd61-1b74-1605827bfae3@xenosoft.de>
Date: Mon, 2 Jan 2023 04:32:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [FSL P50x0] DPAA Ethernet issue
To: Sean Anderson <seanga2@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 "David S. Miller" <davem@davemloft.net>
References: <0bfc8f3d-cb62-25f4-2590-ff424adbe48a@xenosoft.de>
 <a40020bd-c190-4283-1977-9e4d9627b888@gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <a40020bd-c190-4283-1977-9e4d9627b888@gmail.com>
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
Cc: darren@stevens-zone.net, madskateman@gmail.com, sean.anderson@seco.com, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, rtd2@xtra.co.nz, Jakub Kicinski <kuba@kernel.org>, matthew@a-eon.biz, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, info@xenosoft.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 01 January 2023 at 07:11 pm, Sean Anderson wrote:

Thank you for testing this. Unfortunately, I have no P-series hardware,
so I was unable to test the 10gec/dtsec parts of this conversion. I had
hoped that this would get tested by someone with the hardware (at NXP)
before now, but it seems you get to be the "lucky" first user.

I see you have labeled one of your kernels as supporting QEMU.  Do you
happen to have instructions for running Linux on QEMU?

Can you try the following patch. I think my mail client will mangle it,  
so I have also attached it to this email.

------------

Hi Sean,

Thanks a lot for your answer.

I use the virtio-net device in a virtual e5500 QEMU/KVM HV machine. [1] [2]

I will test your patch as soon as possible.

Thanks,
Christian

[1] QEMU command: qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 
-kernel uImage-6.2 -drive 
format=raw,file=void-live-powerpc-20220129.img,index=0,if=virtio -netdev 
user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
root=/dev/vda2" -device virtio-gpu -device virtio-mouse-pci -device 
virtio-keyboard-pci -device pci-ohci,id=newusb -audiodev 
id=sndbe,driver=pa,server=/run/user/1000/pulse/native -device 
usb-audio,bus=newusb.0 -enable-kvm -smp 4 -fsdev 
local,security_model=passthrough,id=fsdev0,path=/home/amigaone/Music 
-device virtio-9p-pci,id=fs0,fsdev=fsdev0,mount_tag=hostshare

[2] https://forum.hyperion-entertainment.com/viewtopic.php?p=46749
