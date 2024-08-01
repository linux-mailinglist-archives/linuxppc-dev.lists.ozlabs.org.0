Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFEA94476A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 11:04:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cdBKYbAK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNLw5nVvz3dLW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 19:04:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cdBKYbAK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNLC47Ckz30V2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 19:03:45 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a7a9185e1c0so671086166b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Aug 2024 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722503022; x=1723107822; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=cdBKYbAKDV/WC+VSOXMbgCUWhPWaivP2wLJHVlxCugf4PygJNf7Gdg55EP/LHWqL0G
         1Q0Gd3ygmL98WhTe4jyo38/5zN2+qDu8y+fX87q4wuKn8GIfOl15rs9cCpdCe8yuP/0c
         CLh6GxuPL4EVZl39B3MqPEi9vFWbLkwa/hDySrSppxGHV0LHR4yn2SwdOr3Z1+7KOQiX
         ugy8hfy/WXYNY4HlDaVP+AXf8yMTyq1iX2/CzzA9RiRI1/ByGX//1ZsGA4AGplshdWBT
         AOzimD+dpinWmgk76or+mOZ2MK0AKy+V2NOc+Ub5Tazeb7QHqNKoOn9XQiST/RbSeZZx
         4bug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503022; x=1723107822;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=bkOPDxSFASP9nL2SYJTzZ3rpxM5kK9W/NH/Wd8hHrzrRnnAiQr+nzWS9NmfZo3IjVv
         OwkFU/y/7hbWbpwBruUcf3+xUXgJxTJ+qFsSctCw0U9iqeyIciLQtz7XcxW0UFHnE7Dh
         dt9E6sMPkjt1Cwm4gbaaFlSG0nGoQZXrgVgYiVtmTuC0WXuhvJ2UHOuYrejE/ZA384fD
         JVREv+9AZhq7Zjdjw256DYQbk1rz2j/fee/CgwOm9bvppMLJKsDe9NAM0XVuHnB/9ENh
         SkZ+kNICnSoOPiGPyoQrgIEmD0gV+BYsHoLCgNajgkYM7rJgRqtfgmR8tARH7flEp936
         3eEA==
X-Forwarded-Encrypted: i=1; AJvYcCWFWk4lB/FvkZyoSEjgC3FLYTCmbE2nxRxpeMd9E72v8C7CeI/GOMtZ37Fmi4ZC+xY45DK2RykRvl8+igQM7ZzNIpgjH6KT03oa/wwenw==
X-Gm-Message-State: AOJu0YxT/IAXABkR84TXU4OqcAZPQ2VKwyWcsKwNYiweDr3lgABuaiVB
	FO8Iaz3mT2sPy2wwMS7ezRimFBt7dEnlZN+iQfFzEvfBu9ss/A0byRLBX13ueXo=
X-Google-Smtp-Source: AGHT+IHhni1Uh+bJITVWfhi2vAVjvXUzKzH/nw0taqtk6cxicA1yt55vq2KJXrilVInru0VfNsUVMQ==
X-Received: by 2002:a17:907:a4c:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a7daf4c7df7mr132037366b.22.1722503021389;
        Thu, 01 Aug 2024 02:03:41 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad902e2sm878292566b.146.2024.08.01.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:03:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 36EF35F80C;
	Thu,  1 Aug 2024 10:03:38 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 04/84] KVM: Allow calling
 kvm_release_page_{clean,dirty}() on a NULL page pointer
In-Reply-To: <20240726235234.228822-5-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:13 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-5-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:03:38 +0100
Message-ID: <871q38fwd1.fsf@draig.linaro.org>
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

> Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
> tangible benefit to forcing the callers to pre-check @page, and it ends up
> generating a lot of duplicate boilerplate code.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
