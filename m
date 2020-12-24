Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1817D2E27D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 16:03:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1tcS3hdhzDqSr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Dec 2020 02:03:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.167;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=OVwnuXlW; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.167])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1tb043fmzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Dec 2020 02:02:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608822119;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:From:
 Subject:Sender;
 bh=EWoGBeWf8hTShx/Ld/bF3iqBBIWydj6zDtfstXIbmI0=;
 b=OVwnuXlWJUeOKJVxbkVg33SUEuq36W/r1T5jUPLBr0h3ILQMOfAX4QHwIl+8NWkwx5
 sDgx96e+e5m+6bzwUaAXkZoqXQJ+jZs79Zm+1D0jkmwkApGA7ZkkKaBrDoaqx8MvaBVJ
 btrDg4QVpAx8P7Vck4dE/KPkVa9qTqitP4G5WuAQ4J9DO4al+tjPokwncinbdAyfw1ul
 2u4sOOc1ab/irOEmB7Fc2b0FIKdqi80hxIjmBeroyt/mpGdXzejdTH73DwgTYrZOLNY/
 xBsNWjG1XSTuuKi11ZZlDFINEtR14rCxcBr+CtG4XswuGko8ey/1rOLvIAdzxbO++LbC
 UfFA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgCIkxmEVIuDnVOhBk8w5Nouy6DZQ=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.10.7 AUTH)
 with ESMTPSA id j010fdwBOF1X25D
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 24 Dec 2020 16:01:33 +0100 (CET)
Subject: Re: GIT kernel with the PowerPC updates 5.11-1 doesn't boot on a FSL
 P5040 board and in a virtual e5500 QEMU machine
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Denis Kirjanov <kda@linux-powerpc.org>
References: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
 <CAOJe8K3+j3kGHYhSfjyywXcSQFca0Y370LiAa2uVsW5znUPsAA@mail.gmail.com>
 <ad682b81-60f6-4e13-46f4-39539de2be72@xenosoft.de>
 <7543ec1a-005d-f868-5607-448baaccb88a@csgroup.eu>
 <8d25f58b-a7bf-4413-b8cc-ed3bd0107263@xenosoft.de>
 <87lfdq6l03.fsf@mpe.ellerman.id.au>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <01a9a678-a541-d338-ccf1-17f9596ca0f9@xenosoft.de>
Date: Thu, 24 Dec 2020 16:01:31 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87lfdq6l03.fsf@mpe.ellerman.id.au>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22 December 2020 at 02:14pm, Michael Ellerman wrote:
> Christian Zigotzky <chzigotzky@xenosoft.de> writes:
> ...
>> Download: http://www.xenosoft.de/MintPPC32-X5000.tar.gz (md5sum:
>> b31c1c1ca1fcf5d4cdf110c4bce11654) The password for both 'root' and
>> 'mintppc' is 'mintppc'.
> ...
>> QEMU command without KVM on macOS Intel: qemu-system-ppc64 -M ppce500
>> -cpu e5500 -m 1024 -kernel uImage -drive
>> format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev
>> user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw
>> root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci -device
>> usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
> I was able to boot the above (on powerpc, but not using KVM), using my
> fixes branch.
>
> Please give that branch a test:
>    https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=fixes
>
>
> cheers
Hello Michael,

I tested your fixes branch today and the kernel boots without any problems.

Thanks a lot for fixing the issue.

Merry Christmas,

Christian
