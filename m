Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B74D7199B5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:28:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX2R00rdfz3fbL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 20:28:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DNPDU595;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=DNPDU595;
	dkim-atps=neutral
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX2Q96BcLz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 20:27:45 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-565ba53f434so6490087b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jun 2023 03:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685615261; x=1688207261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+7FpAWqJ9UaTJolR3fhX+VLULajdYAdz5DrVldjg9M=;
        b=DNPDU5955K3+hJXFzOhvILPyfqhiSdd9AH82pxA7AZjcBYekzjwTVcHeYa5kxirgAO
         Zsqg9Mg7i09PWZMBkKR7GAnp8ApHEPR/Ngb4zXdIsbHhJ2yHMUtuKsa+hA1WMlIBXDaZ
         f5aECL2Gh3Xr5TOs0ItqQjUOT/xZD07F4DerYW8MthBWzV1iasujQH82WKNARh7GgVhv
         RGxSnQJpSYab1qYmx8r7cey9siNoVykynMlqHekdt4eUUPcU8QbgHsus2PuNMBfIFJIn
         wbOdnSrHZ8yKkEnZAa8jCXmmAosVEa2dhbK92w49HB5Bxw4jMYLpapeOHTgKpe+O3OCV
         jJwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685615261; x=1688207261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+7FpAWqJ9UaTJolR3fhX+VLULajdYAdz5DrVldjg9M=;
        b=f+wiEmZpxNeJ8SVMz3b/zWLjV2gWzJV9uzxqjDRfV9PJRTNklPKM4oC6H//1PmzR3e
         uU/7II7nT7d3UkQSvxkivSf7TO7R5ylvyKqlONTVzm3Yzk4qR11VIqOz6CqABM0Q6Szl
         VTW14fE9RTjgfPJurmIucsr0iRssCe9KYfWojgFsFQoG6kTzjBp8TdWazYmhDa7TOR4F
         VMirZ2eQkX0CpDNCspIU08Mb/BuRouNejV2z9H81y9w5skz/LJAACNavB7sItm7YOWTD
         CbfXpSQTPSDaQubX5tH9JxgYpD1798U8EHhh/5Nt8wMTd4OmPJQTp2970UCQIvRULvX9
         vStw==
X-Gm-Message-State: AC+VfDyyMdssX/fqY/UOM1fBzyNL8QseqObuCRTJRp0Jd/alnH7SDmbl
	b8oytHI6qvO5/5CEyWG5TMhWGnSAqwIAwt1qWhA=
X-Google-Smtp-Source: ACHHUZ5Rl9j3K2nrrXUI/ytZpuvVrpIbThy1vg7TGrRlvrVK4YOxw4JnS8GJOEYrUj1mJ3ErDXiEdVBrPMLLYU7fcMk=
X-Received: by 2002:a0d:d712:0:b0:561:abb8:3b38 with SMTP id
 z18-20020a0dd712000000b00561abb83b38mr9719929ywd.17.1685615261437; Thu, 01
 Jun 2023 03:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5@epcas5p2.samsung.com>
 <20230529111337.352990-1-maninder1.s@samsung.com> <20230529111337.352990-2-maninder1.s@samsung.com>
 <CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com> <87ilc8ym6v.fsf@mail.lhotse>
In-Reply-To: <87ilc8ym6v.fsf@mail.lhotse>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Jun 2023 12:27:30 +0200
Message-ID: <CANiq72nf-MC36hHzv0ZpR+qUyaf3mhF+rfqpMcVbw0AheuRBpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/xmon: use KSYM_NAME_LEN in array size
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, bcain@quicinc.com, keescook@chromium.org, gary@garyguo.net, pmladek@suse.com, linux-hexagon@vger.kernel.org, ustavoars@kernel.org, linux-kernel@vger.kernel.org, ojeda@kernel.org, wedsonaf@google.com, npiggin@gmail.com, alex.gaynor@gmail.com, Maninder Singh <maninder1.s@samsung.com>, Onkarnath <onkarnath.1@samsung.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 1, 2023 at 4:02=E2=80=AFAM Michael Ellerman <mpe@ellerman.id.au=
> wrote:
>
> > Side-note: in `get_function_bounds()`, I see `kallsyms_lookup()` being
> > used, but the name seems discarded? Can
> > `kallsyms_lookup_size_offset()` be used instead, thus avoiding the
> > usage of the buffer there to begin with?
>
> A few lines below it uses the modname, and AFAICS there's no (easy) way
> to lookup the modname without also looking up the name.

Hmm... I think you are looking at the `xmon_print_symbol()` one? I was
referring to the `get_function_bounds()` one, where the `modname`
parameter is `NULL` (and the `name` contents are not used, only
whether it was found or not).

> > Side-note 2: in `scanhex()`, I see a loop `i<63` using `tmpstr` which
> > then is used to do a `kallsyms_lookup_name()`, so I guess symbols
> > larger than 64 couldn't be found. I have no idea about what are the
> > external constraints here, but perhaps it is possible to increase the
> > `line` buffer etc. to then allow for bigger symbols to be found.
>
> Yeah that looks wrong. I don't see any symbols that long in current
> kernels, but we should fix it.
>
> Thanks for looking.

My pleasure!

Cheers,
Miguel
