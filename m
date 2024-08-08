Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3081B94C26B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 18:17:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cVHjGvKh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wfsd40hqWz2yRZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Aug 2024 02:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cVHjGvKh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfscB0b7bz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Aug 2024 02:16:24 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso12179951fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2024 09:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723133779; x=1723738579; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=cVHjGvKhXoMlJsc4j6wIc+i8ZnHmcETyVg5j4mi7dlejRiDuW5SR2c4gGQ13fJgmN/
         kZ6T8yOCWQZWyuJoOpkxp0OGJKi8mR9sza69lEBlPMwYi7n7vkCaKPWcb0IxYXiuaaEL
         7CxpzKy4c4xq/Fiwvzgycmr5bvc47I2PqNJ6jaB3KLb7n4myh0lk1cZLlIt4dqqcGcnW
         IAV41kC2VjnMt0ikGS8FfTDLJdcsyvOijpj5ONcYHxiPySStr2CuYhflgNlT2pOhQLYh
         HGRLF2Ku+eUTGmnJlB4O8KAhoI/xT8joVCx3uGjbbmll6ebhwg5lqqX3kcQ9ammeaPYQ
         /3lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723133779; x=1723738579;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLPa+w6AdBa1cUfelytt4eYDYgnS/jumqOLX9cOCUyA=;
        b=e3kBzs0OfNdNNk1jw23KmbztS7Qcj4WMZNl131MQS/H8ygkFGxtBB0PtULTLzOBHX6
         TKipLhTo5BoWgmGDM69rQ5jG0lhgX42wUNj1ZN/n0+kXDXpbVBg01isrGpplf7UNUVVl
         A9EMjEahrMtp0Sy5tOipSts7gcAXsJnhAJ7+FUpaIMmks73enWZGitpdM+cltYHAm9+n
         v83LLEEg6f2qYAKCEh5PS2wXtEejAp6xcVC6uKgrf6D4jC1yx2Rr9GotUPzpNQNYz/Ql
         QPpOaqPUseN4sbMfd9A6KDXZqFgU9sKqJy+5dClP2QeKHj1PmsWT1GGCoioqvau6vlLg
         ZkTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0PARXV6xnDCNMHHyM5gHKLN8yx553ErlvvPzTrVeXFNqXeeq6aaTRDF1BrmE87wjHo+92foRVdc2ygMNgpAgYgxVSYiDEONLmqBrQhA==
X-Gm-Message-State: AOJu0YzFbr1RSf0atX/X5rs4yrHBAALRaKXREgp/f7ZzNF28nviQMs1j
	5xVNvXoX98AvQwWKRuvzw4orOHH3aKNOeIbWjMyTUovLGdpnbHhVmxhSU1F8yJ0=
X-Google-Smtp-Source: AGHT+IFeg1aw2R2jdtW33+RTmD0GoFD4AbJwR/eufpV8IO4HacBEUsTerwG6znblRji34uNx3VzDqg==
X-Received: by 2002:a2e:331a:0:b0:2f0:2d85:2238 with SMTP id 38308e7fff4ca-2f19de75d02mr16453671fa.44.1723133777752;
        Thu, 08 Aug 2024 09:16:17 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36d27229eaasm2377515f8f.103.2024.08.08.09.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 09:16:16 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 824915F769;
	Thu,  8 Aug 2024 17:16:15 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 13/84] KVM: Annotate that all paths in hva_to_pfn()
 might sleep
In-Reply-To: <ZrTk4sQS8k1-GBb3@google.com> (Sean Christopherson's message of
	"Thu, 8 Aug 2024 08:31:46 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-14-seanjc@google.com>
	<87bk23ql6n.fsf@draig.linaro.org> <ZrTFPhy0e1fFb9vA@google.com>
	<877ccrqc06.fsf@draig.linaro.org> <ZrTk4sQS8k1-GBb3@google.com>
Date: Thu, 08 Aug 2024 17:16:15 +0100
Message-ID: <8734nfq9bk.fsf@draig.linaro.org>
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
>> > On Thu, Aug 08, 2024, Alex Benn=C3=A9e wrote:
>> >> Sean Christopherson <seanjc@google.com> writes:
>> >>=20
>> >> > Now that hva_to_pfn() no longer supports being called in atomic con=
text,
>> >> > move the might_sleep() annotation from hva_to_pfn_slow() to
>> >> > hva_to_pfn().
>> >>=20
>> >> The commentary for hva_to_pfn_fast disagrees.
>> >>=20
>> >>   /*
>> >>    * The fast path to get the writable pfn which will be stored in @p=
fn,
>> >>    * true indicates success, otherwise false is returned.  It's also =
the
>> >>    * only part that runs if we can in atomic context.
>> >>    */
>> >>   static bool hva_to_pfn_fast(struct kvm_follow_pfn *kfp, kvm_pfn_t *=
pfn)
>> >>=20
>> >> At which point did it loose the ability to run in the atomic context?=
 I
>> >> couldn't work it out from the commits.
>> >
>> > It didn't lose the ability per se (calling hva_to_pfn_fast() in atomic=
 context
>> > would still be functionally ok), rather the previous patch
>> >
>> >   KVM: Drop @atomic param from gfn=3D>pfn and hva=3D>pfn APIs
>> >
>> > removed support for doing so in order to simplify hva_to_pfn() as a wh=
ole.
>>=20
>> It still sticks out given the only caller no longer enforces this.=20
>
> Oh, sorry, I should have been more explicit.  I'll fix the comment, I sim=
ply
> missed it.

No worries, with the fixed comment:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
