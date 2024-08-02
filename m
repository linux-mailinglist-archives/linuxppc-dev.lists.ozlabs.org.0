Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB029945CC3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 13:04:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lP4Uexne;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb2yR62h8z3dfr
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 21:03:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=lP4Uexne;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com; envelope-from=alex.bennee@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb2xl554Rz3dLS
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 21:03:21 +1000 (AEST)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a7abf92f57bso1040856466b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2024 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722596593; x=1723201393; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7XccJFQ+QycCZFwHexROwL6oGOM5nxC8z9cehuDsO8=;
        b=lP4UexneElVjiADvb5IcRTEbwYfF6wdnyTjhkHOd5RhV8jWCu2HTc5dDitk+9gusYN
         o3aCkyKMlMsPoBOAWD3riq+ZBFJydLK0sMAd/GaYrgbDNuDyDyquWep6ehz037PhtA9f
         slO+UqVFHZis8LAUDcT5xyRArV5t3at10Spwk3IqiN6BwJbfs9SUtuW74U2hFN0x7+JV
         0dkO5v11QT93+Pax8THOquhPfn+rIzvodEOBfdb+C1t3AjfxR78F+fDCJM+PT1MaoqyO
         W1vHkeUcYFzn0Kwb9zmNFKsPeuXboSdpGFLJD6sIFHDwEYyQ/duuuIruFnSuK8stGA0v
         zn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596593; x=1723201393;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7XccJFQ+QycCZFwHexROwL6oGOM5nxC8z9cehuDsO8=;
        b=NwFyan5ycGIE9kEIwMkg2GugR1yeQYJPqMXGZAZuGYTU05iGu5a3uirQFmmF8kV4Ia
         RheMdewTTZ9cYWN6uPXphf3fgbwcIb58T58G3GkMN4ll55eX4dQFbxqiqRjmYa2AJV3i
         poyE3IETvXKh1YmcGNhhVI7pxEIuujBCNNDSquOB5DBCaMVUvRY2Kt8GbvRbsbsyK0ox
         dggBqbeHPRoHBny0Jo36O2qaOqemi5LV3rH18zz14u1+Iqv2mhJw9p+FZ3C8aA0Qbj3z
         exbLWrwjBY2E2qVxEe3CF9JW9Uw3KMuEcRFmJGs7LEeFWi/jazO1eJxye0tB9Gxv2SNS
         7vIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMFVoWX+7Fvt+v4T+2Tu85lrEzQ6dTTu99SjDfqDN7thTXfxzr5gL4Y7OYdhb+3RIGs33WZ79U2+yzR+mComOzcXQOTtdCNjWwkOxbig==
X-Gm-Message-State: AOJu0YzVAvDwWIEz7K3Y+zIpIr6l+x2y8/oCQ3U0E3mkO82kVSk2Hxu6
	M9Ww7bLdcVBHuq1AZyfKmHfZ8hFap8WxTHlqMY2KP4OUbQNVCJKU9TmSf1RW6iQ=
X-Google-Smtp-Source: AGHT+IFGQonexgpZjGUwl51oIYY4w2W/jqJ1zQyOCpk3kJFGs8T5j8dynyIwmzMmmRUPMHGi6NWZlQ==
X-Received: by 2002:a17:907:7f24:b0:a7d:a29e:5c41 with SMTP id a640c23a62f3a-a7dc5029a1dmr251865166b.40.1722596592689;
        Fri, 02 Aug 2024 04:03:12 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e8676fsm84603966b.164.2024.08.02.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 04:03:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 24FEC5F8A9;
	Fri,  2 Aug 2024 12:03:11 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Subject: Re: [PATCH v12 83/84] KVM: Drop APIs that manipulate "struct page"
 via pfns
In-Reply-To: <20240726235234.228822-84-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:52:32 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-84-seanjc@google.com>
Date: Fri, 02 Aug 2024 12:03:11 +0100
Message-ID: <87jzgzchlc.fsf@draig.linaro.org>
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

> Remove all kvm_{release,set}_pfn_*() APIs not that all users are gone.

now?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
