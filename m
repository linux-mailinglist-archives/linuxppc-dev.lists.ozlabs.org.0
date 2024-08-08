Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B076594C0D6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 17:19:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wovqsNrz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfrKy4RDdz2yXd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 01:19:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wovqsNrz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfrKF5qDWz2y0K
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 01:18:23 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-428085a3ad1so8235105e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723130300; x=1723735100; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=wovqsNrzt1kWe5v/KPe9sy0ZDiVvaPK7k001xLTqru2BDpJMz/M2CQztc1AbMqRxuB
         ogEUdb1GIu1BRxGdQhDdroLRZZ7HniGTW7QBCo5dJXa3MvAvVEK9Z1tf38ZDFxVE6gp3
         PFSMDGLU2TTrBfQ/WDsw494KbU+9NVqEmOdfkZDxuqnWeORM2KtERC6is0NJV5VAu1Wi
         wLT7rtpMYoPVwYSnJKbZK+KJgpuSbPLjYYbbsxEzlsC1v0ETNFnanNCmuGRSOZUzNBZp
         251RqeFXTJY/Be6jBnB552cU9s9UJfS0dbHprlMAI3g1CybXWfYKUZ3EW572EFud26Ab
         CMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723130300; x=1723735100;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tobJ9z30Evl1jF8OZuU4Lc5uAJoWjkGhLZnI88VCnqo=;
        b=SnDD1lLRuRbbv3iei0MWXCCj+Khp8QpoAX/17xnVB9TyyO40wChfNs7q0UgyQeh1zv
         huHW42ldYgX/ixxk1L1oRaBzM574gux9C3O833MMQ8E7S6WyoH4ZmjoICuOkbVAo8mTg
         A3TH9m0Gl5wKEYjUVuTOWJg696ZCFfZgdCbvyKCyUBHRf7ixwjR3tN1/1IqJrVrf3SqM
         ECb3yoOf3p6WdKAQnSp1V89Cgg98zf3gOp1MDjTiU4p9M5BwSbCBIFoDzzz4v7K1mzL9
         07dLsRDn7zAzMOk+8eFIAOd2m9PQ2YQA9KvlKPmRULGh1rS9NPdlzxSaa/7poCUwgKui
         WOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq0Rk/pjnKUhhVrnwsjA2pYrfOmf1rkrpUx2xEi9xkoIMTtZxtxkXFG5DkaoaUIvyZC8wsR51xVOZ6ZN4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz8n1EVSlG2GFk9a6LJOW39ZV1D9a3fIMXw1ipI+SHkwD9wJIcm
	u4ezRw652CznogFWsClfOj/Gh1/tfPKPTuu0Rpv7UZkEBR1Ny5RODMNSPxFgwxA=
X-Google-Smtp-Source: AGHT+IGvryFhFZyruwyY4esgEivQLYITNxgcfgoPAmbjFk+Vzw8kMU8OO4VMz6KIvqZ2Rys90VZ6yQ==
X-Received: by 2002:a05:600c:1914:b0:426:4f47:6037 with SMTP id 5b1f17b1804b1-4290af13367mr16171145e9.19.1723130299428;
        Thu, 08 Aug 2024 08:18:19 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429059a5dbbsm78703665e9.36.2024.08.08.08.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 08:18:18 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id BF0C45F769;
	Thu,  8 Aug 2024 16:18:17 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <ZrTFPhy0e1fFb9vA@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 06:16:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
Date: Thu, 08 Aug 2024 16:18:17 +0100
Message-ID: <877ccrqc06.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>>=20
>> > Now that hva_to_pfn() no longer supports being called in atomic contex=
t,
>> > move the might_sleep() annotation from hva_to_pfn_slow() to
>> > hva_to_pfn().
>>=20
>> The commentary for hva_to_pfn_fast disagrees.
>>=20
>>   /*
>>    * The fast path to get the writable pfn which will be stored in @pfn,
>>    * true indicates success, otherwise false is returned.  It's also the
>>    * only part that runs if we can in atomic context.
>>    */
>>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *pfn)
>>=20
>> At which point did it loose the ability to run in the atomic context? I
>> couldn't work it out from the commits.
>
> It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic co=
ntext
> would still be functionally ok), rather the previous patch
>
>   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
>
> removed support for doing so in order to simplify hva_to_pfn() as a whole.

It still sticks out given the only caller no longer enforces this.=20

How about:

    * true indicates success, otherwise false is returned.  It's also the
    * only part that could run in an atomic context if we wanted to
    * (although no callers expect it to).

?

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
