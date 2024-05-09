Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6595A8C0B1C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 07:45:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iCRlJDx8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZgvw05y2z3cTj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 May 2024 15:45:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iCRlJDx8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZgv81wchz3c5Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 May 2024 15:44:36 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1eecc71311eso3691955ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 May 2024 22:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715233473; x=1715838273; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJWRqriluNl85+42GdgojZnsAFr/eRJv/kXU3cwJsng=;
        b=iCRlJDx851UsejX6yIwoPaHDQLj9DePrB4nYmMeCL74Ui9vK3dhdWT4lWz6de6N9qo
         agCaMx9tDHXdakez4wwo+/2s9H9Jw/FskHGvOr0NlesNVbr5xi69LoUQYLFzkWldBNDJ
         oSsU8oQj15WEA2fx7xZzWLj2szRmpnU1SyBum0DigRX8TtkGBfoU+iuXBVmUKFNxPErr
         /2CDKghahv+pb71TNnMmiQALHLSGQknWB9zQgckeNy9/7J+ye+jLZyNRYkcGDFsdXEUG
         pyCzVzggnlq5Ug9d3X5Ss1iqAL5kroeYbMiZWjkWj7YuEIMwf0enAHAde2MtdztH3lHD
         2uAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715233473; x=1715838273;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AJWRqriluNl85+42GdgojZnsAFr/eRJv/kXU3cwJsng=;
        b=OvY99UPZyLWwqOf74Ihs1g8ZWariacjiGSzwp5dnR3v+EYVqJss6cSW5quGM5yuYr7
         Ui/Jt2LG2lFSSuGPsjO7aHN2qgni5bXUdkz1P00E6QJd5BKQ18d+5VdyEIVPlMdM7SfZ
         xpDWCEVRhGFsCSpfbPfx43h9SdbssX8lyXS2FhxKi5kQ/MGe1ZuewB0qn2VwiQB04e0X
         2lMUMD7Xt3n6uYplFQ5DlXNO3oyGI29WpQhINI/Il4/zI0Gvk+Vdz/I0cfNBMWbZqedT
         zI2dMZ66VMsb4UhUpUOZS16pRmiPhjOsljc8CzWH6okI8c3r3I+9/oEgFoIZYNm+2Aac
         URUQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5mnRSc2IpapEFU9sV1viHG/rYblr2Ej8iuRxe/LCPnmQ98MZyBxdW1weJAr/zAMmqscLoCkumJO/s4F9gxgpOgj+3xFKCnu3hn2O5vQ==
X-Gm-Message-State: AOJu0YyW8o/+QAb4gjHob79Yn12k/+zVKZ+X5xUPBjhTnbQDtj0FNbL3
	R8OWi+EE1QkPNnQLZV/yr0mjF7VIu8qYD0/7PXExxFvHH8b2QPciwfH4Yw==
X-Google-Smtp-Source: AGHT+IGd4oa2yMXCfYQP+bxGt12i9vjzrC31YakhXmhGF7KdK4LjzEQLYLhaBSydZRE54ks0BhUoqg==
X-Received: by 2002:a17:903:2283:b0:1eb:2f02:cd0d with SMTP id d9443c01a7336-1eeaf870a61mr69944755ad.0.1715233472788;
        Wed, 08 May 2024 22:44:32 -0700 (PDT)
Received: from localhost (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c1368cfsm5209235ad.253.2024.05.08.22.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 22:44:31 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 May 2024 15:44:27 +1000
Message-Id: <D14VIP36ZLPW.334QUWLZMQ5T3@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v9 07/31] scripts: allow machine option
 to be specified in unittests.cfg
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.17.0
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-8-npiggin@gmail.com>
 <e0df1892-c17f-4fc3-b95a-4efc0af917d3@redhat.com>
 <D149GFR9LAZH.1X2F7YKPEJ42C@gmail.com>
 <f304924b-8acf-40f6-9426-10fdf77712b6@redhat.com>
 <1e07de7a-5b14-4168-aa14-56dae8766dc0@redhat.com>
 <50e43047-b251-465b-b4b0-b5987ec9aa78@redhat.com>
In-Reply-To: <50e43047-b251-465b-b4b0-b5987ec9aa78@redhat.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed May 8, 2024 at 11:36 PM AEST, Thomas Huth wrote:
> On 08/05/2024 14.58, Thomas Huth wrote:
> > On 08/05/2024 14.55, Thomas Huth wrote:
> >> On 08/05/2024 14.27, Nicholas Piggin wrote:
> >>> On Wed May 8, 2024 at 1:08 AM AEST, Thomas Huth wrote:
> >>>> On 04/05/2024 14.28, Nicholas Piggin wrote:
> >>>>> This allows different machines with different requirements to be
> >>>>> supported by run_tests.sh, similarly to how different accelerators
> >>>>> are handled.
> >>>>>
> >>>>> Acked-by: Thomas Huth <thuth@redhat.com>
> >>>>> Acked-by: Andrew Jones <andrew.jones@linux.dev>
> >>>>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >>>>> ---
> >>>>> =C2=A0=C2=A0 docs/unittests.txt=C2=A0=C2=A0 |=C2=A0 7 +++++++
> >>>>> =C2=A0=C2=A0 scripts/common.bash=C2=A0 |=C2=A0 8 ++++++--
> >>>>> =C2=A0=C2=A0 scripts/runtime.bash | 16 ++++++++++++----
> >>>>> =C2=A0=C2=A0 3 files changed, 25 insertions(+), 6 deletions(-)
> >>>>>
> >>>>> diff --git a/docs/unittests.txt b/docs/unittests.txt
> >>>>> index 7cf2c55ad..6449efd78 100644
> >>>>> --- a/docs/unittests.txt
> >>>>> +++ b/docs/unittests.txt
> >>>>> @@ -42,6 +42,13 @@ For <arch>/ directories that support multiple=20
> >>>>> architectures, this restricts
> >>>>> =C2=A0=C2=A0 the test to the specified arch. By default, the test w=
ill run on any
> >>>>> =C2=A0=C2=A0 architecture.
> >>>>> +machine
> >>>>> +-------
> >>>>> +For those architectures that support multiple machine types, this=
=20
> >>>>> restricts
> >>>>> +the test to the specified machine. By default, the test will run o=
n
> >>>>> +any machine type. (Note, the machine can be specified with the MAC=
HINE=3D
> >>>>> +environment variable, and defaults to the architecture's default.)
> >>>>> +
> >>>>> =C2=A0=C2=A0 smp
> >>>>> =C2=A0=C2=A0 ---
> >>>>> =C2=A0=C2=A0 smp =3D <number>
> >>>>> diff --git a/scripts/common.bash b/scripts/common.bash
> >>>>> index 5e9ad53e2..3aa557c8c 100644
> >>>>> --- a/scripts/common.bash
> >>>>> +++ b/scripts/common.bash
> >>>>> @@ -10,6 +10,7 @@ function for_each_unittest()
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local opts
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local groups
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local arch
> >>>>> +=C2=A0=C2=A0=C2=A0 local machine
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local check
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local accel
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local timeout
> >>>>> @@ -21,7 +22,7 @@ function for_each_unittest()
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [[ =
"$line" =3D~ ^\[(.*)\]$ ]]; then
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 rematch=3D${BASH_REMATCH[1]}
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if [ -n "${testname}" ]; then
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 $(arch_cmd) "$cmd" "$testname" "$groups" "$smp"=20
> >>>>> "$kernel" "$opts" "$arch" "$check" "$accel" "$timeout"
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 $(arch_cmd) "$cmd" "$testname" "$groups" "$smp"=20
> >>>>> "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 fi
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 testname=3D$rematch
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 smp=3D1
> >>>>> @@ -29,6 +30,7 @@ function for_each_unittest()
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 opts=3D""
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 groups=3D""
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 arch=3D""
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 machine=3D""
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 check=3D""
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 accel=3D""
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 timeout=3D""
> >>>>> @@ -58,6 +60,8 @@ function for_each_unittest()
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 groups=3D${BASH_REMATCH[1]}
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [=
[ $line =3D~ ^arch\ *=3D\ *(.*)$ ]]; then
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 arch=3D${BASH_REMATCH[1]}
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [[ $line =3D~ ^mac=
hine\ *=3D\ *(.*)$ ]]; then
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 machine=3D${BASH_REMATCH[1]}
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [=
[ $line =3D~ ^check\ *=3D\ *(.*)$ ]]; then
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 check=3D${BASH_REMATCH[1]}
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elif [=
[ $line =3D~ ^accel\ *=3D\ *(.*)$ ]]; then
> >>>>> @@ -67,7 +71,7 @@ function for_each_unittest()
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 done
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "${testname}" ]; then
> >>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(arch_cmd) "$cmd" "$te=
stname" "$groups" "$smp" "$kernel"=20
> >>>>> "$opts" "$arch" "$check" "$accel" "$timeout"
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 $(arch_cmd) "$cmd" "$te=
stname" "$groups" "$smp" "$kernel"=20
> >>>>> "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 exec {fd}<&-
> >>>>> =C2=A0=C2=A0 }
> >>>>> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> >>>>> index 177b62166..0c96d6ea2 100644
> >>>>> --- a/scripts/runtime.bash
> >>>>> +++ b/scripts/runtime.bash
> >>>>> @@ -32,7 +32,7 @@ premature_failure()
> >>>>> =C2=A0=C2=A0 get_cmdline()
> >>>>> =C2=A0=C2=A0 {
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local kernel=3D$1
> >>>>> -=C2=A0=C2=A0=C2=A0 echo "TESTNAME=3D$testname TIMEOUT=3D$timeout A=
CCEL=3D$accel=20
> >>>>> $RUNTIME_arch_run $kernel -smp $smp $opts"
> >>>>> +=C2=A0=C2=A0=C2=A0 echo "TESTNAME=3D$testname TIMEOUT=3D$timeout M=
ACHINE=3D$machine=20
> >>>>> ACCEL=3D$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
> >>>>> =C2=A0=C2=A0 }
> >>>>> =C2=A0=C2=A0 skip_nodefault()
> >>>>> @@ -80,9 +80,10 @@ function run()
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local kernel=3D"$4"
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local opts=3D"$5"
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local arch=3D"$6"
> >>>>> -=C2=A0=C2=A0=C2=A0 local check=3D"${CHECK:-$7}"
> >>>>> -=C2=A0=C2=A0=C2=A0 local accel=3D"$8"
> >>>>> -=C2=A0=C2=A0=C2=A0 local timeout=3D"${9:-$TIMEOUT}" # unittests.cf=
g overrides the default
> >>>>> +=C2=A0=C2=A0=C2=A0 local machine=3D"$7"
> >>>>> +=C2=A0=C2=A0=C2=A0 local check=3D"${CHECK:-$8}"
> >>>>> +=C2=A0=C2=A0=C2=A0 local accel=3D"$9"
> >>>>> +=C2=A0=C2=A0=C2=A0 local timeout=3D"${10:-$TIMEOUT}" # unittests.c=
fg overrides the default
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ "${CONFIG_EFI}" =3D=3D "y=
" ]; then
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel=
=3D${kernel/%.flat/.efi}
> >>>>> @@ -116,6 +117,13 @@ function run()
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 2
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> >>>>> +=C2=A0=C2=A0=C2=A0 if [ -n "$machine" ] && [ -n "$MACHINE" ] && [ =
"$machine" !=3D=20
> >>>>> "$MACHINE" ]; then
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_result "SKIP" $te=
stname "" "$machine only"
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 2
> >>>>> +=C2=A0=C2=A0=C2=A0 elif [ -n "$MACHINE" ]; then
> >>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 machine=3D"$MACHINE"
> >>>>> +=C2=A0=C2=A0=C2=A0 fi
> >>>>> +
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -n "$accel" ] && [ -n "$A=
CCEL" ] && [ "$accel" !=3D "$ACCEL"=20
> >>>>> ]; then
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 print_=
result "SKIP" $testname "" "$accel only, but=20
> >>>>> ACCEL=3D$ACCEL"
> >>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return=
 2
> >>>>
> >>>> For some reasons that I don't quite understand yet, this patch cause=
s the
> >>>> "sieve" test to always timeout on the s390x runner, see e.g.:
> >>>>
> >>>> =C2=A0=C2=A0 https://gitlab.com/thuth/kvm-unit-tests/-/jobs/67989549=
87
> >>>
> >>> How do you use the s390x runner?
> >>>
> >>>>
> >>>> Everything is fine in the previous patches (I pushed now the previou=
s 5
> >>>> patches to the repo):
> >>>>
> >>>> =C2=A0=C2=A0 https://gitlab.com/kvm-unit-tests/kvm-unit-tests/-/pipe=
lines/1281919104
> >>>>
> >>>> Could it be that he TIMEOUT gets messed up in certain cases?
> >>>
> >>> Hmm not sure yet. At least it got timeout right for the duration=3D90=
s
> >>> message.
> >>
> >> That seems to be wrong, the test is declared like this in=20
> >> s390x/unittests.cfg :
> >>
> >> [sieve]
> >> file =3D sieve.elf
> >> groups =3D selftest
> >> # can take fairly long when KVM is nested inside z/VM
> >> timeout =3D 600
> >>
> >> And indeed, it takes way longer than 90 seconds on that CI machine, so=
 the=20
> >> timeout after 90 seconds should not occur here...
> >=20
> > I guess you need to adjust arch_cmd_s390x in scripts/s390x/func.bash to=
 be=20
> > aware of the new parameter, too?
>
> This seems to fix the problem:

Thanks, that looks good.

> diff --git a/scripts/s390x/func.bash b/scripts/s390x/func.bash
> index fa47d019..6b817727 100644
> --- a/scripts/s390x/func.bash
> +++ b/scripts/s390x/func.bash
> @@ -13,12 +13,13 @@ function arch_cmd_s390x()
>          local kernel=3D$5
>          local opts=3D$6
>          local arch=3D$7
> -       local check=3D$8
> -       local accel=3D$9
> -       local timeout=3D${10}
> +       local machine=3D$8
> +       local check=3D$9
> +       local accel=3D${10}
> +       local timeout=3D${11}
>  =20
>          # run the normal test case
> -       "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$c=
heck" "$accel" "$timeout"
> +       "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$m=
achine" "$check" "$accel" "$timeout"
>  =20
>          # run PV test case
>          if [ "$accel" =3D 'tcg' ] || grep -q "migration" <<< "$groups"; =
then
>
> If you don't like to respin, I can add it to the patch while picking it u=
p?

Yeah I shouldn't resend the full series just for this. If you're happy
to squash it in that would be good.

Thanks,
Nick
