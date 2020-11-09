Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA992AB133
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 07:25:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CV1Fy5h2TzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Nov 2020 17:25:42 +1100 (AEDT)
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
 header.s=default header.b=XtcRlj+Z; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CV1DK4TgKzDqPQ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Nov 2020 17:24:15 +1100 (AEDT)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AD7A206CB;
 Mon,  9 Nov 2020 06:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604903052;
 bh=cHnOJKkHVIaTzHEI+bYdGP0PeODU7wFkgjyizlQIPVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XtcRlj+ZVRhT7Wl2ezNlbhfvLgtKIRq7mrnur2Eu1N8K3CBqnr+jjLwELgd9x/McQ
 dVBQhvMCVd2cX7EdHjuoqbmz/td2aqpkNRrmQdrxk6blX87oN+Zscz3QftR8yEWYQ+
 xvXsUdV5ZnnKOFhDfLrYyUsHxeeNZgWIf4mvUKto=
Date: Mon, 9 Nov 2020 07:24:07 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Wang Qing <wangqing@vivo.com>
Subject: Re: [PATCH] sched/rt, powerpc: Prepare for PREEMPT_RT
Message-ID: <20201109062407.GA48938@kroah.com>
References: <1604893209-18762-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604893209-18762-1-git-send-email-wangqing@vivo.com>
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
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alistair Popple <alistair@popple.id.au>,
 tglx@linutronix.de, Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 09, 2020 at 11:40:08AM +0800, Wang Qing wrote:
> Add PREEMPT_RT output to die().

That says what you did, but not why you are doing this.

Why are you doing this?  That needs to go into the changelog text.

greg k-h
