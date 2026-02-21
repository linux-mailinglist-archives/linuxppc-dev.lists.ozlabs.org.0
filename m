Return-Path: <linuxppc-dev+bounces-16997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +2leOv1CmWk5SQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 06:30:37 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D7A16C2D2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Feb 2026 06:30:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHwgW5SnXz2yrn;
	Sat, 21 Feb 2026 16:30:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.50 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771651831;
	cv=pass; b=Ts+B3ac2zGT95gZdAFiOYdm4j7JeNX8y2ojwmDU09NO5nYSaP3vIf51yLsTne2ZoBO7Up6LjRENoi7qZ0l3+GiQZVVw2hhYk75iSQ/xKaovmtmhwhakuWW3xftIs+MQ/n6UpWLnBSy71JJy5mCXR9pPCOP+TaZDKkaoxp8MpP1/5gIKm3T4p8A1/q087pqPk3nCKjvsdqwGZ3ridVt/ObVDXHRxeQOfHw6ugAVV46ArJ+cgRho3LwFn73a59dS8YXuyUbvaRkbAbkpOOvNNWhRv7RKHzRvPeF9SX7nIf5L+iYX0z1mH6nRfWX/V3dg8aHIVkv71GGAT8o84IryxfFA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771651831; c=relaxed/relaxed;
	bh=xiZA9x3OPQVYWcCMaB4GuifGnS/I0Xs2MqxxsnNhDkg=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=cacLrwIOMLXajBQYgbfEou9JLAnzdk3T3fLeNCs1hL3O2+EWisr54kRIba+erc+1MT7nxHSHBstHxDROMRotCxnT1WtrhVCkUO0G/jUb7SYUz8CDfbMvI7lDrV0AEk+t4Mfk6jigJrTs/t0rWetBqSJAj+/U5blfKJA2GOaqbuVzRTo7NJ9jqmRyyKuuy7WQlbfbP9fhdwTvNxG1ukvO5TrNVkXF/y9lQmDAgU01Ipv5xpttyZ5Swmg0a9Y6gaxYsk0JAb+0aA917Zt4NowMmgNvfzlctDB0WIibVMiY94Lt0QehF8oWnlM9pVxlj9eLh3Fh80XX6eyEYRlYxK8Ghw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=LRGnpI8/; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=csbqOM7V; dkim-atps=neutral; spf=pass (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=LRGnpI8/;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=csbqOM7V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHwgS0lS6z2xlr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Feb 2026 16:30:25 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1771651819; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=SfRp1dRaWeeEqpo+5Fw/kPzAAp81PAV10Xl3SfKuJNlw2xNc1bbrY/7wKHIathyIvs
    P1dVHl6vzK7MVFGGLEtv29p1/DVwp9VaKTeg9rYBcnEWj/Fum5u2OAzSTO4WR3X/hz/P
    PpJ4C0cLmdkZT0OT/7ljqWWTSVN8hJrphvKvTTa2r9/woT+McSj4VCAxosDpFx/OWjxn
    ZWx6PqI0Fo6U/TGy4yC6YRzHSGVEy21EeCK9aDzBIZQ/LRY4CAZR3vCeBAXZTxb+SimS
    8zaE+x+vJdCCBUWU3MHglP7m7mG7g83FWeEJ/VgLSZwx15sB8c7uEXPsiEiNnsiuUzdY
    dheg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1771651819;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=xiZA9x3OPQVYWcCMaB4GuifGnS/I0Xs2MqxxsnNhDkg=;
    b=TitQ7QEJWQ32r+IvuwiVOurqmoXJOoUdUG7w41vL30Ks92G91Ok+S3fIdqAAKo9O9U
    TP15Eu73LnUFtYCX8fUfIdpdlZMlD2tMVTjpFTDVISWiGIJ/KC8jfmQsK35HDwmKQXJ3
    od2rSTYlS1p+rgT64/h33rz3Pfy/3s8a90H17LzXhCMoZnPaYv8nCyS6Kde3DrO70aFF
    1MdRCVE0FmghS4+64K/m6m4UTH7imCrocgKpBTHv96FkdBzEJkB5PohGlpVudb5K77VM
    hP+4CRzedK1HX/hXbpEg/wjq7maGFLyiHDiC6LaKnqmJQDd4ImNmomJgA6u9cngFemvz
    g9Bg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1771651819;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=xiZA9x3OPQVYWcCMaB4GuifGnS/I0Xs2MqxxsnNhDkg=;
    b=LRGnpI8/yHS481WpwxjWL5B/7tcjSGqvByvmBzu9km3uMpuMBk59ei81W1qfHzWUhR
    WID1uk1ZhMnwgpNM8Y7DGMvxCu9iOTheb/0wnqFsGHPb0g6A89vHrQH1zQnrDmnCNgGf
    2mxvAIkOpZLUElxtOUhBoA6WYqslO9mV8oE9svQtvAvth2AIyG+SKQOOfHOdc70jPyz9
    qisl4mPRaDiS1PxDzAjvxc80LeF4Lb0iPYEa2AjKwpXTXAE7OqcwQVAxjXeP+2dRipmw
    IAEUGGiJw273rX8sigy93/AcglsLmrWaenQyEHHMLzib0fi201eFGxVF0nc9DXLlaccw
    23lQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1771651819;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=xiZA9x3OPQVYWcCMaB4GuifGnS/I0Xs2MqxxsnNhDkg=;
    b=csbqOM7Vi04DhAntFW8BsxnGc9zeaJfPeSF/88AbgIsyuwoByIxdfyWPQQLVztbfIN
    kmNaj6jIfyVgK3cwB9DA==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr4thIFiqT9BURIi+m7Bzg"
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id e9337f21L5UIc3u
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Sat, 21 Feb 2026 06:30:18 +0100 (CET)
Subject: [Linux PPC] KVM PR and KVM HV do not work if the kernel was compiled
 with PREEMPT
To: Shrikanth Hegde <sshegde@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "kvm-ppc@vger.kernel.org" <kvm-ppc@vger.kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 mad skateman <madskateman@gmail.com>, Christian Zigotzky <info@xenosoft.de>
References: <b897b0fd-90f2-4215-bcd4-3714e497d773@xenosoft.de>
 <185d7a42-f7b4-44e1-a129-f5989d211c74@linux.ibm.com>
 <40154f6a-39da-959d-e039-5ab9ff62db3c@xenosoft.de>
 <709b864f-9daa-4a48-b3d6-39baedce63b2@linux.ibm.com>
 <dbbb7998-5245-170f-626b-81bc75a32591@xenosoft.de>
 <843b7c60-23f1-47d0-b4e8-2147c3e40c23@linux.ibm.com>
 <2a27e6fc-7eb4-41a5-ba88-58f6a22625b5@xenosoft.de>
 <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Organization: A-EON Open Source
Message-ID: <caeed62f-0e36-4868-e593-887d7f33ce50@xenosoft.de>
Date: Sat, 21 Feb 2026 06:30:18 +0100
X-Mailer: BrassMonkey/33.9.1
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
Precedence: list
MIME-Version: 1.0
In-Reply-To: <1d79ec6f-ce7f-4432-80e0-a54fa1668642@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[xenosoft.de,reject];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[xenosoft.de:s=strato-dkim-0002,xenosoft.de:s=strato-dkim-0003];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_FROM(0.00)[bounces-16997-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sshegde@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:kvm-ppc@vger.kernel.org,m:maddy@linux.ibm.com,m:rtd2@xtra.co.nz,m:hypexed@yahoo.com.au,m:madskateman@gmail.com,m:info@xenosoft.de,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[xtra.co.nz,yahoo.com.au,gmail.com,xenosoft.de];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chzigotzky@xenosoft.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[xenosoft.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xenosoft.de:mid,xenosoft.de:dkim]
X-Rspamd-Queue-Id: 55D7A16C2D2
X-Rspamd-Action: no action

On 17/02/26 12:34, Shrikanth Hegde wrote:
>
>
> On 2/17/26 3:56 PM, Christian Zigotzky wrote:
>> On 17/02/26 11:17 Madhavan Srinivasan wrote:
>>>
>>> On 2/17/26 3:14 PM, Christian Zigotzky wrote:
>>>> On 17/02/26 10:03, Shrikanth Hegde wrote:
>>>>>
>>>>>
>>>>> On 2/17/26 2:22 PM, Christian Zigotzky wrote:
>>>>>> Hi,
>>>>>>
>>>>>> Thank you for your patch. I tested the latest git kernel with 
>>>>>> your patch today. Unfortunately the system freezes while booting 
>>>>>> the VM with KVM HV.
>>>>>>
>>>>>> Cheers,
>>>>>> Christian
>>>>>>
>>>>>>
>>>>> Would it be possible to share the console log or boot log of KVM 
>>>>> to the
>>>>> point it freezes?
>>>>
>>>> Unfortunately there aren't any error messages.
>>>>
>>>> I also tried it with:
>>>>
>>>> gdb --args qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel 
>>>> uImage-7.0-preempt -drive 
>>>> format=raw,file=void-live-powerpc-20230317- 
>>>> updated2.img,index=0,if=virtio -netdev user,id=mynet0 -device 
>>>> virtio- net,netdev=mynet0 -append "rw root=/dev/vda" -device 
>>>> virtio-gpu-pci - device virtio-mouse-pci -device 
>>>> virtio-keyboard-pci -enable-kvm -smp 4
>>>>
>>>> and with gdb in the guest:
>>>>
>>>> qemu-system-ppc64 -s -S -M ppce500 -cpu e5500 -m 1024 -kernel 
>>>> uImage-7.0-preempt -drive 
>>>> format=raw,file=void-live-powerpc-20230317- 
>>>> updated2.img,index=0,if=virtio -netdev user,id=mynet0 -device 
>>>> virtio- net,netdev=mynet0 -append "rw root=/dev/vda" -device 
>>>> virtio-gpu-pci - device virtio-mouse-pci -device 
>>>> virtio-keyboard-pci -enable-kvm -smp 4
>>>>
>>>> The system freezed without any error messages.
>
> Anything on host console?
>
>>> can you please share the config.
>>> I tried kvm-hv in my power8/power9 and seems to boot fine without 
>>> any issues with today's upstream
>>> Maddy
>> Here are the configs.
>>
>> With PREEMPT: https://github.com/chzigotzky/kernels/blob/ 
>> d50d259ca63dd2b3b9a9eaabc82e5cc69c8cc9f0/configs/e5500_defconfig
>>
>> Without PREEMPT: https://github.com/chzigotzky/kernels/blob/main/ 
>> configs/e5500_defconfig
>>
>> - Christian
>
> I looked at the code. there was one more place where cond_resched was 
> there.
>
> If possible give the below try.
> (Note: Didn;t replicate your issue)
>
> ---
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 7667563fb9ff..bf0ca49c9915 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4825,10 +4825,13 @@ static int kvmppc_run_vcpu(struct kvm_vcpu *vcpu)
>          vc->runner = vcpu;
>          if (n_ceded == vc->n_runnable) {
>              kvmppc_vcore_blocked(vc);
> -        } else if (need_resched()) {
> +        } else if (need_resched() || spin_needbreak(&vc->lock)) {
>              kvmppc_vcore_preempt(vc);
>              /* Let something else run */
> -            cond_resched_lock(&vc->lock);
> +            spin_unlock(&vc->lock);
> +            schedule();
> +            //cond_resched_lock(&vc->lock);
> +            spin_lock(&vc->lock);
>              if (vc->vcore_state == VCORE_PREEMPT)
>                  kvmppc_vcore_end_preempt(vc);
>          } else {
> @@ -4901,7 +4904,7 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, 
> u64 time_limit,
>      }
>
>      if (need_resched())
> -        cond_resched();
> +        schedule();
>
>      kvmppc_update_vpas(vcpu);
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 9a89a6d98f97..54963c1d8b58 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -86,7 +86,7 @@ int kvmppc_prepare_to_enter(struct kvm_vcpu *vcpu)
>      while (true) {
>          if (need_resched()) {
>              local_irq_enable();
> -            cond_resched();
> +            schedule();
>              hard_irq_disable();
>              continue;
>          }
>
Hello Shrikanth,

I tested your patch today. The patched preempt kernel boots on my e5500 
host and in an e5500 VM. Unfortunately my guest and host freeze after 
loading the VirtIO-GPU.

Thanks for your help,

Christian

-- 
Sent with BrassMonkey 33.9.1 (https://github.com/chzigotzky/Web-Browsers-and-Suites-for-Linux-PPC/releases/tag/BrassMonkey_33.9.1)


