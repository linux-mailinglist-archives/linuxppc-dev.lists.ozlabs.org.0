Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37EA36B367
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 14:46:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTPm64nkKz30Fw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 22:46:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=EIyPOAWK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.dk (client-ip=2607:f8b0:4864:20::533;
 helo=mail-pg1-x533.google.com; envelope-from=axboe@kernel.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel-dk.20150623.gappssmtp.com
 header.i=@kernel-dk.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=EIyPOAWK; dkim-atps=neutral
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTPlg6Wc6z2ysm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 22:46:21 +1000 (AEST)
Received: by mail-pg1-x533.google.com with SMTP id y32so39963248pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 05:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vBwj4uVXhHL7JLV9W7jcaKiEoNSYfcenJXMDu4IEgb4=;
 b=EIyPOAWKOCj1qnQXj5/vN7SitJydh8ksy/yWGwQIbgSR521++d+8lcitRG5F43ZRN8
 QlIz2IYMDdvrq7GEPn+gbkkJo04dJ0eNOGdIV2+9B+1mpqeIRsndnuCrYH08c3QM78uF
 nvFlamzqa7lgpVbeGBjuZqGvlFXZczbfXeRdg8ijj5aaoc2K7x+xsoarcOUdzAtPDS15
 +BNGv7x7jZknt+Xa8dES1Hbq64WeYF4K/CXeIUpdVGE9UhhkJ3STv92QHNSVzp59g8XW
 luhApgxmd+mV9uDhUYSmVempN7kd2Ind88+SJbRpU5DHToCqxClSyKlfolvZaayn9rty
 7eTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vBwj4uVXhHL7JLV9W7jcaKiEoNSYfcenJXMDu4IEgb4=;
 b=ND1tn0OUvFp84HctWmbV0FU0+S3T3QYOLXXzCt5l4hFUlQV7UsZTcIhZ5v6BEs4MQ+
 GS6RAtHAYb7vsUSnsZJfNGVwDdcoCP4srgIlS1G07gnPZcNamToxW9hatmFSeWFjI8uo
 eVtTzO9Q0P59Gj9HNfnev17PwpIzIBvxHR6m1NvxbkG8A1TiBuZbsUsvxLi6GQHIYBUE
 VRd85hQbsHUTQhDlzUyvGlVVTtYdNhzdme+lRYzUVtoE4ggTFpbUYyMpjjVAA9D1pcrp
 M2yhNze3a22ucuY7T5hbu1JPF3dgkxdhPfmRaFZflFTdotsFBIn0jg7txC14jSkm1Hk/
 ZDdg==
X-Gm-Message-State: AOAM532GY0x3Nj7K2iFKXsvNpTDIgG4WuU7mVS1OKw//YPL3vx7FdL6Z
 HQsDiOmTzAVsqhO2PuBO5lHlHg==
X-Google-Smtp-Source: ABdhPJygv6nf3XPJmGVk0TrnyRzt5cckGF0TuhEKL/xCK66Iuw/v0yRZic7hhP9dbBy7CQRGKbKpQA==
X-Received: by 2002:a63:1b5c:: with SMTP id b28mr16454750pgm.444.1619441177945; 
 Mon, 26 Apr 2021 05:46:17 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
 by smtp.gmail.com with ESMTPSA id q6sm11136437pfs.33.2021.04.26.05.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 05:46:17 -0700 (PDT)
Subject: Re: linux-next: boot failure in today's linux-next
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210426163606.36a97253@canb.auug.org.au>
 <20210426174310.6f03345b@canb.auug.org.au>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <387b26fe-81f5-1bb1-33fd-7fccb7b73823@kernel.dk>
Date: Mon, 26 Apr 2021 06:46:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210426174310.6f03345b@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus <torvalds@linux-foundation.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Changheun Lee <nanich.lee@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/26/21 1:43 AM, Stephen Rothwell wrote:
> Hi all,
> 
> On Mon, 26 Apr 2021 16:36:06 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Today's linux-next build (ipowerpc_pseries_le_defconfig)
>> failed its qemu boot tests like this:
>>
>> [    1.833361][    T1] ibmvscsi 71000003: SRP_VERSION: 16.a
>> [    1.834439][    T1] ibmvscsi 71000003: Maximum ID: 64 Maximum LUN: 32 Maximum Channel: 3
>> [    1.834683][    T1] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
>> [    1.842605][    C0] ibmvscsi 71000003: partner initialization complete
>> [    1.844979][    C0] ibmvscsi 71000003: host srp version: 16.a, host partition qemu (0), OS 2, max io 2097152
>> [    1.845502][    C0] ibmvscsi 71000003: sent SRP login
>> [    1.845853][    C0] ibmvscsi 71000003: SRP_LOGIN succeeded
>> [    1.851447][    T1] BUG: Kernel NULL pointer dereference on write at 0x00000390
>> [    1.851577][    T1] Faulting instruction address: 0xc00000000070386c
>> [    1.852171][    T1] Oops: Kernel access of bad area, sig: 11 [#1]
>> [    1.852324][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> [    1.852689][    T1] Modules linked in:
>> [    1.853136][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.12.0 #2
>> [    1.853555][    T1] NIP:  c00000000070386c LR: c000000000703a6c CTR: 0000000000000000
>> [    1.853679][    T1] REGS: c0000000063a2f40 TRAP: 0380   Not tainted  (5.12.0)
>> [    1.853870][    T1] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44002240  XER: 00000000
>> [    1.854305][    T1] CFAR: c000000000703a68 IRQMASK: 0 
>> [    1.854305][    T1] GPR00: c000000000703a6c c0000000063a31e0 c00000000146b200 c0000000080ca800 
>> [    1.854305][    T1] GPR04: c000000006067380 c00c000000020180 0000000000000024 0000000000008500 
>> [    1.854305][    T1] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
>> [    1.854305][    T1] GPR12: 0000000000002000 c000000001640000 c000000008068508 0000000000000020 
>> [    1.854305][    T1] GPR16: 0000000000000000 0000000000000024 c000000000f85f78 c000000000f0d998 
>> [    1.854305][    T1] GPR20: c0000000013b59e0 0000000000000003 c0000000063a340c 0000000000000001 
>> [    1.854305][    T1] GPR24: 0000000000000000 c0000000084a3000 c0000000080ca800 c00c000000020180 
>> [    1.854305][    T1] GPR28: 0000000000008500 c0000000080ca800 0000000000000024 c000000006067380 
>> [    1.855486][    T1] NIP [c00000000070386c] bio_add_hw_page+0x7c/0x240
>> [    1.856357][    T1] LR [c000000000703a6c] bio_add_pc_page+0x3c/0x70
>> [    1.856723][    T1] Call Trace:
>> [    1.856890][    T1] [c0000000063a31e0] [0000000000000c00] 0xc00 (unreliable)
>> [    1.857390][    T1] [c0000000063a3230] [c00000000070105c] bio_kmalloc+0x3c/0xd0
>> [    1.857514][    T1] [c0000000063a3260] [c000000000713014] blk_rq_map_kern+0x164/0x4a0
>> [    1.857630][    T1] [c0000000063a32d0] [c0000000008e17dc] __scsi_execute+0x1cc/0x270
>> [    1.857746][    T1] [c0000000063a3350] [c0000000008e7bf0] scsi_probe_and_add_lun+0x250/0xd90
>> [    1.857887][    T1] [c0000000063a34c0] [c0000000008e921c] __scsi_scan_target+0x17c/0x630
>> [    1.858007][    T1] [c0000000063a35d0] [c0000000008e9900] scsi_scan_channel+0x90/0xe0
>> [    1.858133][    T1] [c0000000063a3620] [c0000000008e9ba8] scsi_scan_host_selected+0x138/0x1a0
>> [    1.858258][    T1] [c0000000063a3670] [c0000000008e9fec] scsi_scan_host+0x2dc/0x320
>> [    1.858367][    T1] [c0000000063a3710] [c00000000091b2a0] ibmvscsi_probe+0xa70/0xa80
>> [    1.858487][    T1] [c0000000063a3800] [c0000000000eb8ac] vio_bus_probe+0x9c/0x460
>> [    1.858616][    T1] [c0000000063a38a0] [c0000000008979bc] really_probe+0x12c/0x6b0
>> [    1.858749][    T1] [c0000000063a3950] [c000000000897fd4] driver_probe_device+0x94/0x130
>> [    1.858874][    T1] [c0000000063a3980] [c00000000089896c] device_driver_attach+0x11c/0x130
>> [    1.858999][    T1] [c0000000063a39c0] [c000000000898a38] __driver_attach+0xb8/0x1a0
>> [    1.859123][    T1] [c0000000063a3a10] [c0000000008941a8] bus_for_each_dev+0xa8/0x130
>> [    1.859257][    T1] [c0000000063a3a70] [c000000000896ef4] driver_attach+0x34/0x50
>> [    1.859381][    T1] [c0000000063a3a90] [c000000000896510] bus_add_driver+0x170/0x2b0
>> [    1.859503][    T1] [c0000000063a3b20] [c000000000899b04] driver_register+0xb4/0x1c0
>> [    1.859626][    T1] [c0000000063a3b90] [c0000000000ea808] __vio_register_driver+0x68/0x90
>> [    1.859754][    T1] [c0000000063a3bb0] [c0000000010cee74] ibmvscsi_module_init+0xa4/0xdc
>> [    1.859931][    T1] [c0000000063a3bf0] [c000000000012190] do_one_initcall+0x60/0x2c0
>> [    1.860071][    T1] [c0000000063a3cc0] [c0000000010846e4] kernel_init_freeable+0x300/0x3a0
>> [    1.860207][    T1] [c0000000063a3da0] [c000000000012764] kernel_init+0x2c/0x168
>> [    1.860336][    T1] [c0000000063a3e10] [c00000000000d5ec] ret_from_kernel_thread+0x5c/0x70
>> [    1.860690][    T1] Instruction dump:
>> [    1.861072][    T1] fba10038 7cbb2b78 7c7d1b78 7cfc3b78 a1440048 2c2a0000 4082008c a13f004a 
>> [    1.861328][    T1] 7c095040 40810110 e93f0008 811f0028 <e9290390> e9290050 812903d8 7d3e4850 
>> [    1.863000][    T1] ---[ end trace c49ca2d91ee47d7f ]---
>> [    1.879456][    T1] 
>> [    2.880941][    T1] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>>
>> I don't know what caused this, but it is some change since Friday.
>>
>> I have left it like this.
> 
> Bisections leads to commit
> 
>   42fb54fbc707 ("bio: limit bio max size")
> 
> from the block tree.  Reverting that commit on top of today's
> linux-next allows to the boot to work again.

The patch has been dropped, thanks Stephen.

-- 
Jens Axboe

