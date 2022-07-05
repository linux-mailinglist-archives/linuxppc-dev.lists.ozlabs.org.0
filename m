Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 336525673E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Jul 2022 18:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LcnjF0M9Lz3c5D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 02:11:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RBfOBOXz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p02-ob.smtp.rzone.de (client-ip=85.215.255.81; helo=mo4-p02-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=RBfOBOXz;
	dkim-atps=neutral
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [85.215.255.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lcnhd1s3Gz2yn5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 02:10:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1657037239;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=PtHy6OokJPrFtoDS0Whqy3V68GshIBOfC24cNcVepSk=;
    b=RBfOBOXzrCI63W9Rvbhf5BanvIUqHt/d3ZmxcpQi0btZObe9VDQ4qLRQatssvXPhxn
    V+UCMvezi0yUYjf4cSxB4rfa1hsm26ImuJzoIvJ7z+u0z9DX46bty7ZdpaxTG2L7cn/F
    CFh/hAygHC0+JkceAg0Elcw8W66VUsYAsgzJFoPBMkqB4Cfb8e37L5lUu+Hbyg+5gnYE
    QTaODKOKflh3J4Ipd6TQCGCAUX0uYiBOK3IbY3AVDxSHE/JZds7B5MX9HGUgIFNXPUho
    3MeKiOUah1xoxTXXQ06fptaDeHybL7e5Kz4VOixx9EANdMULh6UUw5jggXTGLPFNbYJ+
    kvlg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBfio0GngadwjW4dqgkobcHPYDc/BNBepImPPJ"
X-RZG-CLASS-ID: mo00
Received: from [IPV6:2a02:8109:8980:4474:3840:b132:e6ea:146]
    by smtp.strato.de (RZmta 47.46.1 AUTH)
    with ESMTPSA id icdf6dy65G7HK68
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 5 Jul 2022 18:07:17 +0200 (CEST)
Message-ID: <76d0db0f-57fe-2985-4916-175d913d99e4@xenosoft.de>
Date: Tue, 5 Jul 2022 18:07:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] kvm: rename KVM_MAX_VCPU_ID to, KVM_MAX_VCPU_IDS
Content-Language: de-DE
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Juergen Gross <jgross@suse.com>
References: <6d3333b1-05cc-103b-4bdb-88bec5e3e9fd@xenosoft.de>
In-Reply-To: <6d3333b1-05cc-103b-4bdb-88bec5e3e9fd@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>, mad skateman <madskateman@gmail.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Darren Stevens <darren@stevens-zone.net>, Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>, "Huacai Chen," <chenhuacai@kernel.org>, "Aleksandar Markovic," <aleksandar.qemu.devel@gmail.com>, Ingo Molnar <mingo@redhat.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, kvm-ppc@vger.kernel.org, Borislav Petkov <bp@alien8.de>, Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Jim Mattson <jmattson@google.com>, "Thomas Bogendoerfer," <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, "Vitaly, Kuznetsov" <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 14 September 2021 at 05:59 pm, Christian Zigotzky wrote:
> Hello Juergen,
> Hello All,
>
> Since the RC1 of kernel 5.13, -smp 2 and -smp 4 don't work with a 
> virtual e5500 QEMU KVM-HV machine anymore. [1]
> I see in the serial console, that the uImage doesn't load. I use the 
> following QEMU command for booting:
>
> qemu-system-ppc64 -M ppce500 -cpu e5500 -enable-kvm -m 1024 -kernel 
> uImage -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio 
> -netdev user,id=mynet0 -device virtio-net,netdev=mynet0 -append "rw 
> root=/dev/vda" -device virtio-vga -device virtio-mouse-pci -device 
> virtio-keyboard-pci -device pci-ohci,id=newusb -device 
> usb-audio,bus=newusb.0 -smp 4
>
> The kernels boot without KVM-HV.
>
> Summary for KVM-HV:
>
> -smp 1 -> works
> -smp 2 -> doesn't work
> -smp 3 -> works
> -smp 4 -> doesn't work
>
> I used -smp 4 before the RC1 of kernel 5.13 because my FSL P5040 BookE 
> machine [2] has 4 cores.
>
> Does this patch solve this issue? [3]
>
> Thanks,
> Christian
>
> [1] https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-May/229103.html
> [2] http://wiki.amiga.org/index.php?title=X5000
> [3] 
> https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-September/234152.html
Hello,

Since the RC5 of kernel 5.19, -smp 2 and -smp 4 work again. I don't know 
which patch has solved the issue.

Cheers,
Christian

