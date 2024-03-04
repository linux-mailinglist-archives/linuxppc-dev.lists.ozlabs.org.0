Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA61686FD10
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 10:20:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=hbbu7wCa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpCpm3SjFz3dRc
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 20:20:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=hbbu7wCa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpCp15xmCz2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 20:19:52 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a45670f9508so47830666b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 01:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1709543987; x=1710148787; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QpO1bRxqGHUl4bZn2wivQvLLDkQhKaeBu0WknX2/7aU=;
        b=hbbu7wCaGEzyLYKKuZjyzQw6YxEx9aTnCK5amlCKwUHAB+QRk56NprBpiJ0rl00TpK
         aJTlZwrw9G/Ge/Hn92CevxZK7Sf0p7UildiiYv3aU/OhQWJPDlN3s8XjwCVPqGTc4gBr
         3NBEZL99/cGzivZCVSzMESBWKegPEYoQq49BXriSnLG3iinvI5hiAb3LqgJmGZkU3/m0
         SjznN6OvZgs0LTD+dRJtk0ekygR7kpKqEfWqlrQSXDtvgwHlNWD3qUooJZQDAXxfCbyO
         0lnJTyrRmov/19h1Bq0iZSrfg6pMQXgUp12YVJU+gEGivJF8RstGNYkblzaSqkXDKbiF
         uW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709543987; x=1710148787;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QpO1bRxqGHUl4bZn2wivQvLLDkQhKaeBu0WknX2/7aU=;
        b=sc8p7rIbGWWdsVkHZkU14ruLXCvtyq7rIj6HT7+kEypJVlxjWOHk/41Yu0jtZIhHpf
         0iirSUWc9qRijXHKj5mdYXJO/4XDM0yMDrCMdCvnBly+G8qw4J62QqPEvG/6d327mwUk
         mjslJGAV4x5eTrhYaZvO1S1Gdv+Yx30Q1fCBXXkHVBXEcdIrqDCRRbH2N6VCyNYpGk8v
         VaJoLblCOngcJXKCe7wwfdF805Xh4ZXJPiZn6PdfkSHI7HcRs/E/lIUsaD0+ARDcVXL4
         W8nBREH06bvSAz0gPF2eJWOVW/+wtw53R9QceSmZ2sVGk5v+50CaaGiXW5YBct4QhaA5
         9WBA==
X-Forwarded-Encrypted: i=1; AJvYcCXC9PHTbKqXuj2ra9twjECca2oHxVRZeImDH+ACAQVcxqpSHUFWYQv2iE4ZO2d9GKgdbfRa68xlk2JlNkm74v6M59QlKOblhYcqebPMsA==
X-Gm-Message-State: AOJu0YysE1V8k5n7FCl+f9W+QG2PIDx59pGNpi/fQcTxn6nPsS6x1CgH
	h+Da/8CZc5im6Z+hykYrTSW8+NucFIAw+h8gkTGp1jwM6X7RXtCNw1r67IVleKQ=
X-Google-Smtp-Source: AGHT+IHBkLHFj5WFEfrPMbcu4indk9Do5CBPsEWA/ISg1HrPVSBD2kmIH2fC68ipsbsm0K9eK2oBGw==
X-Received: by 2002:a17:906:a456:b0:a44:52e8:9b82 with SMTP id cb22-20020a170906a45600b00a4452e89b82mr5777619ejb.24.1709543986706;
        Mon, 04 Mar 2024 01:19:46 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id pw20-20020a17090720b400b00a450164cec6sm1874622ejb.194.2024.03.04.01.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:19:46 -0800 (PST)
Date: Mon, 4 Mar 2024 10:19:45 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH 5/7] arch-run: Add a "continuous"
 migration option for tests
Message-ID: <20240304-e416eb5a087bde2cad5ff325@orel>
References: <20240226093832.1468383-1-npiggin@gmail.com>
 <20240226093832.1468383-6-npiggin@gmail.com>
 <6329dd4c-2093-40c3-8eb8-701d8e8b2ecd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 04, 2024 at 07:17:35AM +0100, Thomas Huth wrote:
> On 26/02/2024 10.38, Nicholas Piggin wrote:
> > The cooperative migration protocol is very good to control precise
> > pre and post conditions for a migration event. However in some cases
> > its intrusiveness to the test program, can mask problems and make
> > analysis more difficult.
> > 
> > For example to stress test migration vs concurrent complicated
> > memory access, including TLB refill, ram dirtying, etc., then the
> > tight spin at getchar() and resumption of the workload after
> > migration is unhelpful.
> > 
> > This adds a continuous migration mode that directs the harness to
> > perform migrations continually. This is added to the migration
> > selftests, which also sees cooperative migration iterations reduced
> > to avoid increasing test time too much.
> > 
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   common/selftest-migration.c | 16 +++++++++--
> >   lib/migrate.c               | 18 ++++++++++++
> >   lib/migrate.h               |  3 ++
> >   scripts/arch-run.bash       | 55 ++++++++++++++++++++++++++++++++-----
> >   4 files changed, 82 insertions(+), 10 deletions(-)
> > 
> > diff --git a/common/selftest-migration.c b/common/selftest-migration.c
> > index 0afd8581c..9a9b61835 100644
> > --- a/common/selftest-migration.c
> > +++ b/common/selftest-migration.c
> > @@ -9,12 +9,13 @@
> >    */
> >   #include <libcflat.h>
> >   #include <migrate.h>
> > +#include <asm/time.h>
> > -#define NR_MIGRATIONS 30
> > +#define NR_MIGRATIONS 15
> >   int main(int argc, char **argv)
> >   {
> > -	report_prefix_push("migration");
> > +	report_prefix_push("migration harness");
> >   	if (argc > 1 && !strcmp(argv[1], "skip")) {
> >   		migrate_skip();
> > @@ -24,7 +25,16 @@ int main(int argc, char **argv)
> >   		for (i = 0; i < NR_MIGRATIONS; i++)
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
> >   seen_migrate_msg ()
> >   {
> >   	if [ $skip_migration -eq 1 ]; then
> > -		grep -q -e "Now migrate the VM" < $1
> > +	        grep -q -e "Now migrate the VM" -e "Begin continuous migration" < $1
> >   	else
> > -		grep -q -e "Now migrate the VM" -e "Skipped VM migration" < $1
> > +	        grep -q -e "Now migrate the VM" -e "Begin continuous migration" -e "Skipped VM migration" < $1
> >   	fi
> >   }
> > @@ -161,6 +163,7 @@ run_migration ()
> >   	src_qmpout=/dev/null
> >   	dst_qmpout=/dev/null
> >   	skip_migration=0
> > +	continuous_migration=0
> >   	mkfifo ${src_outfifo}
> >   	mkfifo ${dst_outfifo}
> > @@ -186,9 +189,12 @@ run_migration ()
> >   	do_migration || return $?
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
> >   		elif [ $skip_migration -eq 0 ] && grep -q "Skipped VM migration" < ${src_out} ; then
> 
> ... while the other code seems to use "[" for testing values. Can we try to
> stick to one style, please (unless it's really required to use "[["
> somewhere)?
>

We should decide on a Bash coding style and on preferences like [[ and
then write a document for it, as well as create a set of shellcheck
includes/excludes to test it. Then, using shellcheck we'd change all our
current Bash code and also require shellcheck to pass on all new code
before merge. Any volunteers for that effort? For the style selection
we can take inspiration from other projects or even just adopt their
style guides. Google has some guidance[1][2] and googling for Bash style
pops up other hits.

[1] https://google.github.io/styleguide/shellguide.html
[2] https://chromium.googlesource.com/chromiumos/docs/+/master/styleguide/shell.md

Thanks,
drew
