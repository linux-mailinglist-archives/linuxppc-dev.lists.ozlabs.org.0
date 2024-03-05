Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30736871407
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:59:28 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IDybF4a7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpgJZ06LQz3cp1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:59:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IDybF4a7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpgHr5Fc6z3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:58:47 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6e56787e691so4268808b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709607525; x=1710212325; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCrs5zL2Khs7cSmXK351HQUe+lXmYGGNniszlyDGHZU=;
        b=IDybF4a7J9mgpVnaR5sOWNsrXm3fF4EVr319W4dLH+bVeAsDYnCY0pawUgeSuYBygG
         fhXY55kRRGIOF9eys3rNv2Hih+HUV398ktboai0y9vnLFK7ew/iEyEbztrbvF/zM6Cnr
         2Sr+1ayQvSpb+3GYRbgL8b3YBgO5zxczEw7bTdoTGs4QSlNJYU+fqcMYyW6l6N+G9mty
         IzrtaIqPKcYJpjrbpBvqlA/E1n2plMil4pODkbXy6sZHKBXfqR1Yje76+kwUi8irMARQ
         uju/WHE+8kEKhn0egix8dqXEH7vPKiYLlsGVZ0MGqvezgwc7SUKIFkxtjaTR1cA1Ytrb
         iJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709607525; x=1710212325;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCrs5zL2Khs7cSmXK351HQUe+lXmYGGNniszlyDGHZU=;
        b=XnTYWsOC/a6YZgAgEKDoMz5qEZPKUnmFw8jpO4o3VkwYlNe1it6smM8ow6XNGjg0W+
         2dMG/S3KDDlMVv21po9GP39okEdzmZZmh4P4EhYacrraf4lfpUw3cypLWPhYYJk4FxlJ
         1oWaXKquNEtd1YH5wPlUIfYW6SmOMDub2dEWHL7LIirMO3+fsotd4M0ln6HF+/BLFo0F
         3yXglO6kb9VMoid6YbgwQPpT/GakJ/pCZY+shgQwoi4LGO4/X4lpCe4J2aXdlPVigoGe
         Rk1dshAfAGXYGeJVNcOExbBac9ncODAkztkrv38BvWBlXHvS9i/gnO95Of8xsK0CrmK7
         DHhg==
X-Forwarded-Encrypted: i=1; AJvYcCU8p+2rK+F34JQREbCyniWTDdBfBisCnOiVHNXrDdpIKau7JaTwql+ASpghJVw3Us0Bj+AixkgbPlV2fkZ6ZLf1Q2SDQrn0eH4sxCWfuw==
X-Gm-Message-State: AOJu0YyFY+/SeL7vPSNqaBApDx0ixvIZMVeeBPsqI6DicrqU+LUv4N+a
	fUVDmEA08rd13OzfWqgrXexwFgfXYVUdyaMTdKgGepsegTdonLL4
X-Google-Smtp-Source: AGHT+IGvX119Qxv0r58vHXRmQz8eKsM7NGWAogePZFvA0DiMODh/Cp/tprnaiunm19Il0MiXx20R0w==
X-Received: by 2002:a17:903:2443:b0:1dc:b887:35bd with SMTP id l3-20020a170903244300b001dcb88735bdmr908023pls.5.1709607525321;
        Mon, 04 Mar 2024 18:58:45 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902dac700b001dc23e877c9sm9271707plx.106.2024.03.04.18.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:58:45 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:58:37 +1000
Message-Id: <CZLHAB0NZDIK.32S3A33LM1GWC@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <ajones@ventanamicro.com>, "Thomas Huth"
 <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH 5/7] arch-run: Add a "continuous"
 migration option for tests
X-Mailer: aerc 0.15.2
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-6-npiggin@gmail.com>
 <6329dd4c-2093-40c3-8eb8-701d8e8b2ecd@redhat.com>
 <20240304-e416eb5a087bde2cad5ff325@orel>
In-Reply-To: <20240304-e416eb5a087bde2cad5ff325@orel>
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

On Mon Mar 4, 2024 at 7:19 PM AEST, Andrew Jones wrote:
> On Mon, Mar 04, 2024 at 07:17:35AM +0100, Thomas Huth wrote:
> > On 26/02/2024 10.38, Nicholas Piggin wrote:
> > > The cooperative migration protocol is very good to control precise
> > > pre and post conditions for a migration event. However in some cases
> > > its intrusiveness to the test program, can mask problems and make
> > > analysis more difficult.
> > >=20
> > > For example to stress test migration vs concurrent complicated
> > > memory access, including TLB refill, ram dirtying, etc., then the
> > > tight spin at getchar() and resumption of the workload after
> > > migration is unhelpful.
> > >=20
> > > This adds a continuous migration mode that directs the harness to
> > > perform migrations continually. This is added to the migration
> > > selftests, which also sees cooperative migration iterations reduced
> > > to avoid increasing test time too much.
> > >=20
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > > ---
> > >   common/selftest-migration.c | 16 +++++++++--
> > >   lib/migrate.c               | 18 ++++++++++++
> > >   lib/migrate.h               |  3 ++
> > >   scripts/arch-run.bash       | 55 ++++++++++++++++++++++++++++++++--=
---
> > >   4 files changed, 82 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/common/selftest-migration.c b/common/selftest-migration.=
c
> > > index 0afd8581c..9a9b61835 100644
> > > --- a/common/selftest-migration.c
> > > +++ b/common/selftest-migration.c
> > > @@ -9,12 +9,13 @@
> > >    */
> > >   #include <libcflat.h>
> > >   #include <migrate.h>
> > > +#include <asm/time.h>
> > > -#define NR_MIGRATIONS 30
> > > +#define NR_MIGRATIONS 15
> > >   int main(int argc, char **argv)
> > >   {
> > > -	report_prefix_push("migration");
> > > +	report_prefix_push("migration harness");
> > >   	if (argc > 1 && !strcmp(argv[1], "skip")) {
> > >   		migrate_skip();
> > > @@ -24,7 +25,16 @@ int main(int argc, char **argv)
> > >   		for (i =3D 0; i < NR_MIGRATIONS; i++)
> > >   			migrate_quiet();
> > > -		report(true, "simple harness stress");
> > > +		report(true, "cooperative migration");
> > > +
> > > +		migrate_begin_continuous();
> > > +		mdelay(2000);
> > > +		migrate_end_continuous();
> > > +		mdelay(1000);
> > > +		migrate_begin_continuous();
> > > +		mdelay(2000);
> > > +		migrate_end_continuous();
> > > +		report(true, "continuous migration");
> > >   	}
> > >   	report_prefix_pop();
> > > diff --git a/lib/migrate.c b/lib/migrate.c
> > > index 1d22196b7..770f76d5c 100644
> > > --- a/lib/migrate.c
> > > +++ b/lib/migrate.c
> > > @@ -60,3 +60,21 @@ void migrate_skip(void)
> > >   	puts("Skipped VM migration (quiet)\n");
> > >   	(void)getchar();
> > >   }
> > > +
> > > +void migrate_begin_continuous(void)
> > > +{
> > > +	puts("Begin continuous migration\n");
> > > +	(void)getchar();
> > > +}
> > > +
> > > +void migrate_end_continuous(void)
> > > +{
> > > +	/*
> > > +	 * Migration can split this output between source and dest QEMU
> > > +	 * output files, print twice and match once to always cope with
> > > +	 * a split.
> > > +	 */
> > > +	puts("End continuous migration\n");
> > > +	puts("End continuous migration (quiet)\n");
> > > +	(void)getchar();
> > > +}
> > > diff --git a/lib/migrate.h b/lib/migrate.h
> > > index db6e0c501..35b6703a2 100644
> > > --- a/lib/migrate.h
> > > +++ b/lib/migrate.h
> > > @@ -11,3 +11,6 @@ void migrate_quiet(void);
> > >   void migrate_once(void);
> > >   void migrate_skip(void);
> > > +
> > > +void migrate_begin_continuous(void);
> > > +void migrate_end_continuous(void);
> > > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > > index d0f6f098f..5c7e72036 100644
> > > --- a/scripts/arch-run.bash
> > > +++ b/scripts/arch-run.bash
> > > @@ -125,15 +125,17 @@ qmp_events ()
> > >   filter_quiet_msgs ()
> > >   {
> > >   	grep -v "Now migrate the VM (quiet)" |
> > > +	grep -v "Begin continuous migration (quiet)" |
> > > +	grep -v "End continuous migration (quiet)" |
> > >   	grep -v "Skipped VM migration (quiet)"
> > >   }
> > >   seen_migrate_msg ()
> > >   {
> > >   	if [ $skip_migration -eq 1 ]; then
> > > -		grep -q -e "Now migrate the VM" < $1
> > > +	        grep -q -e "Now migrate the VM" -e "Begin continuous migrat=
ion" < $1
> > >   	else
> > > -		grep -q -e "Now migrate the VM" -e "Skipped VM migration" < $1
> > > +	        grep -q -e "Now migrate the VM" -e "Begin continuous migrat=
ion" -e "Skipped VM migration" < $1
> > >   	fi
> > >   }
> > > @@ -161,6 +163,7 @@ run_migration ()
> > >   	src_qmpout=3D/dev/null
> > >   	dst_qmpout=3D/dev/null
> > >   	skip_migration=3D0
> > > +	continuous_migration=3D0
> > >   	mkfifo ${src_outfifo}
> > >   	mkfifo ${dst_outfifo}
> > > @@ -186,9 +189,12 @@ run_migration ()
> > >   	do_migration || return $?
> > >   	while ps -p ${live_pid} > /dev/null ; do
> > > -		# Wait for test exit or further migration messages.
> > > -		if ! seen_migrate_msg ${src_out} ;  then
> > > +		if [[ ${continuous_migration} -eq 1 ]] ; then
> >=20
> > Here you're using "[[" for testing ...
> >=20
> > > +			do_migration || return $?
> > > +		elif ! seen_migrate_msg ${src_out} ;  then
> > >   			sleep 0.1
> > > +		elif grep -q "Begin continuous migration" < ${src_out} ; then
> > > +			do_migration || return $?
> > >   		elif grep -q "Now migrate the VM" < ${src_out} ; then
> > >   			do_migration || return $?
> > >   		elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM migration" =
< ${src_out} ; then
> >=20
> > ... while the other code seems to use "[" for testing values. Can we tr=
y to
> > stick to one style, please (unless it's really required to use "[["
> > somewhere)?
> >
>
> We should decide on a Bash coding style and on preferences like [[ and
> then write a document for it, as well as create a set of shellcheck
> includes/excludes to test it. Then, using shellcheck we'd change all our
> current Bash code and also require shellcheck to pass on all new code
> before merge.

Seems like a good idea.

> Any volunteers for that effort? For the style selection
> we can take inspiration from other projects or even just adopt their
> style guides. Google has some guidance[1][2] and googling for Bash style
> pops up other hits.
>
> [1] https://google.github.io/styleguide/shellguide.html
> [2] https://chromium.googlesource.com/chromiumos/docs/+/master/styleguide=
/shell.md

My bash skills consit of mashing the keyboard until the errors quieten
down, so I may not be the best to decide on this stuff. I could take a
look at getting the checker running in make and post an RFC though. No
promises if it turns out to be harder than it looks...

Thanks,
Nick
