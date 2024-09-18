Return-Path: <linuxppc-dev+bounces-1430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE1997BD43
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2024 15:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X80MP0y9hz2xJ8;
	Wed, 18 Sep 2024 23:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726667249;
	cv=none; b=m96pWpArZzLTgFD5tZfhSUFxhGROJ0dsiPYalEA9u5rJilbrg/C5iRbE8JGQzyTlGJCOZ1vTUGTuGyB2bVtE3AvekpdRNPq88XjFOhKvG+iyMKNxm8lYS2dKJARbRigJRFSZp/3McF5A7Q3IFa4b9n32862XfvVFmlaTxuCvf8Vrvrrgs/wbqtS8wqP69hnyAziDgQMIqZ4LpWrzn2G9ntdCMcOGEwTg/cLKGk2HG78aSNdIddreR1bAVgq02sMlgR2tIyvhDPu+S/gcaEi5UwJODJKVPZ6K7UhxDWkDtOKnzNOXUmojnwEY+/cx5cV13c01/GhnZNuA3+BX8FL7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726667249; c=relaxed/relaxed;
	bh=LA88xgrVVsZ9HS6mv44/h7M+SVZ/ogtb+tJwjKT9Dfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ShK/7FZcJ86hhk2+BiJAkBk5bORDgL8NuGPhMXbQjyfAgKpUMlZcAmJ+YDQIGqmTZsjy0eW0GQA2bkTVea8Zk7lEAFbh4R8dX1yRokkjw7+yoazmRvtVrVsFSCAiBrnTn4PwEtB++FtR/27B3jiMRW64R4kBKU6cOAdlmFY0GxurmLSDXEceF1rZ94o7EYVI2w0bJqe+w5IVedBt1WvY0rlSKS5/tETgEG9OjlN7GNxMlbs2v7DX9ooNpx3a8ZH7jg1Kd/p8I4Lm0ncajOP6z+hwGbui5h2mg16egXaN92VZDbH6LilwBZ1c1/4svWNSqlHHr9JwY0jeebzXeh8cbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X80MN5ZpWz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 23:47:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4X80MG5tqDz9sVq;
	Wed, 18 Sep 2024 15:47:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ylb4EsR4YRR3; Wed, 18 Sep 2024 15:47:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4X80MG4bnGz9sVf;
	Wed, 18 Sep 2024 15:47:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8BECF8B776;
	Wed, 18 Sep 2024 15:47:22 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LVZBc5wuqCZJ; Wed, 18 Sep 2024 15:47:22 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 573B88B775;
	Wed, 18 Sep 2024 15:47:22 +0200 (CEST)
Message-ID: <7f1dfb0f-85ca-4251-96df-c8d4b923c4fd@csgroup.eu>
Date: Wed, 18 Sep 2024 15:47:22 +0200
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
Subject: Re: [PATCH 1/2] powerpc/entry: convert to common and generic entry
To: Luming Yu <luming.yu@shingroup.cn>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 mpe@ellerman.id.au, npiggin@gmail.com, jialong.yang@shingroup.cn,
 luming.yu@gmail.com
References: <B4ABABEA5F13B86A+20240912082500.1469-1-luming.yu@shingroup.cn>
 <fc509bcd-5ca0-4dc2-962e-766a01cbe4fb@csgroup.eu>
 <153FD6B5CE4F97D9+ZuOYDQ-iHIIwJjbh@HX09040029.powercore.com.cn>
 <95ced963-b584-4ccf-ba34-8f2ba99172f4@csgroup.eu>
 <0332BAE1905768B6+ZuPsBvgv0nwmFAjW@HX09040029.powercore.com.cn>
 <854eef54-4779-4233-a958-0c98ae5fcb7e@csgroup.eu>
 <F81D1486B7B82141+ZuQp4YQkAA2cB9Rw@HX09040029.powercore.com.cn>
 <81200b50-eaec-4cfd-9121-f661f3065572@csgroup.eu>
 <9B5E7C0A7C4BFBF0+ZuTzanfk7BcYoFas@HX09040029.powercore.com.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <9B5E7C0A7C4BFBF0+ZuTzanfk7BcYoFas@HX09040029.powercore.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

Le 14/09/2024 à 04:22, Luming Yu a écrit :
> On Fri, Sep 13, 2024 at 02:15:40PM +0200, Christophe Leroy wrote:
>>
>>
>> Le 13/09/2024 à 14:02, Luming Yu a écrit :
>>
>>>> ...
>>>> nothing happens after that.
>>> reproduced with ppc64_defconfig
>>> [    0.818972][    T1] Run /init as init process
>>> [    5.851684][  T240] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
>>> [    5.851742][  T240] kworker/u33:18 (240) used greatest stack depth: 13584 bytes left
>>> [    5.860081][  T232] kworker/u33:16 (232) used greatest stack depth: 13072 bytes left
>>> [    5.863145][  T210] kworker/u35:13 (210) used greatest stack depth: 12928 bytes left
>>> [    5.865000][    T1] Failed to execute /init (error -8)
>>> [    5.868897][    T1] Run /sbin/init as init process
>>> [   10.891673][  T315] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
>>> [   10.894036][    T1] Starting init: /sbin/init exists but couldn't execute it (error -8)
>>> [   10.901455][    T1] Run /etc/init as init process
>>> [   10.903154][    T1] Run /bin/init as init process
>>> [   10.904747][    T1] Run /bin/sh as init process
>>> [   15.931679][  T367] request_module: modprobe binfmt-4c46 cannot be processed, kmod busy with 50 threads for more than 5 seconds now
>>> [   15.934689][    T1] Starting init: /bin/sh exists but couldn't execute it (error -8)
>>
>> That's something different, this is because you built a big-endian kernel
>> and you are trying to run a little-endian userspace.
> okay
>>
>> Does it work with ppc64le_defconfig ?
> make ppc64le_defconfig
> 
> yes, it builds && boots just fine.
> the host is a p8 powernv system , the qemu command line is as below:
> qemu-system-ppc64 -m 64g -smp 16,cores=4,threads=4 --enable-kvm  -nographic -net nic -net tap,ifname=tap0,script=/etc/qemu-ifup-nat,downscript=/etc/qemu-ifdown-nat  Downloads/Fedora-Cloud-Base-38-1.6.ppc64le.qcow2

With that command you don't boot a freshly built kernel, you boot:

Linux version 6.2.9-300.fc38.ppc64le 
(mockbuild@0e2dbea752814aea985bdc5347ce35da) (gcc (GCC) 13.0.1 20230318 
(Red Hat 13.0.1-0), GNU ld version 2.39-9.fc38)

Are you sure you tried with the ppc64le_defconfig ? On my side the boot 
fails as follows when using a ppc64le_defconfig vmlinux with the file 
Fedora-Cloud-Base-38-1.6.ppc64le.qcow2:

...
[    2.602758][    T1] md: autorun ...
[    2.602808][    T1] md: ... autorun DONE.
[    2.612596][  T189] kworker/u73:0 (189) used greatest stack depth: 
29008 bytes left
[    2.617068][    T1] /dev/root: Can't open blockdev
[    2.618136][    T1] VFS: Cannot open root device "" or 
unknown-block(0,0): error -6
[    2.618239][    T1] Please append a correct "root=" boot option; here 
are the available partitions:
[    2.618611][    T1] 0100           65536 ram0
[    2.618768][    T1]  (driver?)
[    2.619101][    T1] 0101           65536 ram1
[    2.619120][    T1]  (driver?)
[    2.619187][    T1] 0102           65536 ram2
[    2.619199][    T1]  (driver?)
[    2.619251][    T1] 0103           65536 ram3
[    2.619261][    T1]  (driver?)
[    2.619312][    T1] 0104           65536 ram4
[    2.619322][    T1]  (driver?)
[    2.619372][    T1] 0105           65536 ram5
[    2.619382][    T1]  (driver?)
[    2.619436][    T1] 0106           65536 ram6
[    2.619447][    T1]  (driver?)
[    2.619500][    T1] 0107           65536 ram7
[    2.619519][    T1]  (driver?)
[    2.619571][    T1] 0108           65536 ram8
[    2.619581][    T1]  (driver?)
[    2.619631][    T1] 0109           65536 ram9
[    2.619641][    T1]  (driver?)
[    2.619690][    T1] 010a           65536 ram10
[    2.619700][    T1]  (driver?)
[    2.619754][    T1] 010b           65536 ram11
[    2.619764][    T1]  (driver?)
[    2.619818][    T1] 010c           65536 ram12
[    2.619827][    T1]  (driver?)
[    2.619880][    T1] 010d           65536 ram13
[    2.619889][    T1]  (driver?)
[    2.619942][    T1] 010e           65536 ram14
[    2.619952][    T1]  (driver?)
[    2.620023][    T1] 010f           65536 ram15
[    2.620036][    T1]  (driver?)
[    2.620116][    T1] 0b00         1048575 sr0
[    2.620150][    T1]  driver: sr
[    2.620221][    T1] 0800         5242880 sda
[    2.620234][    T1]  driver: sd
[    2.620310][    T1]   0801            4096 sda1 
709431c7-74bd-4ec4-bbe8-d4f7e7e3194e
[    2.620369][    T1]
[    2.620449][    T1]   0802         1024000 sda2 
e0b0a6de-ca8f-4e50-808c-121324c94d04
[    2.620463][    T1]
[    2.620531][    T1]   0803          102400 sda3 
8ed2fbf1-fd2c-4ab0-b66f-d31df1d24e3e
[    2.620544][    T1]
[    2.620599][    T1]   0804            1024 sda4 
46dc7fc8-bf10-4166-9bc8-98daabbec06d
[    2.620610][    T1]
[    2.620666][    T1]   0805         4109312 sda5 
8a52b54b-c379-43a5-bf8d-a43fdef4a370
[    2.620676][    T1]
[    2.620838][    T1] List of all bdev filesystems:
[    2.620884][    T1]  ext3
[    2.620918][    T1]  ext2
[    2.620947][    T1]  ext4
[    2.620971][    T1]  msdos
[    2.620995][    T1]  iso9660
[    2.621018][    T1]  xfs
[    2.621050][    T1]
[    2.621311][    T1] Kernel panic - not syncing: VFS: Unable to mount 
root fs on unknown-block(0,0)
[    2.621992][    T1] CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.11.0-06480-gfabc9e955334 #1217
[    2.622166][    T1] Hardware name: IBM pSeries (emulated by qemu) 
POWER9 (architected) 0x4e1200 0xf000005 of:SLOF,HEAD pSeries
[    2.622456][    T1] Call Trace:
[    2.622574][    T1] [c000000003797ad0] [c000000001189fe8] 
dump_stack_lvl+0xd8/0xf0 (unreliable)
[    2.623575][    T1] [c000000003797b00] [c00000000014830c] 
panic+0x2f8/0x4fc
[    2.623666][    T1] [c000000003797ba0] [c000000002006858] 
mount_root_generic+0x2c8/0x474
[    2.623748][    T1] [c000000003797c70] [c000000002006f40] 
prepare_namespace+0x94/0x3a4
[    2.623804][    T1] [c000000003797d00] [c000000002005e7c] 
kernel_init_freeable+0x4cc/0x530
[    2.623896][    T1] [c000000003797de0] [c000000000011138] 
kernel_init+0x34/0x26c
[    2.623954][    T1] [c000000003797e50] [c00000000000debc] 
ret_from_kernel_user_thread+0x14/0x1c
[    2.624025][    T1] --- interrupt: 0 at 0x0
[    4.502550][    T1] pstore: backend (nvram) writing error (-1)
qemu-system-ppc64: OS terminated:


Christophe

