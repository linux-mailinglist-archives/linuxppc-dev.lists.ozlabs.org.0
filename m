Return-Path: <linuxppc-dev+bounces-5601-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69AA1D8D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 15:56:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhWhN6pV4z2yTy;
	Tue, 28 Jan 2025 01:56:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737989780;
	cv=none; b=iM3n1uGFk/tzGOylW8aSaFQsiYYo/EumBO4PEVE3SL3atus3WFI0bnH37khxoZfkR+J7Ouer/CMW+SrwFir3vblfXQoBSlmKKQ5fmTI5a0XFUSq8t1qGWXjmhf33qlctYEV/04GVHbP8gEYKxRDLPttRto3hwahwE3WqI652LUSc9PUAP625w4b7dTYdwjdzw4ox+K/Ug5pFjZsInTcW6DyGl4LiizNKorPrA7y6U2EI+elQuMd2y1ZWjn0F5ikm+I5VwHGqB2gTtj6Q6aYqURD6ZLQSKNuFows1lFmdQcjwAl0n+tQ1KUYqrJYe7sHx7VT54q5P/QSGh7fIf0AJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737989780; c=relaxed/relaxed;
	bh=feVXBXQ+By9WArNNSb/bibglGnzo06lZJuKLaLgAuos=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N2y0vjyY5aRDZU89UI8V2mde/fYpQiiVFH7VJDEJxJhsTT969CifcSJVKxtz4+Eb/eSJzprOtMwr5kJMsSdj7qQCDI1Ec+DideH5CJYiizc+iqqa7B3Dmc/sjZ/qAn4XeT6XXOB2Ap1m2+0hs/an/3KmwS7T5w7KRJcf279BOlAksnODTnH9PRhohUEWJ6OJ2BFMAFGqMIskDyoGd2HSx33+elpV03oVKdpuitheYsdl5EGSqGYRJObIe20L+PCOZiROGyqzViERcBdSjq8tFNQVJCzGuSIpnEo++VEs1k2/PbNp7H9PE50gyJp2N2seyeSIvuGJSv9EP+Mah3xuqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WHJBvp0Q; dkim-atps=neutral; spf=pass (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WHJBvp0Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=jani.nikula@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YhWhL3g48z2yRM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 01:56:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737989778; x=1769525778;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=jgZ2GO8S3cXCdWyE6ZvOdFoqm0rhCqZC3ICQKad44uQ=;
  b=WHJBvp0QSWxjIn1LT9TWSIHoUAnhNAwpDSgkGrvLwVpnk6eUViHxa/ak
   mzBPKxU2SajCEq4+Jx0Z2NFjKm4UKJT21rq9J2hunyYsx0X7DbP7NbADQ
   Nn0SVpyE1Y/k5S4F/Kr53u/u2u2liirfdRT1//42h2TjjKZTimg3VXLw0
   Svev3MbdJwk1V2ggcOKAhO7iGqQcbVeAahg3TwmCzI7RbhzcEYfn/apj7
   1P93Pv4d8GmxdZv2AvYDZe/79YWrI0PY1v5Xd2qK3aisH+JR4aRiRUYg5
   yUt5h6ZorPm5f5FXnJYtBvezlZuKs9qGDKNHEZ4FKDs92n24behWTyjTw
   Q==;
X-CSE-ConnectionGUID: UMIY13AdS8GExSQTHNPaiQ==
X-CSE-MsgGUID: qBPGw+5/QBGYZ8Qi2NPW4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="49104686"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="49104686"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:56:13 -0800
X-CSE-ConnectionGUID: Z9Coz29cQ6uqfPwc/L4sHg==
X-CSE-MsgGUID: XE2pskZGQO2Q6A9y4rThjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113598177"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.14])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 06:56:01 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Joel Granados <joel.granados@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Thomas =?utf-8?Q?Wei=C3=9F?=
 =?utf-8?Q?schuh?=
 <linux@weissschuh.net>, Kees Cook <kees@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-crypto@vger.kernel.org, openipmi-developer@lists.sourceforge.net,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-aio@kvack.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 codalist@coda.cs.cmu.edu, linux-mm@kvack.org, linux-nfs@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, fsverity@lists.linux.dev,
 linux-xfs@vger.kernel.org, io-uring@vger.kernel.org, bpf@vger.kernel.org,
 kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org, Song Liu
 <song@kernel.org>, "Steven Rostedt (Google)" <rostedt@goodmis.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, "Darrick J. Wong"
 <djwong@kernel.org>, Corey Minyard <cminyard@mvista.com>
Subject: Re: Re: Re: [PATCH v2] treewide: const qualify ctl_tables where
 applicable
In-Reply-To: <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250110-jag-ctl_table_const-v2-1-0000e1663144@kernel.org>
 <Z4+jwDBrZNRgu85S@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
 <nslqrapp4v3rknjgtfk4cg64ha7rewrrg24aslo2e5jmxfwce5@t4chrpuk632k>
 <CAMj1kXEZPe8zk7s67SADK9wVH3cfBup-sAZSC6_pJyng9QT7aw@mail.gmail.com>
 <f4lfo2fb7ajogucsvisfd5sg2avykavmkizr6ycsllcrco4mo3@qt2zx4zp57zh>
Date: Mon, 27 Jan 2025 16:55:58 +0200
Message-ID: <87jzag9ugx.fsf@intel.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, 27 Jan 2025, Joel Granados <joel.granados@kernel.org> wrote:
> On Wed, Jan 22, 2025 at 01:41:35PM +0100, Ard Biesheuvel wrote:
>> On Wed, 22 Jan 2025 at 13:25, Joel Granados <joel.granados@kernel.org> wrote:
>> >
>> > On Tue, Jan 21, 2025 at 02:40:16PM +0100, Alexander Gordeev wrote:
>> > > On Fri, Jan 10, 2025 at 03:16:08PM +0100, Joel Granados wrote:
>> > >
>> > > Hi Joel,
>> > >
>> > > > Add the const qualifier to all the ctl_tables in the tree except for
>> > > > watchdog_hardlockup_sysctl, memory_allocation_profiling_sysctls,
>> > > > loadpin_sysctl_table and the ones calling register_net_sysctl (./net,
>> > > > drivers/inifiniband dirs). These are special cases as they use a
>> > > > registration function with a non-const qualified ctl_table argument or
>> > > > modify the arrays before passing them on to the registration function.
>> > > >
>> > > > Constifying ctl_table structs will prevent the modification of
>> > > > proc_handler function pointers as the arrays would reside in .rodata.
>> > > > This is made possible after commit 78eb4ea25cd5 ("sysctl: treewide:
>> > > > constify the ctl_table argument of proc_handlers") constified all the
>> > > > proc_handlers.
>> > >
>> > > I could identify at least these occurences in s390 code as well:
>> > Hey Alexander
>> >
>> > Thx for bringing these to my attention. I had completely missed them as
>> > the spatch only deals with ctl_tables outside functions.
>> >
>> > Short answer:
>> > These should not be included in the current patch because they are a
>> > different pattern from how sysctl tables are usually used. So I will not
>> > include them.
>> >
>> > With that said, I think it might be interesting to look closer at them
>> > as they seem to be complicating the proc_handler (I have to look at them
>> > closer).
>> >
>> > I see that they are defining a ctl_table struct within the functions and
>> > just using the data (from the incoming ctl_table) to forward things down
>> > to proc_do{u,}intvec_* functions. This is very odd and I have only seen
>> > it done in order to change the incoming ctl_table (which is not what is
>> > being done here).
>> >
>> > I will take a closer look after the merge window and circle back with
>> > more info. Might take me a while as I'm not very familiar with s390
>> > code; any additional information on why those are being used inside the
>> > functions would be helpfull.
>> >
>> 
>> Using const data on the stack is not as useful, because the stack is
>> always mapped writable.
>> 
>> Global data structures marked 'const' will be moved into an ELF
>> section that is typically mapped read-only in its entirely, and so the
>> data cannot be modified by writing to it directly. No such protection
>> is possible for the stack, and so the constness there is only enforced
>> at compile time.
> I completely agree with you. No reason to use const within those
> functions. But why define those ctl_tables in function to begin with.
> Can't you just use the ones that are defined outside the functions?

You could have static const within functions too. You get the rodata
protection and function local scope, best of both worlds?

BR,
Jani.


-- 
Jani Nikula, Intel

