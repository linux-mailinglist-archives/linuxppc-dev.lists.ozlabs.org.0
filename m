Return-Path: <linuxppc-dev+bounces-609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4A960C83
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2024 15:50:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WtTT73GRJz2yRG;
	Tue, 27 Aug 2024 23:50:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724749584;
	cv=none; b=oM9DEVOol9Hedig1F1azqeJdZ4ZKvzooPjGQqJ4AQFvF9oId1kwJ85NAzA8+ThNsAy8TaMFwqSxVQWrnwSxrpP407oyvjfxxZHnRCrrZQVoKGKA+n59gARMNP3LjMY/GfiFWABbFspOSQaAlrX1SKzEdrlq365D0e65wQ5rksl0EHXX/tu4vwcfNrOi4wtkAGaPfMbag1F81qdNJpY8MC0JBjhxmWthg3uqy+hhp9nczT/2UcJ+ORJj6P4NtwiJ+s1XWNLuSCa61luZtgPA5P7QQo8pUChdXV5jV0BMATrvHStM8zcC58srku70H96HU7Ok9WNaP9ewlKHC+knvHqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724749584; c=relaxed/relaxed;
	bh=ys5q7+xt7V4u8ZvUMbFPxHX+g0yKhziPVMVNXUTaajE=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Google-Smtp-Source:
	 X-Received:Received:Received:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=nkRwhQa8oCc34J1lOtEyyir1CzKltnybv4NqDNntuTe2iuX2EgR3QBxo5yanXbfoVzLdejZG276+nMWdu0CunherqcGTy1hGzWnrmSWaBqHCLIBKv1r+nKYET/mqSeUj6k0GuUbCh2LrZNjlDUmlwTMDXnlrzoWDjfNr+QtpTdCb1/buyGsWwL4icRtqXc79bv3+t59n1bOgFmTjOt/XD0gjxO31B4IqTK1n8/2e2hJx17AU+LAnHoFrEqoF9Ykf8aJTd6aGUo7hPqsTtmHIVaM2qJYhH9ONEvOGZX+5vAsdxuqN2fiAocFfv+eImOYdx9TUcXIJoAtLfn/1nFDLsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EPJGJErW; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EPJGJErW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtM9C1M9fz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 19:06:22 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-42ab99fb45dso58029745e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2024 02:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724749576; x=1725354376; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ys5q7+xt7V4u8ZvUMbFPxHX+g0yKhziPVMVNXUTaajE=;
        b=EPJGJErWcVj6CVAV4gORUJpTv+DW+k1ycVmJyt0t+saXn5EgQvHYpGmkvmOScXKJpT
         gq/jCN7An1t3XoxK9aolidW4K3T+FMw1ajbFz99TTVGE+MGquzrzqKJohWz8/+yY8axz
         9UHX/iv+LxVgLViBGFt+1wTXY15HlxxJCFUUt7y0PBEYdHKPViLz33iG8kh0FdLSVe+f
         NtYF8zXd/luKpoYiLF6gvgq+FL+W0GY2e/QPcPjfuvoHdErUK6KpbTfWv1KGOklfrLbQ
         5XkmzNxkxu9u0Ghga1gts+2La1RhrHpzCO5leRYsJ1evUPdqJn7A+VK0Q3k8KwwKNw/i
         gIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749576; x=1725354376;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys5q7+xt7V4u8ZvUMbFPxHX+g0yKhziPVMVNXUTaajE=;
        b=HUJhllMmrb90Nhlk3RoIOM3Iv9k4VZm0DJH0Cjswiu7TPGJZdiEtcCVHOdGb3rYZdY
         fUwSiekZIf3D0n/L+dA9CjI5k8RF/OoAkJS1B4CFwiIxPiNErAXON9/oSbeFp9lnqsXi
         O3vLJkz9Y9egyb1fhf4Q6bVg20pAFYCwx4GEJWyrPj7pHxMpEwqNos5gW21IKZOzAjpc
         7F8WNYcT16bv39XXh/dsHHnrd5O6djC4FbX62wO8FzF7HRWJf3vrqZLqlMzPwfDa4n1J
         yGQYQfbFApRrhxUSW8Bma4kPzRLHNEkkHPD4Bd6eSc9orDHVDRuvspVduYpPI7+go6Jk
         WWsg==
X-Forwarded-Encrypted: i=1; AJvYcCUMc0FnkbT9HohUXeRWJUAfPUhzFt55lrKOUkHUigOoXzZYJSPzumkY5kdCuvQ+J9n6oB7yo+ISlYr060k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhvT4JfS9OLo/XCoChWUk1TiN8IMST45XQ24nHeAnuagSPwkGT
	RmMRXENQTH0nKOHj4C0c7UoFGoS+c4T2SyaU1Zy7d3gbWlY8iB3MQSYsyXHDF34=
X-Google-Smtp-Source: AGHT+IE+VDn5FOe01bWlunlr3Q/efu0PB9LC4RFl5VPjT0A0kz6PEXEkfZYstnAt53OJLkCDA/f1HA==
X-Received: by 2002:adf:b311:0:b0:368:3f6a:1dea with SMTP id ffacd0b85a97d-37311840050mr9300691f8f.6.1724749575912;
        Tue, 27 Aug 2024 02:06:15 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730826a3f7sm12533503f8f.112.2024.08.27.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:06:15 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 507E15F7A2;
	Tue, 27 Aug 2024 10:06:14 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
In-Reply-To: <20240726235234.228822-1-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:09 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
Date: Tue, 27 Aug 2024 10:06:14 +0100
Message-ID: <875xrme3nd.fsf@draig.linaro.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> arm64 folks, the first two patches are bug fixes, but I have very low
> confidence that they are correct and/or desirable.  If they are more or
> less correct, I can post them separately if that'd make life easier.  I
> included them here to avoid conflicts, and because I'm pretty sure how
> KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
> to provide to arch code.
>
> On to the series...  The TL;DR is that I would like to get input on two
> things:
>
>  1. Marking folios dirty/accessed only on the intial stage-2 page fault
>  2. The new APIs for faulting, prefetching, and doing "lookups" on
>  pfns

I've finally managed to get virtio-vulkan working on my Arm64 devbox
with an AMD graphics card plugged into the PCI. I'm confident that the
graphics path is using the discrete card memory (as it has been mapped
as device memory with alignment handlers to deal with the broken Altra
PCI). However aside from running graphics workloads in KVM guests is
their anything else I can check to see things are behaving as expected?

The predecessor series did break launching some KVM guests on my x86
system but with this series launching guests works fine and I haven't
noticed any weirdness.

So for those caveats you can certainly have a:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

However if there is anything else I can do to further stress test this
code do let me know.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

