Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE93D2DEBC0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Dec 2020 23:51:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyPGy6Ft1zDqXr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 09:51:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.165;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Vz84Ibvb; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.165])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyPFJ3Vp4zDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 09:49:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608331768;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:From:
 Subject:Sender;
 bh=I+EyRih13YAOsyXemt6zlr57fRWfpI+XjggNhtN1ShU=;
 b=Vz84IbvbhO39tPlDFNhnSlHqlgVa1lcJpXBmj2cEPTrlHo8hbSl0nauYwKIkmiMML6
 GUxUR1mAHKnqj/tZY1zAj3VCV95vuRpV0p0AQfL06K3iNDycVMZd48uwjzInD97chNKK
 KxECHkcuQTmu4ytV4Tz+js+kA1KD0VYP9tobqK08yLYz+mufhtbys4Yn+BSvH+VJpK93
 4YJg5cGrczUodgGXlejZzbOM8r+rT56ghOi7BUzF3JGQdZASwV1TLLrYWKTV+dInTTsG
 3HbFc/frJdCKptXaUBysKYyd4LvOPmbSAnYdr66ejzaJSu5B+6+PjPNVHq//2zhGmV5H
 RmLw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgBL+NzCe1/qJuHXg+BWx9zIxDDPQ=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.9.3 AUTH)
 with ESMTPSA id e00d04wBIMnQ2sa
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Fri, 18 Dec 2020 23:49:26 +0100 (CET)
Subject: Re: GIT kernel with the PowerPC updates 5.11-1 doesn't boot on a FSL
 P5040 board and in a virtual e5500 QEMU machine
To: Denis Kirjanov <kda@linux-powerpc.org>
References: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
 <CAOJe8K3+j3kGHYhSfjyywXcSQFca0Y370LiAa2uVsW5znUPsAA@mail.gmail.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <ad682b81-60f6-4e13-46f4-39539de2be72@xenosoft.de>
Date: Fri, 18 Dec 2020 23:49:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <CAOJe8K3+j3kGHYhSfjyywXcSQFca0Y370LiAa2uVsW5znUPsAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18 December 2020 at 10:25pm, Denis Kirjanov wrote:
 >
 >
 > On Friday, December 18, 2020, Christian Zigotzky 
<chzigotzky@xenosoft.de> wrote:
 >
 >     Hello,
 >
 >     I compiled the latest Git kernel with the new PowerPC updates 
5.11-1 [1] today. Unfortunately this kernel doesn't boot on my FSL P5040 
board [2] and in a virtual e5500 QEMU machine [3].
 >
 >     I was able to revert the new PowerPC updates 5.11-1 [4] and after 
a new compiling, the kernel boots without any problems on my FSL P5040 
board.
 >
 >     Please check the new PowerPC updates 5.11-1.
 >
 >
 > Can you bisect the bad commit?
 >
Hello Denis,

I have bisected [5] and d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e 
(powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32) [6] is the 
first bad commit.

I was able to revert this bad commit and after a new compiling, the 
kernel boots without any problems.

Thanks,
Christian

[5] https://forum.hyperion-entertainment.com/viewtopic.php?p=52077#p52077
[6] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e

 >
 >
 >
 >     Thanks,
 >     Christian
 >
 >
 >     [1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a5be36b9303ae167468d4f5e1b3c090b9981396
 >     [2] http://wiki.amiga.org/index.php?title=X5000
 >     [3] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel 
uImage -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio 
-netdev user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw 
root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci -device 
usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
 >     [4] git revert 8a5be36b9303ae167468d4f5e1b3c090b9981396 -m 1
 >

