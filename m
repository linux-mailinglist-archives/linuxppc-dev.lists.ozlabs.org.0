Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5054A86BFAF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:56:44 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LLhYp5MV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlcpx6mFhz3vYH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:56:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LLhYp5MV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlcpC4dGyz3bsn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 14:56:02 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e56da425b5so337012b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709178959; x=1709783759; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWcLujHHv8i/TCX/eV0Cq8RaT7/itl/bFzVITNyWgHU=;
        b=LLhYp5MVEMMilHdUfDuREsXJOJNft2ED6pMBnwCvEM51bYPYLauqtsHqCXhq2mmZFj
         vzzBKF87sOhtptfFNFh0Beh61bKHDXPLexSITU3A9bOZI/E/Dat14DHV4b2Q/l8o3iuH
         GY15CfXTZLy54t28r0bnNYZeREdxplJtmBCTHQQy+tKbS5NdHdKbRIO9N0I5BGQsxjav
         NbEAYDQDxsTllFzEFqmuPMAvANCs/ynM+YS7d/9Afvs8awIywZDAkNHTLnjRBFQOo3Xf
         Rsr5T5D6vptR+a52y6BAHZ6/CbrHSVj5roIhgcMf/l/gQaJuIN7b33BcgsuKEfyBxMav
         5Ezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709178959; x=1709783759;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JWcLujHHv8i/TCX/eV0Cq8RaT7/itl/bFzVITNyWgHU=;
        b=eICHUZ296v8z3JOzYNH8OISgK6bOwMbRULVaypUOpxz3jonIWc04d+ALRm+pwlqnhn
         MJdK+6fFbCP9eh3MYvW8W0dG6+ZtaAq9RMEI0N8xiuKoxtO2CjcOPtMcSuayaOjHN9zC
         i14PvbULNAyQJm6fE8gwYoYk8bnLP662RPatEEnTe1pNohiqlNFgQvU7o4ZPmiLLQkAG
         Q2M3V0z20YkN7XHQZNl5Gu8WRlqupuFVZ5ad2SAIlI4Vtpk9OI4RA1RGmFM08uXWVScj
         j/IScdvxquWootaz3QoGl7/V0/Y6KszK3SiOFXSBi9qM1R5dQwgI+qPjlZTik9rlxPl3
         g3bw==
X-Forwarded-Encrypted: i=1; AJvYcCVZDVNd6ZNm1J3Mg4l0Y4LzPuFgxjqZJUKn9zvcuhYConaTNAr0vQ1R8W+q1IkYX0iYEovqiwq7NE+de0fuIlZT2mvQkWiMTlIXlPndeg==
X-Gm-Message-State: AOJu0YwefJu7tqHSB3rCSUTwtTxslsdBZw5urDO76kbFDIiCzu6fE3Y8
	/ozaMEhOxGaWcr99OuflN38ST3Z5rejMcTsltQIKnrCQwJaSsY77
X-Google-Smtp-Source: AGHT+IGwE0WC6jn7KJKFPT27e1lEa2s+c9G7mMkwH4tcRT8KLb2sX/mDeX7697E6K+RQ8nsfd60WpA==
X-Received: by 2002:a17:90b:342:b0:29a:a3e1:7ab4 with SMTP id fh2-20020a17090b034200b0029aa3e17ab4mr1196565pjb.20.1709178959242;
        Wed, 28 Feb 2024 19:55:59 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id d23-20020a17090ac25700b0029ae07f56b3sm325887pjx.5.2024.02.28.19.55.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 19:55:59 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 13:55:53 +1000
Message-Id: <CZH9DFOIK83X.3M1VP48W32393@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>
Subject: Re: [kvm-unit-tests PATCH 32/32] powerpc: gitlab CI update
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-33-npiggin@gmail.com>
 <20240228-86aa66c910b91dfebb8afee8@orel>
In-Reply-To: <20240228-86aa66c910b91dfebb8afee8@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Feb 28, 2024 at 10:16 PM AEST, Andrew Jones wrote:
> On Mon, Feb 26, 2024 at 08:12:18PM +1000, Nicholas Piggin wrote:
> > This adds testing for the powernv machine, and adds a gitlab-ci test
> > group instead of specifying all tests in .gitlab-ci.yml.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  .gitlab-ci.yml        | 16 ++++++----------
> >  powerpc/unittests.cfg | 15 ++++++++-------
> >  2 files changed, 14 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 61f196d5d..51a593021 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -69,11 +69,9 @@ build-ppc64be:
> >   - cd build
> >   - ../configure --arch=3Dppc64 --endian=3Dbig --cross-prefix=3Dpowerpc=
64-linux-gnu-
> >   - make -j2
> > - - ACCEL=3Dtcg ./run_tests.sh
> > -     selftest-setup selftest-migration selftest-migration-skip spapr_h=
call
> > -     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-d=
ay
> > -     emulator
> > -     | tee results.txt
> > + - ACCEL=3Dtcg MAX_SMP=3D8 ./run_tests.sh -g gitlab-ci | tee results.t=
xt
> > + - if grep -q FAIL results.txt ; then exit 1 ; fi
> > + - ACCEL=3Dtcg MAX_SMP=3D8 MACHINE=3Dpowernv ./run_tests.sh -g gitlab-=
ci | tee results.txt
> >   - if grep -q FAIL results.txt ; then exit 1 ; fi
> > =20
> >  build-ppc64le:
> > @@ -82,11 +80,9 @@ build-ppc64le:
> >   - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
> >   - ./configure --arch=3Dppc64 --endian=3Dlittle --cross-prefix=3Dpower=
pc64-linux-gnu-
> >   - make -j2
> > - - ACCEL=3Dtcg ./run_tests.sh
> > -     selftest-setup selftest-migration selftest-migration-skip spapr_h=
call
> > -     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-d=
ay
> > -     emulator
> > -     | tee results.txt
> > + - ACCEL=3Dtcg MAX_SMP=3D8 ./run_tests.sh -g gitlab-ci | tee results.t=
xt
> > + - if grep -q FAIL results.txt ; then exit 1 ; fi
> > + - ACCEL=3Dtcg MAX_SMP=3D8 MACHINE=3Dpowernv ./run_tests.sh -g gitlab-=
ci | tee results.txt
> >   - if grep -q FAIL results.txt ; then exit 1 ; fi
> > =20
>
> We're slowly migrating all tests like these to
>
>  grep -q PASS results.txt && ! grep -q FAIL results.txt
>
> Here's a good opportunity to change ppc's.

Sure, I'll do that.

Thanks,
Nick
