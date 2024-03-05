Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DEE38713ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:51:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iC57DWBt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpg6y0H15z3dXL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:51:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iC57DWBt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpg6F14WMz30YR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:50:28 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e617b39877so1581500b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709607026; x=1710211826; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K01sPMa+E35+HBf+hQVX1Loh4XduD8AUM0UI4iasBRg=;
        b=iC57DWBt6D4PxKxcI5vRmrXJtmi6+7CmIVqOBr1cwwqva1GzsgoCiI5apAe9pVL0+R
         tPOX5q42Goc1BYk5Rq0iAnHZHe5cW0KfBSoE5EgWZEfDnUFc+da2fQ03VI24enl4AXIH
         k4j+7L2J0Hde01V0voGFLW7sK2NPc/n+nSpQRcf2N1TINbmHlPIq/FiSn0D0VPArey+2
         yezAJ4jYk5cTqr273fP44VN7YjcRwKgqMj14fd8i500pJoZn19K8X6+wdfaQyQ00spZp
         dUvBjly3yp627/0JklLDBcDVWb2PgVklqvAid2MZOS/o79fwj2FB0iaYFbWcAlEpHK34
         jcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607026; x=1710211826;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K01sPMa+E35+HBf+hQVX1Loh4XduD8AUM0UI4iasBRg=;
        b=CZBvuoNJbKHd0KELTDEiBbjdh39NYmUkSflFbsEetiCxgOl0wSWIvzmIbkPvjtHRXe
         VeQ5hKaOaZYp9eEre2MdrLOBekZsc1mjR1IiVwj3TGv5DQqbHtLjLUDLhwiIG3AHwZB8
         /K0fysbjmZemJz4g1TOSYpG4MD1JTI8rTLuXy12lRldk9g1AbCScrTQih/XDUM3XZf5O
         wMdHZ2O1mhLFtqEnU58VoSa1doQtLOm6/5g9o1gIQeHY01AzMNxWqji8UAmzW4QPC8ei
         LGxfWYiOm3OCz794aK4MbP+dYT18ghDQ1hLR7ixEkbSdIFeg+ga0geG6xHqyv6+qWnp1
         42qw==
X-Forwarded-Encrypted: i=1; AJvYcCUSAOaQZO/9QjHMnXhMa3oto1iEpH3muPTHaQ0JUJcTTQy3gGxK3slI1sfDS64A0wC+mWiEVuR31vO5l0rNXFfDtiYWZfF5FoKHOG9HmA==
X-Gm-Message-State: AOJu0Yw+g5GXpLA7L1ncJbwS41Vd9Sxa/LyR45aoJNPeKxsSCa9nCNa7
	niVlSuUpGVDut3US0/a4Zi8ubfNQLMoZRSuRUDObj5yh2YottkYa
X-Google-Smtp-Source: AGHT+IGeaUyWTzG0fHn8j7kM8kVyutYiwJxH45YKNyPGsMtfAwKqhuxGDXZ2ByjKjIbEtmSLAgF7Iw==
X-Received: by 2002:a62:6203:0:b0:6e5:e7f5:856 with SMTP id w3-20020a626203000000b006e5e7f50856mr6657495pfb.19.1709607026290;
        Mon, 04 Mar 2024 18:50:26 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id k16-20020aa79d10000000b006e5ad7f245esm6916368pfp.11.2024.03.04.18.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:50:26 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:50:18 +1000
Message-Id: <CZLH3XUGU8Z8.2R73ILJ3ISWN8@wheely>
Subject: Re: [kvm-unit-tests PATCH 7/7] common: add memory dirtying vs
 migration test
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-8-npiggin@gmail.com>
 <e967e7a6-eb20-4b2b-ab7a-fc5052a3eb52@redhat.com>
In-Reply-To: <e967e7a6-eb20-4b2b-ab7a-fc5052a3eb52@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Mar 4, 2024 at 4:22 PM AEST, Thomas Huth wrote:
> On 26/02/2024 10.38, Nicholas Piggin wrote:
> > This test stores to a bunch of pages and verifies previous stores,
> > while being continually migrated. This can fail due to a QEMU TCG
> > physical memory dirty bitmap bug.
>
> Good idea, but could we then please drop "continuous" test from=20
> selftest-migration.c again? ... having two common tests to exercise the=
=20
> continuous migration that take quite a bunch of seconds to finish sounds=
=20
> like a waste of time in the long run to me.

Yeah if you like. I could shorten them up a bit. I did want to have
the selftests for just purely testing the harness with as little
"test" code as possible.

>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   common/memory-verify.c  | 48 ++++++++++++++++++++++++++++++++++++++++=
+
> >   powerpc/Makefile.common |  1 +
> >   powerpc/memory-verify.c |  1 +
> >   powerpc/unittests.cfg   |  7 ++++++
> >   s390x/Makefile          |  1 +
> >   s390x/memory-verify.c   |  1 +
> >   s390x/unittests.cfg     |  6 ++++++
> >   7 files changed, 65 insertions(+)
> >   create mode 100644 common/memory-verify.c
> >   create mode 120000 powerpc/memory-verify.c
> >   create mode 120000 s390x/memory-verify.c
> >=20
> > diff --git a/common/memory-verify.c b/common/memory-verify.c
> > new file mode 100644
> > index 000000000..7c4ec087b
> > --- /dev/null
> > +++ b/common/memory-verify.c
> > @@ -0,0 +1,48 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Simple memory verification test, used to exercise dirty memory migr=
ation.
> > + *
> > + */
> > +#include <libcflat.h>
> > +#include <migrate.h>
> > +#include <alloc.h>
> > +#include <asm/page.h>
> > +#include <asm/time.h>
> > +
> > +#define NR_PAGES 32
> > +
> > +int main(int argc, char **argv)
> > +{
> > +	void *mem =3D malloc(NR_PAGES*PAGE_SIZE);
> > +	bool success =3D true;
> > +	uint64_t ms;
> > +	long i;
> > +
> > +	report_prefix_push("memory");
> > +
> > +	memset(mem, 0, NR_PAGES*PAGE_SIZE);
> > +
> > +	migrate_begin_continuous();
> > +	ms =3D get_clock_ms();
> > +	i =3D 0;
> > +	do {
> > +		int j;
> > +
> > +		for (j =3D 0; j < NR_PAGES*PAGE_SIZE; j +=3D PAGE_SIZE) {
> > +			if (*(volatile long *)(mem + j) !=3D i) {
> > +				success =3D false;
> > +				goto out;
> > +			}
> > +			*(volatile long *)(mem + j) =3D i + 1;
> > +		}
> > +		i++;
> > +	} while (get_clock_ms() - ms < 5000);
>
> Maybe add a parameter so that the user can use different values for the=
=20
> runtime than always doing 5 seconds?

Sure.

Thanks,
Nick
