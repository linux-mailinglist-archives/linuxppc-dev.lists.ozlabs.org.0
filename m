Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 985C452AFAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 03:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2w1V3wMgz3c8r
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 11:11:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mLIfT9w9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=srs0=1vmm=v2=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mLIfT9w9; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2w0p1rNvz2yjS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 11:11:06 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 34C6C615D3;
 Wed, 18 May 2022 01:11:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9471AC385B8;
 Wed, 18 May 2022 01:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652836261;
 bh=0JohyQWS56e9PsJ/aORrWTbXqvcpO0LM4k4hDLaFxSc=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=mLIfT9w9lPhfdw9FKFVlZVkdTmBxuuusCSUEyodBbq+pJnMSrBSJy8XXuyRwLyRia
 Qot+dznXqo4P5ZnAcmGr9OtuW6I38udInffyXceCjESIAJfHhf2njRgj1RfSSOirAp
 tQvhq1+8QM2LwwENv67K2GIAy2juTmUiR2Mr4ugevZ4gvcpWsV12uhtM30/Dnh78gg
 Iv1R1Ino0+RjXba1EPwBX5XaiYPGU+x82E9FmkEVEQUPYlXjEEIkQjXLXV0xi1f+HJ
 UMO0InwYprDxMrYeGGdjyrEcHr7cyCZmsuWb96s+30VVhGLm7ooLuN9+B8L5iP9QKO
 v8djKpv1v1BKw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id 349865C051B; Tue, 17 May 2022 18:11:01 -0700 (PDT)
Date: Tue, 17 May 2022 18:11:01 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Chen Zhongjin <chenzhongjin@huawei.com>
Subject: Re: [PATCH v4] locking/csd_lock: change csdlock_debug from
 early_param to __setup
Message-ID: <20220518011101.GK1790663@paulmck-ThinkPad-P17-Gen-1>
References: <20220510094639.106661-1-chenzhongjin@huawei.com>
 <9b3e61b8-ecab-08ff-a3b6-83d6862ead77@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b3e61b8-ecab-08ff-a3b6-83d6862ead77@huawei.com>
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
Reply-To: paulmck@kernel.org
Cc: linux-arch@vger.kernel.org, jgross@suse.com, gor@linux.ibm.com,
 peterz@infradead.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, namit@vmware.com,
 tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 17, 2022 at 11:22:04AM +0800, Chen Zhongjin wrote:
> On 2022/5/10 17:46, Chen Zhongjin wrote:
> > csdlock_debug uses early_param and static_branch_enable() to enable
> > csd_lock_wait feature, which triggers a panic on arm64 with config:
> > CONFIG_SPARSEMEM=y
> > CONFIG_SPARSEMEM_VMEMMAP=n
> > 
> > With CONFIG_SPARSEMEM_VMEMMAP=n, __nr_to_section is called in
> > static_key_enable() and returns NULL which makes NULL dereference
> > because mem_section is initialized in sparse_init() which is later
> > than parse_early_param() stage.
> > 
> > For powerpc this is also broken, because early_param stage is
> > earlier than jump_label_init() so static_key_enable won't work.
> > powerpc throws an warning: "static key 'xxx' used before call
> > to jump_label_init()".
> > 
> > Thus, early_param is too early for csd_lock_wait to run
> > static_branch_enable(), so changes it to __setup to fix these.
> > 
> > Fixes: 8d0968cc6b8f ("locking/csd_lock: Add boot parameter for controlling CSD lock debugging")
> > Cc: stable@vger.kernel.org
> > Reported-by: Chen jingwen <chenjingwen6@huawei.com>
> > Signed-off-by: Chen Zhongjin <chenzhongjin@huawei.com>
> > ---
> > Change v3 -> v4:
> > Fix title and description because this fix is also applied
> > to powerpc.
> > For more detailed arm64 bug report see:
> > https://lore.kernel.org/linux-arm-kernel/e8715911-f835-059d-27f8-cc5f5ad30a07@huawei.com/t/
> > 
> > Change v2 -> v3:
> > Add module name in title
> > 
> > Change v1 -> v2:
> > Fix return 1 for __setup
> > ---
> >  kernel/smp.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/kernel/smp.c b/kernel/smp.c
> > index 65a630f62363..381eb15cd28f 100644
> > --- a/kernel/smp.c
> > +++ b/kernel/smp.c
> > @@ -174,9 +174,9 @@ static int __init csdlock_debug(char *str)
> >  	if (val)
> >  		static_branch_enable(&csdlock_debug_enabled);
> >  
> > -	return 0;
> > +	return 1;
> >  }
> > -early_param("csdlock_debug", csdlock_debug);
> > +__setup("csdlock_debug=", csdlock_debug);
> >  
> >  static DEFINE_PER_CPU(call_single_data_t *, cur_csd);
> >  static DEFINE_PER_CPU(smp_call_func_t, cur_csd_func);
> 
> Ping for review. Thanks！

I have pulled it into -rcu for testing and further review.  It might
well need to go through some other path, though.

								Thanx, Paul
