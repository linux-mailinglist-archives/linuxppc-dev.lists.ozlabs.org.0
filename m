Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D910C8573D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 03:43:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ccOXhp+G;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ccOXhp+G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbbpC4KFQz3dfy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 13:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ccOXhp+G;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ccOXhp+G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbbnP65Jqz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 13:42:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708051347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKDhgPTxCi7j6zi98/JPmNg9BczPoti0AABKhmqf4I0=;
	b=ccOXhp+GPrSVl0nTJb/+PDYfADeBcwTC7gCnuvs36dr+fD1jaTWoTznWpq8YUrk4dQpM0v
	Mm496BsI6E6tdFk4XHHf3P/wzvrJBIVpD1z3prFg0gGcLmZdci/0Qz1ijTqavH+Q8LXg5O
	bLQMFlOL9lK8zaIpb9KDWa95p0GBDoU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708051347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wKDhgPTxCi7j6zi98/JPmNg9BczPoti0AABKhmqf4I0=;
	b=ccOXhp+GPrSVl0nTJb/+PDYfADeBcwTC7gCnuvs36dr+fD1jaTWoTznWpq8YUrk4dQpM0v
	Mm496BsI6E6tdFk4XHHf3P/wzvrJBIVpD1z3prFg0gGcLmZdci/0Qz1ijTqavH+Q8LXg5O
	bLQMFlOL9lK8zaIpb9KDWa95p0GBDoU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-h1BZvbhsNty84YBWulb_tA-1; Thu, 15 Feb 2024 21:42:23 -0500
X-MC-Unique: h1BZvbhsNty84YBWulb_tA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-68c43a4cc11so25700856d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 18:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708051342; x=1708656142;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKDhgPTxCi7j6zi98/JPmNg9BczPoti0AABKhmqf4I0=;
        b=m72T8fNigLhcGWdPd4tV9QlQYMkw1npoiTUTdpzJ3xi00HbeXdWK6tBDDnlM6yJF/I
         +zFS6pqvK31T8JsN9XiS2spkT1LDLShvNRODpThoQ56eTRZSL06p9558ytcmc+cvb8h2
         aXM/Apyb19OtNfLrm8JvH5jvTLBMFIdPySi6VljBnV61Kk8B84Q63Wr8DTUzqObIgJIS
         kRI+7jtR+kv6AUB62P4qE2wZ0Owrf/kD2yKLp8w+BgkemmUCEZNReEZ73EJXXpoqPXKy
         rvKr+WDWcj1Ab8vpzuc63NESOPim68KskCAx2XuF9T2yWfAAervvzi5ib7Q3BNA83J4h
         4Sjw==
X-Gm-Message-State: AOJu0YycFKHsN8imaItnGgTAZ5uHHvAWQKOB/R97iq6PfeLYxUpNsHCz
	YuUHmyxODdbPsdKZrRwkz7JDe/+vcY3WJ57Dk00yzPJz6T2FzGmOQrTFg3DdGgJiSj2+LJcFRSP
	1emtbM6TONhZz4tXi9P9pbc/t7+6kjX6tuSPgBR0g/rRdxnAgVOUqoeSRfrSlqksgOYaZcgoxin
	dKmaXs/2TNpLDYGbikhnIH0hMSOKVu+7swUbXVRQ==
X-Received: by 2002:a0c:e2d2:0:b0:68c:c948:219b with SMTP id t18-20020a0ce2d2000000b0068cc948219bmr3652236qvl.20.1708051342617;
        Thu, 15 Feb 2024 18:42:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGz49kUQDtFGSv6+XWuxR4Yp43NBXGR/Ph0ybzJUW+tijImU9g++PbSM3rHb6Nl75RYJF8aWq04kXmdwLxo/Zw=
X-Received: by 2002:a0c:e2d2:0:b0:68c:c948:219b with SMTP id
 t18-20020a0ce2d2000000b0068cc948219bmr3652223qvl.20.1708051342375; Thu, 15
 Feb 2024 18:42:22 -0800 (PST)
MIME-Version: 1.0
References: <20231229120107.2281153-1-mpe@ellerman.id.au> <170800202447.601034.7290612623478478380.b4-ty@ellerman.id.au>
In-Reply-To: <170800202447.601034.7290612623478478380.b4-ty@ellerman.id.au>
From: Pingfan Liu <piliu@redhat.com>
Date: Fri, 16 Feb 2024 10:42:11 +0800
Message-ID: <CAF+s44SmQKA3xpi6yU0ix1rR1DMfgk5EGhu+Wf5Yd+dhgWR8Ew@mail.gmail.com>
Subject: Re: [RFC PATCH 1/5] powerpc/smp: Adjust nr_cpu_ids to cover all
 threads of a core
To: Michael Ellerman <patch-notifications@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Pingfan Liu <kernelfans@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 15, 2024 at 9:09=E2=80=AFPM Michael Ellerman
<patch-notifications@ellerman.id.au> wrote:
>
> On Fri, 29 Dec 2023 23:01:03 +1100, Michael Ellerman wrote:
> > If nr_cpu_ids is too low to include at least all the threads of a singl=
e
> > core adjust nr_cpu_ids upwards. This avoids triggering odd bugs in code
> > that assumes all threads of a core are available.
> >
> >
>
> Applied to powerpc/next.
>

Great! After all these years, finally we are close to the conclusion
of this feature.

Thanks,

Pingfan

> [1/5] powerpc/smp: Adjust nr_cpu_ids to cover all threads of a core
>       https://git.kernel.org/powerpc/c/5580e96dad5a439d561d9648ffcbccb739=
c2a120
> [2/5] powerpc/smp: Increase nr_cpu_ids to include the boot CPU
>       https://git.kernel.org/powerpc/c/777f81f0a9c780a6443bcf2c7785f0cc2e=
87c1ef
> [3/5] powerpc/smp: Lookup avail once per device tree node
>       https://git.kernel.org/powerpc/c/dca79603fbc592ec7ea8bd7ba274052d39=
84e882
> [4/5] powerpc/smp: Factor out assign_threads()
>       https://git.kernel.org/powerpc/c/9832de654499f0bf797a3719c4d4c5bd40=
1f18f5
> [5/5] powerpc/smp: Remap boot CPU onto core 0 if >=3D nr_cpu_ids
>       https://git.kernel.org/powerpc/c/0875f1ceba974042069f04946aa8f1d4d1=
e688da
>
> cheers
>

