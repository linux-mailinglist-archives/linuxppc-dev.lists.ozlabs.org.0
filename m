Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E62E8713E3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:48:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hjZ1JruC;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tpg4H6WVlz3d2x
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:48:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hjZ1JruC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::234; helo=mail-oi1-x234.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tpg3X6jGnz3bV2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:48:07 +1100 (AEDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3c1f582673bso556933b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709606884; x=1710211684; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HSZr4DPIKRSKTMaW46X/jcBrQt1dzvbv+0KNdLtj2k8=;
        b=hjZ1JruCE5gI3U8MGPTsjU9uR3yF0C82LYAtIUM3rmsXLNjJgf6anxj+N7xEz25juJ
         uGQht4GvcR7eCoUHrD+l8W61bGNz8GgH5ilGhCfk5oepCYsuuPbMNAW2dzvyHwPNT3ko
         /AXjiveUt7ytYOJnn1oB7unW4j/+5pRUMkcmERA6o2iI7oAH1HW6hVD0/hDWZm+ay1Oj
         Gg9TdPQ9lALPqBMbD8rYq1s4vFKNAsAGZXEWbA/dRhrIM/cLpCOiGs54Gx8I/cNi2GH0
         hve85rtgs8H6nXDbG63A34budIxS9GTmh8EzUs4rEtDKcOcgAo1h+gaKF5C4vkp3aj/+
         u2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709606884; x=1710211684;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HSZr4DPIKRSKTMaW46X/jcBrQt1dzvbv+0KNdLtj2k8=;
        b=UmMNIaG5QQmeq3L742urSYcCy0Cd2xgSdSAjEfKNOhK3lmpH/lGjjJpf2xooQrl+m9
         8iI6dbDfNdFdjGj4DiR1T6qt7dSIXG94eGDE5BrhPu22Qd5hYvsCALTyleFP1JihD9qc
         KpYdRohaLhqW0qNgvXe3WKSk0DJZ4RDP84K7lAP0Y37QoiY8ZzxFTeObMiOj/TLxOrZF
         cVvtT++GhLUU0O2BlretKjh/rtLcqmUNEQkmfl1trBkidJKMGtUOKUvVbs1Xt+lViv0/
         SO5ZW1SA8Iw+M52HDiknm5j4jSvU2NOwaBGqJ3SCS8kgNXMxfrctxrNyTWwzi47/qb4e
         WQsA==
X-Forwarded-Encrypted: i=1; AJvYcCVDxGKmWVfiUE7gUgfa5w4ZN4R+RArHaTlaWqM36FtqiyIdeM5VAj+Q3uwPRIK7qYQaFEYbHZq8wU0VzmOXk/lxHpb/QWG21VaLDrIHxQ==
X-Gm-Message-State: AOJu0YxAQLRMfKrjcZ8SFlaFO2eaDc0jSYr31eVmWU/Xm1y547jmvWOv
	jqrY794xdlwupzzDYG5UvyLIdv5bEw3fvzj8J2P4HnK5oCHjdMcw
X-Google-Smtp-Source: AGHT+IH0UuEdRgXkpB3snaCgFc1Pc+EgsL4JBZeNU3fqUdfBioGXZ1BGiwqZOs82imAc/KYqpTli9g==
X-Received: by 2002:aca:f01:0:b0:3c1:dbd5:fc39 with SMTP id 1-20020aca0f01000000b003c1dbd5fc39mr585576oip.31.1709606882631;
        Mon, 04 Mar 2024 18:48:02 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id c6-20020aa78806000000b006e53cc789c3sm7936038pfo.107.2024.03.04.18.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:48:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:47:54 +1000
Message-Id: <CZLH23VYF085.2H710Q91HBR6A@wheely>
Subject: Re: [kvm-unit-tests PATCH 5/7] arch-run: Add a "continuous"
 migration option for tests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-6-npiggin@gmail.com>
 <6329dd4c-2093-40c3-8eb8-701d8e8b2ecd@redhat.com>
In-Reply-To: <6329dd4c-2093-40c3-8eb8-701d8e8b2ecd@redhat.com>
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

On Mon Mar 4, 2024 at 4:17 PM AEST, Thomas Huth wrote:
> On 26/02/2024 10.38, Nicholas Piggin wrote:
> > The cooperative migration protocol is very good to control precise
> > pre and post conditions for a migration event. However in some cases
> > its intrusiveness to the test program, can mask problems and make
> > analysis more difficult.
> >=20
> > For example to stress test migration vs concurrent complicated
> > memory access, including TLB refill, ram dirtying, etc., then the
> > tight spin at getchar() and resumption of the workload after
> > migration is unhelpful.
> >=20
> > This adds a continuous migration mode that directs the harness to
> > perform migrations continually. This is added to the migration
> > selftests, which also sees cooperative migration iterations reduced
> > to avoid increasing test time too much.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   common/selftest-migration.c | 16 +++++++++--
> >   lib/migrate.c               | 18 ++++++++++++
> >   lib/migrate.h               |  3 ++
> >   scripts/arch-run.bash       | 55 ++++++++++++++++++++++++++++++++----=
-
> >   4 files changed, 82 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/common/selftest-migration.c b/common/selftest-migration.c
> > index 0afd8581c..9a9b61835 100644
> > --- a/common/selftest-migration.c
> > +++ b/common/selftest-migration.c
> > @@ -9,12 +9,13 @@
> >    */
> >   #include <libcflat.h>
> >   #include <migrate.h>
> > +#include <asm/time.h>
> >  =20
> > -#define NR_MIGRATIONS 30
> > +#define NR_MIGRATIONS 15
> >  =20
> >   int main(int argc, char **argv)
> >   {
> > -	report_prefix_push("migration");
> > +	report_prefix_push("migration harness");
> >  =20
> >   	if (argc > 1 && !strcmp(argv[1], "skip")) {
> >   		migrate_skip();
> > @@ -24,7 +25,16 @@ int main(int argc, char **argv)
> >  =20
> >   		for (i =3D 0; i < NR_MIGRATIONS; i++)
> >   			migrate_quiet();
> > -		report(true, "simple harness stress");
> > +		report(true, "cooperative migration");
> > +
> > +		migrate_begin_continuous();
> > +		mdelay(2000);
> > +		migrate_end_continuous();
> > +		mdelay(1000);
> > +		migrate_begin_continuous();
> > +		mdelay(2000);
> > +		migrate_end_continuous();
> > +		report(true, "continuous migration");
> >   	}
> >  =20
> >   	report_prefix_pop();
> > diff --git a/lib/migrate.c b/lib/migrate.c
> > index 1d22196b7..770f76d5c 100644
> > --- a/lib/migrate.c
> > +++ b/lib/migrate.c
> > @@ -60,3 +60,21 @@ void migrate_skip(void)
> >   	puts("Skipped VM migration (quiet)\n");
> >   	(void)getchar();
> >   }
> > +
> > +void migrate_begin_continuous(void)
> > +{
> > +	puts("Begin continuous migration\n");
> > +	(void)getchar();
> > +}
> > +
> > +void migrate_end_continuous(void)
> > +{
> > +	/*
> > +	 * Migration can split this output between source and dest QEMU
> > +	 * output files, print twice and match once to always cope with
> > +	 * a split.
> > +	 */
> > +	puts("End continuous migration\n");
> > +	puts("End continuous migration (quiet)\n");
> > +	(void)getchar();
> > +}
> > diff --git a/lib/migrate.h b/lib/migrate.h
> > index db6e0c501..35b6703a2 100644
> > --- a/lib/migrate.h
> > +++ b/lib/migrate.h
> > @@ -11,3 +11,6 @@ void migrate_quiet(void);
> >   void migrate_once(void);
> >  =20
> >   void migrate_skip(void);
> > +
> > +void migrate_begin_continuous(void);
> > +void migrate_end_continuous(void);
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index d0f6f098f..5c7e72036 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -125,15 +125,17 @@ qmp_events ()
> >   filter_quiet_msgs ()
> >   {
> >   	grep -v "Now migrate the VM (quiet)" |
> > +	grep -v "Begin continuous migration (quiet)" |
> > +	grep -v "End continuous migration (quiet)" |
> >   	grep -v "Skipped VM migration (quiet)"
> >   }
> >  =20
> >   seen_migrate_msg ()
> >   {
> >   	if [ $skip_migration -eq 1 ]; then
> > -		grep -q -e "Now migrate the VM" < $1
> > +	        grep -q -e "Now migrate the VM" -e "Begin continuous migratio=
n" < $1
> >   	else
> > -		grep -q -e "Now migrate the VM" -e "Skipped VM migration" < $1
> > +	        grep -q -e "Now migrate the VM" -e "Begin continuous migratio=
n" -e "Skipped VM migration" < $1
> >   	fi
> >   }
> >  =20
> > @@ -161,6 +163,7 @@ run_migration ()
> >   	src_qmpout=3D/dev/null
> >   	dst_qmpout=3D/dev/null
> >   	skip_migration=3D0
> > +	continuous_migration=3D0
> >  =20
> >   	mkfifo ${src_outfifo}
> >   	mkfifo ${dst_outfifo}
> > @@ -186,9 +189,12 @@ run_migration ()
> >   	do_migration || return $?
> >  =20
> >   	while ps -p ${live_pid} > /dev/null ; do
> > -		# Wait for test exit or further migration messages.
> > -		if ! seen_migrate_msg ${src_out} ;  then
> > +		if [[ ${continuous_migration} -eq 1 ]] ; then
>
> Here you're using "[[" for testing ...
>
> > +			do_migration || return $?
> > +		elif ! seen_migrate_msg ${src_out} ;  then
> >   			sleep 0.1
> > +		elif grep -q "Begin continuous migration" < ${src_out} ; then
> > +			do_migration || return $?
> >   		elif grep -q "Now migrate the VM" < ${src_out} ; then
> >   			do_migration || return $?
> >   		elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM migration" < =
${src_out} ; then
>
> ... while the other code seems to use "[" for testing values. Can we try =
to=20
> stick to one style, please (unless it's really required to use "[[" somew=
here)?

Good point. Will do.

Thanks,
Nick
