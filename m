Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4F381754
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 11:48:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fj0w66sN9z30GR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 May 2021 19:48:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ygv9nlc1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=Ygv9nlc1; 
 dkim-atps=neutral
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fj0vb58hxz2yYP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 May 2021 19:48:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; t=1621072097; cv=none;
 d=strato.com; s=strato-dkim-0002;
 b=bsgISamXjnx3jvMilwi69anrF8BIO19ElQSD/WoZgtgw1nczLuE2GONfUeDrCW6T3l
 dCWWnN3ytvlEfPyALWhuh84MD4yfoYNgR4oYo86Wph/kwzoFq7YVrD0r/AaUhTS8aQfy
 8W2Zb3Xta6pOTh4D3iT+lIBCayWTOfpq4RWSWsKrVe5cEnyk6RSZzYQ7IwVVUXJlnS/v
 U4k6GOPsQBFs8lJReqlhy5PqTrQKg3aehEqeUteTTKxD2RFb3EcliDJ7YQAQ+25Dz8Zs
 I22dQKsyjfcq5BXX+I7jZr4qSPUAx1IBbgKnNA0FRfVW33j5sFANMREwo7CtfA5QN47t
 Q/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1621072097;
 s=strato-dkim-0002; d=strato.com;
 h=In-Reply-To:Date:Message-ID:Cc:References:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=DooonvsnXQrUosdrhbUqCbyxjMDxSKv7u3E4sbwbDKI=;
 b=rWqbkKKH5iN32c/XZXEGWtzHhRtmBknD9PxKWCh6wApCgn/oKZPCokc3Iw0bYn7M4E
 vkO6FUbt02KUEYZuBrXIK9hqF/DVGZmawvuTJkikeJfDylJauvDV17KfQwAFcNlTP4W8
 /sicq0p7oQhzXPE0N/Ar89JvseT/1P79CNjvAR02YntclOuyWJkzQcYSuQlulxltp3dP
 qSEmzn4SdrvXcADWcEI0VS3PeIdcmVmKjQuJ8KE/3r4JWU3vA05E43d0H5JcpyNZ0LI6
 yOnXSKPTBPYTO7Cfw9DCNDE/+UHmuZw/K+CsNqt6gtMUmNt2Bap+OWc30gQGXKx1u0bG
 zlbg==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1621072097;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:Cc:References:To:From:Subject:Cc:Date:
 From:Subject:Sender;
 bh=DooonvsnXQrUosdrhbUqCbyxjMDxSKv7u3E4sbwbDKI=;
 b=Ygv9nlc1qzVaS9B7YrEbX7C45lBWXQB/CCS5LfyWLqXkjdpzoKqlpOAzl+c60vA54g
 3Tssb7nrI294k5om7HmEr1BFpDD2pwmByrJkXggJUVTHVK1Ar8shpHhJPnJuh7qIwSpm
 Kzyz0X4EqQ/J5hxNOu2MVLr991f48WwlfUuWMJNn7n39EWYRb0jC6DDjXPFozepz1h9d
 LA+kByg8CE8zWOFRgc3wUVNa6LKGz7oFfn/MF5CgkjMR9ZeNjXzkXbGbnqCN739FeOQR
 iEJlYo+Chups8FoWXVoU8uOVzMo3nIfs0D06cKKgBF5yQ9s+f9sg7W3c8Z+TvnrVxEhD
 tqEw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPhXJ7dKjcwcOiBaUbwe0R4Xq9qUgw=="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2a02:8109:89c0:ebfc:41e6:8089:8f38:3ee8]
 by smtp.strato.de (RZmta 47.25.9 AUTH)
 with ESMTPSA id n06826x4F9mG07S
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 15 May 2021 11:48:16 +0200 (CEST)
Subject: Re: [FSL P50x0] KVM HV doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>
References: <04526309-4653-3349-b6de-e7640c2258d6@xenosoft.de>
Message-ID: <34617b1b-e213-668b-05f6-6fce7b549bf0@xenosoft.de>
Date: Sat, 15 May 2021 11:48:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <04526309-4653-3349-b6de-e7640c2258d6@xenosoft.de>
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi All,

I bisected today [1] and the bisecting itself was OK but the reverting 
of the bad commit doesn't solve the issue. Do you have an idea which 
commit could be resposible for this issue? Maybe the bisecting wasn't 
successful. I will look in the kernel git log. Maybe there is a commit 
that affected KVM HV on FSL P50x0 machines.

Thanks,
Christian

[1] https://forum.hyperion-entertainment.com/viewtopic.php?p=53209#p53209

On 14 May 2021 at 10:10 am, Christian Zigotzky wrote:
> Hi All,
>
> The RC1 of kernel 5.13 doesn't boot in a virtual e5500 QEMU machine 
> with KVM HV anymore. I see in the serial console that the uImage 
> doesn't load. I use the following QEMU command for booting:
>
> qemu-system-ppc64 -M ppce500 -cpu e5500 -enable-kvm -m 1024 -kernel 
> uImage-5.13 -drive 
> format=raw,file=MintPPC32-X5000.img,index=0,if=virtio -netdev 
> user,id=mynet0 -device e1000,netdev=mynet0 -append "rw root=/dev/vda" 
> -device virtio-vga -device virtio-mouse-pci -device 
> virtio-keyboard-pci -device pci-ohci,id=newusb -device 
> usb-audio,bus=newusb.0 -smp 4
>
> The kernel boots without KVM HV.
>
> Have you already tested KVM HV with the kernel 5.13?
>
> Thanks,
> Christian
>
>

