Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4F42206F2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 10:22:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B69Nv3zKvzDqkx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 18:22:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.37.72; helo=4.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 2399 seconds by postgrey-1.36 at bilbo;
 Wed, 15 Jul 2020 18:21:00 AEST
Received: from 4.mo177.mail-out.ovh.net (4.mo177.mail-out.ovh.net
 [46.105.37.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B69M03D9NzDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 18:20:59 +1000 (AEST)
Received: from player732.ha.ovh.net (unknown [10.110.115.29])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 1325F13B25F
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 09:05:27 +0200 (CEST)
Received: from kaod.org (lfbn-tou-1-1163-216.w90-76.abo.wanadoo.fr
 [90.76.222.216]) (Authenticated sender: clg@kaod.org)
 by player732.ha.ovh.net (Postfix) with ESMTPSA id 9E062143BCEA7;
 Wed, 15 Jul 2020 07:05:23 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G0027a6e8fef-c490-41b2-8eb0-8a37657f5ebb,D1878713575E7557A8ED5F979EF3ECB62B482302)
 smtp.auth=clg@kaod.org
Subject: Re: [PATCH 03/15] powerpc/powernv/pci: Add explicit tracking of the
 DMA setup state
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Oliver O'Halloran <oohall@gmail.com>
References: <20200710052340.737567-1-oohall@gmail.com>
 <20200710052340.737567-4-oohall@gmail.com>
 <ee5a00db-badd-12fe-1c46-eaba5afc8dea@ozlabs.ru>
 <CAOSf1CESRPypebf6+rnkZkNmi6+xL4+QP1xgAS1szGsZDBcs8A@mail.gmail.com>
 <34f7eea2-4ace-9931-7b5f-98ec159f3532@ozlabs.ru>
 <CAOSf1CGhc1i64_DS18evMhwoXvMWyafOk3r2czUz49F6gERtfw@mail.gmail.com>
 <1da1c482-a720-d5ec-a39c-a4b4869352d5@ozlabs.ru>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5a1c3bd9-3a35-6e63-2f51-1626b178a7c8@kaod.org>
Date: Wed, 15 Jul 2020 09:05:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1da1c482-a720-d5ec-a39c-a4b4869352d5@ozlabs.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 12301300908738251709
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrfedugdduudeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpefhffegleefjeduveeuvddvieegudetteevfffhffdugefggeelleejueeifeeuvdenucfkpheptddrtddrtddrtddpledtrdejiedrvddvvddrvdduieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejfedvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/15/20 5:33 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 15/07/2020 11:38, Oliver O'Halloran wrote:
>> On Tue, Jul 14, 2020 at 5:21 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>
>>> On 14/07/2020 15:58, Oliver O'Halloran wrote:
>>>> On Tue, Jul 14, 2020 at 3:37 PM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>>>
>>>>> On 10/07/2020 15:23, Oliver O'Halloran wrote:
>>>>>> This also means the only remaining user of the old "DMA Weight" code is
>>>>>> the IODA1 DMA setup code that it was originally added for, which is good.
>>>>>
>>>>>
>>>>> Is ditching IODA1 in the plan? :)
>>>>
>>>> That or separating out the pci_controller_ops for IODA1 and IODA2 so
>>>> we can stop any IODA2 specific changes from breaking it.
>>>
>>> Is IODA1 tested at all these days? Or, is anyone running upstream
>>> kernels anywhere and keeps shouting when it does not work on IODA1? Thanks,
>>
>> Cedric has a P7 with OPAL. That's probably the one left though.
> 
> Has he tried these patches on that box? Or we hope for the best here? :)

I could but can we fix the issue below before I reboot ?  I don't have a 
console anymore on these boxes. 

Firmware is : 

root@amure:~# dtc -I fs /proc/device-tree/ibm,opal/firmware/ -f
<stdout>: ERROR (name_properties): /: "name" property is incorrect ("firmware" instead of base node name)
Warning: Input tree has errors, output forced
/dts-v1/;

/ {
	git-id = "34b3400";
	ml-version = [4d 4c 20 46 57 37 37 30 2e 32 30 20 46 57 37 37 30 2e 32 30 20 46 57 37 37 30 2e 32 30];
	compatible = "ibm,opal-firmware";
	phandle = <0x4d>;
	mi-version = <0x4d49205a 0x4c373730 0x5f303735 0x205a4c37 0x37305f30 0x3735205a 0x4c373730 0x5f303735>;
	linux,phandle = <0x4d>;
	name = "firmware";
};

I rather not change it if possible. 


C.

[    1.979581] ------------[ cut here ]------------
[    1.979582] opal: OPAL_CONSOLE_FLUSH missing.
[    1.979583] WARNING: CPU: 0 PID: 253 at arch/powerpc/platforms/powernv/opal.c:446 .__opal_flush_console+0xfc/0x110
[    1.979584] Modules linked in: ipr(E+) ptp(E) usb_common(E) pps_core(E)
[    1.979587] CPU: 0 PID: 253 Comm: udevadm Tainted: G            E     5.4.0-4-powerpc64 #1 Debian 5.4.19-1
[    1.979588] NIP:  c0000000000d10ec LR: c0000000000d10e8 CTR: c000000000b13510
[    1.979589] REGS: c00000000381f130 TRAP: 0700   Tainted: G            E      (5.4.0-4-powerpc64 Debian 5.4.19-1)
[    1.979590] MSR:  9000000000021032 <SF,HV,ME,IR,DR,RI>  CR: 28002282  XER: 20000000
[    1.979594] CFAR: c000000000157d2c IRQMASK: 3 
[    1.979595] GPR00: c0000000000d10e8 c00000000381f3c0 c000000001618700 0000000000000022 
[    1.979598] GPR04: c000000000c95df2 0000000000000002 414c5f434f4e534f 4c455f464c555348 
[    1.979601] GPR08: 0000000000000003 0000000000000003 0000000000000001 9000000000001032 
[    1.979604] GPR12: c0000000000d0818 c000000001820000 0000000000000000 c0000000014342a8 
[    1.979607] GPR16: c00000000173b850 c00000000148b218 000000011a2d5db8 0000000000000000 
[    1.979609] GPR20: 0000000000000000 c000000004b50e00 0000000000000000 c00000000173e208 
[    1.979612] GPR24: c00000000173bde8 0000000000000000 c00000000148b1d8 c0000000016620e0 
[    1.979615] GPR28: c0000000017f7c40 0000000000000000 0000000000000000 0000000000000000 
[    1.979618] NIP [c0000000000d10ec] .__opal_flush_console+0xfc/0x110
[    1.979618] LR [c0000000000d10e8] .__opal_flush_console+0xf8/0x110
[    1.979619] Call Trace:
[    1.979620] [c00000000381f3c0] [c0000000000d10e8] .__opal_flush_console+0xf8/0x110 (unreliable)
[    1.979621] [c00000000381f450] [c0000000000d1428] .opal_flush_chars+0x38/0xc0
[    1.979623] [c00000000381f4d0] [c0000000007680a8] .hvc_console_print+0x188/0x2d0
[    1.979624] [c00000000381f5b0] [c0000000001eff08] .console_unlock+0x348/0x720
[    1.979625] [c00000000381f6c0] [c0000000001f268c] .vprintk_emit+0x27c/0x3a0
[    1.979626] [c00000000381f780] [c0000000007af2f4] .dev_vprintk_emit+0x208/0x258
[    1.979628] [c00000000381f8e0] [c0000000007af38c] .dev_printk_emit+0x48/0x58
[    1.979629] [c00000000381f950] [c0000000007af748] ._dev_err+0x6c/0x9c
[    1.979630] [c00000000381fa00] [c0000000007aaff8] .uevent_store+0x78/0x80
[    1.979631] [c00000000381fa90] [c0000000007a8ce4] .dev_attr_store+0x64/0x90
[    1.979633] [c00000000381fb20] [c00000000054becc] .sysfs_kf_write+0x7c/0xa0
[    1.979634] [c00000000381fbb0] [c00000000054b294] .kernfs_fop_write+0x114/0x270
[    1.979635] [c00000000381fc50] [c000000000456b58] .__vfs_write+0x68/0xe0
[    1.979636] [c00000000381fce0] [c000000000457e44] .vfs_write+0xc4/0x270
[    1.979638] [c00000000381fd80] [c00000000045adc4] .ksys_write+0x84/0x140
[    1.979639] [c00000000381fe20] [c00000000000c050] system_call+0x5c/0x68
[    1.979640] Instruction dump:
[    1.979641] 3be0fffe 4bffb581 60000000 4bffff90 60000000 3c62ff68 39200001 3d42ffea 
[    1.979644] 3863d6d0 992a9d98 48086be1 60000000 <0fe00000> 4bffff50 480867ad 60000000 
[    1.979648] ---[ end trace 34198c4c2c15e0e2 ]---
