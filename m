Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7325924EE5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 05:12:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=PzS9Wd1x;
	dkim=fail reason="signature verification failed" header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=y5OPKi6s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDPwN3Xs5z3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 13:12:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=PzS9Wd1x;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=y5OPKi6s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.51; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDPvZ4yRvz30VS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 13:11:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1719976281; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=smmxyXFIO87clTVspTInv7QbLpYTThcLUTNJ6wEKeq0tDJ2siDC+Z4nQ1wp1X6qBRH
    50KTsWKtsV+Eb801gsp1zrN2uuCZXLoGAeswH2YppSHhAxiJPm0RCw+Shk+gGSBKQddK
    qP8GmeXpET9DFChAsmvlQbbgZ+QJgKIQTEOxYlpialfi2GxvxorGErzdar7PNCT5xws1
    NdeBrrVeFyjYFDkBTtnESXKvD40hkxEPs14gkzHKdIbFpshfj5KpdMvzwx3x3EVcugVZ
    US2611LnlSC3n+FV9B/MYLbCMj5PloPYUnzEXDPuwkG90VjxIesIv2xGb79WezqXkhoa
    9KGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1719976281;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=LkLT6d+AB9sxIUSqM+FbA1xqneqeb+Ia9dwfhTd4Sr4=;
    b=jPlkW6FrThEhfnV3HtqQmEfyyBH8scShY4Na6lmCEXjPlbtF8Pa5/bZzOUAKznIEM3
    vLbJHIIQPUv6Lzoy4ThzD73BKlcqWoRnj7e5h+GUJ0E+pv0VaOGEFVbJsU36csG6xYno
    2GPihXC1MH2xqw5Bol0w1UMfvM5trMahCtxPs/BVMKD1a8h58WBFM1k2bfF9a800BwhC
    Ju34dEv5dZ1f6ohC+xsq6RWSG0dZiJJ/H3n3zBpHmzNMGzfL3sBgY0dUzINv0J8cTpn1
    OimgZ1U/WZFBw76h/yM1Tov/0aU61CYsBkokX79tD4VhxXs28VgoXaVrlcTAs5ibfk6r
    B4kg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1719976281;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=LkLT6d+AB9sxIUSqM+FbA1xqneqeb+Ia9dwfhTd4Sr4=;
    b=PzS9Wd1xlJIY0SxJuahJTdRrDL+IfJSGUN+zpogi69gfjTgPilTxe/538Wyr7eYe1z
    w3iZKaedazJGvrjo3FmEzQnwboRjKarutUHp7TAY34fZV8rR/3eLFVNn5kO7P+UGgA4j
    4wxFUe5UjU3KJx+0F7xdG56HII1vvZyjxAWqTdnOZABS0y5NCU+E6+ILZMtwJJQPw5wQ
    utLs+V/3eoGmvh4UCcguy0JDuASadt4AUMS+sBO6T3JnYIqKTCu55Bo4rcODOaQ64Cxz
    U1QY4Llq1B9JzTyq8Yh4x/iUT6HZd0fLE91900eQrN2hEASFnQN7cuEQiyKkPEt+NhUn
    9+Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1719976280;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=LkLT6d+AB9sxIUSqM+FbA1xqneqeb+Ia9dwfhTd4Sr4=;
    b=y5OPKi6sY9YxC7YHhN46mmCquwNpHJ8LYCN4Tf7EPOMB/pdypDnbG7DihunUFWw1z1
    M1rLsUpoxrvS14iU9kDw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHvJzedR43JwnbX6uY2qFStl/aCni1Nc81TAvUiF9uCdWDcE="
Received: from [IPV6:2a01:599:806:4825:5b9f:b248:3889:7da0]
    by smtp.strato.de (RZmta 50.5.0 AUTH)
    with ESMTPSA id e083890633BJMon
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 3 Jul 2024 05:11:19 +0200 (CEST)
Message-ID: <f150eb06-b796-48be-9373-544ca8948ab6@xenosoft.de>
Date: Wed, 3 Jul 2024 05:11:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PowerPC] [PASEMI] Issue with the identification of ATA drives
 after the of/irq updates 2024-05-29
To: Marc Zyngier <maz@kernel.org>
References: <3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de>
 <861q4bizxc.wl-maz@kernel.org>
 <68b7988d-eaaa-4713-99c3-525a34c5b322@xenosoft.de>
 <5a6166f107ae31536665d42f410d314d@kernel.org>
Content-Language: en-US
From: Christian Zigotzky <chzigotzky@xenosoft.de>
In-Reply-To: <5a6166f107ae31536665d42f410d314d@kernel.org>
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
Cc: apatel@ventanamicro.com, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, mad skateman <madskateman@gmail.com>, Matthew Leaman <matthew@a-eon.biz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Marc,

On 02.07.24 21:49, Marc Zyngier wrote:
> On 2024-07-02 18:55, Christian Zigotzky wrote:
>> Hello Marc,
>>
>> Thank you for your reply.
>>
>> On 02.07.24 17:19, Marc Zyngier wrote:
>>> Please provide the device tree for your platform. It isn't possible to
>>> debug this without it, no matter how many pictures you provide. If it
>>> doesn't exist in source form, you can dump it using:
>>>
>>> # dtc -I dtb /sys/firmware/fdt
>>>
>>> and posting the full output.
>>>
>>> Additionally, a full dmesg of both working and non working boots would
>>> be useful.
>>>
>>> Thanks,
>>>
>>>     M.
>>>
>> The device tree of the Nemo board and further information:
>> https://forum.hyperion-entertainment.com/viewtopic.php?p=54406#p54406
>
> Please post these things on the list. I have no interest in
> fishing things on a random forum, and this information is
> useful for everyone.
>
> Thanks,
>
>          M.

Sorry, here you are:

Device tree of the Nemo board (Hardinfo):

-Device Tree-
Summary
Maps
/
/sdc@fc000000
/sdc@fc000000/openpic@fc000000
/sdc@fc000000/mdio@0
/sdc@fc000000/mdio@0/ethernet-phy@0
/sdc@fc000000/rng@fc105000
/sdc@fc000000/gizmo@fc104000
/sdc@fc000000/gpio@fc103000
/pxp@0,e0000000
/pxp@0,e0000000/i2c@1c,2
/pxp@0,e0000000/serial@1d
/pxp@0,e0000000/io-bridge@0
/pxp@0,e0000000/dma-engine@1a
/pxp@0,e0000000/pci@11
/pxp@0,e0000000/pci@11/pci@13
/pxp@0,e0000000/pci@11/pci@13,3
/pxp@0,e0000000/pci@11/pci@13,1
/pxp@0,e0000000/pci@11/pci@14,4
/pxp@0,e0000000/pci@11/pci@14,4/pci@6
/pxp@0,e0000000/pci@11/pci@14,4/pci@6,1
/pxp@0,e0000000/pci@11/pci@14,4/pci@5
/pxp@0,e0000000/pci@11/pci@14,2
/pxp@0,e0000000/pci@11/pci@14
/pxp@0,e0000000/pci@11/pci@13,4
/pxp@0,e0000000/pci@11/pci@12
/pxp@0,e0000000/pci@11/pci@12/atapi0.1
/pxp@0,e0000000/pci@11/pci@12/ide0.0
/pxp@0,e0000000/pci@11/pci@13,2
/pxp@0,e0000000/pci@11/pci@14,3
/pxp@0,e0000000/pci@11/pci@14,1
/pxp@0,e0000000/pci@11/pci@13,5
/pxp@0,e0000000/pci@8
/pxp@0,e0000000/i2c@1c
/pxp@0,e0000000/pci@11,2
/pxp@0,e0000000/pci@4
/pxp@0,e0000000/ethernet@14,3
/pxp@0,e0000000/pci@1b
/pxp@0,e0000000/i2c@1c,1
/pxp@0,e0000000/pci@9
/pxp@0,e0000000/pci@11,3
/pxp@0,e0000000/pci@10
/pxp@0,e0000000/pci@10/pci@0,1
/pxp@0,e0000000/pci@10/pci@0
/pxp@0,e0000000/pci@11,1
/pxp@0,e0000000/cache-controller@1
/pxp@0,e0000000/pci@5
/pxp@0,e0000000/serial@1d,1
/pxp@0,e0000000/pci@1e
/pxp@0,e0000000/pci@3
/pxp@0,e0000000/pci@15
/bootconsole
/options
/openprom
/lpc@fe000000
/chosen
/cpus
/cpus/PowerPC,PA6T@0
/cpus/PowerPC,PA6T@1
/memory
/localbus@f0000000
/localbus@f0000000/cf@1000000
Messages

--------

lsprop /proc/device-tree:

compatible       "pasemi,nemo"
          "pasemi,pa6t-1682m"
          "PA6T-1682M"
          "pasemi,pwrficient"
          "pasemi"
device_type      "bootrom"
model            "pasemi,nemo"
#interrupt-cells 00000002
#address-cells   00000002
#size-cells      00000002
linux,phandle    7fdff018 (2145382424)
platform-open-pic 00000000 fc000000 00000000 00041000
name             ""

/proc/device-tree/sdc@fc000000:
compatible       "1682m-sdc"
          "pasemi,pwrficient-sdc"
          "pasemi,sdc"
device_type      "sdc"
#address-cells   00000001
#size-cells      00000001
reg              00000000 fc000000 00000000 00800000
linux,phandle    7fe2f458 (2145580120)
name             "sdc"

/proc/device-tree/sdc@fc000000/rng@fc105000:
compatible       "1682m-rng"
          "pasemi,pwrficient-rng"
          "pasemi,rng"
device_type      "rng"
reg              fc105000 00001000
linux,phandle    7fe2fdd0 (2145582544)
name             "rng"

/proc/device-tree/sdc@fc000000/mdio@0:
compatible       "gpio-mdio"
mdc-pin          00000005
#address-cells   00000001
#size-cells      00000000
reg              00000000 00000000
linux,phandle    7fe3d5a0 (2145637792)
mdio-pin         00000006
name             "mdio"

/proc/device-tree/sdc@fc000000/mdio@0/ethernet-phy@0:
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000007 00000001
reg              00000000
linux,phandle    7fe3d860 (2145638496)
name             "ethernet-phy"

/proc/device-tree/sdc@fc000000/openpic@fc000000:
compatible       "pasemi,pwrficient-openpic"
          "chrp,open-pic"
device_type      "open-pic"
msi-available-ranges 00000200 00000200
#interrupt-cells 00000002
#address-cells   00000000
reg              fc000000 00100000
linux,phandle    7fe2f6e8 (2145580776)
name             "openpic"
interrupt-controller

/proc/device-tree/sdc@fc000000/gizmo@fc104000:
compatible       "1682m-gizmo"
          "pasemi,pwrficient-gizmo"
          "pasemi,gizmo"
device_type      "gizmo"
reg              fc104000 00001000
linux,phandle    7fe2fbf0 (2145582064)
name             "gizmo"

/proc/device-tree/sdc@fc000000/gpio@fc103000:
compatible       "1682m-gpio"
          "pasemi,pwrficient-gpio"
          "pasemi,gpio"
device_type      "gpio"
reg              fc103000 00001000
linux,phandle    7fe2fa18 (2145581592)
name             "gpio"

/proc/device-tree/options:
MENU_2_LABEL     "Debian Sid/experimental Kernel 4.9"
MENU_4_COMMAND   "set pmu -astate=A4 ; ramdisk -z -addr=0x24000000 
-fatfs cf0:slitaz25.gz ; boot -elf -noints -fatfs cf0:vmlinux-3.13.14"
ETH0_HWADDR      "00:50:C2:20:DA:9E"
CFE_MEMORYSIZE   "8192"
MENU_5_LABEL     "Fedora 17 Kernel 3.13.9"
MENU_8_LABEL     "ubuntu MATE 16.04.2 LTS Kernel 4.9"
MENU_1_COMMAND   "setenv amigaboot_quiet Y ;boot -fs=iso 
atapi0.1:amigaboot.of"
MENU_8_COMMAND   "set pmu -astate=A4 ; setenv bootargs "root=/dev/sdb1 
quiet ro splash" ; boot -elf -noints -fatfs cf0:vmlinux-4.9"
bootargs         "root=/dev/sda4"
STARTUP          "speed;menu"
MENU_DEFAULT     "0"
MENU_0_LABEL     "AmigaOS"
MENU_5_COMMAND   73657420 706d7520 2d617374 6174653d
          4134203b 20736574 656e7620 626f6f74
          61726773 20227264 2e6d643d 30207264
          2e6c766d 3d302072 642e646d 3d302053
          5953464f 4e543d54 72756520 4b455954
          41424c45 3d646520 72642e6c 756b733d
          3020726f 6f743d2f 6465762f 73646233
          204c414e 473d6465 5f44452e 5554462d
          [191 bytes total]
MENU_3_LABEL     "ubuntu MATE 17.04 Kernel 4.9"
MENU_6_LABEL     "Fedora 25 PPC64 Kernel 4.9"
MENU_2_COMMAND   "set pmu -astate=A4 ; setenv bootargs "root=/dev/sda4" 
; boot -elf -noints -fatfs cf0:vmlinux-4.9"
MENU_9_LABEL     "openSUSE Tumbleweed Kernel 4.14"
speed            "set pmu -astate=A4"
MENU_9_COMMAND   "set pmu -astate=A4 ; setenv bootargs "root=/dev/sdb6 
splash=silent" ; boot -elf -noints -fatfs cf0:vmlinux-4.14"
BOOT_CONSOLE     "pcconsole0"
CFE_VERSION      "PAS-2.0.30"
little-endian?   00000000
MENU_6_COMMAND   "set pmu -astate=A4 ; setenv bootargs "root=/dev/sdb4" 
; boot -elf -noints -fatfs cf0:vmlinux-4.9"
CFE_BOARDNAME    "NEMO"
MENU_1_LABEL     "AmigaOS CD Boot"
MENU_4_LABEL     "SliTaz Snapshot 25 Kernel 3.13.14"
MENU_3_COMMAND   "set pmu -astate=A4 ; setenv bootargs "root=/dev/sdb7 
quiet ro splash" ; boot -elf -noints -fatfs cf0:vmlinux-4.9"
MENU_7_LABEL     "openSUSE 11.1 Kernel 4.13"
os4_commandline  "DEBUGLEVEL=0 SERIAL"
MENU_0_COMMAND   "setenv amigaboot_quiet Y ;boot -fs=amigafs 
ide0.0:amigaboot.of"
linux,phandle    7fe2f1f0 (2145579504)
MENU_TIMEOUT     "6"
MENU_7_COMMAND   "set pmu -astate=A4 ; setenv bootargs "root=/dev/sdb5" 
; boot -elf -noints -fatfs cf0:vmlinux-4.13"
framebuffer      "800/600/8/0x90000000/832"
name             "options"

/proc/device-tree/chosen:
linux,stdout-package 7fe35880 (2145605760)
bootargs         "root=/dev/sda4"
cpu              7fe30698 (2145584792)
stdout           7fe35990 (2145606032)
memory           7fe316c8 (2145588936)
stdin            7fe35990 (2145606032)
linux,stdout-path "/bootconsole"
sdc-interrupt-controller 7fe2f6e8 (2145580776)
linux,phandle    7fe34628 (2145601064)
name             "chosen"

/proc/device-tree/openprom:
device_type      "BootROM"
model            "Open Firmware 3"
linux,phandle    7fe2f2f0 (2145579760)
name             "openprom"

/proc/device-tree/localbus@f0000000:
compatible       "pasemi,localbus"
          "localbus"
device_type      "localbus"
ranges           00000000 00000000 f0000000 0c000000
#interrupt-cells 00000002
#address-cells   00000001
#size-cells      00000001
reg              00000000 f0000000 00000000 0c000000
linux,phandle    7fe342e0 (2145600224)
name             "localbus"

/proc/device-tree/localbus@f0000000/cf@1000000:
compatible       "pasemi,chitra-cf"
          "pasemi,electra-cf"
          "electra-cf"
card-3v-gpio     0000000a (10)
device_type      "electra-cf"
card-vsense-gpio 00000001
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000000 00000001
reg              00000000 00001000 01000000 00001000
card-detect-gpio 0000000e (14)
linux,phandle    7fe3da70 (2145639024)
card-5v-gpio     0000000b (11)
name             "cf"

/proc/device-tree/memory:
device_type      "memory"
available        00000000 00000000 00000000 7fd1d000
          00000001 00000000 00000001 80000000
reg              00000000 00000000 00000000 80000000
          00000001 00000000 00000001 80000000
linux,phandle    7fe316c8 (2145588936)
name             "memory"

/proc/device-tree/pxp@0,e0000000:
compatible       "pasemi,rootbus"
          "pa-pxp"
device_type      "pci"
interrupt-map-mask 00000000 00000000 00000000 000000ff
model            "pa"
ranges           00000000 00000000 e0000000 00000000
          e0000000 00000000 10000000 01000000
          00000000 00000000 00000000 fc800000
          00000000 00800000 02000000 00000000
          80000000 00000000 80000000 00000000
          60000000 02000000 00000000 e0000000
          00000000 e0000000 00000000 00100000
          02000000 00000000 fd800000 00000000
          [168 bytes total]
#interrupt-cells 00000001
bus-range        00000000 000000ff
#address-cells   00000003
interrupt-map    00000000 00000000 00000000 00000030
          7fe2f6e8 00000030 00000001 00000000
          00000000 00000000 00000031 7fe2f6e8
          00000031 00000001 00000000 00000000
          00000000 00000032 7fe2f6e8 00000032
          00000001 00000000 00000000 00000000
          00000033 7fe2f6e8 00000033 00000001
#size-cells      00000002
reg              00000000 e0000000 00000000 10000000
linux,phandle    7fe2ffa8 (2145583016)
name             "pxp"
interrupt-controller

/proc/device-tree/pxp@0,e0000000/i2c@1c,2:
assigned-addresses 8100e210 00000000 007f0280 00000000 00000040
device_type      "i2c"
revision-id      00000001
class-code       000c0500 (787712)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000048 00000001
device-id        0000a003 (40963)
reg              0000e200 00000000 00000000 00000000 00000000
          0100e210 00000000 00000000 00000000 00000040
linux,phandle    7fe33c80 (2145598592)
name             "i2c"

/proc/device-tree/pxp@0,e0000000/pci@8:
device_type      "pci"
revision-id      00000012 (18)
class-code       000b2000 (729088)
vendor-id        00001959 (6489)
device-id        0000a000 (40960)
reg              00004000 00000000 00000000 00000000 00000000
linux,phandle    7fe383f8 (2145616888)
name             "pci"

/proc/device-tree/pxp@0,e0000000/serial@1d,1:
current-speed    0001c200 (115200)
compatible       "ns16550"
          "pciclass,0700"
assigned-addresses 8100e910 00000000 007f02f8 00000000 00000008
device_type      "serial"
revision-id      00000002
class-code       00070003 (458755)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       0000004a 00000001
device-id        0000a004 (40964)
reg              0000e900 00000000 00000000 00000000 00000000
          0100e910 00000000 00000000 00000000 00000008
clock-frequency  07f28155 (133333333)
linux,phandle    7fe31db0 (2145590704)
name             "serial"

/proc/device-tree/pxp@0,e0000000/pci@1b:
device_type      "pci"
revision-id      00000011 (17)
class-code       00088000 (557056)
vendor-id        00001959 (6489)
device-id        0000a00b (40971)
reg              0000d800 00000000 00000000 00000000 00000000
linux,phandle    7fe38d78 (2145619320)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11,2:
device_type      "pci"
revision-id      00000011 (17)
class-code       00060400 (394240)
vendor-id        00001959 (6489)
#interrupt-cells 00000001
bus-range        00000008 00000008
#address-cells   00000003
#size-cells      00000002
device-id        0000a002 (40962)
reg              00008a00 00000000 00000000 00000000 00000000
linux,phandle    7fe367d0 (2145609680)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@4:
device_type      "pci"
revision-id      00000011 (17)
class-code       00050000 (327680)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000058 00000001
device-id        0000a00a (40970)
reg              00002000 00000000 00000000 00000000 00000000
linux,phandle    7fe37d08 (2145615112)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@10:
device_type      "pci"
revision-id      00000011 (17)
class-code       00060400 (394240)
ranges           01000000 00000000 00002000 01000000
          00000000 00002000 00000000 00001000
          02000000 00000000 90000000 02000000
          00000000 90000000 00000000 10100000
vendor-id        00001959 (6489)
#interrupt-cells 00000001
bus-range        00000001 00000001
#address-cells   00000003
#size-cells      00000002
device-id        0000a002 (40962)
reg              00008000 00000000 00000000 00000000 00000000
linux,phandle    7fe374d8 (2145613016)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@10/pci@0,1:
assigned-addresses 82010110 00000000 a0040000 00000000 00004000
device_type      "pci"
revision-id      00000000
subsystem-id     0000aa88 (43656)
class-code       00040300 (262912)
vendor-id        00001002 (4098)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000031 00000001
device-id        0000aa88 (43656)
reg              00010100 00000000 00000000 00000000 00000000
          02010110 00000000 00000000 00000000 00004000
subsystem-vendor-id 00001682 (5762)
linux,phandle    7fe39948 (2145622344)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@10/pci@0:
assigned-addresses c2010010 00000000 90000000 00000000 10000000
          82010018 00000000 a0020000 00000000 00020000
          81010020 00000000 00002000 00000000 00000100
device_type      "pci"
revision-id      00000000
subsystem-id     00003107 (12551)
class-code       00030000 (196608)
vendor-id        00001002 (4098)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000030 00000001
device-id        00006738 (26424)
reg              00010000 00000000 00000000 00000000 00000000
          42010010 00000000 00000000 00000000 10000000
          02010018 00000000 00000000 00000000 00020000
          01010020 00000000 00000000 00000000 00000100
subsystem-vendor-id 00001682 (5762)
linux,phandle    7fe39458 (2145621080)
name             "pci"

/proc/device-tree/pxp@0,e0000000/i2c@1c,1:
assigned-addresses 8100e110 00000000 007f0240 00000000 00000040
device_type      "i2c"
revision-id      00000001
class-code       000c0500 (787712)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000047 00000001
device-id        0000a003 (40963)
reg              0000e100 00000000 00000000 00000000 00000000
          0100e110 00000000 00000000 00000000 00000040
linux,phandle    7fe33890 (2145597584)
name             "i2c"

/proc/device-tree/pxp@0,e0000000/pci@1e:
assigned-addresses 8100f010 00000000 007f0400 00000000 00000100
          8100f014 00000000 007f0500 00000000 00000100
device_type      "pci"
revision-id      00000012 (18)
class-code       000601ff (393727)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000051 00000001
device-id        0000a008 (40968)
reg              0000f000 00000000 00000000 00000000 00000000
          0100f010 00000000 00000000 00000000 00000100
          0100f014 00000000 00000000 00000000 00000100
linux,phandle    7fe39040 (2145620032)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@9:
device_type      "pci"
revision-id      00000012 (18)
class-code       000b2000 (729088)
vendor-id        00001959 (6489)
device-id        0000a000 (40960)
reg              00004800 00000000 00000000 00000000 00000000
linux,phandle    7fe386c0 (2145617600)
name             "pci"

/proc/device-tree/pxp@0,e0000000/io-bridge@0:
compatible       "pasemi,1682m-iob"
          "pasemi,io-bridge"
assigned-addresses 82000000 00000000 e0000000 00000000 00002000
          c2000000 00000000 fd800000 00000000 00001000
device_type      "isa"
revision-id      00000012 (18)
class-code       00060000 (393216)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000056 00000001
device-id        0000a001 (40961)
reg              00000000 00000000 00000000 00000000 00000000
          82000000 00000000 e0000000 00000000 00002000
          c2000000 00000000 fd800000 00000000 00001000
linux,phandle    7fe32728 (2145593128)
name             "io-bridge"

/proc/device-tree/pxp@0,e0000000/pci@15:
assigned-addresses 82000000 00000000 e00a8000 00000000 00001000
device_type      "pci"
revision-id      00000011 (17)
class-code       00020000 (131072)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000044 00000001
device-id        0000a006 (40966)
reg              0000a800 00000000 00000000 00000000 00000000
          82000000 00000000 e00a8000 00000000 00001000
linux,phandle    7fe38988 (2145618312)
name             "pci"

/proc/device-tree/pxp@0,e0000000/dma-engine@1a:
compatible       "1682m-dma"
          "pasemi,dma-engine"
assigned-addresses 82000000 00000000 e00d0000 00000000 00001000
device_type      "dma-engine"
revision-id      00000012 (18)
class-code       000801ff (524799)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000080 00000001
device-id        0000a007 (40967)
reg              0000d000 00000000 00000000 00000000 00000000
          82000000 00000000 e00d0000 00000000 00001000
linux,phandle    7fe322b8 (2145591992)
name             "dma-engine"

/proc/device-tree/pxp@0,e0000000/pci@11,3:
device_type      "pci"
revision-id      00000011 (17)
class-code       00060400 (394240)
vendor-id        00001959 (6489)
#interrupt-cells 00000001
bus-range        00000009 00000009
#address-cells   00000003
#size-cells      00000002
device-id        0000a002 (40962)
reg              00008b00 00000000 00000000 00000000 00000000
linux,phandle    7fe363a8 (2145608616)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@5:
device_type      "pci"
revision-id      00000011 (17)
class-code       00050000 (327680)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       0000005a 00000001
device-id        0000a00a (40970)
reg              00002800 00000000 00000000 00000000 00000000
linux,phandle    7fe38080 (2145616000)
name             "pci"

/proc/device-tree/pxp@0,e0000000/i2c@1c:
assigned-addresses 8100e010 00000000 007f0200 00000000 00000040
device_type      "i2c"
revision-id      00000001
class-code       000c0500 (787712)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000046 00000001
device-id        0000a003 (40963)
reg              0000e000 00000000 00000000 00000000 00000000
          0100e010 00000000 00000000 00000000 00000040
linux,phandle    7fe334a0 (2145596576)
name             "i2c"

/proc/device-tree/pxp@0,e0000000/cache-controller@1:
compatible       "pasemi,1682m-l2c"
          "pasemi,l2c"
device_type      "cache-controller"
revision-id      00000011 (17)
class-code       00058000 (360448)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000052 00000001
device-id        0000a009 (40969)
reg              00000800 00000000 00000000 00000000 00000000
linux,phandle    7fe32bc8 (2145594312)
name             "cache-controller"

/proc/device-tree/pxp@0,e0000000/pci@11:
device_type      "pci"
revision-id      00000011 (17)
class-code       00060400 (394240)
ranges           01000000 00000000 00000000 01000000
          00000000 00000000 00000000 00004000
          02000000 00000000 a0100000 02000000
          00000000 a0100000 00000000 00300000
vendor-id        00001959 (6489)
#interrupt-cells 00000001
bus-range        00000005 00000006
#address-cells   00000003
#size-cells      00000002
device-id        0000a002 (40962)
reg              00008800 00000000 00000000 00000000 00000000
linux,phandle    7fe37020 (2145611808)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@14,1:
assigned-addresses 8105a110 00000000 00001030 00000000 00000008
          8105a114 00000000 00001054 00000000 00000004
          8105a118 00000000 00001038 00000000 00000008
          8105a11c 00000000 00001050 00000000 00000004
          8105a120 00000000 00001000 00000000 00000010
device_type      "pci"
revision-id      00000000
class-code       00010183 (65923)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       00000009 00000001
device-id        0000438c (17292)
reg              0005a100 00000000 00000000 00000000 00000000 0105a110
          00000000 00000000 00000000 00000008 0105a114 00000000
          00000000 00000000 00000004 0105a118 00000000 00000000
          00000000 00000008 0105a11c 00000000 00000000 00000000
          00000004 0105a120 00000000 00000000 00000000 00000010
linux,phandle    7fe3bfb0 (2145632176)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@13,5:
assigned-addresses 82059d10 00000000 a0209800 00000000 00000100
device_type      "pci"
revision-id      00000000
class-code       000c0320 (787232)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       0000000c 00000001
device-id        00004386 (17286)
reg              00059d00 00000000 00000000 00000000 00000000
          02059d10 00000000 00000000 00000000 00000100
linux,phandle    7fe3b858 (2145630296)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@13,3:
assigned-addresses 82059b10 00000000 a0204000 00000000 00001000
device_type      "pci"
revision-id      00000000
class-code       000c0310 (787216)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       0000000a 00000001
device-id        0000438a (17290)
reg              00059b00 00000000 00000000 00000000 00000000
          02059b10 00000000 00000000 00000000 00001000
linux,phandle    7fe3b078 (2145628280)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@14:
assigned-addresses 8105a010 00000000 00001020 00000000 00000010
          8205a014 00000000 a0209000 00000000 00000400
device_type      "pci"
revision-id      00000014 (20)
class-code       000c0500 (787712)
vendor-id        00001002 (4098)
device-id        00004385 (17285)
reg              0005a000 00000000 00000000 00000000 00000000
          0105a010 00000000 00000000 00000000 00000010
          0205a014 00000000 00000000 00000000 00000400
linux,phandle    7fe3bc48 (2145631304)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@13,1:
assigned-addresses 82059910 00000000 a0207000 00000000 00001000
device_type      "pci"
revision-id      00000000
class-code       000c0310 (787216)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       0000000a 00000001
device-id        00004388 (17288)
reg              00059900 00000000 00000000 00000000 00000000
          02059910 00000000 00000000 00000000 00001000
linux,phandle    7fe3a898 (2145626264)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@12:
assigned-addresses 81059010 00000000 00001040 00000000 00000008 81059014
          00000000 0000105c 00000000 00000004 81059018 00000000
          00001048 00000000 00000008 8105901c 00000000 00001058
          00000000 00000004 81059020 00000000 00001010 00000000
          00000010 82059024 00000000 a0209400 00000000 00000400
device_type      "pci"
revision-id      00000000
class-code       0001018f (65935)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       00000009 00000001
device-id        00004380 (17280)
reg              00059000 00000000 00000000 00000000
          00000000 01059010 00000000 00000000
          00000000 00000008 01059014 00000000
          00000000 00000000 00000004 01059018
          00000000 00000000 00000000 00000008
          0105901c 00000000 00000000 00000000
          00000004 01059020 00000000 00000000
          00000000 00000010 02059024 00000000
          [140 bytes total]
linux,phandle    7fe39de8 (2145623528)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@12/ide0.0:
device_type      "block"
linux,phandle    7fe3a2a0 (2145624736)
name             "ide0.0"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@12/atapi0.1:
device_type      "block"
linux,phandle    7fe3a3a0 (2145624992)
name             "atapi0.1"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@14,4:
device_type      "pci"
revision-id      00000000
class-code       00060400 (394240)
ranges           01000000 00000000 00003000 01000000
          00000000 00003000 00000000 00001000
          02000000 00000000 a0300000 02000000
          00000000 a0300000 00000000 00100000
vendor-id        00001002 (4098)
#interrupt-cells 00000001
bus-range        00000006 00000006
#address-cells   00000003
#size-cells      00000002
device-id        00004384 (17284)
reg              0005a400 00000000 00000000 00000000 00000000
linux,phandle    7fe3cc20 (2145635360)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@14,4/pci@5:
assigned-addresses 81062810 00000000 00003000 00000000 00000100
          82062814 00000000 a0310000 00000000 00000100
device_type      "pci"
revision-id      00000010 (16)
subsystem-id     00008139 (33081)
class-code       00020000 (131072)
vendor-id        000010ec (4332)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       00000004 00000001
device-id        00008139 (33081)
reg              00062800 00000000 00000000 00000000 00000000
          01062810 00000000 00000000 00000000 00000100
          02062814 00000000 00000000 00000000 00000100
subsystem-vendor-id 000010ec (4332)
linux,phandle    7fe3d0d8 (2145636568)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@14,2:
assigned-addresses 8205a210 00000000 a0200000 00000000 00004000
device_type      "pci"
revision-id      00000000
subsystem-id     00001000 (4096)
class-code       00040300 (262912)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       00000009 00000001
device-id        00004383 (17283)
reg              0005a200 00000000 00000000 00000000 00000000
          0205a210 00000000 00000000 00000000 00004000
subsystem-vendor-id 00001888 (6280)
linux,phandle    7fe3c440 (2145633344)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@13,4:
assigned-addresses 82059c10 00000000 a0205000 00000000 00001000
device_type      "pci"
revision-id      00000000
class-code       000c0310 (787216)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       0000000b 00000001
device-id        0000438b (17291)
reg              00059c00 00000000 00000000 00000000 00000000
          02059c10 00000000 00000000 00000000 00001000
linux,phandle    7fe3b468 (2145629288)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@13,2:
assigned-addresses 82059a10 00000000 a0206000 00000000 00001000
device_type      "pci"
revision-id      00000000
class-code       000c0310 (787216)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       0000000b 00000001
device-id        00004389 (17289)
reg              00059a00 00000000 00000000 00000000 00000000
          02059a10 00000000 00000000 00000000 00001000
linux,phandle    7fe3ac88 (2145627272)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@13:
assigned-addresses 82059810 00000000 a0208000 00000000 00001000
device_type      "pci"
revision-id      00000000
class-code       000c0310 (787216)
vendor-id        00001002 (4098)
interrupt-parent 7fe2ffa8 (2145583016)
interrupts       00000009 00000001
device-id        00004387 (17287)
reg              00059800 00000000 00000000 00000000 00000000
          02059810 00000000 00000000 00000000 00001000
linux,phandle    7fe3a4a8 (2145625256)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11/pci@14,3:
assigned-addresses 8205a310 00000000 a0100000 00000000 00100000
device_type      "pci"
revision-id      00000000
class-code       00060100 (393472)
vendor-id        00001002 (4098)
device-id        0000438d (17293)
reg              0005a300 00000000 00000000 00000000 00000000
          0205a310 00000000 00000000 00000000 00100000
linux,phandle    7fe3c8e0 (2145634528)
name             "pci"

/proc/device-tree/pxp@0,e0000000/pci@11,1:
device_type      "pci"
revision-id      00000011 (17)
class-code       00060400 (394240)
vendor-id        00001959 (6489)
#interrupt-cells 00000001
bus-range        00000007 00000007
#address-cells   00000003
#size-cells      00000002
device-id        0000a002 (40962)
reg              00008900 00000000 00000000 00000000 00000000
linux,phandle    7fe36bf8 (2145610744)
name             "pci"

/proc/device-tree/pxp@0,e0000000/serial@1d:
current-speed    0001c200 (115200)
compatible       "ns16550"
          "pciclass,0700"
assigned-addresses 8100e810 00000000 007f03f8 00000000 00000008
device_type      "serial"
revision-id      00000002
class-code       00070003 (458755)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000049 00000001
device-id        0000a004 (40964)
reg              0000e800 00000000 00000000 00000000 00000000
          0100e810 00000000 00000000 00000000 00000008
clock-frequency  07f28155 (133333333)
linux,phandle    7fe318a8 (2145589416)
name             "serial"

/proc/device-tree/pxp@0,e0000000/ethernet@14,3:
phy-handle       7fe3d860 (2145638496)
compatible       "pasemi,1682m-gmac"
          "pasemi,ethernet"
assigned-addresses 82000000 00000000 e00a3000 00000000 00001000
local-mac-address 02 00 ffffffe0 0a 30 00                              
....0.
device_type      "ethernet"
revision-id      00000011 (17)
class-code       00020000 (131072)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000043 00000001
device-id        0000a005 (40965)
reg              0000a300 00000000 00000000 00000000 00000000
          82000000 00000000 e00a3000 00000000 00001000
linux,phandle    7fe32fd0 (2145595344)
name             "ethernet"

/proc/device-tree/pxp@0,e0000000/pci@3:
device_type      "pci"
revision-id      00000013 (19)
class-code       00080080 (524416)
vendor-id        00001959 (6489)
interrupt-parent 7fe2f6e8 (2145580776)
interrupts       00000054 00000001
device-id        0000a00c (40972)
reg              00001800 00000000 00000000 00000000 00000000
linux,phandle    7fe37990 (2145614224)
name             "pci"

/proc/device-tree/lpc@fe000000:
device_type      "lpc"
ranges           fe000000 00000000 fe000000 02000000
#address-cells   00000001
#size-cells      00000001
reg              00000000 fe000000 00000000 02000000
linux,phandle    7fe34070 (2145599600)
name             "lpc"

/proc/device-tree/bootconsole:
device_type      "bootconsole"
linux,phandle    7fe35880 (2145605760)
name             "bootconsole"

/proc/device-tree/cpus:
#address-cells   00000001
#size-cells      00000000
linux,phandle    7fe30540 (2145584448)
name             "cpus"

/proc/device-tree/cpus/PowerPC,PA6T@0:
bus-frequency    35a4e900 (900000000)
64-bit
timebase-frequency 03f940aa (66666666)
graphics
device_type      "cpu"
ibm,segment-page-sizes 0000000c 00000000 00000001 0000000c
          00000000 0000000e 00000020 00000001
          0000000e 00000001 00000010 00000110
          00000001 00000010 00000003 00000012
          00000130 00000001 00000012 0000000f
          00000014 00000030 00000001 00000014
          0000001f 00000018 00000100 00000001
          00000018 00000000 0000001e 00000120
          [140 bytes total]
i-cache-line-size 00000040 (64)
cpu-version      00900102 (9437442)
i-cache-block-size 00000040 (64)
reg              00000000
d-cache-block-size 00000040 (64)
clock-frequency  6b49d200 (1800000000)
ibm,processor-segment-sizes 0000001c 00000028
linux,phandle    7fe30698 (2145584792)
d-cache-size     00010000 (65536)
i-cache-size     00010000 (65536)
general-purpose
name             "PowerPC,PA6T"
ibm,processor-page-sizes 0000000c 0000000e 00000010 00000012
          00000014 00000018 0000001e
d-cache-sets     00000002
i-cache-sets     00000002
d-cache-line-size 00000040 (64)

/proc/device-tree/cpus/PowerPC,PA6T@1:
bus-frequency    35a4e900 (900000000)
64-bit
timebase-frequency 03f940aa (66666666)
graphics
device_type      "cpu"
ibm,segment-page-sizes 0000000c 00000000 00000001 0000000c
          00000000 0000000e 00000020 00000001
          0000000e 00000001 00000010 00000110
          00000001 00000010 00000003 00000012
          00000130 00000001 00000012 0000000f
          00000014 00000030 00000001 00000014
          0000001f 00000018 00000100 00000001
          00000018 00000000 0000001e 00000120
          [140 bytes total]
i-cache-line-size 00000040 (64)
cpu-version      00900102 (9437442)
i-cache-block-size 00000040 (64)
reg              00000001
d-cache-block-size 00000040 (64)
clock-frequency  6b49d200 (1800000000)
ibm,processor-segment-sizes 0000001c 00000028
linux,phandle    7fe30eb0 (2145586864)
d-cache-size     00010000 (65536)
i-cache-size     00010000 (65536)
general-purpose
name             "PowerPC,PA6T"
ibm,processor-page-sizes 0000000c 0000000e 00000010 00000012
          00000014 00000018 0000001e
d-cache-sets     00000002
i-cache-sets     00000002
d-cache-line-size 00000040 (64)

--------

Download the compiled device tree for the Nemo board: 
http://www.xenosoft.de/fdt-nemo-board.zip

--------

Darren wrote:

...

The dtb passed by the CFE firmware has a number of issues, which up till
now have been fixed by use of patches applied to the mainline kernel.
This occasionally causes problems with changes made to mainline.

Patching the firmware to correct the dtb is not an option for the
following reasons:

It was modified by a 3rd party, and we don't have a copy of the source.

All versions of CFE used on the X1000 export the same dtb.

At least one machine suffered damage during a firmware upgrade attempt,
many people will be unwilling to reflash their system if an upgrade is
produced.

...

Pasemi arch code finds the root of the PCI-e bus by searching the
device-tree for a node called 'pxp'. But the root bus has a
compatible property of 'pasemi,rootbus' so search for that instead.

...

The device tree on the Nemo passes all of the i8259 interruts with
numbers between 212 and 222, and points their interrupt-parent property
to the pasemi-opic, requiring custom patches to the kernel.
Fix the values so that they can be controlled by the generic ppc i8259
code.
