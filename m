Return-Path: <linuxppc-dev+bounces-1781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370F9922ED
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 05:19:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMPWt6wTcz2xpl;
	Mon,  7 Oct 2024 14:19:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728271162;
	cv=pass; b=OI/UGIR1Ftlk3xVQ9z6zzwWgl5egdW1/5G7kYGz0aHRbEkJEu4dZ+Zk/WoV6nLxO6Z2qL/xZPxCY1MgKNOShS/nzREeAaOxFNWM0bR6LqLMpxzOX82a+LdLq65oFuOkT8Dcgy85fWL72jOALUBSpkvGGlOl/yeXyZVlDC6Qlf57I7Onrvrw/plrnlIfdd0LMNIW7OxvYO/EK9+nWmFE+/xuHfWpF/c9YyjmyDyuKAsGM3maYV1A/b8YcHX2KZiG1n6FApJTXUXsmFtQH6fRl4uLdhlRXolNYo+WPFje++Cy6RXYIH0+EHsin6lCldgpOcAdpDnZhFdvEg8ucSYoMTw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728271162; c=relaxed/relaxed;
	bh=7oUVXoKpJUWkPyjQFwDeZmR5nBCSmSHS7bEqYE+Zo4I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RW42X4GaIZygV/+lvdRimo34G37ykPKtUqk+pvNtll9dnkK5874BNX83LSPy5qBd2tpXqSA+euB34+PTV070j36lmLKKWZP/dGQTHz5FzvN3Yb4kjOPZVJmHM4XZ136BUEq0PvQ6OHVREqwJALsSBxfAbSgBiIR8GbtSuNiANy3Arn3LKSt992rqPAYV4jfrQXVLlj4Z4eCK0fI4n7jlVcU0sP/o66N3L/LZAOH3ICSSnPrXXpE2pT4IDXp6K2E2cLuJhFbYVArhqu5QDhofu86BVoNO9mTbNeb/9B0T2ZD4QRBdTMIL6MNnCM9O+bT98X5vP7uyKaiq/EBS/+j9eg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QaZ5vcqU; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=DAfaRQ+O; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=QaZ5vcqU;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=DAfaRQ+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMPWp2fj6z2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 14:19:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728271139; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SeTR1y8uvoBF8vIUP81e73jWbXgVcwj6a+NvQFCcaBc+42hNcvB5i7ELIErRt80P6q
    mhh1Cifyik7nSrli7XArOLTa/GvQ6UTwvXGf+hHvIVP/yGJoIDSrfY8q7ZancXe4bo3C
    dOR5jY5KriY7BS9QOEu47vYFQMtbwF+bPh9XCJid0zf5dbafAm6HkgUgbsaXCT/SbvoJ
    HCwzA+1zzcUU7RKzr8tb7pNkErxSrt00TDx2Q+jtJQQHZKs80bGQE4ChCYiaTh0UiD98
    Kp8pq8nHTzZsixzeKUYeW+8G3WO13JPHUjTRWzgbya6cubIGxMFdtSJjDGTEIZFQRujq
    VxCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1728271139;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=7oUVXoKpJUWkPyjQFwDeZmR5nBCSmSHS7bEqYE+Zo4I=;
    b=qac2S1uKPOyw/bIEozQDgPXNR8im6t4QWRqEcne8VjTdmdsQo2S6qbZQgL/EnVlJh7
    Wal6gjMTdasUhkQrc9xoX3o6Zy4TC+bmHEm27sI7QXj/4TZGPXI2bM3R1Y5TKDRJORah
    +ieK5Tl1hIcywvHH+5PaM5pivyiOo827L+7jNvun32EDiyAiFsQO/7pn79lBbU6YMqCP
    HurgNKOE8itIjc4kFExa9UlVCBaGWwDB6P1QnSfw4ndtKAXtC+V+Wcq74P+T55m8OM9O
    zfG8I2bUDOkVcLn0aJbrs1SqBwTMRAezg8X5hbSAaFz95O9Fllt+vsZorpEMdoQvFZQG
    ntFw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1728271139;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=7oUVXoKpJUWkPyjQFwDeZmR5nBCSmSHS7bEqYE+Zo4I=;
    b=QaZ5vcqU3NvC7vWoqAbldmpw8+5XGzscGiy4jiudoMlJECvhtKoA8Az4pETZGRfONd
    poP/O5bZL1Tiuw2sSS5rc16O3vRusA233Lvz0tLn68yLaaD8wR8drdZJyuCYjh6EHc2A
    cSX3hoKD98m2vwuqxidqJXvPf434JpFw8MWyA372m95K2e+9fIIKljvrG1KOWY74BR85
    8qur2qXr0vMgOTyY/AVC31QGv9urFalC9G4t3uUsAxilYQqHmHoWHcLwZjAnp5R2VkrU
    YP25WIKG+h8Kusb84PkhDWQhXN79NAhJmuQCwGnPMtXm4doF7HzRwXXFULQ6Gu7hdRcd
    jLDA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1728271139;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=7oUVXoKpJUWkPyjQFwDeZmR5nBCSmSHS7bEqYE+Zo4I=;
    b=DAfaRQ+Ou3jtMFn1f2K1mNlRw+T1zSKTOBwSvguxzd6okVRcMaMksdioh3AkIBL1CS
    d11RZwA/1QjrcPd8veDA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6KxrfO5Oh7V7X5mys3LHAXVbPoBiRzkYB5n33o6mQQKw38M3y98="
Received: from [IPV6:2a01:599:816:9399:d800:af8f:8d35:671a]
    by smtp.strato.de (RZmta 51.2.8 AUTH)
    with ESMTPSA id e0da1a0973IvhQc
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Mon, 7 Oct 2024 05:18:57 +0200 (CEST)
Message-ID: <b6c988d5-ba57-4592-aa69-4340ae096da4@xenosoft.de>
Date: Mon, 7 Oct 2024 05:19:59 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Kernel doesn't boot after DRM updates (drm-next-2024-09-19)
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Wu Hoi Pok <wuhoipok@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "R.T.Dickinson"
 <rtd2@xtra.co.nz>, mad skateman <madskateman@gmail.com>,
 hypexed@yahoo.com.au, Christian Zigotzky <info@xenosoft.de>,
 Darren Stevens <darren@stevens-zone.net>
References: <20241003060650.18454-1-wuhoipok@gmail.com>
 <d2704a2b-ceb2-4919-81d3-f6ff58a734fe@xenosoft.de>
 <c868e394-b1ad-4f30-b27b-c779e3458c42@csgroup.eu>
 <4a224c38-35fe-42e3-8dee-ab6353cb7553@xenosoft.de>
In-Reply-To: <4a224c38-35fe-42e3-8dee-ab6353cb7553@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 06 October 2024 at 8:01pm, Christian Zigotzky wrote:
> On 06 October 2024 at 7:37pm, Christophe Leroy wrote:
>>
>> Le 06/10/2024 à 18:56, Christian Zigotzky a écrit :
>>> Hello Wu Hoi Pok,
>>>
>>> Thanks a lot for your patch. Unfortunately there is a new issue 
>>> after patching the RC1. Could you please fix the following issue?
>>>
>>> Thanks,
>>> Christian
>>>
>>> ---
>>>
>>> Linux fienix 6.12.0-rc1-2-powerpc64-smp #1 SMP Fri Oct  4 08:55:45 
>>> CEST 2024 ppc64 GNU/Linux
>>>
>>> [   29.167145] systemd[1]: Sent message type=signal sender=n/a 
>>> destination=n/a 
>>> path=/org/freedesktop/systemd1/unit/NetworkManager_2eservice 
>>> interface=org.freedesktop.DBus.Properties member=PropertiesChanged 
>>> cookie=103 reply_cookie=0 signature=sa{sv}as error-name=n/a 
>>> error-message=n/a
>>> [   29.542140] systemd-journald[1301]: Successfully sent stream file 
>>> descriptor to service manager.
>>> [   29.561863] BUG: Kernel NULL pointer dereference on read at 
>>> 0x00000000
>>> [   29.567156] Faulting instruction address: 0xc000000000c973c0
>>> [   29.571574] cpu 0x1: Vector: 300 (Data Access) at [c000000006f97640]
>>> [   29.576637]     pc: c000000000c973c0: .drm_gem_object_free+0x20/0x70
>>> [   29.581708]     lr: c000000000d28dd8: .radeon_bo_unref+0x58/0x90
>>> [   29.586428]     sp: c000000006f978e0
>>> [   29.588695]    msr: 9000000000009032
>>> [   29.590962]    dar: 0
>>> [   29.591925]  dsisr: 40000000
>>> [   29.593496]   current = 0xc0000000085b1f00
>>> [   29.596286]   paca    = 0xc00000003ffff680     irqmask: 0x03 
>>> irq_happened: 0x01
>>> [   29.602119]     pid   = 1524, comm = Xorg.wrap
>>> [   29.605257] Linux version 6.12.0-rc1-2-powerpc64-smp 
>>> (geeko@buildhost) (powerpc64-suse-linux-gcc (SUSE Linux) 7.5.0, GNU 
>>> ld (GNU Binutils; devel:gcc / SLE-15) 2.43.1.20240828-150300.536) #1 
>>> SMP Fri Oct  4 08:55:45 CEST 2024
>>> [   29.623892] enter ? for help
>>> [   29.625487] [c000000006f97960] c000000000d28dd8 
>>> .radeon_bo_unref+0x58/0x90
>>> [   29.631083] [c000000006f979e0] c000000000e287b0 
>>> .radeon_vm_fini+0x260/0x330
>>> [   29.636765] [c000000006f97aa0] c000000000d07c94 
>>> .radeon_driver_postclose_kms+0x1a4/0x1f0
>>> [   29.643579] [c000000006f97b30] c000000000c9374c 
>>> .drm_file_free+0x28c/0x300
>>> [   29.649174] [c000000006f97be0] c000000000c93900 
>>> .drm_release+0x90/0x170
>>> [   29.654508] [c000000006f97c70] c000000000304790 .__fput+0x120/0x3b0
>>> [   29.659495] [c000000006f97d10] c0000000002fe0fc 
>>> .__se_sys_close+0x4c/0xc0
>>> [   29.665004] [c000000006f97d90] c000000000025bac 
>>> .system_call_exception+0x22c/0x260
>>> [   29.671295] [c000000006f97e10] c00000000000b554 
>>> system_call_common+0xf4/0x258
>>> [   29.677164] --- Exception: c00 (System Call) at 00000000006b2b48
>>> [   29.681876] SP (fff4b3d0) is in userspace
>>> [   29.684577] 1:mon>  <no input ...>
>>> [   31.666727] Oops: Kernel access of bad area, sig: 11 [#1]
>>> [   31.670829] BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 A-EON Amigaone 
>>> X1000
>>> [   31.676144] Modules linked in: snd_hda_codec_idt 
>>> snd_hda_codec_generic snd_hda_codec_hdmi snd_hda_intel 
>>> snd_intel_dspcfg snd_hda_codec snd_hda_core dm_mod
>>> [   31.688703] CPU: 1 UID: 0 PID: 1524 Comm: Xorg.wrap Not tainted 
>>> 6.12.0-rc1-2-powerpc64-smp #1
>>> [   31.695932] Hardware name: pasemi,nemo PA6T 0x900102 A-EON 
>>> Amigaone X1000
>>> [   31.701417] NIP:  c000000000c973c0 LR: c000000000d28dd8 CTR: 
>>> c000000000d07af0
>>> [   31.707250] REGS: c000000006f97640 TRAP: 0300   Not tainted 
>>> (6.12.0-rc1-2-powerpc64-smp)
>>> [   31.714128] MSR:  9000000000009032 <SF,HV,EE,ME,IR,DR,RI> CR: 
>>> 28002222  XER: 20000000
>>> [   31.720773] DAR: 0000000000000000 DSISR: 40000000 IRQMASK: 0
>>>                 GPR00: c000000000d28dd8 c000000006f978e0 
>>> c00000000207a800 c0000000085f5468
>>>                 GPR04: 0000000000000b9b 0000000000000b9a 
>>> 0000000179779000 c0000000086a4b00
>>>                 GPR08: 0000000000000000 0000000000000000 
>>> 0000000000000001 0000000000000000
>>>                 GPR12: 0000000048002202 c00000003ffff680 
>>> 0000000000000000 0000000000000000
>>>                 GPR16: 00000000006e3318 0000000000000001 
>>> 00000000006e289c 0000000000000063
>>>                 GPR20: 00000000c04064a0 00000000007f0088 
>>> 00000000fff4c734 00000000007d165c
>>>                 GPR24: 00000000007d1668 c000000024b6a220 
>>> c000000003588000 c000000024b6a200
>>>                 GPR28: c000000003b3cc00 c000000024b6a248 
>>> c000000002d48820 c0000000085f5468
>>> [   31.778903] NIP [c000000000c973c0] .drm_gem_object_free+0x20/0x70
>>> [   31.783701] LR [c000000000d28dd8] .radeon_bo_unref+0x58/0x90
>>> [   31.788062] Call Trace:
>>> [   31.789199] [c000000006f978e0] [c000000006f97990] 
>>> 0xc000000006f97990 (unreliable)
>>> [   31.795388] [c000000006f97960] [c000000000d28dd8] 
>>> .radeon_bo_unref+0x58/0x90
>>> [   31.801142] [c000000006f979e0] [c000000000e287b0] 
>>> .radeon_vm_fini+0x260/0x330
>>> [   31.806982] [c000000006f97aa0] [c000000000d07c94] 
>>> .radeon_driver_postclose_kms+0x1a4/0x1f0
>>> [   31.813954] [c000000006f97b30] [c000000000c9374c] 
>>> .drm_file_free+0x28c/0x300
>>> [   31.819707] [c000000006f97be0] [c000000000c93900] 
>>> .drm_release+0x90/0x170
>>> [   31.825197] [c000000006f97c70] [c000000000304790] 
>>> .__fput+0x120/0x3b0
>>> [   31.830342] [c000000006f97d10] [c0000000002fe0fc] 
>>> .__se_sys_close+0x4c/0xc0
>>> [   31.836010] [c000000006f97d90] [c000000000025bac] 
>>> .system_call_exception+0x22c/0x260
>>> [   31.842460] [c000000006f97e10] [c00000000000b554] 
>>> system_call_common+0xf4/0x258
>>> [   31.848476] --- interrupt: c00 at 0x6b2b48
>>> [   31.851267] NIP:  00000000006b2b48 LR: 00000000006b2b20 CTR: 
>>> 0000000000000000
>>> [   31.857101] REGS: c000000006f97e80 TRAP: 0c00   Not tainted 
>>> (6.12.0-rc1-2-powerpc64-smp)
>>> [   31.863978] MSR:  100000000200f032 <HV,VEC,EE,PR,FP,ME,IR,DR,RI>  
>>> CR: 28002400  XER: 00000000
>>> [   31.871235] IRQMASK: 0
>>>                 GPR00: 0000000000000006 00000000fff4b3d0 
>>> 00000000f7b7f3a0 0000000000000003
>>>                 GPR04: 0000000000000000 0000000000000000 
>>> 0000000000000000 0000000000000000
>>>                 GPR08: 0000000000000000 0000000000000000 
>>> 0000000000000000 0000000000000000
>>>                 GPR12: 0000000000000000 00000000007efff4 
>>> 0000000000000000 0000000000000000
>>>                 GPR16: 00000000006e3318 0000000000000001 
>>> 00000000006e289c 0000000000000063
>>>                 GPR20: 00000000c04064a0 00000000007f0088 
>>> 00000000fff4c734 00000000007d165c
>>>                 GPR24: 00000000007d1668 00000000fff4b400 
>>> 0000000000000001 0000000000000001
>>>                 GPR28: 00000000fff4b46c 0000000000000000 
>>> 00000000007bfff4 0000000000000003
>>> [   31.926053] NIP [00000000006b2b48] 0x6b2b48
>>> [   31.928930] LR [00000000006b2b20] 0x6b2b20
>>> [   31.931720] --- interrupt: c00
>>> [   31.933466] Code: ebe1fff8 7c0803a6 4e800020 60000000 7c0802a6 
>>> fbe1fff8 7c7f1b78 f8010010 f821ff81 60000000 60000000 e93f0140 
>>> <e9290000> 7d2a0074 794ad182 0b0a0000
>>> [   31.946913] ---[ end trace 0000000000000000 ]---
>>>
>>>
>>
>> That's a NULL pointer dereference in drm_gem_object_free().
>>
>> Trying to read obj->funcs->free while obj->funcs is NULL.
>>
>> Christophe
>
> Hello Christophe,
>
> Thank you for the hint. Could you please create a patch? I would like 
> to apply it to the RC2 tomorrow.
>
> Thanks,
> Christian

Hello Wu Hoi Pok,

Reverting of the drm-next-2024-09-19 updates solves the issue.

Please check the drm-next-2024-09-19 updates.

Thanks,
Christian

