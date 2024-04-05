Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6073989949E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 06:55:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HWP4Mltq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9mPg1ZYYz3vXw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 15:55:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HWP4Mltq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9mNv4zT8z3dVp
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 15:54:21 +1100 (AEDT)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3c3d7e7402dso1250613b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Apr 2024 21:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712292857; x=1712897657; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NM65XexEQuUDhr+aIgnkbT0SpwOWl1w3Itz5eH8He64=;
        b=HWP4MltqFMJZ4cnkxTi4T/2Wt5T7LwnZk6tumGtrWi40NZbbgCzu2XMhDY1ghuu8Di
         cUwY8xu/2/8lrCUvtjVK/N6cOzMx9JfVcX7+C8gVWh1HdQ2Wh4OqpV671sDvW88uRJIu
         UnZg+CzXMT2QzTsw7iLZHOFm6I4rCrDcKfeg1VJ4RX3lWX9PujMGwcVyFISkc3+jgmik
         Rzm62Gs0EmrXTeMG1ILSESEaxjfd3a2gkqYdfomDZTOrAcJ+h4LGyxjmtXCqZsYpCKAk
         dMOAuRqh3jMWDOg1MmfFOduBbfNUAJH4l30lrmaY2F8eYtf+jmgnPikZWRO5kW9IiCuY
         LQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712292857; x=1712897657;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NM65XexEQuUDhr+aIgnkbT0SpwOWl1w3Itz5eH8He64=;
        b=CmO7qFS9uRQt2ynNQdqMudSOytxI0GmXJdccgXyF3dnRCv1nD02E+nJP7KTaZmjTtv
         +xr0Nux42Z1XYy0TNRSQWexZv6sGy6BYC+KbccrI66g2QLJUy7OFz62nGBThOJ1sKLsk
         SOfNfGPSvfNHeADMBF10/I3VEDu0EicvsaFdAY2/FRFtu36p8vrBL/xfizSrT78jilbk
         zrJQnUcjf6VUbpyLgVGeURZ+y1U9VotqIGcEFHyg0FXK/pCxCsI8vZpASVexYth5VxoD
         i98OS1rfffztPDTSimBmfbeG8+gKsmo1t9yLNo/3C/Ii0F2C8AdvgDNUVjGKYVYzrnDV
         QPpA==
X-Forwarded-Encrypted: i=1; AJvYcCU3v+ck/VLQnH31RLvyJZRZuV86UXjsH8aPJ5MCeRpoBhGlcsrD01wzPpyi+2u5W79VQRDYJWz8HxrDm4UcTqmTn1wEmaq5ZsVaZhFvKA==
X-Gm-Message-State: AOJu0Yw6rQZNzPv+LNPgWLR889JJp6HjQAYtR5uGe5oPK2MuGUH1Xp2G
	Mrak0cOEwjf9FnIX0E3ARk9ZYxvG8Bd2opSdRybknppF0HIidi1n
X-Google-Smtp-Source: AGHT+IGHD0DlwEdgHO7QJ9tkbc1GkMFmfexAQlDtE82V1qn/NLI0Tu7/QDx6d5bnKtEbzA7K44YNSg==
X-Received: by 2002:a54:451a:0:b0:3c5:d953:3814 with SMTP id l26-20020a54451a000000b003c5d9533814mr381743oil.2.1712292857082;
        Thu, 04 Apr 2024 21:54:17 -0700 (PDT)
Received: from localhost (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id gu11-20020a056a004e4b00b006e6cc93381esm546830pfb.125.2024.04.04.21.54.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 21:54:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 Apr 2024 14:54:06 +1000
Message-Id: <D0BX5M9GOA7N.RV1WXBCHI79X@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v7 07/35] common: add memory dirtying vs
 migration test
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.17.0
References: <20240319075926.2422707-1-npiggin@gmail.com>
 <20240319075926.2422707-8-npiggin@gmail.com>
 <6821682a-56f8-46aa-8fee-197434723bf5@redhat.com>
In-Reply-To: <6821682a-56f8-46aa-8fee-197434723bf5@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 29, 2024 at 3:37 AM AEST, Thomas Huth wrote:
> On 19/03/2024 08.58, Nicholas Piggin wrote:
> > This test stores to a bunch of pages and verifies previous stores,
> > while being continually migrated. Default runtime is 5 seconds.
> >=20
> > Add this test to ppc64 and s390x builds. This can fail due to a QEMU
> > TCG physical memory dirty bitmap bug, so it is not enabled in unittests
> > for TCG yet.
> >=20
> > The selftest-migration test time is reduced significantly because
> > this test
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   common/memory-verify.c      | 67 ++++++++++++++++++++++++++++++++++++=
+
> >   common/selftest-migration.c |  8 ++---
> >   powerpc/Makefile.common     |  1 +
> >   powerpc/memory-verify.c     |  1 +
> >   powerpc/unittests.cfg       |  7 ++++
> >   s390x/Makefile              |  1 +
> >   s390x/memory-verify.c       |  1 +
> >   s390x/unittests.cfg         |  6 ++++
> >   8 files changed, 88 insertions(+), 4 deletions(-)
> >   create mode 100644 common/memory-verify.c
> >   create mode 120000 powerpc/memory-verify.c
> >   create mode 120000 s390x/memory-verify.c
> >=20
> > diff --git a/common/memory-verify.c b/common/memory-verify.c
> > new file mode 100644
> > index 000000000..e78fb4338
> > --- /dev/null
> > +++ b/common/memory-verify.c
> > @@ -0,0 +1,67 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Simple memory verification test, used to exercise dirty memory migr=
ation.
> > + */
> > +#include <libcflat.h>
> > +#include <migrate.h>
> > +#include <alloc.h>
> > +#include <asm/page.h>
> > +#include <asm/time.h>
> > +
> > +#define NR_PAGES 32
> > +
> > +static unsigned time_sec =3D 5;
> > +
> > +static void do_getopts(int argc, char **argv)
> > +{
> > +	int i;
> > +
> > +	for (i =3D 0; i < argc; ++i) {
> > +		if (strcmp(argv[i], "-t") =3D=3D 0) {
> > +			i++;
> > +			if (i =3D=3D argc)
> > +				break;
> > +			time_sec =3D atol(argv[i]);
> > +		}
> > +	}
> > +
> > +	printf("running for %d secs\n", time_sec);
> > +}
> > +
> > +int main(int argc, char **argv)
> > +{
> > +	void *mem =3D malloc(NR_PAGES*PAGE_SIZE);
>
> Use alloc_pages(5) instead ? Or add at least some white spaces around "*"=
.

Hmm, alloc_pages is physical? Maybe I should use memalign instead (and
I'll fix the space). Even though it's not using VM, we might change
that.

> Apart from that this patch looks sane to me, so with that line fixed:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

I'll keep your R-B with the memalign change if that's okay.

Thanks,
Nick
