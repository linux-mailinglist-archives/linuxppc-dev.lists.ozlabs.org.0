Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190FB8A1F63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 21:23:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtJX+fh3;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B7rAn49s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFqNM5vGjz3vZk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 05:22:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CtJX+fh3;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=B7rAn49s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFqMc01Hrz3dV7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 05:22:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712863335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=18QsSf6cSqU7ygavXwYObjncvBPRu0gV7UzJI9r152U=;
	b=CtJX+fh31hicIEgWPial1X2ZcFCYZDYa85IVEo5tICSLy8JA13OhVq6IsHIHqtugxFgGWS
	0BNB5mMBaJ2iFKR0NhrJ0irwGc/1WBiZ/pUy8edEcv1TBRgXeezgM4TB93LHr8gP7rEEuC
	jOKtKDlL6pRPv8Lgbs7tigXM/iUHFio=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712863336;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=18QsSf6cSqU7ygavXwYObjncvBPRu0gV7UzJI9r152U=;
	b=B7rAn49sHI+xSQiUnVyIP2BjXkY8zlQUhtm3Or9ZZMyznGE3JJjKBA/T+bc7qdHMiNFCwI
	MaWsNza+g7CVgcmUZdKoqbd7y4M3j3sUpAkR9bLJQh7aiGWYkGpo9E+SA8UsLnrbgkm+r6
	oiwO2HDqYTh8Q1lPuA214GmaBBDzWIk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-nDyTaO_oOBeKrThSxUgvSw-1; Thu, 11 Apr 2024 15:22:13 -0400
X-MC-Unique: nDyTaO_oOBeKrThSxUgvSw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-56fdaa6fc78so45467a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 12:22:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712863332; x=1713468132;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18QsSf6cSqU7ygavXwYObjncvBPRu0gV7UzJI9r152U=;
        b=Qa7EeJeNFMt56Zo4fEd0Z14ttDVWc73UJEcBkX9orFWe7WkfQD8bQbKRn0rrGZSjng
         Gkq7Tcq3hKEis+FBPdwT1nYPV4Y/zD4CyczmGB0gEvBEHaonllanl0BHN3KalvRMmp6T
         VQwzcOiZkyCZYmFEElbFpzELTp15g24sWL/ytv7aVNYIrm2yv5/Pb2UcOLOm9FwZovWJ
         lftQCIjtRo3VeI7aO2SqrJy5K+RN38imHmZxg7G+icuwcdRSAOKQUvSwzVvdXX8JHNrU
         MZNfgsbPq8poFF2FNHcbCj9P63dek64iahEnko8ZW60IK5FtHN/RDWi2Uf3++LYzr5r9
         LhxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2fe0nJnPdcbhEc6sZ/IIE+EV6wK/bxBSO/CsZezjskS2NlyCitQ5Gv7+gXm4SJgBk5qtQ3WufeWXUpqACod405P4Rbrj7z9csFeRobg==
X-Gm-Message-State: AOJu0YyJm/hpEpVepcodwdxiOzSnUcWlkjbpoGaGf0v8wxT7bve3fvGV
	A6bvutickKvQgFUGrqeeXyR5K8djA+biwYchjN6mOIxkjCGEE0oTx1XRAmv6/yNuSoA3umWyzKI
	gLqB00ZoSNjMXRSJKMH8TqsgyUtlRRoEtUoLg7fYF2eUUxFEluxfTIovyXLMsrFw=
X-Received: by 2002:a17:906:d54c:b0:a51:9416:4c9d with SMTP id cr12-20020a170906d54c00b00a5194164c9dmr474487ejc.46.1712863332649;
        Thu, 11 Apr 2024 12:22:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyeQ1TJPhivcaEtnUjzeo5bhrEokf4/u40jykJuOeXTLFR1VvvgS+ZPUkvFNWW8vONPsSctQ==
X-Received: by 2002:a17:906:d54c:b0:a51:9416:4c9d with SMTP id cr12-20020a170906d54c00b00a5194164c9dmr474474ejc.46.1712863332314;
        Thu, 11 Apr 2024 12:22:12 -0700 (PDT)
Received: from [192.168.0.9] (ip-109-43-179-142.web.vodafone.de. [109.43.179.142])
        by smtp.gmail.com with ESMTPSA id dm18-20020a170907949200b00a51983e6190sm1006517ejc.205.2024.04.11.12.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 12:22:11 -0700 (PDT)
Message-ID: <e6c452bd-9101-40b7-ae3b-02400fed9e42@redhat.com>
Date: Thu, 11 Apr 2024 21:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v8 06/35] gitlab-ci: Run migration selftest
 on s390x and powerpc
To: Nico Boehr <nrb@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
 <20240405083539.374995-7-npiggin@gmail.com>
 <171259239221.48513.3205716585028068515@t14-nrb>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <171259239221.48513.3205716585028068515@t14-nrb>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/04/2024 18.06, Nico Boehr wrote:
> Quoting Nicholas Piggin (2024-04-05 10:35:07)
>> The migration harness is complicated and easy to break so CI will
>> be helpful.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   .gitlab-ci.yml      | 32 +++++++++++++++++++++++---------
>>   s390x/unittests.cfg |  8 ++++++++
>>   2 files changed, 31 insertions(+), 9 deletions(-)
>>
>> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
>> index ff34b1f50..60b3cdfd2 100644
>> --- a/.gitlab-ci.yml
>> +++ b/.gitlab-ci.yml
> [...]
>> @@ -135,7 +147,7 @@ build-riscv64:
>>   build-s390x:
>>    extends: .outoftree_template
>>    script:
>> - - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
>> + - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
>>    - mkdir build
>>    - cd build
>>    - ../configure --arch=s390x --cross-prefix=s390x-linux-gnu-
>> @@ -161,6 +173,8 @@ build-s390x:
>>         sclp-1g
>>         sclp-3g
>>         selftest-setup
>> +      selftest-migration-kvm
> 
> We're running under TCG in the Gitlab CI. I'm a little bit confused why
> we're running a KVM-only test here.

The build-s390x job is TCG, indeed, but we have the "s390x-kvm" job that 
runs on a KVM-capable s390x host, so it could be added there?

  Thomas

