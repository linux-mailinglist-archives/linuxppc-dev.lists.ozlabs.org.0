Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF2F94486F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 11:32:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z0WpuAOQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZNzL6RJ3z3dVC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 19:32:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z0WpuAOQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WZNyg0PyDz306x
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 19:31:53 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a7aa4ca9d72so848308566b.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Aug 2024 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722504709; x=1723109509; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rijpxav22ULBZ/jbonQFBSqZGbACHb2Ltfu5GqR29ew=;
        b=z0WpuAOQlCKIlHcIBMOITYx07R9swEK1gvjJUcfOhqGs+VGAAl4k4SnsQM6GLp1Wy1
         dGRqP6t+vHxPIl7/sk/Mhr/jaCozl5fVXa4HkTSLpfpIHMKmW7W1Rz3asVL2m/kr06z7
         yF15tKQiPtBPkL3UhOVz0ssxt/+VhUxsCiPSvE5IBK3HNrk2E4PCcrJWqWQ9keON7QQW
         7/sS+J0N7arl+8i5REmdNrqUJh7OJ+V/cCDooNuNikfLDj+mB8efBbJMTk8Sf2XxeBEx
         ZmXwj/vdI5YnciS8NoPFg4rWvbkmNoC31cKDLEBSluWJ6p5wAyrK88TJ0wX7E+kNorLZ
         WauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504709; x=1723109509;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rijpxav22ULBZ/jbonQFBSqZGbACHb2Ltfu5GqR29ew=;
        b=N+H5Kxj0uNuLDsqt8c4y4T6kifSARy0Wu5HhqRmXNShQYACC823kFrJz5tau4xPMgz
         8nIHEllzIORt3Hs5XqgWuxEapsN6p7HMhFH1K1N9kV6RijBUBtvWzhNxVa/6uOUBL+1z
         sUp9qAEenbq/iFVV8KzbinVQt5QLEoR110Uf4jdnWljS3jXhIYIVr1Lgu/HL0xa5CMP9
         IeGJolBBwCR6BZW7n2qk1EHFwL1H/EklmwFfuJOBa0k4grzjlLb52gdS9aNkQ8lasVYa
         EQ2QuQ2/ZQbPqGXJXVcW0vLaqKBBMGw55aGiw2pat9eHHzg2jNcEVKo1bOqbtyfX1YQm
         jzrw==
X-Forwarded-Encrypted: i=1; AJvYcCXd/Z6rgArr1XfqK0A3uvYysYe4kR0wCWsF8C1jDtWtXgK5VmHSjYRY6vYonm5/erLmoYwOa1eRcFFNWiHo6dfgPKyRhhJwLCGWJaYMqA==
X-Gm-Message-State: AOJu0YzNslY5VwoKLJ7NhBHNe3TymJN/9KWoUHZOegk56aS1VBM8z3fO
	9F8bvBp9fQ8P1CWFpXKnQpzxNgO/JPSRE1fJjbIanhez/ww849myr19wj1/fzas=
X-Google-Smtp-Source: AGHT+IG5iXbqJIGCb3pyknIex0iMsjWXZk5BqBH1pB4+wqA2VBzM+EI5zwQ/R0bb0H5+cKiu5+pmpA==
X-Received: by 2002:a17:907:968b:b0:a77:cdaa:88ab with SMTP id a640c23a62f3a-a7daf544a4fmr161420366b.15.1722504708836;
        Thu, 01 Aug 2024 02:31:48 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb8313sm876290366b.211.2024.08.01.02.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:31:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5DD7F5F80C;
	Thu,  1 Aug 2024 10:31:46 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 12/84] KVM: Drop @atomic param from gfn=>pfn and
 hva=>pfn APIs
In-Reply-To: <20240726235234.228822-13-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:21 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-13-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:31:46 +0100
Message-ID: <87plqseghp.fsf@draig.linaro.org>
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

> Drop @atomic from the myriad "to_pfn" APIs now that all callers pass
> "false".
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
