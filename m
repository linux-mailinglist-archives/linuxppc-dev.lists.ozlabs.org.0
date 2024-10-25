Return-Path: <linuxppc-dev+bounces-2585-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD99B0BF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2024 19:42:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZqq60J3Dz2xrb;
	Sat, 26 Oct 2024 04:42:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729878129;
	cv=none; b=iVbO3scvmgXa0FV2N3+gKcPGflZXN3E+fL3YGiCYBdoiVec4b9CxV3Jxn1S04NRIH+MNKAD2IgaA9ldJKE3q2vL67cQHPK5LNOTa0H2OT+Xj+Nk5SKFd3qMMDSIev7UTrN4qUM5YBmDOAJkdka1thgCkGUv/OtgCohoKAniIPhtV0cENoRd4pAqP9NLBu+NU3lBHXj6MkQZZHEX5PuQPZVa90MAv2JyHxtvl2tktr4DnJOwYcjpRwY9jIOH4hQxExaqKjI0c8mizfmMO/uISipwlecZ1s8yJofFZ8r4pnnEEVvjd21my/+0KRXIRPc80gu70Z3qxKeZKqsQRj5UJmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729878129; c=relaxed/relaxed;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKaYvH6MPs1rhCp+9p5w6WXqU/raBXWbHmXHmVPQGfij9moJ7zV0cyMMEXj0SLGyjJQgpE46356ocmFc1bPXiVJwSFaidhgSugeLvQv+FK1b0bUSx8cfhENo3xogY1ovqAwJG6bxFSo41ED8P0aqPnrgZ40tprpqBfEJ1egZOTN8fzTmsPPnAJ1RB+uXoZVFv4LJ5uNWe/HvQZzXJKX4CDWv3GgVLqJ4oEwaky3YQiZFqtSBgr3BfmQRDWiTAqGn427iG9fU24vmWqU5UDfFzXggeSH9VJoTw7XrGcVwL1mJ7zEc3zVbjtSAg2xSH7ZONZ520tvQUrBUZpHdKc/vqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQGGVJXe; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQGGVJXe; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQGGVJXe;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XQGGVJXe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZqq43rPKz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Oct 2024 04:42:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729878121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	b=XQGGVJXeAqgRjC3t0U6B0LMNCdt5GhZVZ2bLsaP1SlUZO2pdkbcocWjW59I9Lt2mao9VeW
	iDxGVx310gWIbkxW7TOWuq0ThGCfh3vbfdldMFqMTmb6f7BXD+4Jpy7yB2hqFQbt0xo+o8
	Bfez7gpa1CaXOLMdEzaE8XwHePNMOQI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729878121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	b=XQGGVJXeAqgRjC3t0U6B0LMNCdt5GhZVZ2bLsaP1SlUZO2pdkbcocWjW59I9Lt2mao9VeW
	iDxGVx310gWIbkxW7TOWuq0ThGCfh3vbfdldMFqMTmb6f7BXD+4Jpy7yB2hqFQbt0xo+o8
	Bfez7gpa1CaXOLMdEzaE8XwHePNMOQI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-4P6KtcVZO3S_izVexzhjTQ-1; Fri, 25 Oct 2024 13:41:59 -0400
X-MC-Unique: 4P6KtcVZO3S_izVexzhjTQ-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4315c1b5befso15958215e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 10:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729878118; x=1730482918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
        b=MBQwFNztA6jJ53o71fiAKQ9G3FF+eczr2YfpHhgKp5JrwWXyk+QQaI1WEY4z3MIKiA
         sH6AgGU67ec1ude9XThqRcn16D2qEDuB8niTl5sygeXcz3ca4qYXlev2FBNhJU6ZUagV
         M++rxYs7MPITUmkgepLl+sIxP0LIGTLJBXfGNA/0elSKdv91he+r0RiSTdFjN+2W74qP
         y8NLqEHixOP8hoGkR0x7XUKTQaPODMrx5gknHkF0Q3XZZl4ZdIjO8Njdltq2+ALpSSZg
         rOLQfTWG8Dz/dD7zcupuJyTqO0HVn6iI8Tqh91/VcgHEiycMu178hthp1GsYKGqIW5E1
         CsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsPA+dk3x21K+1m+nu6QR8c7DaW99J1dO+CrzcFyUBttMV6i9bJIauCSp6YC1o4q+zLfbj2fig5dp3kEo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxllY2ANWg6xOwOUE/JQVNCwLYlRkkna2uw2xlS5O2KHfvKsIiz
	2QwAMl9I4i2Ue8yNdvA/aHINhdCs6m0q8frbshVVV7MqUySi3PamJrqhgOBNwmAFhoO6KA9vlQo
	7FS/HOIGEdLhVfYQS94YVyCxguiRdYJd0uiZLBPi8xV4VhuKgkH8uoR4kp4Yc5+xwPZVMykuRyP
	Y/6hWXF5C81sLsoeY8P/NsK00haY7Kpsc10SaN+Q==
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id ffacd0b85a97d-3806113a07emr163672f8f.13.1729878118153;
        Fri, 25 Oct 2024 10:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJirsSaLOjUEz6kn7HmxOjIyhE9ZfBrB9GAGHgNcgNSBUFOeNbcRoyDDrANp8n6mxM4gCIddwEWDqpYot15qQ=
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id
 ffacd0b85a97d-3806113a07emr163639f8f.13.1729878117761; Fri, 25 Oct 2024
 10:41:57 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
 <Zxbw9XcFCHYR1Ald@google.com>
In-Reply-To: <Zxbw9XcFCHYR1Ald@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 25 Oct 2024 19:41:45 +0200
Message-ID: <CABgObfayH1x3qFjOiM=rQjxiui5tXJXObgR_qOGV5Hn_2QLEJQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 22, 2024 at 2:25=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> > Looks good to me, thanks and congratulations!! Should we merge it in
> > kvm/next asap?
>
> That has my vote, though I'm obvious extremely biased :-)

Your wish is my command... Merged.

Paolo


