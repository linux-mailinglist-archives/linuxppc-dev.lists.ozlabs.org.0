Return-Path: <linuxppc-dev+bounces-5600-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1F9A1D73D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 14:50:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhVCw53jxz2ysX;
	Tue, 28 Jan 2025 00:50:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737985804;
	cv=none; b=MV44FqMNBPask0qYrCrk1e9C+yx+S/kSLkeLIS/bZUdOO9HLparvR4bAICv+9rJyeEZ7zYfPs9w9LK0syJEb87Ro4sdNnZSI8H+Xrui+xmJsz6uxsKVyZWj40M54+JmtmyBunCyHrUDzY1LzXjHh25PwyrOXUfBXTq3R9XNwgypfsTZxEZ+hNI98ahNnsvBGt9ZaAy7ucGQFgVcnarTWcWO+GTPvvND3xt/tL7w7auaEAcLNrmwJLJ8f0NylZAxwqQNg2CiKxuz54itVVXYgUEK6bwH4ULYa2J/GE705oPd0BKDzug8LfM7rNHcGjKS9pOYejusJmlw524YjS6LXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737985804; c=relaxed/relaxed;
	bh=epQcBRbikRChnEcLD7GohI/p/yPUxTUqgScFKmNVdcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WFpjAF3tEV041x3aw0MD+Vlu4/HizDmUUTLzy1Rnh+kuWsKPvDZ+/sT1zh6ribRjzRZjAt9f52JAVv5FvVBdTqxmMdkNB/fZIDtahWMFi6+2ioa3AR00kTDcK2Z8Xmro9htLWeN4ylU0C1cgV6vs/Hwr2KcA1Qd4YUYUSBkXGsNlBkjXyvF9ym25DOyMzX58pp+Iws6v/DOM9BvccetOCaKf99kF00pxL0tXBpWt23a2zfGYPTRc3NwjNrgc3ozLs3IfWZkTt6QS9+VIvFhXP0cgO2B4txUDOBEuVcIyDeE4oTwZxQ3HC0iG/QhDvVKy/1I3o4pyx0vdHNs0eJxIhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ITreSYYk; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=joel.granados@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ITreSYYk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=joel.granados@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhVCv2Nnmz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 00:50:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 554B0A4154E;
	Mon, 27 Jan 2025 13:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881ACC4CED2;
	Mon, 27 Jan 2025 13:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737985800;
	bh=laZX1iWKmTFe6EBXe6dQ6V5dBHky9feUPubV8bbHYy0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ITreSYYkYqJo0yzT/NmeCNaU8ylN9fF82uixbVQhbAMNhn/x1ksvsdeN2BZIjx7Av
	 6jRzLOfnz1KOiZ8BN/+a6yzSKjX86nOzP6ewnKK12LbyYoLRgr6MitIVZMs+Q9nRjt
	 1O56sOuQWf9/oW9JBeL1K1Ep9SPnbGRY0gAqf1BfWdrmsV6P6rbrAzrEzJaWATIpCg
	 PxgyGHOSh+1Dp+na/sGNdWcGsgzNCRs4/nnMHS16Kt8UOkwJO9cYsDiIOKruHAZkDs
	 tuJVwo0MPlNeiRHuQkLVgJEWRQ8mSboCfx8PwGZonQ0+bdJkEjI8BLPDWS5oZchNDY
	 iBi9Q4ViZ4cfA==
Date: Mon, 27 Jan 2025 14:49:55 +0100
From: Joel Granados <joel.granados@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, 
	Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>, Kees Cook <kees@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-aio@kvack.org, linux-fsdevel@vger.kernel.org, 
	netfs@lists.linux.dev, codalist@coda.cs.cmu.edu, linux-mm@kvack.org, 
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev, 
	linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org, 
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com, linux-security-module@vger.kernel.org, 
	keyrings@vger.kernel.org, Song Liu <song@kernel.org>, 
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, 
	"Darrick J. Wong" <djwong@kernel.org>, Jani Nikula <jani.nikula@intel.com>, 
	Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where
 applicable
Message-ID: <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
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
In-Reply-To: <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 22, 2025 at 01:41:35PM +0100, Ard Biesheuvel wrote:
> On Wed, 22 Jan 2025 at 13:25, Joel Granados <joel.granados@kernel.org> wrote:
> >
> > On Tue, Jan 21, 2025 at 02:40:16PM +0100, Alexander Gordeev wrote:
> > > On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
> > >
> > > Hi Joel,
> > >
> > > > Add the const qualifier to all the ctl_tables in the tree except for
> > > > watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
> > > > loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
> > > > drivers/inifiniband dirs). These are special cases as they use a
> > > > registration function with a non-const qualified ctl_table argument or
> > > > modify the arrays before passing them on to the registration function.
> > > >
> > > > Constifying ctl_table structs will prevent the modification of
> > > > proc_handler function pointers as the arrays would reside in .rodata.
> > > > This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
> > > > constify the ctl_table argument of proc_handlers") constified all the
> > > > proc_handlers.
> > >
> > > I could identify at least these occurences in s390 code as well:
> > Hey Alexander
> >
> > Thx for bringing these to my attention. I had completely missed them as
> > the spatch only deals with ctl_tables outside functions.
> >
> > Short answer:
> > These should not be included in the current patch because they are a
> > different pattern from how sysctl tables are usually used. So I will not
> > include them.
> >
> > With that said, I think it might be interesting to look closer at them
> > as they seem to be complicating the proc_handler (I have to look at them
> > closer).
> >
> > I see that they are defining a ctl_table struct within the functions and
> > just using the data (from the incoming ctl_table) to forward things down
> > to proc_do{u,}intvec_* functions. This is very odd and I have only seen
> > it done in order to change the incoming ctl_table (which is not what is
> > being done here).
> >
> > I will take a closer look after the merge window and circle back with
> > more info. Might take me a while as I'm not very familiar with s390
> > code; any additional information on why those are being used inside the
> > functions would be helpfull.
> >
> 
> Using const data on the stack is not as useful, because the stack is
> always mapped writable.
> 
> Global data structures marked 'const' will be moved into an ELF
> section that is typically mapped read-only in its entirely, and so the
> data cannot be modified by writing to it directly. No such protection
> is possible for the stack, and so the constness there is only enforced
> at compile time.
I completely agree with you. No reason to use const within those
functions. But why define those ctl_tables in function to begin with.
Can't you just use the ones that are defined outside the functions?

Best


-- 

Joel Granados

