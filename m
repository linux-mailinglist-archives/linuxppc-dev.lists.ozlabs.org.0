Return-Path: <linuxppc-dev+bounces-4560-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8189FF4AF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 18:21:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNc840WYyz2xfW;
	Thu,  2 Jan 2025 04:21:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.54 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735752099;
	cv=pass; b=d3TZZ/76PiP6aL0QH+bhOJ8cKYKyh3Q9zw+HmHTe7KDzwfGg7JMpYKlxJ2R1Dr8HMZRAdgmG49i2z6pNzIIp3itu84tvPes3DR240PIMr/QhSk8/QvzC+VrAddmdkxf4bjtfBhf9PXG7yVSU7mriSr45F5X5WUOHh8kKmRW57DqPLhtGgkbxVmYa5fqzHnX9g8acIT6uR/+fIJOTNthxCpt6jEymEJ39nGYeOhBv53sxtwl8Xirv/MVfDgAIw0CBTDQjOGZEBsdJB4KPpiRhpRSh5B1hA20k5CawPWlwMGIttOuRugE0KE9T+uG2vYzrlsJWpCs75llhSIQQcByWzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735752099; c=relaxed/relaxed;
	bh=5hq9xnb8DY/iuwXktmMmUz/CVLXuk5ve6jKKAReX3SE=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=EN+UJHvYgv3aATxeuvklhW2sDqaQLvwhqUDmzcS249i7teQ5Wvsg+Ho79Bp7LaSJoqG4GQPshGtseoS3uTSCcTp9/Bd5uQ8+Ilfo9Xp6wXCxiburP7jcYle+BVKUC4JxRwcYoXQRnLg86HgrUXnSpIOoPWYIHJEAoMt/Bm2IoKZLVx6KCXWwNnbCi5Z5x1msEbo8gZV/2q58euxgFi7I5L16XwA9FWi9MHnEst3h3PKstD/PI04+zf7Z5Uw0hQOYJtzWtcFOkaneyiEFwcc0G+dsH0jI5aHs/laSAUNrvzhxXlIMny6HNbSIvSxzklWY1OqOewI9jE2DBxYp4bD2sQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=crah09jU; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=sr7jbfKY; dkim-atps=neutral; spf=pass (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=crah09jU;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=sr7jbfKY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.54; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNc7z4CV1z2xdp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2025 04:21:33 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735752085; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Xb0OyH65vYAUU2k36UEUqpbhlr7aRC2+XPxiCiRkEFjrZX30kI2rqy+CemzxK4Ot8K
    LAz3nOIOEwts4mwphfi2U9pb1rLKbqvwBtVDxmv4oMGnkIRYtg8lLeALKcmFD+zMB6MK
    16GlpWEIl+EOnGkervjiv0PHNwLosnhX4StwepFCqAXoiKUB2m7LtSGmNR8P5prMaBra
    Qk/LiroR3g8umvVoV0qNpCBP+znd1tE5kfzaVJKA6I6iULs7lfxqI2KHsyLRJY0NELjS
    CiTmD985eApZ7RxUz1cILirKae1ypGdkLpW1MHBDsmQlQcbkS9blOYVNrX1aHo9OnEu6
    7RUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735752085;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=5hq9xnb8DY/iuwXktmMmUz/CVLXuk5ve6jKKAReX3SE=;
    b=tCYYcUmtvCWrQEzaIkfXlLBdq5hp65w2JBUFVleTQC/J7/8INEloBuw19Yd55uFB1X
    RajGgkY22UNiTqMpQkku//W7GJLIbDAjcEN2A6gKw5T6LM92yxt4sKr5LsVd9msMojje
    h8c4OqjfJwhqCZMI2H6xEPEMQLKb/gnd9GXvgKlgk4wv95v2ugS3pgbrOhhEe7X+d793
    19M7VwRnu64H63U7tvd528TnrJH7LLS5qur6Vqw02moxRSfXAy+gDbD1KCg3+Ni4YhDA
    V4OmDJ47Yj+bvLT1S1JeO3cp7sf09P4g/OVza5QeIK0HIj67pSu2AwfhOB9uXYO/ir2M
    A82g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735752085;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=5hq9xnb8DY/iuwXktmMmUz/CVLXuk5ve6jKKAReX3SE=;
    b=crah09jU/SxjBDi/Sw97Pp8kvEck3R4Ilvs1L+DDRIUTNVEIcxDjlEpjHp601YOUYf
    I0WbIAZdMB6XZFPPg3fcuC/zgz5EQjprYhIYzJWKhgNaaM0y6iGhAU3TAq6xJYpeiCSt
    lDvzAxisnCm47WBpMdl/Y6JNSSx/yeNXk8zDrajHhd5gyj9qxAUIT0i0w+2X/M3wT8sL
    +g3ptNOUBf73hXykcNMlfDLrwF52qsZ+7+BbJ/+0hFD3EDXaTrFXCeSFbiYgrWj29ZxA
    15CliqHyithDCNRkzO+y6ZEUWVWwHlTXcU0xpMEKAJXkZAr6c1QVDaK4On9DRgSBhPKf
    ozyw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735752085;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=5hq9xnb8DY/iuwXktmMmUz/CVLXuk5ve6jKKAReX3SE=;
    b=sr7jbfKYTZ9UsIdT+4EXUkVQBN6pODND3ai+r4/6lGw4dwr9Ij4O7vplyissEVSSig
    siVS9zq/4b+MvnhAhZAg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EivHj9FnXlZguLZm8PSmufN+FD/uA=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c9101HLPMvK
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Wed, 1 Jan 2025 18:21:25 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Darren Stevens <darren@stevens-zone.net>, Pat Wall <pjwall@mac.com>,
 Pat Wall <pjwall@me.com>, Christian Zigotzky <info@xenosoft.de>,
 madskateman@gmail.com, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 hypexed@yahoo.com.au, regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
 <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
 <2881940a-2da0-4498-b447-f09fffb14189@redhat.com>
 <50149f09-174f-ad6e-e97d-3d8889b412a6@xenosoft.de>
 <CABgObfYqGVQk0nvPZqzc1Q7K0jg-Gxk2tVmrk75R6TaLUt9exQ@mail.gmail.com>
 <10826e5f-d3a6-7792-4466-0bf21082a155@xenosoft.de>
 <CABgObfY-R+ASCGbhDNaQPBLRk4jHiOOvOrN9+e-ub3=-VzKEYw@mail.gmail.com>
 <4d291b7d-a65e-2ec9-146c-4063d14ef85f@xenosoft.de>
 <bfb4f3bc-23f3-3a9a-195e-afd73ab675cd@xenosoft.de>
 <1b8945df-fa30-ffb3-d270-b2642242f055@xenosoft.de>
Message-ID: <f7ac9e24-d701-3d54-f35a-8863082a6c6a@xenosoft.de>
Date: Wed, 1 Jan 2025 18:21:24 +0100
X-Mailer: BrassMonkey/33.4.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
In-Reply-To: <1b8945df-fa30-ffb3-d270-b2642242f055@xenosoft.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 01/01/25 14:30, Christian Zigotzky wrote:
> Hello Paolo,
>
> First, I wish you a Happy New Year. Thanks a lot for your patch! I 
> patched the RC5 of kernel 6.13 with your patch and KVM HV works! :-)
>
> kvm_hv_final.patch:
>
> virt/kvm/kvm_main.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index de2c11dae231..5177e56fdbd5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2975,10 +2975,11 @@ kvm_pfn_t __kvm_faultin_pfn(const struct 
> kvm_memory_slot *slot, gfn_t gfn,
>                 .refcounted_page = refcounted_page,
>         };
>
> -       if (WARN_ON_ONCE(!writable || !refcounted_page))
> +       if (WARN_ON_ONCE(!refcounted_page))
>                 return KVM_PFN_ERR_FAULT;
>
> -       *writable = false;
> +       if (writable)
> +               *writable = false;
>         *refcounted_page = NULL;
>
>         return kvm_follow_pfn(&kfp);
> ---
>
> patch -p0 < kvm_hv_final.patch
>
> patching file a/virt/kvm/kvm_main.c
>
> Now, we have a good patch after 56 test kernels!!!!!!!!!
>
> I will test all QEMU/KVM HV components and report, if they work.
>
> Cheers,
> Christian
>
Test results:

- Guest performance: good
- Guest boot time: short
- KVM HV works (-enable-kvm)
- SMP works (-smp 4)
- QEMU User Networking (SLIRP) via VirtIO_net works (Tested it with SSH 
and with a web browser)
- QEMU USB Audio works (Tested it with some audio files in the guest system)
- VirtIO GPU works
- Virtual mouse and keyboard controller work (VirtIO input)
- 9p mount of a host folder via VirtIO works in the guest system
- Serial output from the guest works (console=ttyS0,115200)
- Shutdown and reboot work

Final result: I have not noticed any changes compared to KVM HV with 
kernel 6.12.

@Paolo
There has been a lot of work in KVM for kernel 6.13.
Could you please just explain in a few words the news about KVM? I would 
like to share the KVM news with our users.

Thanks

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


