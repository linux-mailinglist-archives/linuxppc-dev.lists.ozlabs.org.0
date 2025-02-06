Return-Path: <linuxppc-dev+bounces-5914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 772BFA2B36F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 21:33:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yppj56t5Hz30N8;
	Fri,  7 Feb 2025 07:33:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738853966;
	cv=none; b=EEZgIgKVdaIGnI3A7S/MSjO647ckih333bD6LsqnRC+fxodOZs41C1g3UY8UycY3nO0OMIFXxQ+h9a4lJ2aGngcf1+p2dzIe7XuNVtfsVzY9YiAXwPI5tcNzmbNgs+ZJDRIJETv1YnqUuuUiOe1X8eBs0bz3WW3GH9L5tOEjzcw3qaulUk6rJ7Q6QMv+gat+fr31mj4mLlgHQQYrWr6PMxHvOauOi0gwtkP5FwyOEoFT5pqBQe+2bnFAln6ACO3wx48adgjkldvbqmQ82GyxxWLCLqq1sexm0mFePza60yh5z+4WnYtJlHOhXWkXRZyI2KfzJFs+GFwjo3IdVJAH1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738853966; c=relaxed/relaxed;
	bh=U74SGZiAIGmMlazRLhrpYiZ/iTjbN0drFn9h+a0WXAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TOw4O7gUK+8vtPzorPfthlxukNKD04wqUOie58GdIxdxwi2ULgI4t8VWBz9LCYkLuliPOrK1bGouqhiG/LI5109gn83BCenN+bp0WnsCzHFuD281r5JEt79uq02aVwiOxEQtyqVA4v5dbe1BI3nnUVkAzirLjUZNurwuKTYImTwRMmXadhO56y4hTx5XZPZVrHlIPCsBWFvaf+mqtojT648zQazMtPAgStlZER8GP2wOm0YT10LPYw/DK5tM/vbd5ExKhJ3G8oy2FaZ9NIcIeDme3drpV5GhJya2h7VR4+SvzRRgccMsqIUYRJHooGOhsLPVoufVwoBFqWH4BXWk6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IdukG7zH; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FC/DO2/j; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aesteve@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IdukG7zH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FC/DO2/j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aesteve@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpgHJ6ckqz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 01:59:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738853959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U74SGZiAIGmMlazRLhrpYiZ/iTjbN0drFn9h+a0WXAw=;
	b=IdukG7zHcjbwzv/f3JojfJsBikQY78FJFCG9oIm/rVa9dF8+fkxjgtRotISd6u1LIRdL8A
	t/4XmQSO0hLrrmwDBeQi/8NAyN6c19A4sIqvx56B5ace54oDMCN6UzSVzmefoyR5eujFNc
	lh2GY/5bawpZJEn53cUr6CzlRKlSD+8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738853960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=U74SGZiAIGmMlazRLhrpYiZ/iTjbN0drFn9h+a0WXAw=;
	b=FC/DO2/j9U4vH3IY8jDYSil1qXftx/tkzbxaapS0QhSNvef+KRNYIJ0yP8pSauTD3QD27f
	UMCR1QQdJO9Htf0mDtVGr5Lry6DAt+1QefeZ+uPDs2o4RwwlkiZAK2RlRqV/dhh+3hM39s
	VZDjkqg35ga4oPo7iIQNqvWEzQJzOi4=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-GAYqrJwpPzWI_6G-0-69ug-1; Thu, 06 Feb 2025 09:59:18 -0500
X-MC-Unique: GAYqrJwpPzWI_6G-0-69ug-1
X-Mimecast-MFC-AGG-ID: GAYqrJwpPzWI_6G-0-69ug
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2f780a3d6e5so2215322a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2025 06:59:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738853957; x=1739458757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U74SGZiAIGmMlazRLhrpYiZ/iTjbN0drFn9h+a0WXAw=;
        b=tnZxMSpWdCuJKm/VTMGBc+RsBaCHI3lb5eRGrKGrXWeNK+RuBHrx8ylyUKQ3S4b59d
         B2LUcZ6YRHFT1uk1jefsturi8E7yZ7xAqiKduzHWdJnRe+nc0LGEIXh224+oq0imKCWi
         qfLBewIq7KXZxowMNewjQoYyo/kNjkVUsOsgP4lic7CxQOBDsqhSq+dNt5z+rsBPM5Fm
         PEEuMUzDXj2l1XYdaSG3E6N+zvRXelEiBUWlq+hCu7kXWJURqGJuxdA7rGmYUpLd8awh
         Rit7nNqG9+uFDtz6a2I9hmU+tmfW9zlyfQDZvEPzWQhdz1YIAQwpP8NlfwP20kRtwhz5
         O7jg==
X-Forwarded-Encrypted: i=1; AJvYcCUFZEB/kFOppjPqSljrWKPBrOTiqx44C4fy8OE8U8V5Ui4LHUvNa3K580nDg3EF5KlDZH6gmI/LthGS97A=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxiJNPmpyLB9VDJKBvIIE0daPYAKs3NB8XhkfD2ZLg3MDtX0twm
	bKReUqoAF5GfvNLOTQzKHDcXz6uL7QrbBsasLIJ85PoajObVCzp6xcyZe/oLX/Qj5SdEtc8CdtN
	yW4ZsizhIgsJLqvbViYLtTJyxDMuSLaVn60sZ2Tvr5i+/GyP0AlNplRpnPDp/p8BLd9QlCQSjPj
	fKjlyDvzd5YNqMryDDguFGBkMEhDqhbT2oGyaD6g==
X-Gm-Gg: ASbGncux2f2m7FohVDqzv3Oh+D25n3CoaWHu07W049LTAaa75yPUcvXsK1SyU4xd4QX
	S35N6Hq0tRoO2Icwk6i1CKuTvT/4s4FYJTVCKSN8EKzbhfboXa4AxLAeT/JhA+unz
X-Received: by 2002:a17:90b:2786:b0:2ee:e518:c1d8 with SMTP id 98e67ed59e1d1-2f9e082f33emr11110511a91.30.1738853955625;
        Thu, 06 Feb 2025 06:59:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWpQlGfjL4+bcsd9CXoOi/pDbHuiuuwkJUWCLm8Y4KSWCpEnRWVj/utErs2ioiglleYEOHWPatBsG9+Rhw180=
X-Received: by 2002:a17:90b:2786:b0:2ee:e518:c1d8 with SMTP id
 98e67ed59e1d1-2f9e082f33emr11110445a91.30.1738853955312; Thu, 06 Feb 2025
 06:59:15 -0800 (PST)
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
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com> <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
 <Z6S7A-51SdPco_3Z@redhat.com> <20250206143032.GA400591@fedora>
In-Reply-To: <20250206143032.GA400591@fedora>
From: Albert Esteve <aesteve@redhat.com>
Date: Thu, 6 Feb 2025 15:59:03 +0100
X-Gm-Features: AWEUYZm-M5VdAvcj3hSDqRtWWsY2KSl-UpKtCd6mALNvZQI6X9XPfCW9uUgmKYc
Message-ID: <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>, Dan Williams <dan.j.williams@intel.com>, 
	Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org, linux-mm@kvack.org, 
	alison.schofield@intel.com, lina@asahilina.net, zhang.lyra@gmail.com, 
	gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, dave.jiang@intel.com, 
	logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca, 
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, 
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, 
	david@redhat.com, peterx@redhat.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-xfs@vger.kernel.org, jhubbard@nvidia.com, 
	hch@lst.de, david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>, 
	German Maglione <gmaglione@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PT4rsNrOc6PFHfRQEjrby8-dyIyc9WNtvJKboqnzbnE_1738853957
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi!

On Thu, Feb 6, 2025 at 3:30=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.com=
> wrote:
>
> On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> > And then there are challenges at QEMU level. virtiofsd needs additional
> > vhost-user commands to implement DAX and these never went upstream in
> > QEMU. I hope these challenges are sorted at some point of time.
>
> Albert Esteve has been working on QEMU support:
> https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@redhat=
.com/
>
> He has a viable solution. I think the remaining issue is how to best
> structure the memory regions. The reason for slow progress is not
> because it can't be done, it's probably just because this is a
> background task.

It is partially that, indeed. But what has me blocked for now on posting th=
e
next version is that I was reworking a bit the MMAP strategy.
Following David comments, I am relying more on RAMBlocks and
subregions for mmaps. But this turned out more difficult than anticipated.

I hope I can make it work this month and then post the next version.
If there are no major blockers/reworks, further iterations on the
patch shall go smoother.

I have a separate patch for the vhost-user spec which could
iterate faster, if that'd help.

BR,
Albert.

>
> Please discuss with Albert if QEMU support is urgent.
>
> Stefan


