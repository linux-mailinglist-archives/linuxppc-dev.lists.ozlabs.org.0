Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893A36FE63
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWyHm1GTWz2yy9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 02:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=embeddedor.com header.i=@embeddedor.com header.a=rsa-sha256 header.s=default header.b=DkVi50Av;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=embeddedor.com (client-ip=192.185.45.95;
 helo=gateway21.websitewelcome.com; envelope-from=gustavo@embeddedor.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=embeddedor.com header.i=@embeddedor.com
 header.a=rsa-sha256 header.s=default header.b=DkVi50Av; 
 dkim-atps=neutral
X-Greylist: delayed 1364 seconds by postgrey-1.36 at boromir;
 Sat, 01 May 2021 02:19:07 AEST
Received: from gateway21.websitewelcome.com (gateway21.websitewelcome.com
 [192.185.45.95])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWyHH0Rqsz2xZG
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 02:19:07 +1000 (AEST)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway21.websitewelcome.com (Postfix) with ESMTP id 9EEE7400CAC7E
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 10:56:17 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id cVV3lE5HTb8LycVV3l6ywG; Fri, 30 Apr 2021 10:56:17 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Om4ZY5IbR19QUfg7UpptCRqjveQax7WqnKvkVNKEw60=; b=DkVi50Avya1CiFlM/pC74kdFZb
 DC5++rKV2ax2Pj+xzqzHZIp0+MzKKyA9u7coLXcUQ3S19AIyxbS0UXXkenkHuhghE9mjzRyNElVzb
 EiaXYAIefqo22e44jo5Gt+BnoZvFiKQexMpOdYL2Gpx6qKIf7NvSfKP4QpDKFy/cRyS/ceK4t5zEf
 BP9mJydmEVVwIpXm1EDvjEoi2yb5IKBzilP4xtQpAMKV4YmyS99k14k00wozGpCM2zZKA6DyabKj9
 VutcrxfmfxU+t2FWRHBzUllg6XvZdWWynd3nL20MWZjruty9oOVOR1tBUtFfUzvE1BpiWCdJn8bWs
 A9j85RSg==;
Received: from 187-162-31-110.static.axtel.net ([187.162.31.110]:33768
 helo=[192.168.15.8])
 by gator4166.hostgator.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <gustavo@embeddedor.com>)
 id 1lcVUy-003wNy-PP; Fri, 30 Apr 2021 10:56:12 -0500
Subject: Re: Radeon NI: GIT kernel with the nislands_smc commit doesn't boot
 on a Freescale P5040 board and P.A.Semi Nemo board
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>,
 "gustavoars@kernel.org" <gustavoars@kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <3eedbe78-1fbd-4763-a7f3-ac5665e76a4a@xenosoft.de>
 <MN2PR12MB44881C5F5E24888E2590BF74F75E9@MN2PR12MB4488.namprd12.prod.outlook.com>
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <eaf27853-916c-e095-7b7a-afb5256a6f67@embeddedor.com>
Date: Fri, 30 Apr 2021 10:56:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <MN2PR12MB44881C5F5E24888E2590BF74F75E9@MN2PR12MB4488.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.ozlabs.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.162.31.110
X-Source-L: No
X-Exim-ID: 1lcVUy-003wNy-PP
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 187-162-31-110.static.axtel.net ([192.168.15.8])
 [187.162.31.110]:33768
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 8
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
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
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>, Olof Johansson <olof@lixom.net>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/30/21 10:26, Deucher, Alexander wrote:
> [AMD Public Use]
> 
> + Gustavo, amd-gfx
> 
>> -----Original Message-----
>> From: Christian Zigotzky <chzigotzky@xenosoft.de>
>> Sent: Friday, April 30, 2021 8:00 AM
>> To: gustavoars@kernel.org; Deucher, Alexander 
>> <Alexander.Deucher@amd.com>
>> Cc: R.T.Dickinson <rtd2@xtra.co.nz>; Darren Stevens <darren@stevens- 
>> zone.net>; mad skateman <madskateman@gmail.com>; linuxppc-dev 
>> <linuxppc-dev@lists.ozlabs.org>; Olof Johansson <olof@lixom.net>; 
>> Maling list - DRI developers <dri-devel@lists.freedesktop.org>; Michel 
>> Dänzer <michel@daenzer.net>; Christian Zigotzky <info@xenosoft.de>
>> Subject: Radeon NI: GIT kernel with the nislands_smc commit doesn't 
>> boot on a Freescale P5040 board and P.A.Semi Nemo board
>>
>> Hello,
>>
>> The Nemo board (A-EON AmigaOne X1000) [1] and the FSL P5040 Cyrus+ 
>> board (A-EON AmigaOne X5000) [2] with installed AMD Radeon HD6970 NI 
>> graphics cards (Cayman XT) [3] don't boot with the latest git kernel 
>> anymore after the commit "drm/radeon/nislands_smc.h: Replace 
>> one-element array with flexible-array member in struct NISLANDS_SMC_SWSTATE branch" [4].
>> This git kernel boots in a virtual e5500 QEMU machine with a VirtIO-GPU [5].
>>
>> I bisected today [6].
>>
>> Result: drm/radeon/nislands_smc.h: Replace one-element array with 
>> flexible-array member in struct NISLANDS_SMC_SWSTATE branch
>> (434fb1e7444a2efc3a4ebd950c7f771ebfcffa31) [4] is the first bad commit.
>>
>> I was able to revert this commit [7] and after a new compiling, the 
>> kernel boots without any problems on my AmigaOnes.
>>
>> After that I created a patch for reverting this commit for new git test kernels.
>> [3]
>>
>> The kernel compiles and boots with this patch on my AmigaOnes. Please 
>> find attached the kernel config files.
>>
>> Please check the first bad commit.

I'll have a look.

Thanks for the report!
--
Gustavo

>>
>> Thanks,
>> Christian
>>
>> [1]
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fen.
>> wikipedia.org%2Fwiki%2FAmigaOne_X1000&amp;data=04%7C01%7Calexand
>> er.deucher%40amd.com%7C0622549383fb4320346b08d90bcf7be1%7C3dd89
>> 61fe4884e608e11a82d994e183d%7C0%7C0%7C637553808670161651%7CUnkn
>> own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik
>> 1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PNSrApUdMrku20hH7dEKlJJ
>> TBi7Qp5JOkqpA4MvKqdE%3D&amp;reserved=0
>> [2]
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwiki.
>> a miga.org%2Findex.php%3Ftitle%3DX5000&amp;data=04%7C01%7Calexander
>> .deucher%40amd.com%7C0622549383fb4320346b08d90bcf7be1%7C3dd8961f
>> e4884e608e11a82d994e183d%7C0%7C0%7C637553808670161651%7CUnknow
>> n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
>> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=B8Uvhs25%2FP3RfnL1AgICN3Y4
>> CEXeCE1yIoi3vvwvGto%3D&amp;reserved=0
>> [3]
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fforu
>> m.hyperion-
>> entertainment.com%2Fviewtopic.php%3Ff%3D35%26t%3D4377&amp;data=
>> 04%7C01%7Calexander.deucher%40amd.com%7C0622549383fb4320346b08d
>> 90bcf7be1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63755380
>> 8670161651%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj
>> oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=TokXplD
>> Tvg3%2BZMPLCgR1fs%2BN2X9MIfLXLW67MAM2Qsk%3D&amp;reserved=0
>> [4]
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.
>> k ernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%
>> 2Fcommit%2F%3Fid%3D434fb1e7444a2efc3a4ebd950c7f771ebfcffa31&amp;d
>> ata=04%7C01%7Calexander.deucher%40amd.com%7C0622549383fb4320346
>> b08d90bcf7be1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375
>> 53808670161651%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
>> CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JC
>> M4xvPEnWdckcTPbQ2Ujv%2FAiMMsFMzzl4Pr%2FRPlcMQ%3D&amp;reserve
>> d=0
>> [5] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel uImage - 
>> drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev
>> user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append "rw 
>> root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci 
>> -device usb- tablet -device virtio-keyboard-pci -smp 4 -vnc :1 [6] 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fforu
>> m.hyperion-
>> entertainment.com%2Fviewtopic.php%3Fp%3D53074%23p53074&amp;data
>> =04%7C01%7Calexander.deucher%40amd.com%7C0622549383fb4320346b08
>> d90bcf7be1%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6375538
>> 08670161651%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
>> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=RXfSlY
>> A3bDEFas0%2Fk2vMWsl2l0nuhS2ecjZgSBLc%2Bs4%3D&amp;reserved=0
>> [7] git revert 434fb1e7444a2efc3a4ebd950c7f771ebfcffa3
