Return-Path: <linuxppc-dev+bounces-5477-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F26BA19184
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2025 13:41:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YdNxY14d0z2xLR;
	Wed, 22 Jan 2025 23:41:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737549713;
	cv=none; b=PNAOEWRA3TC23JqSBQnQNGXVJ1mf9EAHKOV8JJ/Sp2jrp/K+Co0C/z7v9pFYhLknAp1ZiAWK2hmTfFk4QYTSOmYRPQAv17oarnJfyiMREDF26JUSzj9teWy/TZcQDpn9Q7GYY7hEV6zSAWeuesMThRXC3qfx7MOteus1yDa406NdBPl5xC1JQjEJ9lIN5sAwR7dJs/zFDtWUeJ+cqd3/iOxaq3cBSaim/fnhgesC/FcFl3MZMliutAi303kt3WMu8Od8bF1QllqT/9gduRC26h056tqMRw+AoR6zqHGcB2wFWMU3bLLATZ9WYXBPtpHIc1WHxH5ztWusAI0hjqBxLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737549713; c=relaxed/relaxed;
	bh=/nRt7/FOVju0HHPP7y/y/GmcikIqd0uun9LCjQjrq7E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Go5S5TmrZZvCqFMiFr1rE3eg7uQPsLZzrAmJUTpEiRv14qI8x+W85ZqjcSLpQkWFN29ihIGk2RTwsafTKQ9tOvRyBpy8HcAK6L1qQuzhYpn7APh8yZIN+e7Ad1ioqfE28A3AUkbx8El7EicZBRF6pLr7iCepu9lQoECwHsPCcdEVxAQilsgADMfDeeN/Osy66gFie5bXmYUgaLPbMPYm4AFapsSEpkm/p/mFv+qszGqBanslP5j8NO4SoiaAOD7VdB4GwhZZhauudRjHSUDNxWkaNBN/QxrOxxxC+/M4VnL6cHYT4lzNJdfZ+6PH6jS2kOoPJLgVmObJhM+mFreNhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VoyrM/KR; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VoyrM/KR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YdNxX0y5zz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 23:41:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 220FAA42532
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 12:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47251C4CEE5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737549708;
	bh=/nRt7/FOVju0HHPP7y/y/GmcikIqd0uun9LCjQjrq7E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VoyrM/KR3y6SyzXqcrUXIeXUzSXAukF1jTugO3Tp/XeZbDQsZz0btjWFVZexImUyA
	 GNv9Ye0JlCb6LXyPS9Jx9MVxR+Wdtkk0Ms+qZSrA1Lr8Xe+0i9vU/ISeGtF/6vb7Vs
	 1Uj3RovlFmNzqVfmuzQ82cCacT+Fx0ki2YqsVx1IY92F3iqqKCafCCMLWLqphwdRxg
	 srLeLPCzyALTJw1qCRW7tcb44xO01Rx4zDtdApARN9p2pthq2z1LppbizS751cMHo9
	 cZn++ylUYdHjeWMHwboi8qRzV/CerfY2kd1XCsOqWLze560AIlYM8svAXpyzid0N54
	 v69z43CGgr7bQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3022484d4e4so70972101fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2025 04:41:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVUAzgPu8nHCRt6uW7RI7oOLTz63CNakD/nZWr5UuSCc7J4lmW7h1MuBfWQDV1GD2ifMSu2iH53FHMNV8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzDh0G8FIRyIIEh3uDO960mFL0pcxCLH4X4C6Kn5N4Sm9FqeVZM
	G3FTZRzJtwR+iuBj0E9s7ncCsktuqwsPDvmeKEIJfHxAbT5aGPFkhRIWCSq0A1jvJwdW0Wujr0X
	AWpsP7ilGdQ8p9oaP/ndS6Zxh6IA=
X-Google-Smtp-Source: AGHT+IFcRSReB7hah7mapcirnp1PWu31SswN3BbR4HjBYPEG79Tzl030J0TjqkE7fYQS4xaDIi2/KgOUqh2J3fswv1A=
X-Received: by 2002:a05:651c:2228:b0:302:4130:e19c with SMTP id
 38308e7fff4ca-3072caa15c1mr71017091fa.19.1737549706586; Wed, 22 Jan 2025
 04:41:46 -0800 (PST)
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
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com> <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
In-Reply-To: <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 22 Jan 2025 13:41:35 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
X-Gm-Features: AbW1kvaDj3u8bGVj1m4rnYAkpiRSTpmPAB3bThAH-GyuG2Tmgw9okzkp1e58uCc
Message-ID: <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
Subject: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where applicable
To: Joel Granados <joel.granados@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev, 
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org, 
	ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, 
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, 
	Song Liu <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	Jani Nikula <jani.nikula@intel.com>, Corey Minyard <cminyard@mvista.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 22 Jan 2025 at 13:25, Joel Granados <joel.granados@kernel.org> wrote:
>
> On Tue, Jan 21, 2025 at 02:40:16PM +0100, Alexander Gordeev wrote:
> > On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
> >
> > Hi Joel,
> >
> > > Add the const qualifier to all the ctl_tables in the tree except for
> > > watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
> > > loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
> > > drivers/inifiniband dirs). These are special cases as they use a
> > > registration function with a non-const qualified ctl_table argument or
> > > modify the arrays before passing them on to the registration function.
> > >
> > > Constifying ctl_table structs will prevent the modification of
> > > proc_handler function pointers as the arrays would reside in .rodata.
> > > This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> > > constify the ctl_table argument of proc_handlers") constified all the
> > > proc_handlers.
> >
> > I could identify at least these occurences in s390 code as well:
> Hey Alexander
>
> Thx for bringing these to my attention. I had completely missed them as
> the spatch only deals with ctl_tables outside functions.
>
> Short answer:
> These should not be included in the current patch because they are a
> different pattern from how sysctl tables are usually used. So I will not
> include them.
>
> With that said, I think it might be interesting to look closer at them
> as they seem to be complicating the proc_handler (I have to look at them
> closer).
>
> I see that they are defining a ctl_table struct within the functions and
> just using the data (from the incoming ctl_table) to forward things down
> to proc_do{u,}intvec_* functions. This is very odd and I have only seen
> it done in order to change the incoming ctl_table (which is not what is
> being done here).
>
> I will take a closer look after the merge window and circle back with
> more info. Might take me a while as I'm not very familiar with s390
> code; any additional information on why those are being used inside the
> functions would be helpfull.
>

Using const data on the stack is not as useful, because the stack is
always mapped writable.

Global data structures marked 'const' will be moved into an ELF
section that is typically mapped read-only in its entirely, and so the
data cannot be modified by writing to it directly. No such protection
is possible for the stack, and so the constness there is only enforced
at compile time.

