Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7663058660A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 10:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lx9nV37rpz2ypD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 18:11:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbHrryCg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dsahern@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qbHrryCg;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lx20T4Nmfz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 12:20:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28EE261210;
	Mon,  1 Aug 2022 02:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6678CC433D6;
	Mon,  1 Aug 2022 02:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659320435;
	bh=8+H9rIFxtVXMLizyjzjdfAN5H4rrg+kZwIAaizE2yzQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qbHrryCgLDT40La7RvFNZvpswRq37MotxkwMrnSgvThg10C5P0Wuvbhb+kgAW2IV/
	 7l9AinfPyV+s0mp74V/lgRfNNWtXpVcoBhJZq6nNU0+Y+uztq9mnx8qZUNJtGfOmBy
	 z9E4MQQrlRBjePrgwRm5wkSRkYp1eh67rIz1eWdsjiCrWjEg7KPlp9UuuRYFvVdF4H
	 AG5ozENZQdt/UaSewznbAtfMQ42eqJ8Aijum4zvDsoNX31z1VJqC3WWFB8VpixZRdN
	 eZ7vzT+qAn+vAnbV2YEMFy6M4I4SzFXOjvGZzYicWbyrhI6mijE08eH8oBJNpMbil5
	 HrwTfHKih8DWg==
Message-ID: <65fb5e26-2000-ffa5-5a3b-21db87da9e3b@kernel.org>
Date: Sun, 31 Jul 2022 20:20:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [RFC] Remove DECNET support from kernel
Content-Language: en-US
To: Stephen Hemminger <stephen@networkplumber.org>, netdev@vger.kernel.org
References: <20220731190646.97039-1-stephen@networkplumber.org>
From: David Ahern <dsahern@kernel.org>
In-Reply-To: <20220731190646.97039-1-stephen@networkplumber.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 01 Aug 2022 18:11:12 +1000
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
Cc: "open list:NETFILTER" <netfilter-devel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Alexei Starovoitov <ast@kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Yajun Deng <yajun.deng@linux.dev>, Suma Hegde <suma.hegde@amd.com>, Paolo Abeni <pabeni@redhat.com>, Victor Erminpour <victor.erminpour@oracle.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Soheil Hassas Yeganeh <soheil@google.com>, Menglong Dong <imagedong@tencent.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.com>, "open list:NETFILTER" <coret
 eam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Jens Axboe <axboe@kernel.dk>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Benjamin Poirier <bpoirier@nvidia.com>, Yu Zhe <yuzhe@nfschina.com>, "GONG, Ruiqi" <gongruiqi1@huawei.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Scott Wood <oss@buserror.net>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat Karakotov <hmukos@yandex-team.ru>, Petr Machata <petrm@nvidia.com>, Antoine Tenar
 t <atenart@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Florian Westphal <fw@strlen.de>, open list <linux-kernel@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Jeff Layton <jlayton@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/31/22 1:06 PM, Stephen Hemminger wrote:
> Decnet is an obsolete network protocol that receives more attention
> from kernel janitors than users. It belongs in computer protocol
> history museum not in Linux kernel.
> 
> It has been Orphaned in kernel since 2010.
> And the documentation link on Sourceforge says it is abandoned there.
> 
> Leave the UAPI alone to keep userspace programs compiling.
> 
> Signed-off-by: Stephen Hemminger <stephen@networkplumber.org>
> ---

Acked-by: David Ahern <dsahern@kernel.org>


