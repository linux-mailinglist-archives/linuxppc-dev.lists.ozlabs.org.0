Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E17CC21B0D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 09:58:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B355V0v1PzDrML
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 17:58:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.61;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=EJrDQNXg; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=EJrDQNXg; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B353q41nPzDqTK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 17:57:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594367828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UmlYK6TFkdH3M5DCGlsKdci4FjjHwdZByjtVurs5W4=;
 b=EJrDQNXgkCZvp3P1S26jEFVkS/Q4nEZ8uzLJIYsCfrdMZ4XFGlzrD4OWILXaxzf9NyFelf
 13L7wR5JPc1BQ6mEy6G6lv7p5P0DtVcpuuCZZg9KoHLBsN93YZbpLVZgOBpVnilAK7kecT
 mg5SfUoFIqME+4VPgA0JVqmt7fb/v68=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594367828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UmlYK6TFkdH3M5DCGlsKdci4FjjHwdZByjtVurs5W4=;
 b=EJrDQNXgkCZvp3P1S26jEFVkS/Q4nEZ8uzLJIYsCfrdMZ4XFGlzrD4OWILXaxzf9NyFelf
 13L7wR5JPc1BQ6mEy6G6lv7p5P0DtVcpuuCZZg9KoHLBsN93YZbpLVZgOBpVnilAK7kecT
 mg5SfUoFIqME+4VPgA0JVqmt7fb/v68=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-Fe-sSYzbOiupsFEd_qs4dg-1; Fri, 10 Jul 2020 03:57:06 -0400
X-MC-Unique: Fe-sSYzbOiupsFEd_qs4dg-1
Received: by mail-wr1-f71.google.com with SMTP id i12so5063757wrx.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 00:57:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9UmlYK6TFkdH3M5DCGlsKdci4FjjHwdZByjtVurs5W4=;
 b=Y2nucuiK2JRsSA3ycADkqvzH0aqvm2DpyvvNoExuqGNh23iX8ZwJTyT+XG6LjSqqIi
 rio109bG91KeyrAAMPj87Uul1pzNbM1X3cT5NZaXW0pbRS38a2GX8frORwJuCDeCmbiy
 NsZW62+fKCyIGZLOjj7yl14XtSOHIg24EERw5YoOLKrO8rwIDZ0kqJeecXqIr5+3qy3V
 rvWdQ83UAOhzDjDP5dVZeeavCqGi6xGkQJXJjy9RUq0dm4JwZymDPCk2VZleXJZbKu1H
 BGIU/EnEMFdAJxWbjBnmdHt1RyF68QjrsQloGMvpQEJJdAt8aLX/+F5tJrHIac3DPcED
 sMRw==
X-Gm-Message-State: AOAM532u44VJuVUuigzrK3dKFRCMKWsidFeOWZKVfNdZnsvcBUcZbIBQ
 3Odxzo2nJxbqv5HrDvjQzJrBa1h2+W79ef2OWCX9DQ94dQknKma8QjQgt3+kvPQyohCEGQgJrGN
 h5rE2iX+f6UcmJKm1eTi36nOMKQ==
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr35612083wrx.166.1594367825620; 
 Fri, 10 Jul 2020 00:57:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxlW3Ot+LBMZYtqgHl9fPkIYjtKMwBy9LJ/7SxUDFXEtvSCRy05DGSOlP3Hhmft1U2EXpdY3Q==
X-Received: by 2002:a05:6000:d0:: with SMTP id
 q16mr35612051wrx.166.1594367825324; 
 Fri, 10 Jul 2020 00:57:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:9541:9439:cb0f:89c?
 ([2001:b07:6468:f312:9541:9439:cb0f:89c])
 by smtp.gmail.com with ESMTPSA id 138sm23193764wmb.1.2020.07.10.00.57.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Jul 2020 00:57:04 -0700 (PDT)
Subject: Re: [PATCH v6 3/5] KVM: PPC: clean up redundant kvm_run parameters in
 assembly
To: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 tsbogend@alpha.franken.de, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, borntraeger@de.ibm.com, frankja@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, heiko.carstens@de.ibm.com,
 gor@linux.ibm.com, sean.j.christopherson@intel.com, vkuznets@redhat.com,
 wanpengli@tencent.com, jmattson@google.com, joro@8bytes.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, maz@kernel.org, james.morse@arm.com,
 julien.thierry.kdev@gmail.com, suzuki.poulose@arm.com,
 christoffer.dall@arm.com, peterx@redhat.com, thuth@redhat.com,
 chenhuacai@gmail.com
References: <20200623131418.31473-1-tianjia.zhang@linux.alibaba.com>
 <20200623131418.31473-4-tianjia.zhang@linux.alibaba.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8947174f-ce16-c076-e208-55e743d9fdf0@redhat.com>
Date: Fri, 10 Jul 2020 09:57:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623131418.31473-4-tianjia.zhang@linux.alibaba.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org,
 kvm-ppc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvmarm@lists.cs.columbia.edu,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/06/20 15:14, Tianjia Zhang wrote:
>  
>  	/* Load non-volatile guest state from the vcpu */
> -	VCPU_LOAD_NVGPRS(r4)
> +	VCPU_LOAD_NVGPRS(r3)
>  
>  kvm_start_lightweight:
>  	/* Copy registers into shadow vcpu so we can access them in real mode */
> -	mr	r3, r4
>  	bl	FUNC(kvmppc_copy_to_svcpu)
>  	nop
> -	REST_GPR(4, r1)
> +	REST_GPR(3, r1)
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
>  	/* Get the dcbz32 flag */
> @@ -146,7 +144,7 @@ after_sprg3_load:

Below, there are a bunch of references to r3 and r4 left

        rldicl  r3, r3, 0, 63           /* r3 &= 1 */
        stb     r3, HSTATE_RESTORE_HID5(r13)

        /* Load up guest SPRG3 value, since it's user readable */
        lwz     r3, VCPU_SHAREDBE(r4)				  <<<
        cmpwi   r3, 0
        ld      r5, VCPU_SHARED(r4)				  <<<

where r3 is also destroyed.  So I'd rather have three patches:

- one that is as small as possible, changing the prototypes and adding

	mr r4, r3

- one that entirely swaps out r3 and r4.  This would be the hard one to
review!

- one that cleans up the prologue and epilogue

But overall I think it's simplest to just leave out this patch.

Paolo

