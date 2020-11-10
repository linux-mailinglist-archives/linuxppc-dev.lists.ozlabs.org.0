Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD452AD0F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:12:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVgb55R1szDqWL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:12:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=K06u+zu3; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVgWT0ZS5zDqNw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 19:09:41 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C4D020829;
 Tue, 10 Nov 2020 08:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604995777;
 bh=sy7QXvxUfH/3KiKO9Y6BbpTJBIkVN+fQSL9Hr6a0y/A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K06u+zu3nrS01+JWe8jentZZLcazBwFJCjZuuCpV9CCCazEU0xPJ8j9z1QmWcuYGO
 AzHgwoesnsoHQ08Feh758/mm5qI/brMyTjUzM43H3xLpIl3mFX1wCGzHHxuyUMzmTS
 al5Wn734Pi2E1ZqceeT9DcpMTp7YbwWTRztjOviM=
Date: Tue, 10 Nov 2020 09:10:34 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH V2] sched/rt, powerpc: Prepare for PREEMPT_RT
Message-ID: <X6pK+oh3XuusGVFR@kroah.com>
References: <1604995368-29649-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604995368-29649-1-git-send-email-wangqing@vivo.com>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Peter Zijlstra <peterz@infradead.org>,
 Michael Neuling <mikey@neuling.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Jordan Niethe <jniethe5@gmail.com>, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 10, 2020 at 04:02:47PM +0800, Wang Qing wrote:
> PREEMPT_RT is a separate preemption model, CONFIG_PRTTMPT will

Minor typo on this line with your config option :(

