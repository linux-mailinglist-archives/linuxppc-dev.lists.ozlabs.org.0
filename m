Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E80ED30A34C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 09:31:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DTh3v36p2zDrQ8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Feb 2021 19:31:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p00-ob.smtp.rzone.de (client-ip=81.169.146.162;
 helo=mo4-p00-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=coFRL4eC; 
 dkim-atps=neutral
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [81.169.146.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DTh230XXxzDr08
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Feb 2021 19:29:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1612168159;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=SpbmEisnLoL6lSlImlvuqP2MXYU76Kyfh+BBqDqcBj8=;
 b=coFRL4eCEx8GkFZRrnTAmTmkd6RHQKvxU7RiUcYkrDvMKzEm0FEwWIJ+h/hidvNRCN
 AkXlktX++0P+e8bzfvuHsHcVo2hY1RempCV7UQKr+bevQr1txUB26BOMmojyOxquvlEx
 fYaTMkrcZkldDMWWgX+UTgLnypAHTXMD5HrKZ3zO2aQ745AH5+SuVEhU3uf5WH91fNF0
 qDqcQLfJNQK3qv8ulVN1d50Wxiq0t1M8FCrQHu1k3sfLzR5RemSOdRF2A3/sZx3j5LYr
 bcLLlitjUUUfvmqNBuEcvwjFSxjXiehJELExxDmJbTKvnBrqrya537aZIbQN2Ge8FVP+
 c3vw==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhQImqeseX15NqTF93hOr+kotnQew=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.16.0 AUTH)
 with ESMTPSA id R0b2d2x118TH9gf
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Mon, 1 Feb 2021 09:29:17 +0100 (CET)
Subject: Re: FSL P5040: KVM HV doesn't work with the RC5 of kernel 5.11
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, tglx@linutronix.de,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
References: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
 <b0ba0690-507f-7660-79e2-5268cc6684bf@xenosoft.de>
Message-ID: <8a2ddbb2-134a-6692-7645-4079c9c486e9@xenosoft.de>
Date: Mon, 1 Feb 2021 09:29:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b0ba0690-507f-7660-79e2-5268cc6684bf@xenosoft.de>
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
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

I compiled the RC6 of kernel 5.11 today and KVM HV works again. 
Therefore I don't need the patch below anymore.

Many thanks for solving the issue,
Christian


On 27 January 2021 at 05:07pm, Christian Zigotzky wrote:
> Hello,
>
> I compiled the RC5 of kernel 5.11 today. Unfortunately KVM HV doesn't 
> work anymore on my FSL P5040 board [1]. I tested it with QEMU 5.0.0 
> today [2]. The virtual e5500 QEMU machine works with the "RC4 with KVM 
> HV" and with the "RC5 without KVM HV". The complete system freezes if 
> I use KVM HV with the RC5.
>
> I have bisected and 785025820a6a565185ce9d47fdd8d23dbf91dee8 
> (powerpc/mm/highmem: use __set_pte_at() for kmap_local()) [3] is the 
> first bad commit.
>
> I was able to revert this bad commit and after a new compiling, KVM HV 
> works again.  I created a patch for reverting the commit. [4] Please 
> find attached the kernel config. I use one uImage for the virtual 
> machine and for the P5040 board.
>
> Please check the first bad commit.
>
> Thanks,
> Christian
>
>
> [1] http://wiki.amiga.org/index.php?title=X5000
> [2] qemu-system-ppc64 -M ppce500 -cpu e5500 -enable-kvm -m 1024 
> -kernel uImage-5.11 -drive 
> format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
> user,id=mynet0 -device e1000,netdev=mynet0 -append "rw root=/dev/vda" 
> -device virtio-vga -device virtio-mouse-pci -device 
> virtio-keyboard-pci -device pci-ohci,id=newusb -device 
> usb-audio,bus=newusb.0 -smp 4
> [3] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.11-rc5&id=785025820a6a565185ce9d47fdd8d23dbf91dee8
> [4]
> diff -rupN a/arch/powerpc/include/asm/highmem.h 
> b/arch/powerpc/include/asm/highmem.h
> --- a/arch/powerpc/include/asm/highmem.h        2021-01-27 
> 16:12:40.382164118 +0100
> +++ b/arch/powerpc/include/asm/highmem.h        2021-01-27 
> 16:10:54.055249957 +0100
> @@ -58,8 +58,6 @@ extern pte_t *pkmap_page_table;
>
>  #define flush_cache_kmaps()    flush_cache_all()
>
> -#define arch_kmap_local_set_pte(mm, vaddr, ptep, ptev) \
> -       __set_pte_at(mm, vaddr, ptep, ptev, 1)
>  #define arch_kmap_local_post_map(vaddr, pteval)        \
>         local_flush_tlb_page(NULL, vaddr)
>  #define arch_kmap_local_post_unmap(vaddr)      \

