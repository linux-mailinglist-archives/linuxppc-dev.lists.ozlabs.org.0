Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 273F837283D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 11:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZFPG1GVQz30B3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 19:47:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=nhZRJog0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=nhZRJog0; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.53])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZFNj5wt7z2xZM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 19:46:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620121571; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=Qpe3Tvwuaz7u81KPrYbJAnO/7BErpbn7AYFehAp1sOCh767tBdjgX0OWTJP/Xc9R8S
 aen+4nXFdZ2roEkJ6f09AuzcEX+PrSije7RHRkLdrhcIW+NEguoy3h9rJeJ7AdRSdieO
 YpTeyEYDrzpQ9ddCz6sbduK+Z/x4/3rvck/hHFVvR/c9PhUpCMF9OXnnnncWkQtamnm5
 sJJLihzsigezujm3D3LLoZvE1qV8exn2LF6Gbvhh5T/dfOa5J012hPfl2Yn6ZDvqwkNr
 fygtwQ9w7/IMtVFE3re+hHY4tJkouevbKNEP3VsmxagLukNTK0D8jYklkbNN1UNXkdcA
 fA6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620121571;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=MgizYsbGn7HeDOcM8nTynUkJ1ZfvETeTqLaz8M2Jiv4=;
 b=CgKVDig00pCjJXk5vzYHxoNXQQC/oIlir8h15qluPTt+pp7MJ2Lj9p59m1fKKrygPW
 MPqBtx833ZCy3+aisPXLuvTVPwqDaRP0UpM42W+Rbc5FAZnlKcWc6JRdfUA57QGOfuwb
 4p7jImUWqm2h6QoqbqDnXpyZQP7O2J+PzxpHbfLXoQbkABh9J+BIZpynk9yXof9tmEUc
 s6IHssjAFp/8Gcc4Qyrsssq9wSR/riu+WwLKuysTjm6DVf+e8FD8qA/DJ/kVNi5nMtb2
 lrErWsVHTh38NtDCKJiiaitL8sDJwo67pe7noUROLVkwMcwGBF1eNiLdJKXEwVWVw/wF
 XgwQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620121571;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=MgizYsbGn7HeDOcM8nTynUkJ1ZfvETeTqLaz8M2Jiv4=;
 b=nhZRJog0LZy3UdPLUcfFrMltgpmJqj7oJfxon+xry0O82y8isXn7y+wnUO43gxkP5/
 q1W0Aq7P+h9afoMWLsIu9PnlTTojlrT5Ce6OAb/m+V76IsxLIJDquNJxE8rw/JVa6Az9
 PY2sgj5vo4XhllSiCvCxx9cqmacAIB4Hh9GCLNjlf0Qj49UciYwzCztnzTpm3jPzbp6e
 CO5C0ppmWX0HslQIoOA3G0zZrDHSqjcl9UR/I7eJvJdkU9LbacoOAjd0NQ+3ItOxV0YF
 1vW2GSq8XBKaMGt9rbPMLDqbRHAOSUWXK9bRX+kef4I+Tg7oIT8aMKDxABzXnv9FHLCu
 A6Gg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhSIhsJhhV/a8MrHM5J4CoqSoOzBQ=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:14dd:6e8f:db34:91bd]
 by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id D075c0x449kA11H
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 4 May 2021 11:46:10 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
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
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <1502fb22-680c-7393-238c-f82570806717@xenosoft.de>
Date: Tue, 4 May 2021 11:46:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3b7daea5-7b2b-a089-0427-3becb986b6f5@csgroup.eu>
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
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am 04.05.21 um 11:11 schrieb Christophe Leroy:
>
>
> Le 04/05/2021 à 11:09, Christian Zigotzky a écrit :
>> Am 04.05.21 um 10:58 schrieb Christophe Leroy:
>>>
>>>
>>> Le 04/05/2021 à 10:29, Christian Zigotzky a écrit :
>>>> On 04 May 2021 at 09:47am, Christophe Leroy wrote:
>>>>> Hi
>>>>>
>>>>> Le 04/05/2021 à 09:21, Christian Zigotzky a écrit :
>>>>>> Hi Christophe,
>>>>>>
>>>>>> Thanks for your answer but I think I don't know how it works with 
>>>>>> the cherry-pick.
>>>>>>
>>>>>> $ git bisect start
>>>>>
>>>>> As you suspect the problem to be specific to powerpc, I can do
>>>>>
>>>>> git bisect start -- arch/powerpc
>>>>>
>>>>>
>>>>>> $ git bisect good 68a32ba14177d4a21c4a9a941cf1d7aea86d436f
>>>>>> $ git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>>>
>>>>> You said that powerpc-5.13-1 is bad so you can narrow the search I 
>>>>> think:
>>>>>
>>>>> git bisect bad powerpc-5.13-1
>>>>> git bisect good 887f3ceb51cd3~
>>>> I tried it but without any success.
>>>>
>>>> git bisect bad powerpc-5.13-1
>>>>
>>>> Output:
>>>> fatal: Needed a single revision
>>>> Bad rev input: powerpc-5.13-1
>>>
>>> I don't understand, on my side it works. Maybe a difference between 
>>> your version of git and mine.
>>>
>>> In that case, just use the SHA corresponding to the merge:
>>>
>>> git bisect bad c70a4be130de333ea079c59da41cc959712bb01c
>>>
>>> Christophe
>> Do you use a BookE machine?
>
> No I don't unfortunately, and I have tried booting in QEMU a kernel 
> built with your config, but it freezes before any output.
You can use my kernels and distributions.

Download Fedora 28 PPC64: http://www.xenosoft.de/fedora28-2.img.tar.gz
Download size: 4.1 GB
MD5 checksum: 1784ca69651531522161498720a89414

Default username and password:
Username: amigaone
Password: amigaone
Root Password: amigaone

You can start the MATE desktop with "startx".

Download MintPPC (Debian Sid) PPC32: 
http://www.xenosoft.de/MintPPC32-X5000.tar.gz
MD5 checksum: b31c1c1ca1fcf5d4cdf110c4bce11654

The password for both 'root' and 'mintppc' is 'mintppc'.

Download kernel 5.12.0 for the AmigaOne X5000 and for the virtual e5500 
QEMU machine without the bad commit: 
http://www.xenosoft.de/linux-image-5.12-X1000_X5000.tar.gz
Download git kernel for the AmigaOne X5000 and for the virtual e5500 
QEMU machine with the bad commit: 
http://www.xenosoft.de/linux-image-5.13-alpha3-X1000_X5000.tar.gz

QEMU command with KVM on the X5000: qemu-system-ppc64 -M ppce500 -cpu 
e5500 -enable-kvm -m 1024 -kernel uImage -drive 
format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
user,id=mynet0 -device e1000,netdev=mynet0 -append "rw root=/dev/vda" 
-device virtio-vga -device virtio-mouse-pci -device virtio-keyboard-pci 
-device pci-ohci,id=newusb -device usb-audio,bus=newusb.0 -smp 4

QEMU command for Fedora 28 without KVM and with VNC connect: 
qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive 
format=raw,file=fedora28-2.img,index=0,if=virtio -netdev user,id=mynet0 
-device virtio-net-pci,netdev=mynet0 -append "rw root=/dev/vda" -device 
virtio-vga -usb -device usb-ehci,id=ehci -device usb-tablet -device 
virtio-keyboard-pci -smp 4 -vnc :1

QEMU command for MintPPC without KVM and with VNC connect: 
qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage -drive 
format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw 
root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci -device 
usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1

