Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B76503BA6F7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 05:52:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGyhR5KZCz3bjF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Jul 2021 13:52:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu
 (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu;
 receiver=<UNKNOWN>)
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGyh66hNvz2yNx
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Jul 2021 13:52:21 +1000 (AEST)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 1633q4h8012116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jul 2021 23:52:06 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id CA34B15C3CE6; Fri,  2 Jul 2021 23:52:04 -0400 (EDT)
Date: Fri, 2 Jul 2021 23:52:04 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Zhang Yi <yi.zhang@huawei.com>
Subject: Re: [powerpc][5.13.0-next-20210701] Kernel crash while running
 ltp(chdir01) tests
Message-ID: <YN/e5KOEdzRUsZra@mit.edu>
References: <26ACA75D-E13D-405B-9BFC-691B5FB64243@linux.vnet.ibm.com>
 <bf1c5b38-92f1-65db-e210-a97a199718ba@linux.dev>
 <4cc87ab3-aaa6-ed87-b690-5e5b99de8380@huawei.com>
 <03f734bd-f36e-f55b-0448-485b8a0d5b75@huawei.com>
 <YN86yl5kgVaRixxQ@mit.edu> <YN+PIKV010a+j88S@mit.edu>
 <9b81eb4e-9adb-991f-31be-f5ef0092c4b3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b81eb4e-9adb-991f-31be-f5ef0092c4b3@huawei.com>
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

On Sat, Jul 03, 2021 at 11:37:07AM +0800, Zhang Yi wrote:
> I check the ocfs2 code, if we register shrinker here, __ocfs2_recovery_thread()->
> ocfs2_recover_node() seems will register and unregister a lot of unnecessary
> shrinkers. It depends on the lifetime of the shrinker and the journal, because of
> the jbd2_journal_destroy() destroy everything, it not a simple undo of
> jbd2_load_journal(), so it's not easy to add shrinker properly. But it doesn't
> seems like a real problem, just curious.

ocfs2_recover_node() only gets called for nodes that need recovery ---
that is, when an ocfs2 server has crashed, then it becomes necessary
to replay that node's journal before that node's responsibilities can
be taken over by another server.  So it doesn't get called that
frequently --- and when it is needed, the fact that we need to read
the journal, and replay its entries, the cost in comparison for
registering and unregistering the shrinker is going to be quite cheap.

Cheers,

					- Ted
