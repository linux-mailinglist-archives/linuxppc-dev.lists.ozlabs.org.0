Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A8377B657
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 12:16:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8A+oEaF;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8A+oEaF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RPVff4JJsz30NP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Aug 2023 20:16:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8A+oEaF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c8A+oEaF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RPVdj6m6Sz303d
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 20:15:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692008116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yO4ixNcrplGZ+NAzDMsq0PAPN989Nujk0uRoLq5dtlU=;
	b=c8A+oEaFnVdZZxfz5kOI8U4UsJvhC+VjlRT6GEfLy7Q3N2lcamSsuBejc5WDULkOLTuei3
	4USiBXWQuE0I/QfVpXjxI8eb7MMVnVYTHkR+r2OEvnr/bVPNt851y43Md06zVha3/oU6LA
	5PU3CsVf2H9vrA6g4Nc4WP1n+pyP2jc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692008116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yO4ixNcrplGZ+NAzDMsq0PAPN989Nujk0uRoLq5dtlU=;
	b=c8A+oEaFnVdZZxfz5kOI8U4UsJvhC+VjlRT6GEfLy7Q3N2lcamSsuBejc5WDULkOLTuei3
	4USiBXWQuE0I/QfVpXjxI8eb7MMVnVYTHkR+r2OEvnr/bVPNt851y43Md06zVha3/oU6LA
	5PU3CsVf2H9vrA6g4Nc4WP1n+pyP2jc=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-4crqZ3UgOHazmNUlw5WC1g-1; Mon, 14 Aug 2023 06:15:13 -0400
X-MC-Unique: 4crqZ3UgOHazmNUlw5WC1g-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-4fe08e088d5so3685271e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Aug 2023 03:15:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692008111; x=1692612911;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yO4ixNcrplGZ+NAzDMsq0PAPN989Nujk0uRoLq5dtlU=;
        b=VjqMGS7v0MHmHk9CzRvhUZTeTA1hqb94okpM7nQX4+hjK+j4jgFgTrykjqjwih0iOC
         h8lMixFkM1ua5oDZB/2mPWkBOUikbF4gNnHzYRVUado/82G/7VpNaNuHj4103VGMRiVD
         WR8xY2Bw3mzwxJr22CK7hr60AiVmVZHP99JRFMQ0itWdaWc29o839t2ceGqfuwsM8hn5
         /eIiongUYKKs8A7gRNaUw9X1ZTWaZOttPtrB7Hf/PItCRxQaKkvVphu+TB32w6FBv/ci
         JYjyxB0i0tMPeI9F6n6RhQIXQrQuHyaJS1nknPJUzwAnv2CCW5rKPn1UlXck0WLOuL6T
         bcMw==
X-Gm-Message-State: AOJu0YzIJOSxouZA6DC+bh9278fMspfV7df6oaBSCYosvglk+0zuU/kT
	h5Ty9Y2oEZrXhZxsajz/1dL8V6qx4PTadvJ9tWK6dJnYwo0rd6mmkdvN75DIkMmh5O1cUJO/aZb
	faBv/Vf5DpSuw043aZzWezDk4BQ==
X-Received: by 2002:a05:6512:e82:b0:4fe:536f:4b12 with SMTP id bi2-20020a0565120e8200b004fe536f4b12mr5593169lfb.53.1692008111725;
        Mon, 14 Aug 2023 03:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEca0li3s2cCXU3KqOsIHIl+enh83DStfRjmgDfbqbNRd44kTmw2r9zOvatsjVNqOxQyJB2A==
X-Received: by 2002:a05:6512:e82:b0:4fe:536f:4b12 with SMTP id bi2-20020a0565120e8200b004fe536f4b12mr5593146lfb.53.1692008111297;
        Mon, 14 Aug 2023 03:15:11 -0700 (PDT)
Received: from [192.168.8.105] (dynamic-046-114-244-033.46.114.pool.telefonica.de. [46.114.244.33])
        by smtp.gmail.com with ESMTPSA id p16-20020a05600c205000b003fe26bf65e7sm13778145wmg.13.2023.08.14.03.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 03:15:10 -0700 (PDT)
Message-ID: <ff259694-eb1b-771a-faaf-b8119b899615@redhat.com>
Date: Mon, 14 Aug 2023 12:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [kvm-unit-tests PATCH 2/2] Link with "-z noexecstack" to avoid
 warning from newer versions of ld
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org
References: <20230623125416.481755-1-thuth@redhat.com>
 <20230623125416.481755-3-thuth@redhat.com> <ZJWrKtnflTrskPkX@google.com>
 <fc70263c-b7af-d8e0-14f4-4ffcde67aa3e@redhat.com>
 <ZJoSYnZGYrAj11RN@google.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZJoSYnZGYrAj11RN@google.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, David Hildenbrand <david@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/06/2023 00.34, Sean Christopherson wrote:
> On Fri, Jun 23, 2023, Thomas Huth wrote:
>> On 23/06/2023 16.24, Sean Christopherson wrote:
>>> On Fri, Jun 23, 2023, Thomas Huth wrote:
>>>> Newer versions of ld (from binutils 2.40) complain on s390x and x86:
>>>>
>>>>    ld: warning: s390x/cpu.o: missing .note.GNU-stack section implies
>>>>                 executable stack
>>>>    ld: NOTE: This behaviour is deprecated and will be removed in a
>>>>              future version of the linker
>>>>
>>>> We can silence these warnings by using "-z noexecstack" for linking
>>>> (which should not have any real influence on the kvm-unit-tests since
>>>> the information from the ELF header is not used here anyway, so it's
>>>> just cosmetics).
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>>    Makefile | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 0e5d85a1..20f7137c 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -96,7 +96,7 @@ CFLAGS += -Woverride-init -Wmissing-prototypes -Wstrict-prototypes
>>>>    autodepend-flags = -MMD -MF $(dir $*).$(notdir $*).d
>>>> -LDFLAGS += -nostdlib
>>>> +LDFLAGS += -nostdlib -z noexecstack
>>>
>>> Drat, the pull request[1] I sent to Paolo yesterday only fixes x86[2].
...
>>> Paolo, want me to redo the pull request to drop the x86-specific patch?
>>
>> I can also respin my patch on top of your series later ... the problem
>> currently also only seems to happen on x86 and s390x, on ppc64 and aarch64,
>> the linker does not complain ... so maybe it's even better to do it
>> per-architecture only anyway? Opinions?
> 
> I don't think it makes sense to do this per-arch, other architectures likely aren't
> problematic purely because of linker specific behavior, e.g. see
> 
> https://patches.linaro.org/project/binutils/patch/1506025575-1559-1-git-send-email-jim.wilson@linaro.org

Ok, I've pushed now my patches since other people were running into this 
issue, too (see 
https://lore.kernel.org/kvm/20230809091717.1549-1-nrb@linux.ibm.com/ ).

Sean, could you please rebase your series now?

  Thanks,
   Thomas


