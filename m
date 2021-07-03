Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE933BA6EA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 05:36:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGyKM278Yz3bWq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 13:36:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu
 (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu;
 receiver=<UNKNOWN>)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGyJy5zGsz2ymQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 13:35:44 +1000 (AEST)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 1633ZBda007796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jul 2021 23:35:12 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id D29EF15C3CE6; Fri,  2 Jul 2021 23:35:11 -0400 (EDT)
Date: Fri, 2 Jul 2021 23:35:11 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Zhang Yi <yi.zhang@huawei.com>
Subject: Re: [powerpc][5.13.0-next-20210701] Kernel crash while running
 ltp(chdir01) tests
Message-ID: <YN/a70ucYXu0DqGf@mit.edu>
References: <26ACA75D-E13D-405B-9BFC-691B5FB64243@linux.vnet.ibm.com>
 <bf1c5b38-92f1-65db-e210-a97a199718ba@linux.dev>
 <4cc87ab3-aaa6-ed87-b690-5e5b99de8380@huawei.com>
 <03f734bd-f36e-f55b-0448-485b8a0d5b75@huawei.com>
 <YN86yl5kgVaRixxQ@mit.edu>
 <36778615-86fd-9a19-9bc9-f93a6f2d5817@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36778615-86fd-9a19-9bc9-f93a6f2d5817@huawei.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Jan Kara <jack@suse.cz>,
 Guoqing Jiang <guoqing.jiang@linux.dev>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Ext4 Developers List <linux-ext4@vger.kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 03, 2021 at 11:05:07AM +0800, Zhang Yi wrote:
> 
> Originally, I want to add this shrinker as a optional feature for jbd2 because
> only ext4 use it now and I'm not sure does ocfs2 needs this feature. So I export
> jbd2_journal_[un]register_shrinker(), ext4 could invoke them individually.

The reason why bdev_try_to_free_page() callback was needed for ext4
--- namely so there was a way to release checkpointed buffers under
memory pressure --- also exists for ocfs2.  It was probably true that
in most deployments of ocfs2, they weren't running with super-tight
memory availability, so it may not have been necessary the same way
that it might be necessary, say, if ext4 was being used on a Rasberry
Pi.  :-)

> And one more thing we to could do is rename the 'j_jh_shrink_count' to something
> like 'j_checkpoint_jh_count' because we always init it no matter we register the
> shrinker or not later.

That makes sense.

In fact, unless I'm mistaken, I don't think it's legal to call
percpu_counter_{inc,dec} if the shrinker isn't initialized.  So for
ocfs2, if we didn't initialize percpu_counter, when
__jbd2_journal_insert_checkpoint() tries to call percpu_counter_inc(),
I believe things would potentially go *boom* on some implementations
of the percpu counter (e.g., on Power and ARM).  So not only would it
not hurt to register the shrinker for ocfs2, I think it's required.

So yeah, let's rename it to something like j_checkpoint_jh_count, and
then let's inline jbd2_journal_[un]register_shrinker() in
journal_init_common() and jbd2_journal_unregister_shrinker().

What do you think?

					- Ted
