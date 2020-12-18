Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 158FE2DE886
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 18:50:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyGbj20DWzDqR1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 04:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.220;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=cGPLl5hS; 
 dkim-atps=neutral
X-Greylist: delayed 177 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Dec 2020 04:48:44 AEDT
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.220])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyGZ413Q3zDqPN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 04:48:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608313717;
 s=strato-dkim-0002; d=xenosoft.de;
 h=Date:Message-ID:Cc:Subject:From:To:From:Subject:Sender;
 bh=9mH/NrQMJ0CDP6rtexY7cz/6OuGIdw2DoaGg1scDlZw=;
 b=cGPLl5hSzW4/KMWy/eaCblyICAjfl/1HsRM14yHegqS5oe5AlSNGV43VyJQj7fj1rE
 nUOe48fhoJKXusPYUXpBIjbqgVdmrujpygxY2vpcUf7tfv/XXbVxbGmla6qXVpjv51WM
 o2fRVfryBe7QnTpeG70gHCjvopoYWVHAWxjJ8lhHvlV6KfF3jcvu+R0FefccbgJY2SmB
 fCaiD1J7gG6hJgo5dnQK1xQBsWwxd7Z4E+RnhUY0FGA5TF0+fCvfd0fw9VZJsB0Uvfd5
 /PyZ+8cR8G7P4S4zshhacYsqvsxLTXmKPJJmRnSwe79PCgpu21QQQINlKknMNNmBIcrB
 Nj/w==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhaLuYXGH/N4di62bYTyqxAoAdFpQ=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.9.3 AUTH)
 with ESMTPSA id e00d04wBIHja2RX
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Dec 2020 18:45:36 +0100 (CET)
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Subject: GIT kernel with the PowerPC updates 5.11-1 doesn't boot on a FSL
 P5040 board and in a virtual e5500 QEMU machine
Message-ID: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
Date: Fri, 18 Dec 2020 18:45:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I compiled the latest Git kernel with the new PowerPC updates 5.11-1 [1] 
today. Unfortunately this kernel doesn't boot on my FSL P5040 board [2] 
and in a virtual e5500 QEMU machine [3].

I was able to revert the new PowerPC updates 5.11-1 [4] and after a new 
compiling, the kernel boots without any problems on my FSL P5040 board.

Please check the new PowerPC updates 5.11-1.

Thanks,
Christian


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a5be36b9303ae167468d4f5e1b3c090b9981396
[2] http://wiki.amiga.org/index.php?title=X5000
[3] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage 
-drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw 
root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci -device 
usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
[4] git revert 8a5be36b9303ae167468d4f5e1b3c090b9981396 -m 1
