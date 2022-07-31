Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A2458611F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jul 2022 21:56:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LwsTW73L3z3cfS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 05:56:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T9jGZEBn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T9jGZEBn;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LwrZT0RzFz2xG8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 05:16:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AE46BB80DCD;
	Sun, 31 Jul 2022 19:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313F4C433C1;
	Sun, 31 Jul 2022 19:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659294954;
	bh=wZPiOmb/8y3eGL/2h6/nS4c4cbBrC5BVAnNHwWdf0GU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T9jGZEBnUXLfaa8X7PKLziwJ0/gtSigoQGvVgA14bEv3XngpVWIXW8iksAjIMqSav
	 4WfoTj7ox8y9lP3t1dusu++r8cFwf/tf8PrbfwSPUAA07RjC+/uTe5h7uINWx6eP9m
	 czT313x97GQnnWiUz9oSONS3V1P5iqus9MVAr+VbYyB6+YJ27X56fsTF2Kx1mSfdh5
	 11eHqxXr4IDxrxksfrnc0A2YCNqabIB3vbZRK0GejO1qfVDJE7ezzxLQirWm2d6o1G
	 EKnfF0rHw4RHjqtNTXRHDkEgKAx4AwjERSjAybhUArQGdxXnWUBriayLi9pLhmdpOO
	 xx2EZNtgZDN7Q==
Received: by pali.im (Postfix)
	id 388B36E8; Sun, 31 Jul 2022 21:15:51 +0200 (CEST)
Date: Sun, 31 Jul 2022 21:15:51 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Stephen Hemminger <stephen@networkplumber.org>
Subject: Re: [RFC] Remove DECNET support from kernel
Message-ID: <20220731191551.5m7ql3ysozi3owrl@pali>
References: <20220731190646.97039-1-stephen@networkplumber.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220731190646.97039-1-stephen@networkplumber.org>
User-Agent: NeoMutt/20180716
X-Mailman-Approved-At: Mon, 01 Aug 2022 05:55:30 +1000
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
Cc: "open list:NETFILTER" <netfilter-devel@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Nikolay Aleksandrov <razor@blackwall.org>, Petr Machata <petrm@nvidia.com>, Alexei Starovoitov <ast@kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, Wang Qing <wangqing@vivo.com>, Paul Gortmaker <paul.gortmaker@windriver.com>, Eric Dumazet <edumazet@google.com>, Paul Mackerras <paulus@samba.org>, Yajun Deng <yajun.deng@linux.dev>, Suma Hegde <suma.hegde@amd.com>, Paolo Abeni <pabeni@redhat.com>, Victor Erminpour <victor.erminpour@oracle.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Soheil Hassas Yeganeh <soheil@google.com>, Menglong Dong <imagedong@tencent.com>, Xin Long <lucien.xin@gmail.com>, Chen Yu <yu.c.chen@intel.com>, Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, Jozsef Kadlecsik <kadlec@netfilter.org>, Xie Yongji <xieyongji@bytedance.c
 om>, "open list:NETFILTER" <coreteam@netfilter.org>, Roopa Prabhu <roopa@nvidia.com>, Jakub Kicinski <kuba@kernel.org>, Borislav Petkov <bp@suse.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Pablo Neira Ayuso <pablo@netfilter.org>, Stefano Garzarella <sgarzare@redhat.com>, Jens Axboe <axboe@kernel.dk>, Kees Cook <keescook@chromium.org>, "Paul E. McKenney" <paulmck@kernel.org>, Benjamin Poirier <bpoirier@nvidia.com>, Yu Zhe <yuzhe@nfschina.com>, "GONG, Ruiqi" <gongruiqi1@huawei.com>, William Breathitt Gray <vilhelm.gray@gmail.com>, Scott Wood <oss@buserror.net>, Hans de Goede <hdegoede@redhat.com>, Kuniyuki Iwashima <kuniyu@amazon.com>, Shakeel Butt <shakeelb@google.com>, Alexandre Ghiti <alexandre.ghiti@canonical.com>, Yuwei Wang <wangyuweihx@gmail.com>, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Akhmat Karakotov <hmukos@yandex-team.ru>, netdev@vger.kernel.org, Antoine Tenart <atenart@kernel.org>, Randy Dunlap <rdunlap@infradead.org>,
  Florian Westphal <fw@strlen.de>, open list <linux-kernel@vger.kernel.org>, David Ahern <dsahern@kernel.org>, Chuck Lever <chuck.lever@oracle.com>, Arnd Bergmann <arnd@arndb.de>, Jeff Layton <jlayton@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sunday 31 July 2022 12:06:10 Stephen Hemminger wrote:
> diff --git a/Documentation/admin-guide/sysctl/net.rst b/Documentation/admin-guide/sysctl/net.rst
> index 805f2281e000..299d9c3407d3 100644
> --- a/Documentation/admin-guide/sysctl/net.rst
> +++ b/Documentation/admin-guide/sysctl/net.rst
> @@ -39,7 +39,6 @@ Table : Subdirectories in /proc/sys/net
>   802       E802 protocol         ax25       AX25
>   ethernet  Ethernet protocol     rose       X.25 PLP layer
>   ipv4      IP version 4          x25        X.25 protocol
> - bridge    Bridging              decnet     DEC net
>   ipv6      IP version 6          tipc       TIPC
>   ========= =================== = ========== ==================
>  

Hello! You should remove only decnet from the list, not bridge.
This is two columns table.
