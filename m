Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 009C882160F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 01:53:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MnWfT7FR;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MnWfT7FR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T3vTy4v5Nz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jan 2024 11:53:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MnWfT7FR;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MnWfT7FR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T3vT4669qz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jan 2024 11:52:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704156739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hn3yZPc5aSpO0YbvCjnALHpqvPvA9UwVTSzN3i4swWE=;
	b=MnWfT7FRXMMxZQSTMMTE3tmrZukhlc0tBMSlk7bsgl87fjPioYnLf12qoTJzBPNxB6iogz
	sw0B2MD3OQShPSbJ/sOir4935lubWpnKluoyp+2/uQ0eKSpwjPiZj8uV6qVut3AmWyWc71
	aUOgIWftuvNKsGW/jx/5zfXHQAkUlTk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704156739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Hn3yZPc5aSpO0YbvCjnALHpqvPvA9UwVTSzN3i4swWE=;
	b=MnWfT7FRXMMxZQSTMMTE3tmrZukhlc0tBMSlk7bsgl87fjPioYnLf12qoTJzBPNxB6iogz
	sw0B2MD3OQShPSbJ/sOir4935lubWpnKluoyp+2/uQ0eKSpwjPiZj8uV6qVut3AmWyWc71
	aUOgIWftuvNKsGW/jx/5zfXHQAkUlTk=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-r_HHWoBDNBGHsnXjEWzhUg-1; Mon, 01 Jan 2024 19:52:10 -0500
X-MC-Unique: r_HHWoBDNBGHsnXjEWzhUg-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6805f615543so103421896d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jan 2024 16:52:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704156730; x=1704761530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hn3yZPc5aSpO0YbvCjnALHpqvPvA9UwVTSzN3i4swWE=;
        b=khHS4x29D4KWp/3IknC2AIzQL7OgU3h+iH/TPvsz21lCB9EQkUz3tWqT7kUdZaCKc8
         G7DkCzH1NyltgLFMDdRqky9b5oooh+kR0yQGfodSwU74sfdz6rQzExZR6mfdHoTj1lTa
         QTy5cYxjHSenL4YE1Ig7xe7LKQwnc7/ksMvU/uy9M45GoCpWqomJKTKlGv58fjgXF81r
         xSqejQVAFS3m+U7ESF/oSOVWtBuu8S0iUILPaeu67+vqG7JPcSSPURMPMmHdXh7/eeE8
         2KsVlrLGwxNQ7Qviyt6gtAXEMc/wzRqkbfpSeDS3zQj2QfwvJzrL46FsJxQ82gBeQjwa
         qD+A==
X-Gm-Message-State: AOJu0YxsyH4UKtfMqZH26h+wLZKO/TKAx2MHZGLY7qmo4mVQYDmtbR9B
	AFDcmAT1kCsbY+UCQdtbKngRp+4KSD6QVW6yDOsXyaQ3bnwXzsVm13YZcK+y7w0TVwtSPakfXp6
	CiKcmbWyiT4Apeb1gDE3ycYk6zWyClxECMj7KpOZ8xcU2KI8wAw==
X-Received: by 2002:a05:6214:c5:b0:67f:ae1d:917d with SMTP id f5-20020a05621400c500b0067fae1d917dmr19860874qvs.125.1704156729895;
        Mon, 01 Jan 2024 16:52:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8Yq2NhTKVXVIHL3AhMruPY16SPBWmHDzxDJke5sS9oNVopqZspPShbMAGArZYyrkpGX17amWOOeV/V6tyqC8=
X-Received: by 2002:a05:6214:c5:b0:67f:ae1d:917d with SMTP id
 f5-20020a05621400c500b0067fae1d917dmr19860870qvs.125.1704156729748; Mon, 01
 Jan 2024 16:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20231229120107.2281153-1-mpe@ellerman.id.au> <20231229120107.2281153-5-mpe@ellerman.id.au>
 <87tto1jjou.fsf@mail.lhotse>
In-Reply-To: <87tto1jjou.fsf@mail.lhotse>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 2 Jan 2024 08:51:59 +0800
Message-ID: <CAF+s44QfT+m1hL=Z-wevFhWff=O6DNK=WRxcdjK+p-rK5J=LKQ@mail.gmail.com>
Subject: Re: [RFC PATCH 5/5] powerpc/smp: Remap boot CPU onto core 0 if >= nr_cpu_ids
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Ming Lei <ming.lei@redhat.com>, linuxppc-dev@lists.ozlabs.org, Hari Bathini <hbathini@linux.ibm.com>, Pingfan Liu <kernelfans@gmail.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Dec 29, 2023 at 8:07=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
>
> Michael Ellerman <mpe@ellerman.id.au> writes:
> > If nr_cpu_ids is too low to include the boot CPU, remap the boot CPU
> > onto logical core 0.
>
> Hi guys,
>
> I finally got time to look at this issue. I think this series should fix

Thanks a lot for sparing time on it and hope we can close this
prolonged issue soon.

And loop in Wen Xiong and Ming Lei, who care for this issue too.

Best Regards,

Pingfan

> the problems that have been seen. I've tested this fairly thoroughly
> with a qemu script, and also a few boots on a real machine.
>
> If you can test it with your setups that would be great. Hopefully there
> isn't some obscure case I've missed.
>
> cheers
>

