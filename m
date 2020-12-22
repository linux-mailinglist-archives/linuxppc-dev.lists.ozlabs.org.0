Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9BD2E09F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 13:19:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0b3w16XrzDqLY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 23:19:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=81.169.146.166;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=UBmNigje; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0b0d0x0JzDqDD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Dec 2020 23:16:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608639364;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:From:
 Subject:Sender;
 bh=kiNm4DXGXLmdmYW3w3gKomiOkcikhrWnMZqNuMN+4no=;
 b=UBmNigjeEZxgrD5ioXM65ByCcJxJ65eQ8rwqDycFLVI5AO0mc2TsguQPveOV0YNBQD
 cQJczUKKNrRKvR93Yakv/nZHqw37Zcz1Lx+7bAKo+JHRRqLK2yfa1ZtMS2nXU9eWroa1
 uYSxdGwdXvINBHnK+vbNQ0TQgWTikj5GAas/5Pw7EkLmaC1Lc6uUDtLKzQpgwl/Jf3mk
 8UUMUKDL25AhQybG4gSqbtXJiZmmtr7QdXH20urtdF+N73Ui82bQgUFaDhoChMHrygIW
 90lyF+LDeYwltHXH3D51LEM85Z8HFbZ660bjJzvJnclaiQwIBrRFs2lYjvxO2l24GRIK
 PCuw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgGLCCSDVtFoWTYRiXBE8s7vg=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.10.2 AUTH)
 with ESMTPSA id D06d08wBMCFu2TR
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 22 Dec 2020 13:15:56 +0100 (CET)
Subject: Re: GIT kernel with the PowerPC updates 5.11-1 doesn't boot on a FSL
 P5040 board and in a virtual e5500 QEMU machine
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Denis Kirjanov <kda@linux-powerpc.org>
References: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
 <CAOJe8K3+j3kGHYhSfjyywXcSQFca0Y370LiAa2uVsW5znUPsAA@mail.gmail.com>
 <ad682b81-60f6-4e13-46f4-39539de2be72@xenosoft.de>
 <7543ec1a-005d-f868-5607-448baaccb88a@csgroup.eu>
 <8d25f58b-a7bf-4413-b8cc-ed3bd0107263@xenosoft.de>
Message-ID: <ea93063b-4c8d-7094-b326-2a8568e2fbb4@xenosoft.de>
Date: Tue, 22 Dec 2020 13:15:55 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <8d25f58b-a7bf-4413-b8cc-ed3bd0107263@xenosoft.de>
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
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I compiled the latest Git kernel today and unfortunately the boot issue 
still exists.

I was able to reduce the patch for reverting the changes. In this way we 
know the problematic code now.

vdso-v2.patch:

diff -rupN a/arch/powerpc/kernel/vdso32/vgettimeofday.c 
b/arch/powerpc/kernel/vdso32/vgettimeofday.c
--- a/arch/powerpc/kernel/vdso32/vgettimeofday.c    2020-12-19 
00:01:16.829846652 +0100
+++ b/arch/powerpc/kernel/vdso32/vgettimeofday.c    2020-12-19 
00:00:37.817369691 +0100
@@ -10,12 +10,6 @@ int __c_kernel_clock_gettime(clockid_t c
      return __cvdso_clock_gettime32_data(vd, clock, ts);
  }

-int __c_kernel_clock_gettime64(clockid_t clock, struct 
__kernel_timespec *ts,
-                   const struct vdso_data *vd)
-{
-    return __cvdso_clock_gettime_data(vd, clock, ts);
-}
-
  int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct 
timezone *tz,
                  const struct vdso_data *vd)
  {

----

With this patch, the uImage boots without any problems on my FSL P5040 
board and in a virtual e5500 QEMU machine. Please check the problematic 
code.

Thanks,
Christian



On 19 December 2020 at 01:33pm, Christian Zigotzky wrote:
> On 19 December 2020 at 07:49am, Christophe Leroy wrote:
>>
>>
>> Le 18/12/2020 à 23:49, Christian Zigotzky a écrit :
>>> On 18 December 2020 at 10:25pm, Denis Kirjanov wrote:
>>>  >
>>>  >
>>>  > On Friday, December 18, 2020, Christian Zigotzky 
>>> <chzigotzky@xenosoft.de> wrote:
>>>  >
>>>  >     Hello,
>>>  >
>>>  >     I compiled the latest Git kernel with the new PowerPC updates 
>>> 5.11-1 [1] today. Unfortunately this kernel doesn't boot on my FSL 
>>> P5040 board [2] and in a virtual e5500 QEMU machine [3].
>>>  >
>>>  >     I was able to revert the new PowerPC updates 5.11-1 [4] and 
>>> after a new compiling, the kernel boots without any problems on my 
>>> FSL P5040 board.
>>>  >
>>>  >     Please check the new PowerPC updates 5.11-1.
>>>  >
>>>  >
>>>  > Can you bisect the bad commit?
>>>  >
>>> Hello Denis,
>>>
>>> I have bisected [5] and d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e 
>>> (powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32) [6] is 
>>> the first bad commit.
>>>
>>> I was able to revert this bad commit and after a new compiling, the 
>>> kernel boots without any problems.
>>
>> That's puzzling.
>>
>> Can you describe the symptoms exactly ? What do you mean by "the 
>> kernel doesn't boot" ? Where and how does it stops booting ?
> It stops during the disk initialisation.
>>
>> This commit only adds a new VDSO call, for getting y2038 compliant 
>> time. At the time I implemented it there was no libc using it yet. Is 
>> your libc using it ?
> I tested it with ubuntu MATE 16.04.7 LTS (32-bit userland + 64-bit 
> kernel) and with Debian Sid (MintPPC and Fienix 32-bit userland + 
> 64-bit kernel) on my FSL P5040 board and in a virtual e5500 QEMU 
> machine. How can I figure out if the libc use it?
>>
>> Where can I find all the elements you are using to boot with QEMU ? 
>> Especially the file MintPPC32-X5000.img
> Download: http://www.xenosoft.de/MintPPC32-X5000.tar.gz (md5sum: 
> b31c1c1ca1fcf5d4cdf110c4bce11654) The password for both 'root' and 
> 'mintppc' is 'mintppc'.
>
> QEMU command with KVM on my P5040 board: qemu-system-ppc64 -M ppce500 
> -cpu e5500 -enable-kvm -m 1024 -kernel uImage -drive 
> format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
> user,id=mynet0 -device e1000,netdev=mynet0 -append "rw root=/dev/vda" 
> -device virtio-vga -device virtio-mouse-pci -device 
> virtio-keyboard-pci -device pci-ohci,id=newusb -device 
> usb-audio,bus=newusb.0 -smp 4
>
> QEMU command without KVM on macOS Intel: qemu-system-ppc64 -M ppce500 
> -cpu e5500 -m 1024 -kernel uImage -drive 
> format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
> user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw 
> root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci 
> -device usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
>>
>> Can you also share you kernel config
> See attachment.
>>
>> Thanks
>> Christophe
> Thanks
> Christian
>

