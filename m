Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A433BA114
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 15:16:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GGbFN6DZ6z3bjS
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jul 2021 23:16:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=mit.edu
 (client-ip=18.9.28.11; helo=outgoing.mit.edu; envelope-from=tytso@mit.edu;
 receiver=<UNKNOWN>)
X-Greylist: delayed 141 seconds by postgrey-1.36 at boromir;
 Fri, 02 Jul 2021 23:16:03 AEST
Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GGbDz1JMCz301N
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jul 2021 23:16:01 +1000 (AEST)
Received: from cwcc.thunk.org (pool-72-74-133-215.bstnma.fios.verizon.net
 [72.74.133.215]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 162DDKDI002165
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 2 Jul 2021 09:13:21 -0400
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id AE97615C3CE4; Fri,  2 Jul 2021 09:13:20 -0400 (EDT)
Date: Fri, 2 Jul 2021 09:13:20 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Guoqing Jiang <guoqing.jiang@linux.dev>
Subject: Re: [powerpc][5.13.0-next-20210701] Kernel crash while running
 ltp(chdir01) tests
Message-ID: <YN8Q8O3W5u8iYSQr@mit.edu>
References: <26ACA75D-E13D-405B-9BFC-691B5FB64243@linux.vnet.ibm.com>
 <bf1c5b38-92f1-65db-e210-a97a199718ba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf1c5b38-92f1-65db-e210-a97a199718ba@linux.dev>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, jack@suse.cz, yi.zhang@huawei.com,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 02, 2021 at 05:38:10PM +0800, Guoqing Jiang wrote:
> 
> 
> I guess the problem is j_jh_shrink_count was destroyed in ext4_put_super _> 
> jbd2_journal_unregister_shrinker
> which is before the path ext4_put_super -> jbd2_journal_destroy ->
> jbd2_log_do_checkpoint to call
> percpu_counter_dec(&journal->j_jh_shrink_count).
> 
> And since jbd2_journal_unregister_shrinker is already called inside
> jbd2_journal_destroy, does it make sense
> to do this?
> 
> --- a/fs/ext4/super.c
> +++ b/fs/ext4/super.c
> @@ -1176,7 +1176,6 @@ static void ext4_put_super(struct super_block *sb)
>         ext4_unregister_sysfs(sb);
> 
>         if (sbi->s_journal) {
> -               jbd2_journal_unregister_shrinker(sbi->s_journal);
>                 aborted = is_journal_aborted(sbi->s_journal);
>                 err = jbd2_journal_destroy(sbi->s_journal);
>                 sbi->s_journal = NULL;

Good catch.  There's another place where we call
jbd2_journal_unregister_shrinker(), in the failure path for
ext4_fill_super().

					- Ted

P.S.  Whatever outgoing mailer you are using, it's not preserving TAB
characters correctly.  You might want to look into that before trying
to submit a patch.
