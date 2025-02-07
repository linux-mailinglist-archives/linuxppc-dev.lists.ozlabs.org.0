Return-Path: <linuxppc-dev+bounces-5945-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 677FDA2C85D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2025 17:16:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YqJxr6Z9Qz30Pn;
	Sat,  8 Feb 2025 03:16:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738944992;
	cv=none; b=kn5O5hh412Bpf4cy5LgiVXOWRtOIfs2tEFWoyWxHAYNLqR5ON3qvzYNexKBZlb5AiFu5XG4I7UmNNR9oSQzE20iTQC5sQGzx3qBQSMgRfoo7HoU9B1JKU5sO1dVDzt84cjJ+PfFShU0OZZuWAkVu43sK51PXxwUm4VwlJDfIW9K6pL5dwjyh9Mys2Tp0G4cRAQ6TQ912vGmF1TZBzj4NcONG5CkoQ8xCZP6Vqvgrj4lJM35o718wt9FZXP2FGyvPrWQnqzqm52FkD2i1uWWcRXdyKLifh6z3UlWrtuT2laIaalBXjMLZw4EP8YzbrR6KA2GpX/2zF794YmH56FruJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738944992; c=relaxed/relaxed;
	bh=hD+eCZVAmu9HYlJ66O10gtRu+u/xshw0dNIF0ppHeG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hru8kxGhcSYob6ZHuKRyu1uPmFJ4OEnBl+ETHPMukLvqIKiPfYG1tWyYjQLcrEdi8ExaT4Bw+DpCkZqyqaeazFNjpDRkjjg60bQp1E67qA4As0rPmMhgFlTYozQxe97x6IAbatIWGUKxrOxWUftI5BuYFBLv3IzqYTqogP/DOK+Fg/82Y0d3//86cY9T2olFYt95YbGnuqluz0atEcMCRCoqsWP0eczcqhEEuJdK76rNHkgPyCdVjWNTTgelSAdmA52DzwfvC3JKXzY3C+xYMejjiGz44cNXH9ucxM6GufutpoS7w0giTyV6BV/L+lZoKPP/7O3Hltm2MDN/BOmYJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iy+C5GtD; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iy+C5GtD; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aesteve@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iy+C5GtD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Iy+C5GtD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=aesteve@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YqJxq4mZ0z2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2025 03:16:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738944986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hD+eCZVAmu9HYlJ66O10gtRu+u/xshw0dNIF0ppHeG4=;
	b=Iy+C5GtDbg/9azw5oPqlrn3HdOpy+W2ByHcxeinX/c6klmLMjMQx+1tJe2kNOjT0bmde9C
	1N+62MNO2eSw72d/Z0c+3cpVEs0Npk+YCGmADIXqNWjKyXBOwS4gtwEvePuOFQDPUOofnh
	h5HjFVIRZq1aZXbzqIBgAXGFz4TF32c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738944986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hD+eCZVAmu9HYlJ66O10gtRu+u/xshw0dNIF0ppHeG4=;
	b=Iy+C5GtDbg/9azw5oPqlrn3HdOpy+W2ByHcxeinX/c6klmLMjMQx+1tJe2kNOjT0bmde9C
	1N+62MNO2eSw72d/Z0c+3cpVEs0Npk+YCGmADIXqNWjKyXBOwS4gtwEvePuOFQDPUOofnh
	h5HjFVIRZq1aZXbzqIBgAXGFz4TF32c=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-T2rj0PtVNLKYkGhC1xFXbQ-1; Fri, 07 Feb 2025 11:16:23 -0500
X-MC-Unique: T2rj0PtVNLKYkGhC1xFXbQ-1
X-Mimecast-MFC-AGG-ID: T2rj0PtVNLKYkGhC1xFXbQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fa32e4044bso1003052a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2025 08:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738944982; x=1739549782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hD+eCZVAmu9HYlJ66O10gtRu+u/xshw0dNIF0ppHeG4=;
        b=FHpWOFHMztDng3hr/+js/sfw9Yqqw69yAiEEUUMJre1Hzzw2hhOP75B6ksGXmhnHCP
         fnIzMrkkSe6LppEXdlY4ifvYc7A6YeP8BSESG5hAWgcJXq9xhyvTF97WHQCl/t+PnUKr
         k6an1mI1t931HWZa/5c+Dw3XfNS8tOi7ZBn4quZWy+WdJrOwbZf/f6LcUVWiw3zM97sn
         YSNGkY4r4wpY7PrehnAdKyQXFdWHtb7rTYA51XSWY6Mn+2KgFu/JsSmp9OIw0JcDIjTt
         WRBQQiSwunTN0CgmW0YdlXNCyCEBDOnCvalFj26BJ+7jE9iwakrKKz49tbDuoyA/t+SQ
         OSEw==
X-Forwarded-Encrypted: i=1; AJvYcCUsIlaPc9Gj+7kc9pf4jvREqKPBaOqWA4oiSM3N7N07BvF/DpgLoBs33azoDI6AxQETcId8SALJV2BU9tI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzC2wXXDmxAEfBq90AwwpBxtXorSAjZ2IRQibXWF1NQJELh4jw1
	7p6zUDFiL12wWKAOrq4byWjGT9cQ0cgUs4kjGzhfvqqEhaMRxs4l2zOnSOHG2FLeRtVGY86YqK1
	g5O3o8G+k8pIuVAnymCPhtU7Wjoi3XkWxKaU5ndHRECmBN0sq882GZVO/tDpyZ4KONSJtpZEQMY
	nK0nmoFTiQ1A6z890QfpqKLbDCWUbqA6L+a7XfNg==
X-Gm-Gg: ASbGncvkengQcRkroITMKIoDwa4IMi7K1Y9+ANvH47lDmaLy8KmcmKb83yPrujQnP8m
	HpqHuFclMQlrZ+aDZrx12lc26mzXkIcK0u4nrALhzHYN9tjQV7LhORbHU+AWAyPaw
X-Received: by 2002:a17:90b:1b44:b0:2f4:f7f8:fc8b with SMTP id 98e67ed59e1d1-2fa242e7602mr5367372a91.27.1738944981880;
        Fri, 07 Feb 2025 08:16:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9qQ6Ac9CdjS0hM2Fp5CTCftFgkMjfVYiNIpp2aFlk5UPLOL/FOPn2I3gKNt5IDhZaRA3QY4m6BBB8aMlIkFs=
X-Received: by 2002:a17:90b:1b44:b0:2f4:f7f8:fc8b with SMTP id
 98e67ed59e1d1-2fa242e7602mr5367287a91.27.1738944981087; Fri, 07 Feb 2025
 08:16:21 -0800 (PST)
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
 <CADSE00+2o5Ma0W6FBLHwpUaKut9Tf74GKLCU-377qgxr08EeoQ@mail.gmail.com> <e1630046-8889-4452-9f8f-07695ba07772@redhat.com>
In-Reply-To: <e1630046-8889-4452-9f8f-07695ba07772@redhat.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 7 Feb 2025 17:16:09 +0100
X-Gm-Features: AWEUYZnF6uEewR9F7JdT3B1cLzxz-kUGRVOwAxRfyR8MegKqDpoCLJWu8Fphkbs
Message-ID: <CADSE00KUeTp_C_kZPS1U2JcLiWuN1s6Se72gtFiN71kXCZx4UA@mail.gmail.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
To: David Hildenbrand <david@redhat.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Dan Williams <dan.j.williams@intel.com>, Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net, 
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, logang@deltatee.com, bhelgaas@google.com, jack@suse.cz, 
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com, 
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu, linmiaohe@huawei.com, 
	peterx@redhat.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de, 
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name, 
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>, 
	German Maglione <gmaglione@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: hyGCr-5Q_Iz4lk0vhSbgsqE6JSeVSKUY3mToPxxqx_4_1738944982
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Feb 6, 2025 at 7:22=E2=80=AFPM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 06.02.25 15:59, Albert Esteve wrote:
> > Hi!
> >
> > On Thu, Feb 6, 2025 at 3:30=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat=
.com> wrote:
> >>
> >> On Thu, Feb 06, 2025 at 08:37:07AM -0500, Vivek Goyal wrote:
> >>> And then there are challenges at QEMU level. virtiofsd needs addition=
al
> >>> vhost-user commands to implement DAX and these never went upstream in
> >>> QEMU. I hope these challenges are sorted at some point of time.
> >>
> >> Albert Esteve has been working on QEMU support:
> >> https://lore.kernel.org/qemu-devel/20240912145335.129447-1-aesteve@red=
hat.com/
> >>
> >> He has a viable solution. I think the remaining issue is how to best
> >> structure the memory regions. The reason for slow progress is not
> >> because it can't be done, it's probably just because this is a
> >> background task.
> >
> > It is partially that, indeed. But what has me blocked for now on postin=
g the
> > next version is that I was reworking a bit the MMAP strategy.
> > Following David comments, I am relying more on RAMBlocks and
> > subregions for mmaps. But this turned out more difficult than anticipat=
ed.
>
> Yeah, if that turns out to be too painful, we could start with the
> previous approach and work on that later. I also did not expect that to
> become that complicated.

Thanks. I'd like to do it properly, so I think will try a bit more to get i=
t
to work. Maybe another week. If I do not manage, I may do
what you suggested (I'll align with you first) to move the patch forward.

That said, if I end up doing that, I will definitively revisit it later.

BR,
Albert.

>
> --
> Cheers,
>
> David / dhildenb
>


