Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DAC3804E5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 10:11:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhLpK6RwDz3bnZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 18:11:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=f4EoKpCs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=85.215.255.23;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=f4EoKpCs; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.23])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhLnn31Jzz2yYY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 18:11:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620979858; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=nd4ukRRMFugrIBZORbohoSRx10X2GTHX06fwwk1UR729WZtA1m8NvX1NY7O1zSWN6F
 LC3jLtZVmmFJZkoXtgNzB2JmkkIh1S0E2raaSW1NeZsHmYrnNnw/jr1qEPrsXzNFVrPR
 +wgU5lAfzEO5r0icLJmAYI0Yb75GCbdAJvtL3RVhPL73gXEQXyRS/5fVZ8OTjoBZQX5K
 56rukhZEpuwFYczpe1klqfERvdLoAcvwBocBQaj9UK9yzbodOQTvgjxb1W5blmhiGUoM
 4QsEtrF/LX4CPdDYuP+YQkIY3n2oqk05rAx1GA1poR6boh8XBMxAFaggX9Cp/9rL2wB9
 a9AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620979857;
 s=strato-dkim-0002; d=strato.com;
 h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
 bh=DRFEqRxbUF4JQepTwytIK0mTO2lW7nm12hqFPYiCzf4=;
 b=X/f61R+LkzVGlbdESqlGv2e0E+BAFv6Yim9Oac604Ypu7XBytVXMjTgG273nSlz6YH
 od/m3549R1x0xKlFqCxTJ+AAPXRFWsRkHb4n1ujw6Uj1IvQfghU2EtNG2fku1jFH5cCU
 bAJm4dvkEQjiqzeySKAWmeRPQojcmWAjvp4NPXv7klSPlkkJITUaSscN18X4wMCRuUDO
 hLfs6i5XH6IQkIDf1sg7PrZ9om+wAJpvvLFV56eKMOVjEFOkKf7rR01h199Tqz7VovBC
 KlicUFQMy9Vw3Q0qho7ws9y6qF47VEIHHxBcUvBKZ93LxU4lqql8I0RBXpcuT28v5Bsq
 HnQA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620979857;
 s=strato-dkim-0002; d=xenosoft.de;
 h=Date:Message-ID:Subject:From:To:Cc:Date:From:Subject:Sender;
 bh=DRFEqRxbUF4JQepTwytIK0mTO2lW7nm12hqFPYiCzf4=;
 b=f4EoKpCsyApSgqXqesdb1fLoqo1WW/ygt1yGOIryuUoAlM0HfdYBXvZBNPb3UnL49e
 s2B3oHqEJjP+brtxeW4xYA2jENgSYairf5nA6yPY4U2fl6xucOGEgerQhZfshvEk9BwC
 OvTcfBK4nf5oUcKeQ/3R579MvfkJDlQncgPrYxPLtdYpeEgnsr/QMoqTRzEmtLdrIf0i
 9Qxo8XTUjrbEHy2gTaQqT1eSGnWul4S1c8EzBiOB28TV4NTCzbNpBmXvKfJmT6xgN60f
 Gj8DgwCkB5ZbVaA2FuYooWV3yU53vTRlY96v7707MgvYUWsXiZQBKWJEOiErN7jCQMZ7
 Dvew==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgHdHphOlL35mNMsyUFLhfF+VwI"
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:dbd:7fae:896a:127c]
 by smtp.strato.de (RZmta 47.25.7 AUTH)
 with ESMTPSA id j00466x4E8Av8gF
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 14 May 2021 10:10:57 +0200 (CEST)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: [FSL P50x0] KVM HV doesn't work anymore
Message-ID: <04526309-4653-3349-b6de-e7640c2258d6@xenosoft.de>
Date: Fri, 14 May 2021 10:10:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

The RC1 of kernel 5.13 doesn't boot in a virtual e5500 QEMU machine with 
KVM HV anymore. I see in the serial console that the uImage doesn't 
load. I use the following QEMU command for booting:

qemu-system-ppc64 -M ppce500 -cpu e5500 -enable-kvm -m 1024 -kernel 
uImage-5.13 -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio 
-netdev user,id=mynet0 -device e1000,netdev=mynet0 -append "rw 
root=/dev/vda" -device virtio-vga -device virtio-mouse-pci -device 
virtio-keyboard-pci -device pci-ohci,id=newusb -device 
usb-audio,bus=newusb.0 -smp 4

The kernel boots without KVM HV.

Have you already tested KVM HV with the kernel 5.13?

Thanks,
Christian


