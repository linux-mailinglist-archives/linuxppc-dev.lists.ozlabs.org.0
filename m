Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AEF8BFD1B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 14:27:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KQXHS22U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZDv10R2fz3cVX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 22:27:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KQXHS22U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZDtJ2Vnwz2yvf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 22:27:18 +1000 (AEST)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5e152c757a5so2628191a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 05:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715171232; x=1715776032; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzhl7ZAW8jGRz42aowIWp6lQAQOy/vCwiQrcQ4oOFJk=;
        b=KQXHS22UK/fFqeXSjA48QuqzWg1h2q/BPQFqtofBe04oD1SYVzQYJ2OhCduffMDLR+
         Z7711gaOrImzITD+6wDOAVQT/l4hB2LVckqW2xAFabx4AY2UctR0TR8i2dVgyKnPyaPy
         MvsS5bCnmTxVKMilf4Gb/LCV2PdbmECqpIoHa6ZAFReDYoH7jKbWQ2vGbwYvRyQN4XoT
         yLJpvJ5pdpM72RZWLV441gFaulMLm7XHdc/QDrBeCp9RKSJ8VzyX1Lq7t6Ih+WA45S4b
         GcD8Bzt9X27mroCTr0kSU3w7h1TWPJuXyZyqcsUnW2866W2ilUXdJ26amPzImHzn/FhJ
         Wc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715171232; x=1715776032;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Tzhl7ZAW8jGRz42aowIWp6lQAQOy/vCwiQrcQ4oOFJk=;
        b=FJwxroe0zPZmQXlCYF2qzdnU1wFQHH+5dDe5GOL5E250QqNC72ZvR+RxBZ2ITiQpKx
         hCVeG7f7Is1Ds2l1cvvJfmNR3te9R+4/pTRvJdY/uIi0eJPy2mZ+TTb1JGRQrwe8H1q1
         Xd6qIqVUpxTgOSnvmzQOjbLPfP3SkQZ7HWUy3/O/tlXKM7AmLOxaNnUUMb4KeFgd39IF
         vBFohcJTRIDRL3QPQ7j6Gw3O7N/6I8FRODe55MCP4IHiDnWPJT0b31x7MnDHzkm9lejx
         WS6ZsesX/eihdTQzqo7p2o9Cfz5W0W+4EqEuNaoAxT5DVgeoEt5Fp39Bv5oJRH65z2u4
         VXjw==
X-Forwarded-Encrypted: i=1; AJvYcCWb/S7LsB39UOVBtQysqn49t02ynNRJSgCG3ryjODLmbkS6FmspH1Bm5/sSIVpJ/qvgCK1GuSvg3E2ZQlGUb4ogTt0LBufr3RlSisc9Zw==
X-Gm-Message-State: AOJu0YySMBza8HLNyIq0rHWHPjKTBWkhwLkRuiWOAcgxIEqOcGV7q3WJ
	3sT8kSdlQG45V34VyOCQukhLuhr3KeYMNZLlSxOdyGUGNP7GthrMvEn7Yg==
X-Google-Smtp-Source: AGHT+IExSIPuMSRPDbfvHtma7L54x5+aVxWuQHg9He/3VD/CbX/zKKN8vvUnUhZKdtm0xXYCF+asZg==
X-Received: by 2002:a17:90a:b38a:b0:2b4:fe80:1b1b with SMTP id 98e67ed59e1d1-2b616ae2a2fmr2221006a91.43.1715171232484;
        Wed, 08 May 2024 05:27:12 -0700 (PDT)
Received: from localhost ([1.146.8.34])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a390800b002b622cdbc40sm1409386pjb.39.2024.05.08.05.27.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 05:27:12 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 May 2024 22:27:06 +1000
Message-Id: <D149GFR9LAZH.1X2F7YKPEJ42C@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 07/31] scripts: allow machine option
 to be specified in unittests.cfg
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-8-npiggin@gmail.com>
 <e0df1892-c17f-4fc3-b95a-4efc0af917d3@redhat.com>
In-Reply-To: <e0df1892-c17f-4fc3-b95a-4efc0af917d3@redhat.com>
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

On Wed May 8, 2024 at 1:08 AM AEST, Thomas Huth wrote:
> On 04/05/2024 14.28, Nicholas Piggin wrote:
> > This allows different machines with different requirements to be
> > supported by run_tests.sh, similarly to how different accelerators
> > are handled.
> >=20
> > Acked-by: Thomas Huth <thuth@redhat.com>
> > Acked-by: Andrew Jones <andrew.jones@linux.dev>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   docs/unittests.txt   |  7 +++++++
> >   scripts/common.bash  |  8 ++++++--
> >   scripts/runtime.bash | 16 ++++++++++++----
> >   3 files changed, 25 insertions(+), 6 deletions(-)
> >=20
> > diff --git a/docs/unittests.txt b/docs/unittests.txt
> > index 7cf2c55ad..6449efd78 100644
> > --- a/docs/unittests.txt
> > +++ b/docs/unittests.txt
> > @@ -42,6 +42,13 @@ For <arch>/ directories that support multiple archit=
ectures, this restricts
> >   the test to the specified arch. By default, the test will run on any
> >   architecture.
> >  =20
> > +machine
> > +-------
> > +For those architectures that support multiple machine types, this rest=
ricts
> > +the test to the specified machine. By default, the test will run on
> > +any machine type. (Note, the machine can be specified with the MACHINE=
=3D
> > +environment variable, and defaults to the architecture's default.)
> > +
> >   smp
> >   ---
> >   smp =3D <number>
> > diff --git a/scripts/common.bash b/scripts/common.bash
> > index 5e9ad53e2..3aa557c8c 100644
> > --- a/scripts/common.bash
> > +++ b/scripts/common.bash
> > @@ -10,6 +10,7 @@ function for_each_unittest()
> >   	local opts
> >   	local groups
> >   	local arch
> > +	local machine
> >   	local check
> >   	local accel
> >   	local timeout
> > @@ -21,7 +22,7 @@ function for_each_unittest()
> >   		if [[ "$line" =3D~ ^\[(.*)\]$ ]]; then
> >   			rematch=3D${BASH_REMATCH[1]}
> >   			if [ -n "${testname}" ]; then
> > -				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" =
"$arch" "$check" "$accel" "$timeout"
> > +				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" =
"$arch" "$machine" "$check" "$accel" "$timeout"
> >   			fi
> >   			testname=3D$rematch
> >   			smp=3D1
> > @@ -29,6 +30,7 @@ function for_each_unittest()
> >   			opts=3D""
> >   			groups=3D""
> >   			arch=3D""
> > +			machine=3D""
> >   			check=3D""
> >   			accel=3D""
> >   			timeout=3D""
> > @@ -58,6 +60,8 @@ function for_each_unittest()
> >   			groups=3D${BASH_REMATCH[1]}
> >   		elif [[ $line =3D~ ^arch\ *=3D\ *(.*)$ ]]; then
> >   			arch=3D${BASH_REMATCH[1]}
> > +		elif [[ $line =3D~ ^machine\ *=3D\ *(.*)$ ]]; then
> > +			machine=3D${BASH_REMATCH[1]}
> >   		elif [[ $line =3D~ ^check\ *=3D\ *(.*)$ ]]; then
> >   			check=3D${BASH_REMATCH[1]}
> >   		elif [[ $line =3D~ ^accel\ *=3D\ *(.*)$ ]]; then
> > @@ -67,7 +71,7 @@ function for_each_unittest()
> >   		fi
> >   	done
> >   	if [ -n "${testname}" ]; then
> > -		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$=
arch" "$check" "$accel" "$timeout"
> > +		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$=
arch" "$machine" "$check" "$accel" "$timeout"
> >   	fi
> >   	exec {fd}<&-
> >   }
> > diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> > index 177b62166..0c96d6ea2 100644
> > --- a/scripts/runtime.bash
> > +++ b/scripts/runtime.bash
> > @@ -32,7 +32,7 @@ premature_failure()
> >   get_cmdline()
> >   {
> >       local kernel=3D$1
> > -    echo "TESTNAME=3D$testname TIMEOUT=3D$timeout ACCEL=3D$accel $RUNT=
IME_arch_run $kernel -smp $smp $opts"
> > +    echo "TESTNAME=3D$testname TIMEOUT=3D$timeout MACHINE=3D$machine A=
CCEL=3D$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> >   }
> >  =20
> >   skip_nodefault()
> > @@ -80,9 +80,10 @@ function run()
> >       local kernel=3D"$4"
> >       local opts=3D"$5"
> >       local arch=3D"$6"
> > -    local check=3D"${CHECK:-$7}"
> > -    local accel=3D"$8"
> > -    local timeout=3D"${9:-$TIMEOUT}" # unittests.cfg overrides the def=
ault
> > +    local machine=3D"$7"
> > +    local check=3D"${CHECK:-$8}"
> > +    local accel=3D"$9"
> > +    local timeout=3D"${10:-$TIMEOUT}" # unittests.cfg overrides the de=
fault
> >  =20
> >       if [ "${CONFIG_EFI}" =3D=3D "y" ]; then
> >           kernel=3D${kernel/%.flat/.efi}
> > @@ -116,6 +117,13 @@ function run()
> >           return 2
> >       fi
> >  =20
> > +    if [ -n "$machine" ] && [ -n "$MACHINE" ] && [ "$machine" !=3D "$M=
ACHINE" ]; then
> > +        print_result "SKIP" $testname "" "$machine only"
> > +        return 2
> > +    elif [ -n "$MACHINE" ]; then
> > +        machine=3D"$MACHINE"
> > +    fi
> > +
> >       if [ -n "$accel" ] && [ -n "$ACCEL" ] && [ "$accel" !=3D "$ACCEL"=
 ]; then
> >           print_result "SKIP" $testname "" "$accel only, but ACCEL=3D$A=
CCEL"
> >           return 2
>
> For some reasons that I don't quite understand yet, this patch causes the=
=20
> "sieve" test to always timeout on the s390x runner, see e.g.:
>
>   https://gitlab.com/thuth/kvm-unit-tests/-/jobs/6798954987

How do you use the s390x runner?

>
> Everything is fine in the previous patches (I pushed now the previous 5=
=20
> patches to the repo):
>
>   https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/pipelines/1281919104
>
> Could it be that he TIMEOUT gets messed up in certain cases?

Hmm not sure yet. At least it got timeout right for the duration=3D90s
message.

Thanks,
Nick
