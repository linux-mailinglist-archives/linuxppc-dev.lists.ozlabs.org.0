Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 656EE372C53
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 16:44:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZN0T3XNxz2yjH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 00:44:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZN03651Sz2xfr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 00:44:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FZN010cxSz9sW7;
 Tue,  4 May 2021 16:44:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z0cs786sijev; Tue,  4 May 2021 16:44:17 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FZMzz2jzrz9sW9;
 Tue,  4 May 2021 16:44:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FAE78B78D;
 Tue,  4 May 2021 16:44:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id byetipLJV-xQ; Tue,  4 May 2021 16:44:15 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A0D808B7B1;
 Tue,  4 May 2021 16:44:14 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <c5b0ac7c-525f-0208-7587-c90427eae137@xenosoft.de>
 <0886c1dc-e946-69cb-a0a9-57247acfd080@csgroup.eu>
 <9864cd72-f1aa-4cf5-1cda-b3a10233b24d@xenosoft.de>
 <1b0307be-05cd-ab62-8b22-75ffb59ff76b@csgroup.eu>
 <daace050-6233-77ea-4517-0fd3c4b21057@xenosoft.de>
 <30f559f4-b50a-de63-94e1-761022468684@csgroup.eu>
 <c9a692b4-0ac0-d595-10fa-c3213b1518fc@xenosoft.de>
 <3b7daea5-7b2b-a089-0427-3becb986b6f5@csgroup.eu>
 <1502fb22-680c-7393-238c-f82570806717@xenosoft.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b91adffe-aec9-2328-eb3c-553009ad663b@csgroup.eu>
Date: Tue, 4 May 2021 16:44:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <1502fb22-680c-7393-238c-f82570806717@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/05/2021 à 11:46, Christian Zigotzky a écrit :
> Am 04.05.21 um 11:11 schrieb Christophe Leroy:
>>
>>
>> Le 04/05/2021 à 11:09, Christian Zigotzky a écrit :
>>> Am 04.05.21 um 10:58 schrieb Christophe Leroy:
>>>>
>>>>
>>>> Le 04/05/2021 à 10:29, Christian Zigotzky a écrit :
>>>>> On 04 May 2021 at 09:47am, Christophe Leroy wrote:
>>>>>> Hi
>>>>>>
>>>>>> Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
>>>>>>> Hi Christophe,
>>>>>>>
>>>>>>> Thanks for your answer but I think I don't know how it works with the cherry-pick.
>>>>>>>
>>>>>>> $ git bisect start
>>>>>>
>>>>>> As you suspect the problem to be specific to powerpc, I can do
>>>>>>
>>>>>> git bisect start -- arch/powerpc
>>>>>>
>>>>>>
>>>>>>> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
>>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>>
>>>>>> You said that powerpc-5.13-1 is bad so you can narrow the search I think:
>>>>>>
>>>>>> git bisect bad powerpc-5.13-1
>>>>>> git bisect good 887f3ceb51cd3~
>>>>> I tried it but without any success.
>>>>>
>>>>> git bisect bad powerpc-5.13-1
>>>>>
>>>>> Output:
>>>>> fatal: Needed a single revision
>>>>> Bad rev input: powerpc-5.13-1
>>>>
>>>> I don't understand, on my side it works. Maybe a difference between your version of git and mine.
>>>>
>>>> In that case, just use the SHA corresponding to the merge:
>>>>
>>>> git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>
>>>> Christophe
>>> Do you use a BookE machine?
>>
>> No I don't unfortunately, and I have tried booting in QEMU a kernel built with your config, but it 
>> freezes before any output.
> You can use my kernels and distributions.
> 
> Download Fedora 28 PPC64: http://www.xenosoft.de/fedora28-2.img.tar.gz
> Download size: 4.1 GB
> MD5 checksum: 1784ca69651531522161498720a89414
> 
> Default username and password:
> Username: amigaone
> Password: amigaone
> Root Password: amigaone
> 
> You can start the MATE desktop with "startx".
> 
> Download MintPPC (Debian Sid) PPC32: http://www.xenosoft.de/MintPPC32-X5000.tar.gz
> MD5 checksum: b31c1c1ca1fcf5d4cdf110c4bce11654
> 
> The password for both 'root' and 'mintppc' is 'mintppc'.
> 
> Download kernel 5.12.0 for the AmigaOne X5000 and for the virtual e5500 QEMU machine without the bad 
> commit: http://www.xenosoft.de/linux-image-5.12-X1000_X5000.tar.gz
> Download git kernel for the AmigaOne X5000 and for the virtual e5500 QEMU machine with the bad 
> commit: http://www.xenosoft.de/linux-image-5.13-alpha3-X1000_X5000.tar.gz
> 
> QEMU command with KVM on the X5000: qemu-system-ppc64 -M ppce500 -cpu e5500 -enable-kvm -m 1024 
> -kernel uImage -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev user,id=mynet0 
> -device e1000,netdev=mynet0 -append "rw root=/dev/vda" -device virtio-vga -device virtio-mouse-pci 
> -device virtio-keyboard-pci -device pci-ohci,id=newusb -device usb-audio,bus=newusb.0 -smp 4
> 
> QEMU command for Fedora 28 without KVM and with VNC connect: qemu-system-ppc64 -M ppce500 -cpu e5500 
> -m 1024 -kernel uImage -drive format=raw,file=fedora28-2.img,index=0,if=virtio -netdev 
> user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw root=/dev/vda" -device virtio-vga 
> -usb -device usb-ehci,id=ehci -device usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
> 
> QEMU command for MintPPC without KVM and with VNC connect: qemu-system-ppc64 -M ppce500 -cpu e5500 
> -m 1024 -kernel uImage -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
> user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw root=/dev/vda" -device virtio-vga 
> -usb -device usb-ehci,id=ehci -device usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1

It doesn't work, it remains stuck.

But I'm probably not in the best situation: I'm on a PC running Windows 7, with Virtualbox running 
Fedora core 33 and I try to run powerpc QEMU on the fedora core 33. Maybe too many layers to succeed.
