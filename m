Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1D59C12B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 16:00:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBDXg474wz3cdc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 00:00:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AWbqZa3l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AWbqZa3l;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBDX60b1wz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 00:00:21 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 56E47B81244;
	Mon, 22 Aug 2022 14:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEADAC43148;
	Mon, 22 Aug 2022 14:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661176816;
	bh=orT3QMvkSoHHqPhUrfOeoGgvMUqUg3YkbuOk1NRLzD0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AWbqZa3ljQPak3jKFSQ9qYXmSiFK4hkUob7qCQFNQAUGaf1kp6Spcd33go1QpR+uy
	 C4QENOLNHYb8BXD7FxbLFhq40cQZpByYuo34BmLObmzo0ORKUULTibjpwiak5uU1J9
	 /G+QNaQm1L6JePN9koM9Mz6rg3LH89BwWhUIfi9o2SlSCnJWsFwb1hjBLeUsF8WbFp
	 ikutXfke0k5TpTFeQaYJ+JSlGTx45Hxo7Xd6LaXx0Vuw7hgXqHFGhHG/M6FnjYiNeM
	 cyHi85/7+k/qLiXoV9UJD21wRjOIMM6oa888vL93CW3OCApUE/j9zmndxo+/GumxdH
	 ZOAVoif43f5HQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BDFF9E2A040;
	Mon, 22 Aug 2022 14:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next] Remove DECnet support from kernel
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166117681677.22523.5504877991738164971.git-patchwork-notify@kernel.org>
Date: Mon, 22 Aug 2022 14:00:16 +0000
References: <20220818004357.375695-1-stephen@networkplumber.org>
In-Reply-To: <20220818004357.375695-1-stephen@networkplumber.org>
To: Stephen Hemminger <stephen@networkplumber.org>
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
Cc: netfilter-devel@vger.kernel.org, linux-doc@vger.kernel.org, jlayton@kernel.org, razor@blackwall.org, linux-mips@vger.kernel.org, wangqing@vivo.com, paul.gortmaker@windriver.com, edumazet@google.com, nathan.fontenot@amd.com, suma.hegde@amd.com, pabeni@redhat.com, quic_neeraju@quicinc.com, imagedong@tencent.com, f.fainelli@gmail.com, lucien.xin@gmail.com, yu.c.chen@intel.com, daniel@iogearbox.net, corbet@lwn.net, damien.lemoal@opensource.wdc.com, kadlec@netfilter.org, xieyongji@bytedance.com, coreteam@netfilter.org, roopa@nvidia.com, kuba@kernel.org, bp@suse.de, bigeasy@linutronix.de, pablo@netfilter.org, sgarzare@redhat.com, petrm@nvidia.com, linuxppc-dev@lists.ozlabs.org, keescook@chromium.org, paulmck@kernel.org, yuzhe@nfschina.com, vilhelm.gray@gmail.com, npiggin@gmail.com, hdegoede@redhat.com, kuniyu@amazon.com, shakeelb@google.com, songmuchun@bytedance.com, alexandre.ghiti@canonical.com, wangyuweihx@gmail.com, jgross@suse.com, tsbogend@alpha.franken.de, hmukos@yandex-team.ru,
  martin.petersen@oracle.com, netdev@vger.kernel.org, dsahern@kernel.org, rdunlap@infradead.org, fw@strlen.de, linux-kernel@vger.kernel.org, chuck.lever@oracle.com, arnd@arndb.de, atenart@kernel.org, akpm@linux-foundation.org, pali@kernel.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello:

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Wed, 17 Aug 2022 17:43:21 -0700 you wrote:
> DECnet is an obsolete network protocol that receives more attention
> from kernel janitors than users. It belongs in computer protocol
> history museum not in Linux kernel.
> 
> It has been "Orphaned" in kernel since 2010. The iproute2 support
> for DECnet was dropped in 5.0 release. The documentation link on
> Sourceforge says it is abandoned there as well.
> 
> [...]

Here is the summary with links:
  - [net-next] Remove DECnet support from kernel
    https://git.kernel.org/netdev/net-next/c/1202cdd66531

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


