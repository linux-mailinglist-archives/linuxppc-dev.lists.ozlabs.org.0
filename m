Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6CB8BD9F1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 05:58:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WLqM5N80;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYPdM0V30z3cRK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 13:58:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=WLqM5N80;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYPcc3M33z30Vy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 13:57:35 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1ec4dc64c6cso18235055ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2024 20:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715054252; x=1715659052; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R2cs0fpmc057SmgZuvUqhV6BRJkkXjYOTVxjCTsqmYg=;
        b=WLqM5N80zqafBwoLrZI31AG0it1Zwf/EB5FAXmR4HnWXZ9g9+BtGLXm4OAFMoTxKKI
         A8RB+UepAg4hcZEwK9m+2crzo0M5DmQchzyDg8ZffcJDfYCMQGqoVoQZ/bGXqqOTEm8Y
         p4m9PcQJ1PvIPh7tDhp/IUu0VJZP4346Q2Gk9fdHvK1K/idDA1fKZyzSaNWNnqTTFX6o
         bfhG+pXLM1+IaWdXde8fnURF5rdbiJjpvWfijt0PgZ9+t8qx1lZT/CWCy3uTQHn7Fp++
         aM0TJhe2ZCRhMaR5a/fty0UEI5ESUy/tIfh75VMStWiUxv9/WSAFja7MsqywP3419X/i
         3d4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715054252; x=1715659052;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R2cs0fpmc057SmgZuvUqhV6BRJkkXjYOTVxjCTsqmYg=;
        b=Lzso5OX+fxOUKbdrANlh1YFhbS8AYR9ykMiqlIhZ4H2ctTMFq+9MQ/cEZawu2UVydZ
         U0x5zHulyGHDlxVJidrOddZJAsFX2QDSNQDfuSrYwAopDavuwmIZj/kF1YuYdgWogTpF
         aXe528MBOnWkCnluoCwrQdTN6DACilPlZ/vAYkoGZNI8SMWbVWkaJnIT5fcZvXw+WSRF
         hrU1UQR8DHWGl558o901PVmMU3SohxFtY7iotkT8P/8LQa2E8k6uTVUIYlCXlnvgWM7V
         v3b88xovzOvGYOV8aSasLDiiTreQSY4RVh+M8hNoc1KRvqmafjG071LBNstbuZi09Z9j
         kqnA==
X-Forwarded-Encrypted: i=1; AJvYcCUPu71k6lGx3NF+TaLtT4eEx4lnwXNJc8hg5c6p+l+zgmWi2HIsIWCDxP8lIrEKyufzmvKeQyQAL94heNAq2Flv99lQDstAJYGIaFiaMg==
X-Gm-Message-State: AOJu0Yy+md29ULORsdqljSBJkYFsF0HL6tJVmRn8wzGbFVBlYZoIm0E+
	gPtYewqtbcRzfb4h46sb8niC+onTDBRbJddTlOuzzT/wSrPH/BKc
X-Google-Smtp-Source: AGHT+IFnsSAWAlTgWGgEMXfTnsR6Yjv2EsMgnVAbQPN7Mf2KfnP5wxrcw/efQSk4vLwCeVuNMhmAyQ==
X-Received: by 2002:a17:902:d486:b0:1eb:4c47:3454 with SMTP id c6-20020a170902d48600b001eb4c473454mr18442927plg.0.1715054251926;
        Mon, 06 May 2024 20:57:31 -0700 (PDT)
Received: from localhost (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id n15-20020a170902e54f00b001e4d22f828fsm9052639plf.33.2024.05.06.20.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 May 2024 20:57:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 May 2024 13:57:26 +1000
Message-Id: <D133ZNVZZZM6.24D8Z032EFSRO@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 01/31] doc: update unittests doc
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-2-npiggin@gmail.com>
 <5cde6ee7-eabc-414b-a409-24a6ed141b39@redhat.com>
In-Reply-To: <5cde6ee7-eabc-414b-a409-24a6ed141b39@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 6, 2024 at 5:03 PM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > This adds a few minor fixes.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   docs/unittests.txt | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/docs/unittests.txt b/docs/unittests.txt
> > index 3192a60ec..7cf2c55ad 100644
> > --- a/docs/unittests.txt
> > +++ b/docs/unittests.txt
> > @@ -15,8 +15,8 @@ unittests.cfg format
> >  =20
> >   # is the comment symbol, all following contents of the line is ignore=
d.
> >  =20
> > -Each unit test is defined with a [unit-test-name] line, followed by
> > -a set of parameters that control how the test case is run. The name is
> > +Each unit test is defined with a [unit-test-name] line, followed by a
> > +set of parameters that control how the test case is run. The name is
> >   arbitrary and appears in the status reporting output.
> >  =20
> >   Parameters appear on their own lines under the test name, and have a
> > @@ -62,8 +62,8 @@ groups
> >   groups =3D <group_name1> <group_name2> ...
> >  =20
> >   Used to group the test cases for the `run_tests.sh -g ...` run group
> > -option. Adding a test to the nodefault group will cause it to not be
> > -run by default.
> > +option. The group name is arbitrary, aside from the nodefault group
> > +which makes the test to not be run by default.
> >  =20
> >   accel
> >   -----
> > @@ -82,8 +82,10 @@ Optional timeout in seconds, after which the test wi=
ll be killed and fail.
> >  =20
> >   check
> >   -----
> > -check =3D <path>=3D<<value>
> > +check =3D <path>=3D<value>
> >  =20
> >   Check a file for a particular value before running a test. The check =
line
> >   can contain multiple files to check separated by a space, but each ch=
eck
> >   parameter needs to be of the form <path>=3D<value>
> > +
> > +The path and value can not contain space, =3D, or shell wildcard chara=
cters.
>
> Could you comment on my feedback here, please:
>
>   https://lore.kernel.org/kvm/951ccd88-0e39-4379-8d86-718e72594dd9@redhat=
.com/

Sorry, missed that. I didn't mean to re-send this one.

Thanks,
Nick
