Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6360073BC4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 18:04:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSGBOaY1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSGBOaY1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QnhrV2D9Lz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 02:04:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSGBOaY1;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NSGBOaY1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QnhqW6thnz3bSt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 02:03:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687536210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGvZEb4xaeTCLlMZCHf/6JLvoihCjh5MngBavGT5bMs=;
	b=NSGBOaY1qrMYhGrJHlGuifoHYyGEamE8BgkTaXJQD1AO5yN2JhVf9ud3gTMJPlCNa0oFlc
	Z7jT4whLAAQP9qEFe0hWI372Sn55Jmb/cm5uSTgTbUIOUQ/29qdpMX51BA9TNJaMb1mH6J
	W/B0NlOhoq/Sjz4x347caKBsbpXWZRg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687536210;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGvZEb4xaeTCLlMZCHf/6JLvoihCjh5MngBavGT5bMs=;
	b=NSGBOaY1qrMYhGrJHlGuifoHYyGEamE8BgkTaXJQD1AO5yN2JhVf9ud3gTMJPlCNa0oFlc
	Z7jT4whLAAQP9qEFe0hWI372Sn55Jmb/cm5uSTgTbUIOUQ/29qdpMX51BA9TNJaMb1mH6J
	W/B0NlOhoq/Sjz4x347caKBsbpXWZRg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-7JNKBaKmPOWSlnXCGnG15Q-1; Fri, 23 Jun 2023 12:03:28 -0400
X-MC-Unique: 7JNKBaKmPOWSlnXCGnG15Q-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-4f624a4ea72so608970e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 09:03:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687536207; x=1690128207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGvZEb4xaeTCLlMZCHf/6JLvoihCjh5MngBavGT5bMs=;
        b=FEwXyhVoSHU5ksV2DLYGM+8s/Ukmdir41YMUJpI1LDGOQVZAbq4eTqgHVxPgc0ZJVj
         rAufPWjaq9wnly+kn1yx1FTkHbtvBwYthX+fM8PI9AyHu5C0/+cCsFeaSTh/hoCiBYPC
         qM2IZfwZPEcG5m63ZbXx6Ezg6Kq/vaahn7afqbLG/Z9cKIXITSKQZhabmwCTrQzBxaOI
         aML8PGjtnOjTl0SZvL3H2H9WOVzIbEPQ00pHuEO2EbsJgfss5IhCx7eCJAUPXNGKQun8
         1AzUyHnaTRkKPQBuF0w679qPSolYrYkHqjSAoLc9C17jiqCvcIrqfJmfiHqbxRS6opwe
         VLOQ==
X-Gm-Message-State: AC+VfDyEuukbkB/2HiU56uNY64DddIOdgcDodnopJVxh6UFKEBCl4a1V
	LUu32N7LTdPqOGLH+nK1UXpbbAo36CX5CMWAa64AYOKUOQmJuzzsG5GVdL9cz+0sW/XYHVTirXP
	iyalMSdqHn8BwaRAspjWKE92XjA==
X-Received: by 2002:a19:6601:0:b0:4f6:6037:128e with SMTP id a1-20020a196601000000b004f66037128emr13950316lfc.57.1687536207032;
        Fri, 23 Jun 2023 09:03:27 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4FhNowTVfmy0Vku7MNzLc5bMuiBYL6uHFIN/glgac8uc/9qkhgwWZMHcPVOfP2JGnHjumDqA==
X-Received: by 2002:a19:6601:0:b0:4f6:6037:128e with SMTP id a1-20020a196601000000b004f66037128emr13950297lfc.57.1687536206687;
        Fri, 23 Jun 2023 09:03:26 -0700 (PDT)
Received: from [192.168.8.100] (tmo-099-170.customers.d1-online.com. [80.187.99.170])
        by smtp.gmail.com with ESMTPSA id f2-20020a056402004200b0051bde3e1e48sm3461571edu.96.2023.06.23.09.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jun 2023 09:03:25 -0700 (PDT)
Message-ID: <fc70263c-b7af-d8e0-14f4-4ffcde67aa3e@redhat.com>
Date: Fri, 23 Jun 2023 18:03:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [kvm-unit-tests PATCH 2/2] Link with "-z noexecstack" to avoid
 warning from newer versions of ld
To: Sean Christopherson <seanjc@google.com>
References: <20230623125416.481755-1-thuth@redhat.com>
 <20230623125416.481755-3-thuth@redhat.com> <ZJWrKtnflTrskPkX@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZJWrKtnflTrskPkX@google.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, =?UTF-8?Q?Nico_B=c3=b6hr?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/06/2023 16.24, Sean Christopherson wrote:
> On Fri, Jun 23, 2023, Thomas Huth wrote:
>> Newer versions of ld (from binutils 2.40) complain on s390x and x86:
>>
>>   ld: warning: s390x/cpu.o: missing .note.GNU-stack section implies
>>                executable stack
>>   ld: NOTE: This behaviour is deprecated and will be removed in a
>>             future version of the linker
>>
>> We can silence these warnings by using "-z noexecstack" for linking
>> (which should not have any real influence on the kvm-unit-tests since
>> the information from the ELF header is not used here anyway, so it's
>> just cosmetics).
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   Makefile | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 0e5d85a1..20f7137c 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -96,7 +96,7 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
>>   
>>   autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d
>>   
>> -LDFLAGS += -nostdlib
>> +LDFLAGS += -nostdlib -z noexecstack
> 
> Drat, the pull request[1] I sent to Paolo yesterday only fixes x86[2].

Oops, sorry, I did not notice that patch in my overcrowded mailboxes (or 
forgot about it during KVM forum...) :-/

> Paolo, want me to redo the pull request to drop the x86-specific patch?

I can also respin my patch on top of your series later ... the problem 
currently also only seems to happen on x86 and s390x, on ppc64 and aarch64, 
the linker does not complain ... so maybe it's even better to do it 
per-architecture only anyway? Opinions?

  Thomas

