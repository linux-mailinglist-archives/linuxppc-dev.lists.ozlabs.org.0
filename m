Return-Path: <linuxppc-dev+bounces-5461-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D72FFA181DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2025 17:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YcsnC2cDJz30VM;
	Wed, 22 Jan 2025 03:17:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.180
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737476271;
	cv=none; b=YjUhJVZinoCeQt7Uemi7gpTT6mPDc8BkKNJhfga/wTk6Q2FXpPblsXcDAPuupICCyy5I+gFWBC6nqSfw1CM85Wc4yJgYymYzEctgfJmo8zduCY3TUHcyc0BCIwv9U5xZY+A9gp+cJwJe5PO36nbLsrvaM1gMm8lXKddylAu4C7eF3R3jP0AuYrAnnhzfAOOzSMIhkw7m+BZR97Ov4ojB2Xh2S61ADmW6C9IE4ce4lblQ/U+QnflrDk5EocxsKG8MN3YJFX7DZbes5SZbSKW3XFQwKkiXXUORPs35Oux1xoxURFGoSLcT0ylKLJQnkKYP5tFvy05wkX/MlUXiGo2LSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737476271; c=relaxed/relaxed;
	bh=7WwSMRATO0QjUqb11IwaPpIM7wS7YIxBQxz1gbtNgig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGR08XhX6NTX3kWdhER4dt6UMtk8Ehu3DgCaQsOMj9uHbBGZ0kBB+CfLPyCWhkiJw+VA5lI1IFlOUo9Oiq4muktqDCeV5DiYvDalzajsW5FecIXFrYPYeLJ3GRwxwO2OJRhvlOqYVb3UX2+c8Y8WWRGlSA2sxxNcGXofIXx8Dx2i+rn3hMoAijGPt4XpmQfvUqk8zHs+s653z+maapdMlI6y77Ue+atZfTzIPd7silvAX7f0v33jyrZCAKUODNlLo64iDxHKCnxo+HD8IxgpgQSpeIxIV/WXF8AYY+StpORqPZTHkdMpVtetWXHqkYSNerxS1SZW5Wa/SjVvYsYHgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=95.215.58.180; helo=out-180.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.180; helo=out-180.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ycsn53TfPz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 03:17:45 +1100 (AEDT)
Date: Tue, 21 Jan 2025 17:17:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737476245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7WwSMRATO0QjUqb11IwaPpIM7wS7YIxBQxz1gbtNgig=;
	b=uIyKdIUQNmCtu7Q0IcIVXtHI6XK6xj7PVO6GVegFWD6wgh2mr8arrR6cZhBwT6O4r/GQRY
	PGdz0lyr4Q5bxBPOjt3FmyZAyyEs3+aDLQ9S+6/Z5cC5t0DN2SwlomAxxkrnle8K2K9rLR
	GN90A4eGae+VZ+Mggm60xlRxe2A7J/0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 03/18] scripts: Refuse to run the tests
 if not configured for qemu
Message-ID: <20250121-c7f5ba2a25ccbfe793da07f6@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-4-alexandru.elisei@arm.com>
 <20250121-45faf6a9a9681c7c9ece5f44@orel>
 <Z4_DKTMeDQqsqV_6@raptor>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4_DKTMeDQqsqV_6@raptor>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 21, 2025 at 03:54:17PM +0000, Alexandru Elisei wrote:
> Hi Drew,
> 
> On Tue, Jan 21, 2025 at 03:48:55PM +0100, Andrew Jones wrote:
> > On Mon, Jan 20, 2025 at 04:43:01PM +0000, Alexandru Elisei wrote:
> > > Arm and arm64 support running the tests under kvmtool. Unsurprisingly,
> > > kvmtool and qemu have a different command line syntax for configuring and
> > > running a virtual machine.
> > > 
> > > On top of that, when kvm-unit-tests has been configured to run under
> > > kvmtool (via ./configure --target=kvmtool), the early UART address changes,
> > > and if then the tests are run with qemu, this warning is displayed:
> > > 
> > > WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.
> > > 
> > > At the moment, the only way to run a test under kvmtool is manually, as no
> > > script has any knowledge of how to invoke kvmtool. Also, unless one looks
> > > at the logs, it's not obvious that the test runner is using qemu to run the
> > > tests, and not kvmtool.
> > > 
> > > To avoid any confusion for unsuspecting users, refuse to run a test via the
> > > testing scripts when kvm-unit-tests has been configured for kvmtool.
> > > 
> > > There are four different ways to run a test using the test infrastructure:
> > > with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
> > > parameters (only the arm directory is mentioned here because the tests can
> > > be configured for kvmtool only on arm and arm64), and by creating
> > > standalone tests. Add a check in each of these locations for the supported
> > > virtual machine manager.
> > > 
> > > Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> > > ---
> > >  arm/efi/run             | 8 ++++++++
> > >  arm/run                 | 9 +++++++++
> > >  run_tests.sh            | 8 ++++++++
> > >  scripts/mkstandalone.sh | 8 ++++++++
> > >  4 files changed, 33 insertions(+)
> > > 
> > > diff --git a/arm/efi/run b/arm/efi/run
> > > index 8f41fc02df31..916f4c4deef6 100755
> > > --- a/arm/efi/run
> > > +++ b/arm/efi/run
> > > @@ -12,6 +12,14 @@ fi
> > >  source config.mak
> > >  source scripts/arch-run.bash
> > >  
> > > +case "$TARGET" in
> > > +qemu)
> > > +    ;;
> > > +*)
> > > +    echo "$0 does not support '$TARGET'"
> > > +    exit 2
> > > +esac
> > > +
> > >  if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
> > >  	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
> > >  elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
> > > diff --git a/arm/run b/arm/run
> > > index efdd44ce86a7..6db32cf09c88 100755
> > > --- a/arm/run
> > > +++ b/arm/run
> > > @@ -8,6 +8,15 @@ if [ -z "$KUT_STANDALONE" ]; then
> > >  	source config.mak
> > >  	source scripts/arch-run.bash
> > >  fi
> > > +
> > > +case "$TARGET" in
> > > +qemu)
> > > +    ;;
> > > +*)
> > > +   echo "'$TARGET' not supported"
> > > +   exit 3
> > 
> > I think we want exit code 2 here.
> 
> Exit code 2 is already in use in arm/run. Now that I'm looking more closely
> at it, exit code 2 is already in use in run_tests.sh, same for
> mkstandalone.sh and arm/efi/run.
> 
> How about using 3 everywhere as the exit code?
>

In kvm-unit-tests, exit code 2 is what we use for "most likely a run
script failed" (see the comment above run_qemu() in
scripts/arch-run.bash). We don't try to create a new error code for each
type of error, but we do have the error message as well. So if there's a
higher level runner, which runs this runner, it only needs to learn that
2 is likely a script failure and that an error message will hopefully
point the way to the problem.

Thanks,
drew

