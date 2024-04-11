Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC748A1A91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 18:58:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QSf0d64F;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QSf0d64F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VFm9Z52Fkz3vbL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Apr 2024 02:58:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QSf0d64F;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QSf0d64F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VFm8p1N2jz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Apr 2024 02:57:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712854662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzMoeKDG3HLVO21BydyhZtfJookrt2+0z0ZoaUJK4l8=;
	b=QSf0d64Fwo686YFOfs59mCSQP1948Un0RA/fQ3Yiu9BZfzEx1iO4abhyTd98Cu2cYnHx5M
	altpxNCL/do7yMPLufPTpDs6+a19E5FUoHcy5LHTkDVMesac9On1XS8or3LU9V2mFiF/t6
	RCkMkz83fe59JTi1rwNLhnnXZrVqR0Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712854662;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wzMoeKDG3HLVO21BydyhZtfJookrt2+0z0ZoaUJK4l8=;
	b=QSf0d64Fwo686YFOfs59mCSQP1948Un0RA/fQ3Yiu9BZfzEx1iO4abhyTd98Cu2cYnHx5M
	altpxNCL/do7yMPLufPTpDs6+a19E5FUoHcy5LHTkDVMesac9On1XS8or3LU9V2mFiF/t6
	RCkMkz83fe59JTi1rwNLhnnXZrVqR0Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-NFMn5sM0PLmuV_MUAdvkcg-1; Thu, 11 Apr 2024 12:57:39 -0400
X-MC-Unique: NFMn5sM0PLmuV_MUAdvkcg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4166b96002dso453625e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 09:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712854658; x=1713459458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzMoeKDG3HLVO21BydyhZtfJookrt2+0z0ZoaUJK4l8=;
        b=RUha7yPxAO4eGwUT/GuL3PywD+6BAM4/7wJQO35x9V526Wt0rPWtRj4AAs29cK9DU3
         bOegficdUpG3plcHFrldNvaQxCbGC9BkPaGQLTihc9/sIbxNvrKOC03g/j7lk9ip/58n
         4n3hjDwLFsr9THuUJj/ZXkKS1Bt10a3NAjmrOF2e29CbZLQtZw/zOeLtMTV4PTIsZi3e
         dN4o37wES4o5RjNz//d+K0w/A0ND8dHX9WL4hsig/lYZNkv/VdzV9GTXLUSqeZuYTdsL
         CAI033Vla7rxsIHcojiPspnXHsX0OupzBjTDH4pNUDIPZNMpmccRZR7U/xK0L64wZ6xc
         gyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV66iTchiIyFGXlVD7Wv30P6J9siDIBXWOWncBQ3eMsYeNMquoTaNDRacH2X7rgv2SseA0P1YkyMxFXdat5nMfDDR6F9h8j+ObQYXlpQg==
X-Gm-Message-State: AOJu0YyBugiGmC3j69Sdu+7fd+uAYVo4vcCy7QrkJwMyQpAhEQQyD/2J
	vcKjP3Hk0herGNon3TcuGtzHNQjSoPs3D5GRUEwAQeZEThbRtoLlisK68s2K7iG9Emi+2s5dUo4
	Cel0VVhJOjGisDpJxwzDxUrPJzn9qWfAtoU/WqZXgiegmZ1pxbWWnDvDFZqJcJvglyYWG/oUkxi
	xqmp2Po9hEIOiRc1KO2q16KKIoWfff6sAYfZJnBA==
X-Received: by 2002:a05:600c:c07:b0:416:b75e:ffb9 with SMTP id fm7-20020a05600c0c0700b00416b75effb9mr294497wmb.19.1712854657985;
        Thu, 11 Apr 2024 09:57:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmoGFz39xTCvG23vKtpQgogb148s+KvVt7/U1rBvktp1dcwHHxjM7spsq3rgOmQW5LGi5xUnT62q1v5vcy7Gk=
X-Received: by 2002:a05:600c:c07:b0:416:b75e:ffb9 with SMTP id
 fm7-20020a05600c0c0700b00416b75effb9mr294473wmb.19.1712854657685; Thu, 11 Apr
 2024 09:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240405115815.3226315-1-pbonzini@redhat.com> <20240410143020.420cafd47bf8af257b2e647a@linux-foundation.org>
In-Reply-To: <20240410143020.420cafd47bf8af257b2e647a@linux-foundation.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 11 Apr 2024 18:57:25 +0200
Message-ID: <CABgObfZiEiLbbp35gNmSGd9vNr03__Eep+D_Mj7r2o+XbF96TQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] KVM, mm: remove the .change_pte() MMU notifier and set_pte_at_notify()
To: Andrew Morton <akpm@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: kvm-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Bibo Mao <maobibo@loongson.cn>, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, kvmarm@lists.linux.dev, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 10, 2024 at 11:30=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Fri,  5 Apr 2024 07:58:11 -0400 Paolo Bonzini <pbonzini@redhat.com> wr=
ote:
> > Please review!  Also feel free to take the KVM patches through the mm
> > tree, as I don't expect any conflicts.
>
> It's mainly a KVM thing and the MM changes are small and simple.
> I'd say that the KVM tree would be a better home?

Sure! I'll queue them on my side then.

Paolo

