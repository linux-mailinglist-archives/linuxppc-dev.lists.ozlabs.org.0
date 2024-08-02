Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDA7945E16
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 14:47:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HOPuNjPv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wb5G44z70z3fRK
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2024 22:47:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HOPuNjPv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rafael@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wb5FN1mqyz3dV9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 22:47:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49861CE19B4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 12:47:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79403C4AF0A
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2024 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722602820;
	bh=1QgdOFHc5UJ7JLTaVxoYYVwQrMYFGF8fQ1SbQIxZkhc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=HOPuNjPvTZZBsjB3tap/xqosF5SQqQYpnAfbYzS12d+zdYkiM8SP/fcVGUBeqc3HC
	 lMinvM1uFnU4HZra2cN5wfQlihPihtSBfTfDViH3rmj7nQhlY6S7WA3QZqoWhGTK1d
	 tq+btNcsaMnEszrxEHUYcedP9A5FKqoLRU7J2bkS5FJk38Op8v/vD+BPaqBs66udDs
	 HnTHjIQCM/iUXUNA3U8wNWM49K0nW5Mt5AnXisVBfznEoiNeCqudJfa49jbHwyrOz/
	 h2kMC8TAuykWtLdIkBV6vjeVmkM31QuC9wJiPOO8ftEYrwSXC7XVAeZ5Iejvb3RsSM
	 RDGqnl3DweuEw==
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3db111a08c3so695754b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2024 05:47:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlXicWOavbwxzNBxJFBVJr+qAWRDjCU3qL6UsHcbT0Io3vcK5LZAVT/CwQs7d8xBA7nyITQXiJ+frPSfjI5T7Bo053PSTXF8YwR8BPCg==
X-Gm-Message-State: AOJu0YzJJ91vWLuNfG9VxVk0WQELEqLTkjDKv/8O8XNmawAciYAk55Mx
	6VbF2FdJXeS1cBgvmAN7K3HAeoLgysytLNfLQECG9MJSZtH/UT4XrnxDBfk30eR+uYmZNBFaMW+
	m2o1b7Ooq9s9KAIpe/R2Ls1KZYes=
X-Google-Smtp-Source: AGHT+IFEVv8eZDY5b3H89JJWLVBnt5m9XtSne/AH0CAwtm0pD7to6WgcNrLrHJUClqgyEggleITIiM5TGHtAKB4tRuk=
X-Received: by 2002:a05:6870:56ab:b0:260:23bb:1087 with SMTP id
 586e51a60fabf-26891732bc5mr2122828fac.0.1722602819834; Fri, 02 Aug 2024
 05:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20240722-md-powerpc-drivers-cpufreq-v2-1-bb84d715eb3d@quicinc.com>
 <20240724043941.5wpa5di7ta4fjyl5@vireshk-i7>
In-Reply-To: <20240724043941.5wpa5di7ta4fjyl5@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 2 Aug 2024 14:46:48 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iYDDQkPpnHsuJ_7du7Efg4zuLuhj2RHobJ6UiciuhphQ@mail.gmail.com>
Message-ID: <CAJZ5v0iYDDQkPpnHsuJ_7du7Efg4zuLuhj2RHobJ6UiciuhphQ@mail.gmail.com>
Subject: Re: [PATCH v2] cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
To: Viresh Kumar <viresh.kumar@linaro.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 24, 2024 at 6:39=E2=80=AFAM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> On 22-07-24, 10:14, Jeff Johnson wrote:
> > With ARCH=3Dpowerpc, make allmodconfig && make W=3D1 C=3D1 reports:
> > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-c=
be-cpufreq.o
> > WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/power=
nv-cpufreq.o
> >
> > Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> > files which have a MODULE_LICENSE().
> >
> > This includes three additional files which, although they did not
> > produce a warning with the powerpc allmodconfig configuration, may
> > cause this warning with specific options enabled in the kernel
> > configuration.
> >
> > Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> > ---
> > Changes in v2:
> > - Per Michael Ellerman updated maple-cpufreq.c and powernv-cpufreq.c
> >   descriptions
> > - Did not carry forward Viresh Kumar's Acked-by due to this change
> > - Link to v1: https://lore.kernel.org/r/20240614-md-powerpc-drivers-cpu=
freq-v1-1-de4034d87fd2@quicinc.com
>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

Applied as 6.12 material, thanks!
