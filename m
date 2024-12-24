Return-Path: <linuxppc-dev+bounces-4467-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E4C9FBCDE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Dec 2024 12:05:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YHX9Z5L67z2yD8;
	Tue, 24 Dec 2024 22:05:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.53 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735038322;
	cv=pass; b=oc2foGWvc60OuhBwhRuElq9fQTFoG/muYeE6RD5YVQ0hiwqznt2vh+ygKv0OiuejElx2YEGc0C5UhzB/18RXpsXmivYhoNfH92O4bQt8e7HFDXAl90q5RC1Teg5ZNTWeUm+ciY28rO/6eZ4ZacE/secciqlw2GmUMC6JjhIsr7qHdhslvx/SjSYdemqR1/deZvg4G91T8+YkFAp+5Wv+68EhAH6LuMTJOkcC4imhMgwtF5THu3A/Tm8ZCRHcuRJN2wQxQI/+ptm4IlTTHZ6NFkr9UpDpfFaXzQB9mmDR7ptN9DDBVSLO5D0yBkjCIucMzOl9+NX/QmetWcP4CsLUQg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735038322; c=relaxed/relaxed;
	bh=rWDJsGx4IEgo+D26UaSNArr51NpFOgRXg8WQAw+PHug=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=WY1b8yRjtMMxB0AX0F8UHth5szLaoCEe7Is33ISZYyjJnH/ymUVKDMc4Opr2zKTpJEdtngVpRizejVgKYPXiCWAJhvcTFPfrHAbaOZEep9sq9+QEe50W+KTyjfxuRX9dEV52Zr3XinLbdi1M/ympBviU4S/HryIEAWWnibURicnnRIEb7RrTmnOV96wf6i1MCX5ZK+lCIyktA/EcSUK63kFxbIyGfeAp8FYbA5d4d64UE99zM6v/8BPOnRLkOnNQAftSTRHAEi5to7APEk05XVad5cqN+duHN53Xjj3m8INpH8EHbLGsut68wsa5Ck2zp5UNgCr4IBasGehICLkaPg==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de; dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Tg0O577v; dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=zcKwnPtc; dkim-atps=neutral; spf=pass (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Tg0O577v;
	dkim=pass header.d=xenosoft.de header.i=@xenosoft.de header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=zcKwnPtc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.53; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YHX9V0Sr5z2xfW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 22:05:15 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1735038308; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=F+3TvCAvdM1U2Ft/4mROPp+0LCTUyI9FGyIybhs1OwyJ6i06lq78na3CDUcKs/sn+r
    hTVyg4LAujTV1NJ5aZOytozjifUG3S79PXUY6hNlOQN27lHpAbxGS7JuoGdbpFUCvTuR
    PHp8+NuxXoQmD0KWjrkixi0u5KKGeNT2a8T5Ecidt43PNQNMr8mEaKsAFTnpdxRwZiBr
    q+Rrpj1E2VyvUVeltIbce5PDD9Qs6NCNJWBUB4+l04RWqdt8VVDvMhzhjJPf1rzmfDFw
    u4nCErdfTREK4/DwRTXDpWew6RpOX/oRrR+LaJ3DWeLbuZGKp7qJcDLRsjVS8bQ6Fegi
    iyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1735038308;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=rWDJsGx4IEgo+D26UaSNArr51NpFOgRXg8WQAw+PHug=;
    b=Hb2s3kei6EtzagwXPu8z/2KNN0Lo2es2ZHp3tVP6Jnj2oLNTe3e7kMnxOrAvfFsOlR
    qQfRSphbTTqd/rdsBzrlEUNZaO7fDhpJ/zQ/7gQSKFajdZ7FMH0biUwEa9P4pel+3iMg
    uclR3EME70GB+ARmovfOUA2/zT0w+Hz6Rvui/6MwIKlEWVRWXN2MfiieFKuY69CFpoXf
    LEQWLsvPfyd+MW6LBqv3FJx7FT1dKwtH0TCOCxyrYWJwsqOxQB6lk8TzFGqjSHATzQ8w
    0jZXY04fC+gn20yuHdxpYfYAENYMNzguJ/0od/c1cDLbp/CoY9cBrRHwLzKq/cy1af/V
    SmWQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1735038308;
    s=strato-dkim-0002; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=rWDJsGx4IEgo+D26UaSNArr51NpFOgRXg8WQAw+PHug=;
    b=Tg0O577v02zDr2cRLhEKVViHsKFGL52rxQ/dmvYDj/MjmbXgsI/+sl1vzKUtezsEFS
    dc1PydjMly3Hn4+wYS/x6bOUCbIsT+HAnRtl3Z1QdRbX8vf0V/sx4P91dxjvaOO9KIX9
    SBAHIKzTT7oVh+npNcU3IjP1n7us1jI4HUQey65YxFcyPa2jPbgGBj2v1OjOWUFMFm0r
    UqSMI3RqCTsB4BVC/t309uIJaozBBNpwkfVEwmq7+sF2yvsCj2Zqz2vnAe8CkxycMJns
    aK4g6AdTkqTMkRgyBQ9ZZr02AguAtfK/kbYc27e8NsXwwf3BXqUXhyLrrdtBQ3pA2w2O
    OEeQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1735038308;
    s=strato-dkim-0003; d=xenosoft.de;
    h=In-Reply-To:Date:Message-ID:From:References:Cc:To:Subject:Cc:Date:
    From:Subject:Sender;
    bh=rWDJsGx4IEgo+D26UaSNArr51NpFOgRXg8WQAw+PHug=;
    b=zcKwnPtcHCDq46eqRSqXdwh33m+ZyHti9bFvqha5VqURMiX49en2VAFLwSWIabnd+J
    EM2qSbabqpzi5Ls+CnAQ==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGN0rBVhd9dFr6Kxrf+5Dj7x4QgaMrvdtcX133EisT29BnYJMBKrhBYBGwL4fUrhbbg=="
Received: from void-ppc.a-eon.tld
    by smtp.strato.de (RZmta 51.2.16 AUTH)
    with ESMTPSA id ebe9c90BOB57CN9
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 24 Dec 2024 12:05:07 +0100 (CET)
Subject: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org, Darren Stevens <darren@stevens-zone.net>,
 Pat Wall <pjwall@mac.com>, Pat Wall <pjwall@me.com>,
 Christian Zigotzky <info@xenosoft.de>, madskateman@gmail.com,
 "R.T.Dickinson" <rtd2@xtra.co.nz>, hypexed@yahoo.com.au,
 regressions@lists.linux.dev
References: <F693EFBE-3F0D-4B7C-89D8-EA8DCAB3CAB7@xenosoft.de>
 <6CC404E2-2442-47FE-877C-252B1F2872C2@xenosoft.de>
 <f31e176f-200d-f96c-2971-4da0fe8f1245@xenosoft.de>
 <04e5da1a-65e2-ce12-27a5-5fdba9f0408d@xenosoft.de>
 <5e8e202d-4a0b-ced3-8034-796cda679e8a@xenosoft.de>
 <e6672ce2-2bf9-4a1e-b4b8-e1396ccbb56a@xenosoft.de>
 <1539b4dd-9a52-4f87-882d-cb605018d1f4@xenosoft.de>
 <0769459a-10ee-4573-a3ce-541c01429948@redhat.com>
 <fdd0528d-96f2-bc8d-783c-30600b0c15d8@xenosoft.de>
 <CABgObfa6ei-=dSRaPgj7OP07Y4nKAbTt3cRgMSCGRHUmkguOdQ@mail.gmail.com>
 <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
 <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
From: Christian Zigotzky <chzigotzky@xenosoft.de>
Message-ID: <31895b11-5084-95bc-0f14-faaea023b7f8@xenosoft.de>
Date: Tue, 24 Dec 2024 12:05:06 +0100
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
In-Reply-To: <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 23/12/24 16:37, Paolo Bonzini wrote:
>
>
> On Mon, Dec 23, 2024 at 3:41 PM Christian Zigotzky 
> <chzigotzky@xenosoft.de> wrote:
>> Bisecting: a merge base must be tested
>> [e9001a382fa2c256229adc68d55212028b01d515] Merge tag
>> 'kvmarm-fixes-6.12-3' of
>> git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
>>
>> The host system doesn't boot.
>> Unfortunately, there isn't a guest kernel boot log via serial log.
>
> No big deal since the boot hang was fixed via rebase.
>
>>      git checkout -b bisection-rebase
>> b467ab82a9fde4b46c0cd2c299220857afb0e0d4
>>      git rebase v6.12
>>
>> The host kernel boots but the guest kernel doesn't boot so KVM HV
>> doesn't work.
>
> As expected, so that's good.
>
>>      git bisect start
>>      git bisect bad bisection-rebase
>>      git bisect good v6.12
>>
>> [skipping bisection process]
>>
>> `edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 is the first bad commit
>
> Ok, that means that the culprit is commit 419cfb983ca93 (the above
> is the rebased hash).  Thank you very much, your work was really
> helpful!
>
> Can you test this simple patch?
>
> --------------- 8< ----------------
> From: Paolo Bonzini <pbonzini@redhat.com>
> Subject: [PATCH] KVM: allow  NULL writable argument to __kvm_faultin_pfn
>
> kvm_follow_pfn() is able to work with NULL in the .map_writable field
> of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
> despite KVM for e500 trying to use it.  Indeed .map_writable is not
> particularly useful if the flags include FOLL_WRITE and readonly
> guest memory is not supported, so add support to __kvm_faultin_pfn()
> for this case.
>
> Fixes: 1c7b627e9306 ("KVM: Add kvm_faultin_pfn() to specifically 
> service guest page faults")
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index de2c11dae231..5177e56fdbd5 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -2975,10 +2975,11 @@ kvm_pfn_t __kvm_faultin_pfn(const struct 
> kvm_memory_slot *slot, gfn_t gfn,
>          .refcounted_page = refcounted_page,
>      };
>
> -    if (WARN_ON_ONCE(!writable || !refcounted_page))
> +    if (WARN_ON_ONCE(!refcounted_page))
>          return KVM_PFN_ERR_FAULT;
>
> -    *writable = false;
> +    if (writable)
> +        *writable = false;
>      *refcounted_page = NULL;
>
>      return kvm_follow_pfn(&kfp);
>
> Thanks,
>
> Paolo

Hello Paolo,

Thanks a lot for your patch.

I tested it with the RC4 of kernel 6.13 today but unfortunately it 
doesn't solve the KVM HV issue. The guest system doesn't boot and I 
can't see any error messages. (console=ttyS0)

Regards,

Christian

-- 
Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)


