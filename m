Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EBC3778E8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 May 2021 23:47:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fdd823yXDz308Y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 07:47:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=ZJxWkV27;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.161;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=ZJxWkV27; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.161])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fdd7W35PMz2yXD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 May 2021 07:47:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1620596787; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=ntDTxgBtPWTtORO9037BPKt7kIDz+jDspOWoIY+/LyrWlGq5ylc3cz/pt9XcNHWHzm
 QgQm8p/xkf83nnou7bNnnp+42cTP6zpX7TX1Oc4Ie6bfE+KVq79XZFlMWATofDQQgyWe
 WXgnO4d1bUBwK+/6uyuFgPvx+jhvTZKF4lzkrjMT0YcN4uiO9biyci8TCd9864Mq9vST
 g+z1QRD3TEACOw81SKkV/2uRon6LPWUIDRcT0uAh19yllAqD+VG4OGdKTpJnOMFwpNBo
 bSH8naIkRcF31HrE3WP338J4nzJ0WHJ3Ga2kHJcpeig6T20RwRaaYkWAPqReGAkuHpv6
 BUig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1620596787;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=XCnM9Ev/5UibDWlUdr9k4HeOWmK+pnq1a/8JZJui1Po=;
 b=bBzlu9pWe3OWW6n8C5lY7ewkH6qlvLGkh0XiahNn12kw1af0qeWHzImyLxlCSV7EEw
 jhIL6hrAaEEvOtSy+r/s0KOqJpEKHdEwiq+fZF/g+kAyw2ZPOwzeb3d1BVl52uEpk7J8
 4sGEAAmrt54qXkt4/cP6dgE57ZSU11inXFJX2xgR+suGdrQK5lH7jn5cbNHEXrMYz87d
 O+93YMAjhHgU3RTXqHy3yWipRVioBsm1gaE0RvJDpa74RZkg7SSZOazujo7cyIwpfjBR
 Hp7fxKoYU5GTrzkEoMU/U1uChlBqBStaJW86goG9LyXgEmHjcpnaGuGO/0PV/HVjpXCL
 jPgQ==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1620596787;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
 From:Subject:Sender;
 bh=XCnM9Ev/5UibDWlUdr9k4HeOWmK+pnq1a/8JZJui1Po=;
 b=ZJxWkV27OKawcgE4O3TcCPH1mKeqmmWUFCxRARZ4hDWjnjuHQJzuKKKqesdr5biVWs
 aJc/9/ElrpeW/DVKpfvchhvm7B49BY9ykTugihdYaMi2N/0ppbk0hi1WGb+UDzgDGOwv
 imvJbyhwBjqazPE4szLiuVq33eWVzoUlOliCZP02tKTDcAZyBSqhjZHWxQrMn1+iy/pP
 nMiVWzI0eXIq3IWhKuw5LDMUCrBQGE3BhceaLE7h7GEFKHAElWwlaFMmVmflogzIm3as
 YQImWPeQHxPUHp7ddr7gsT6u8W8yYXkupDBojaRARPKKuFjFI5IdjUUgFiEh9u4RgDEQ
 Ywug==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgFI2YOjh8BNN/2KQiJ6prxQ6VKlg=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.25.6 AUTH)
 with ESMTPSA id L0ba16x49LkR7R9
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sun, 9 May 2021 23:46:27 +0200 (CEST)
Subject: Re: [FSL P50x0] Xorg always restarts again and again after the the
 PowerPC updates 5.13-1
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <1b0134d4-4235-b294-8112-dcd5468564bf@csgroup.eu>
 <0A8D70F6-CBD4-44FD-9DB1-69097AEB5FA3@xenosoft.de>
 <10d52780-34ca-2205-8d5c-544a1ff2f248@xenosoft.de>
 <806945b0-d4e9-3064-8447-e8265642c048@xenosoft.de>
 <fa29dfac-012d-26c3-51b6-2c67af944ecc@csgroup.eu>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <54d2f6c9-f8a3-37fc-4d7e-cc87e09ac07a@xenosoft.de>
Date: Sun, 9 May 2021 23:46:26 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <fa29dfac-012d-26c3-51b6-2c67af944ecc@csgroup.eu>
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09 May 2021 at 07:43 pm, Christophe Leroy wrote:
>
> On my side, book3e (corenet64_smp_defconfig) built with GCC 10.1 works 
> well with QEMU 2.11.2
>
> A kernel built with the configuration you provided doesn't boot on 
> QEMU, no output at all, even with kernel v5.12.
>
> What versions of GCC and QEMU are you using ?
>
> Thanks
> Christophe
Hi Christophe,

I use the following QEMU versions (qemu-system-ppc64):

- QEMU 5.0.0 (Debian 1:5.0-5) ELF 32-bit PowerPC with or without KVM on 
Debian Sid 32-bit userland with some 64-bit kernels [1] [3] [11] [12] 
[13] [14] [15] [16] [17]
- QEMU 5.2.0 ELF 64-bit x86_64 on Ubuntu 18.04 64-bit [2]
- QEMU 5.2.0 Mach-O 64-bit on macOS Catalina 10.15.7
- QEMU 5.2.0 on Windows Server 2016 [4] [5] [6] [7] [8] [9] [10]

The kernels work really well with my kernel configuration in QEMU (see 
screenshots [1] - [17]). You can also see the kernel 5.12 in virtual 
QEMU machines in the screenshots.
I work very often with my kernels in e5500 QEMU machines on Linux, 
macOS, and Windows.

I build my kernels with the GCC 7.5.0. We are testing very intensive all 
kernel builds in our test threads [18] [19] [20] and the kernel 5.12 
works very well on our AmigaOnes and in virtual
e5500 QEMU machines.

Cheers,
Christian

[1] 
https://i.pinimg.com/originals/94/a1/56/94a156481ab469dd6cd0eba97bd88855.png
[2] 
https://i.pinimg.com/originals/93/5a/97/935a9792ca4b76b569eeb40857b2162f.png
[3] 
https://i.pinimg.com/originals/c5/0d/85/c50d85d7e8f20b4caa1a439faf751964.png
[4] 
https://i.pinimg.com/originals/cb/1d/12/cb1d12610c197a5e24f4a549c4dc56fe.png
[5] 
https://i.pinimg.com/originals/46/e0/1a/46e01a5ef174cc65420d760b074e2f23.png
[6] 
https://i.pinimg.com/originals/15/3c/9c/153c9cba276542528721d313812f232a.png
[7] 
https://i.pinimg.com/originals/b7/dc/c0/b7dcc0d04d8a7d8e771c888403aa9f6f.png
[8] 
https://i.pinimg.com/originals/1f/37/0e/1f370e80ec9805c93d3bd30c0c3a6926.png
[9] 
https://i.pinimg.com/originals/7c/4b/1a/7c4b1a602a0760865a1722ef1608cedf.png
[10] 
https://i.pinimg.com/originals/c3/89/19/c3891928d359500ab5e7484357b4ab01.png
[11] 
https://i.pinimg.com/originals/e4/53/00/e4530020d4292b36cd1dd22a20f2ba93.png
[12] 
https://i.pinimg.com/originals/fa/92/5b/fa925bbe132caf6d7f84bdc4090690c6.png
[13] 
https://i.pinimg.com/originals/4f/b0/14/4fb01476edd7abe6be1e1203a8e7e152.png
[14] 
https://i.pinimg.com/originals/f1/23/a4/f123a448743b8039b0b5fba320daee7c.png
[15] 
https://i.pinimg.com/originals/6e/3b/59/6e3b59fe10276c5644b15622a81f43f1.png
[16] 
https://i.pinimg.com/originals/f2/a5/e3/f2a5e34e2015381b0cb87cc51232a8bc.png
[17] 
https://i.pinimg.com/originals/57/d9/83/57d98324cd055b7ae00a87ad5a45a42f.png
[18] https://forum.hyperion-entertainment.com/viewtopic.php?f=58&t=4612
[19] https://forum.hyperion-entertainment.com/viewtopic.php?f=35&t=4611
[20] https://forum.hyperion-entertainment.com/viewtopic.php?f=58&t=4564
