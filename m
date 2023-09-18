Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC5E7A419C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 08:57:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQHaDQ0+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQHaDQ0+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RpwZr3k3Kz3c7q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 16:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQHaDQ0+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WQHaDQ0+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RpwYw74z9z2yTx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Sep 2023 16:56:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695020175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2mcwAczqQrH8FC4T+/52u6VelTTkFaOGAGOTHdcUPg=;
	b=WQHaDQ0+g805qLR/QFkMPYQCESO4YJ21A8ubGqWEojozaikcwz0CGpzZzWjCJK3eJRTWDr
	P+onZRvPyBHt6zqBsir6BoKpm/MekFydQcpa438ECoU/h8y8D/lN3CA+obHpy+qDiJ02Hw
	AQhhrdhSdqzc/1DcLjR6MXUQqXV2/t0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695020175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h2mcwAczqQrH8FC4T+/52u6VelTTkFaOGAGOTHdcUPg=;
	b=WQHaDQ0+g805qLR/QFkMPYQCESO4YJ21A8ubGqWEojozaikcwz0CGpzZzWjCJK3eJRTWDr
	P+onZRvPyBHt6zqBsir6BoKpm/MekFydQcpa438ECoU/h8y8D/lN3CA+obHpy+qDiJ02Hw
	AQhhrdhSdqzc/1DcLjR6MXUQqXV2/t0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-sF549zutOxWciPRqASt7ag-1; Mon, 18 Sep 2023 02:56:13 -0400
X-MC-Unique: sF549zutOxWciPRqASt7ag-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3172a94b274so2811247f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Sep 2023 23:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695020172; x=1695624972;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h2mcwAczqQrH8FC4T+/52u6VelTTkFaOGAGOTHdcUPg=;
        b=WCwUpKIUqV5paCE0Ye8JFuhRCaTsFVha7YcP2gCBc46I3YZMVZ8E9YZL+8YeDHUre9
         QNNQeUeGHazsklEMPO4U/LbhROJ3V/akAJxluVDVec6HhuLc3BFqVfonPEHVQFuY/3mg
         QM7gWlM/rk5DH01iiaXpnK5pJywjYrA5iyXAaq3luWo9j7dpQ3bUk/fxxeaVbS1NSb+0
         PMhFc8XgrhiBtPlu3BXCqllzKccmuHAk8m4VUSJVw02sU4b9xJ5vdsMQDp4/CUoKSCpi
         R1g3iyDN008ed5iy+yk6erKnMop3CTxv7I/mPD8IePlNyWuT70QcJbDRSb4B11qkuVJi
         hAQA==
X-Gm-Message-State: AOJu0YxMRdoz95seURd0sN+rWcOMoKv9yZsiOO3H2o3TTcpl9Wcwumyd
	+zv7eGO+gXm+L1zCFHi16BaokZ8GqO/Xiy3Eg490cF58EQ69U7lLQiY/SF44ChYc1L7ObeqyQnD
	Ede0IRCxkhuDlE567yBzn0Rhkiw==
X-Received: by 2002:a5d:4c4a:0:b0:31f:8999:c409 with SMTP id n10-20020a5d4c4a000000b0031f8999c409mr6947630wrt.66.1695020172215;
        Sun, 17 Sep 2023 23:56:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6F/Z9q4tB58E26+mCTcb2TpjD2EEslfwOYb0HqPPBuG0zLaR6K3OsqOUHedxMDM3AqkpDEA==
X-Received: by 2002:a5d:4c4a:0:b0:31f:8999:c409 with SMTP id n10-20020a5d4c4a000000b0031f8999c409mr6947581wrt.66.1695020171900;
        Sun, 17 Sep 2023 23:56:11 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
        by smtp.gmail.com with ESMTPSA id t3-20020a05600001c300b003143b14848dsm11523936wrx.102.2023.09.17.23.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Sep 2023 23:56:11 -0700 (PDT)
Message-ID: <a6a77718-219f-30f6-b8de-acd7aadf3b0c@redhat.com>
Date: Mon, 18 Sep 2023 08:56:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 18/26] KVM: s390: Stop adding virt/kvm to the arch include
 path
To: Sean Christopherson <seanjc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andy Lutomirski <luto@kernel.org>
References: <20230916003118.2540661-1-seanjc@google.com>
 <20230916003118.2540661-19-seanjc@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230916003118.2540661-19-seanjc@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16/09/2023 02.31, Sean Christopherson wrote:
> Don't add virt/kvm to KVM s390's include path, the headers in virt/kvm are
> intended to be used only by other code in virt/kvm, i.e. are "private" to
> the core KVM code.  It's not clear that s390 *ever* included a header from
> virt/kvm, i.e. odds are good the "-Ivirt/kvm" was copied from a x86's
> Makefile when s390 support was first added.
> 
> The only headers in virt/kvm at the time were the x86 specific ioapic.h,
> and iodev.h, neither of which shows up as an #include in the diff for the
> commit range 37817f2982d0f..e976a2b997fc4.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>   arch/s390/kvm/Makefile | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/s390/kvm/Makefile b/arch/s390/kvm/Makefile
> index 02217fb4ae10..f17249ab2a72 100644
> --- a/arch/s390/kvm/Makefile
> +++ b/arch/s390/kvm/Makefile
> @@ -5,7 +5,7 @@
>   
>   include $(srctree)/virt/kvm/Makefile.kvm
>   
> -ccflags-y := -Ivirt/kvm -Iarch/s390/kvm
> +ccflags-y := -Iarch/s390/kvm
>   
>   kvm-y += kvm-s390.o intercept.o interrupt.o priv.o sigp.o
>   kvm-y += diag.o gaccess.o guestdbg.o vsie.o pv.o

Reviewed-by: Thomas Huth <thuth@redhat.com>

