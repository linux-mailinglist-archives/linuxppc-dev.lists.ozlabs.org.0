Return-Path: <linuxppc-dev+bounces-4453-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DBB9FB0C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 16:37:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH2GT0FpKz2yNf;
	Tue, 24 Dec 2024 02:37:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734968272;
	cv=none; b=jfSQ2faxR2ARhepaYpyUK8/wXL/vYvNdedsLcNs/+0m/5k6xQJq/ouuYmtUueFmdFyrMQrx4n+I/QBbbK1Q3mYjOO90yo9BnkBSLe8ZxmPMGche8u6ZrRfpR99Jz2L3WkOuNjcgwTNNHPtl2cJ6uGTYnpwYWUQ6zyjU5XPqaXdLwKTpWgjSwZEmlEeWdY9K/ZixisAsZZ2XRpPg0viMha4GfvdaclkLkNsud/rbq8tMM8LxTVln6UTOPxihN6YjC1QUIVKvn2NkHRNyTHsM6S/w3h3vDfXWJihCiBtUocR1bZpK9OuqcSRCEICYWnYvmKIscJD9XMEpN3kxAjyDOAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734968272; c=relaxed/relaxed;
	bh=gERxao5u7e+QeAFFNB7FHNxaHvWvlD9w4fuFOgxVmVU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OLKKGIklgIAYquLe6M5Bs4rPkdw2vOZDysRZ7P2R9UETWnQPCiOEAicCm5/WicbtvINqpxlZaHUO3wIyYgndqggqtOe6CnJeguq2WbwpXlRC53Ls7J9s8eOGGFDxjTsYHsPt2BBnsM+2l8v62kfBtN71zLEoQF8B2U6TJyr3uQMyfM2U/9tT1cqCDD0IEx5pagtkXOVm9nADGSX0zHJusl3e7slJA+sgel2ENN5Q/vloeK9/7ocnhTBZWFQTPRK8ESL9aNmspdpQMnlbnE2jlM+VkjYcUBWPkq3dAoykrUBlUd1ECOiBfaIkWs+TDU/Ee3B9TjjCyoQYfF0NFC4vhA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+p2iZBV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+p2iZBV; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+p2iZBV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=U+p2iZBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH2GR0bLmz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 02:37:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734968263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gERxao5u7e+QeAFFNB7FHNxaHvWvlD9w4fuFOgxVmVU=;
	b=U+p2iZBV/L/Pj5D9wpXyYgbLXLDlekIB3n+0HkMtMoS2qVh235WmiBi+2omf/EzavjuTYj
	ze9u4Ytk8TZqia/cLoHvOxodQ+clGq96ESbURxx06+UjfDWi0skTtUkHHrZOScs1t9uhCF
	Z5p+YnkgOJAyblprNp65vCp+vyx36wc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734968263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gERxao5u7e+QeAFFNB7FHNxaHvWvlD9w4fuFOgxVmVU=;
	b=U+p2iZBV/L/Pj5D9wpXyYgbLXLDlekIB3n+0HkMtMoS2qVh235WmiBi+2omf/EzavjuTYj
	ze9u4Ytk8TZqia/cLoHvOxodQ+clGq96ESbURxx06+UjfDWi0skTtUkHHrZOScs1t9uhCF
	Z5p+YnkgOJAyblprNp65vCp+vyx36wc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-0VZ_PhDWMOqAuc6JEFV6Pw-1; Mon, 23 Dec 2024 10:37:42 -0500
X-MC-Unique: 0VZ_PhDWMOqAuc6JEFV6Pw-1
X-Mimecast-MFC-AGG-ID: 0VZ_PhDWMOqAuc6JEFV6Pw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43621907030so34913135e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 07:37:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734968261; x=1735573061;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gERxao5u7e+QeAFFNB7FHNxaHvWvlD9w4fuFOgxVmVU=;
        b=wOtfGxWozbTOzvkjFnEe3ptAY796caNwzqpy1RjTvigMf3RDa9iCnyFpnE1I8VuYC0
         8vMQyoAiSkDJCekCL/kwt/gd48eIeD51HACVAL+DNT8nPFzsxiGZ4ZVu8LYra+Hj4GpX
         oIHLUW+ZABqc6jhGyKgBxspYe1KheZVcNjHR6cUxEawfiVk/1LhEzcbPTTOVHTdeZc4K
         saXzli+xffZUS1xlB1CAMt7/Q7lwU5Oc6hhv0mcmBvSPDxQKLIz5biNyKzvVTnQ17a4s
         j7A6MEwRCJ6VmE+PhXDGmhb1wVVdoDr5xnY/1g9Wkfxxcv74fgkj8pvlAhciTCR0+qvS
         rxhQ==
X-Gm-Message-State: AOJu0Ywg3nbcqt0piV5a7Zi+6+XPTuLUa5JzIo4dycRrOT86WY0g7ZBB
	JOkY/poomPQY3sWacANsWui0M7QHL7C8U3CHzxiNhYgNbVFUXo6+eASdrJYvl46uPlK5uOFxgAF
	wtcdKiQCXBxvatuhbfpo+TjcJmc2gJfbBxM72nfMIEyUs/UoiUYY+P4QYeXLa6Bs=
X-Gm-Gg: ASbGncsqrHJteGeQBfUHi1vqbIwOl0yOq6X7QizKO0IkjWcsJu5CR9Nax6tfBUvnhPa
	PRZ8d1l583ttKCXokSX6sARY+47sys18ePJrOoBPMcMIYgEIJ5WlIrsMfSHx5fS8FHb7lDMRIoi
	WegR1xykQd4bVWn/RHFqNMbPbLvOPb6PKLlucgHiG3IwjVQ4FS8aYiIx8maQCiOMhF4kXSYJ66H
	E8u8Ia3jQnYtTkQytMIWBm9Dv8VLp89YJX6PII4O6dAn569kyN+jfpLNBQ=
X-Received: by 2002:a05:6000:70a:b0:382:4ab4:b3e5 with SMTP id ffacd0b85a97d-38a2213e228mr12437162f8f.0.1734968260985;
        Mon, 23 Dec 2024 07:37:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOnMCRNQXx31Qgp9j0WYinV6Gw587GcKHuh8+AHujQ7z9thka6NjL/Uwdm0+hCZkHSiJVi9Q==
X-Received: by 2002:a05:6000:70a:b0:382:4ab4:b3e5 with SMTP id ffacd0b85a97d-38a2213e228mr12437145f8f.0.1734968260634;
        Mon, 23 Dec 2024 07:37:40 -0800 (PST)
Received: from [192.168.10.3] ([151.81.118.45])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436611ea3e0sm141436085e9.7.2024.12.23.07.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2024 07:37:39 -0800 (PST)
Message-ID: <f944fadf-2dfe-4dd3-a086-ae7bb6c0bff6@redhat.com>
Date: Mon, 23 Dec 2024 16:37:38 +0100
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
User-Agent: Mozilla Thunderbird
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: KVM: PPC: Book3E: KVM HV host module doesn't work anymore
To: Christian Zigotzky <chzigotzky@xenosoft.de>
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
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <7d8b5b78-b20c-d915-4a94-7082d7e01600@xenosoft.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G0mc_gFXIr8GIC8dIL0hREKUvKYek0M1A35KxgJ_zDA_1734968261
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On Mon, Dec 23, 2024 at 3:41 PM Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> Bisecting: a merge base must be tested
> [e9001a382fa2c256229adc68d55212028b01d515] Merge tag
> 'kvmarm-fixes-6.12-3' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD
>
> The host system doesn't boot.
> Unfortunately, there isn't a guest kernel boot log via serial log.

No big deal since the boot hang was fixed via rebase.

>      git checkout -b bisection-rebase
> b467ab82a9fde4b46c0cd2c299220857afb0e0d4
>      git rebase v6.12
>
> The host kernel boots but the guest kernel doesn't boot so KVM HV
> doesn't work.

As expected, so that's good.

>      git bisect start
>      git bisect bad bisection-rebase
>      git bisect good v6.12
>
> [skipping bisection process]
>
> `edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4 is the first bad commit

Ok, that means that the culprit is commit 419cfb983ca93 (the above
is the rebased hash).  Thank you very much, your work was really
helpful!

Can you test this simple patch?

--------------- 8< ----------------
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] KVM: allow  NULL writable argument to __kvm_faultin_pfn

kvm_follow_pfn() is able to work with NULL in the .map_writable field
of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
despite KVM for e500 trying to use it.  Indeed .map_writable is not
particularly useful if the flags include FOLL_WRITE and readonly
guest memory is not supported, so add support to __kvm_faultin_pfn()
for this case.

Fixes: 1c7b627e9306 ("KVM: Add kvm_faultin_pfn() to specifically service guest page faults")
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..5177e56fdbd5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2975,10 +2975,11 @@ kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
  		.refcounted_page = refcounted_page,
  	};
  
-	if (WARN_ON_ONCE(!writable || !refcounted_page))
+	if (WARN_ON_ONCE(!refcounted_page))
  		return KVM_PFN_ERR_FAULT;
  
-	*writable = false;
+	if (writable)
+		*writable = false;
  	*refcounted_page = NULL;
  
  	return kvm_follow_pfn(&kfp);

Thanks,

Paolo

> commit edebc0a1b7ab5ff19b4f5cd011c93196fc34b3e4
> Author: Sean Christopherson seanjc@google.com
> Date: Thu Oct 10 11:23:56 2024 -0700
>
> KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
>
> Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
> and continue the inexorable march towards the demise of
> kvm_pfn_to_refcounted_page().
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Message-ID: <20241010182427.1434605-55-seanjc@google.com>
>
> arch/powerpc/kvm/e500_mmu_host.c | 8 +++-----
> 1 file changed, 3 insertions(+), 5 deletions(-)`
>
> Cheers,
> Christian
>
> --
> Sent with BrassMonkey 33.4.0 (https://github.com/wicknix/brass-monkey/releases/tag/33.4.0)
>


