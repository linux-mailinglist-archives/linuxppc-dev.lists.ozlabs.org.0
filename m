Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C9754C30A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 10:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNHpk0c7jz3ch2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 18:02:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qRtiw/Ew;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=qRtiw/Ew;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNHp52wwYz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 18:02:04 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id EB64B21B27;
	Wed, 15 Jun 2022 08:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655280119; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DaM9M2rnjrvdQGQ7RvZB3kRvN0KL8OK3uY7jsfFlhwM=;
	b=qRtiw/EwzIsZzY7D7oh0BeOfU6iIQ38xDbUtfQXTtdaPPWK3B2vJeEb6IIHEt7MxZ3zKcC
	dfyx4Mc4tIb/eF0FliF28q8hNk+hU2TEYFUekYuM8cDMqgo0Awx7lmNgOzPGeK/9Q2qhBN
	CjKBFgcYgu+XVY7XBl81AW22w0F/oCg=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id E39D82C142;
	Wed, 15 Jun 2022 08:01:57 +0000 (UTC)
Date: Wed, 15 Jun 2022 10:01:57 +0200
From: Petr Mladek <pmladek@suse.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH 0/5] kallsyms: make kallsym APIs more safe with scnprintf
Message-ID: <YqmR9ZeiwMQLyKDu@alley>
References: <CGME20220520083715epcas5p400b11adef4d540756c985feb20ba29bc@epcas5p4.samsung.com>
 <20220520083701.2610975-1-maninder1.s@samsung.com>
 <YonTOL4zC4CytVrn@infradead.org>
 <202205231238.FAF6D28@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205231238.FAF6D28@keescook>
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
Cc: peterz@infradead.org, linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org, paulus@samba.org, linux-hexagon@vger.kernel.org, agordeev@linux.ibm.com, will@kernel.org, linux-s390@vger.kernel.org, daniel.thompson@linaro.org, arnd@arndb.de, linux-scsi@vger.kernel.org, onkarnath.1@samsung.com, anil.s.keshavamurthy@intel.com, Christoph Hellwig <hch@infradead.org>, kartilak@cisco.com, kgdb-bugreport@lists.sourceforge.net, naveen.n.rao@linux.ibm.com, longman@redhat.com, borntraeger@linux.ibm.com, jejb@linux.ibm.com, mhiramat@kernel.org, v.narang@samsung.com, satishkh@cisco.com, boqun.feng@gmail.com, gor@linux.ibm.com, hca@linux.ibm.com, rostedt@goodmis.org, linux-fsdevel@vger.kernel.org, andriy.shevchenko@linux.intel.com, mingo@redhat.com, bcain@quicinc.com, martin.petersen@oracle.com, dianders@chromium.org, sebaddel@cisco.com, senozhatsky@chromium.org, mcgrof@kernel.org, svens@linux.ibm.com, jason.wessel@windriver.com, Maninder Singh <maninder1.s@samsung.com>, akpm@linux-foundation.or
 g, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, linux-modules@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 2022-05-23 12:39:12, Kees Cook wrote:
> On Sat, May 21, 2022 at 11:07:52PM -0700, Christoph Hellwig wrote:
> > On Fri, May 20, 2022 at 02:06:56PM +0530, Maninder Singh wrote:
> > > kallsyms functionality depends on KSYM_NAME_LEN directly.
> > > but if user passed array length lesser than it, sprintf
> > > can cause issues of buffer overflow attack.
> > > 
> > > So changing *sprint* and *lookup* APIs in this patch set
> > > to have buffer size as an argument and replacing sprintf with
> > > scnprintf.
> > 
> > This is still a pretty horrible API.  Passing something like
> > a struct seq_buf seems like the much better API here.  Also with
> > the amount of arguments and by reference passing it might be worth
> > to pass them as a structure while you're at it.
> 
> Yeah, I agree. It really seems like seq_buf would be nicer.

There is a new patchset that is trying to use this kind of buffer
in vsprintf.

It introduces another buffer struct because vsprintf() needs a bit
different semantic than the one used in seq_buf. But it actually
replaces seq_buf() in the end. I am not sure if this is the right
approach.

Anyway, the initial API is very simple, see
https://lore.kernel.org/r/20220604193042.1674951-2-kent.overstreet@gmail.com

And it makes the internal vsprintf() API more sane, see
https://lore.kernel.org/r/20220604193042.1674951-4-kent.overstreet@gmail.com

It would eventually solve also concerns about the kallsysms API.
Any comments on the new printbuf API are much appreaciated.

Best Regards,
Petr
