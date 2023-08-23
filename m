Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BC3785296
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 10:23:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVzkT4PGcz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 18:23:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alpha.franken.de (client-ip=193.175.24.41; helo=elvis.franken.de; envelope-from=tsbogend@alpha.franken.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 3609 seconds by postgrey-1.37 at boromir; Wed, 23 Aug 2023 18:22:59 AEST
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVzjw01gcz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 18:22:59 +1000 (AEST)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1qYiCO-00071b-00; Wed, 23 Aug 2023 09:22:40 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id E31D4C0234; Wed, 23 Aug 2023 09:22:24 +0200 (CEST)
Date: Wed, 23 Aug 2023 09:22:24 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Trevor Woerner <twoerner@gmail.com>
Subject: Re: [PATCH v3 3/4] arch/mips/configs/*_defconfig cleanup
Message-ID: <ZOWzsAHxuHQLGsEa@alpha.franken.de>
References: <20230817115017.35663-1-twoerner@gmail.com>
 <20230817115017.35663-4-twoerner@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817115017.35663-4-twoerner@gmail.com>
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
Cc: loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023 at 07:50:13AM -0400, Trevor Woerner wrote:
> Drop CONFIG_IP_NF_TARGET_CLUSTERIP from any remaining mips defconfigs as it
> was removed in commit 9db5d918e2c0 ("netfilter: ip_tables: remove clusterip
> target").
> 
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  arch/mips/configs/ip22_defconfig        | 1 -
>  arch/mips/configs/malta_defconfig       | 1 -
>  arch/mips/configs/malta_kvm_defconfig   | 1 -
>  arch/mips/configs/maltaup_xpa_defconfig | 1 -
>  arch/mips/configs/rm200_defconfig       | 1 -
>  5 files changed, 5 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
