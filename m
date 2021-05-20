Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EF138B095
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB892fWYz3f1V
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HA6pEpqr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=johan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HA6pEpqr; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB4c6KRgz3cNl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:52:16 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE10A611AB;
 Thu, 20 May 2021 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621518732;
 bh=tb813muLIdvtkuBQsEk+ZysD5iGQyfTsaX6Hfs4zPlU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HA6pEpqrRUl7cKhILqDuKlsepXsh+JJSfQwDIvw/o0Q4uzWGRIqY3xFSr2Bbc85eK
 XIIGYyQ/e7lsGYtuILwdwMkh5MCTmOXY9+IkJbUeae5AUT1pbRliYZM8EdSHBnBy/N
 JLjKvQpt2zlpm1GD90i51q40/tFdxltC9bAIchY5znU4B31qBM4ljMk0uVOihJ+r12
 IV7VoXNbZrJAoC8/3XJaiLoL+LbcPhT7kWC5cHs5whfLtiwvmc0BtTZsnFS+wNJuDZ
 hdaJG7UqHl8mLn9B7mnhXZbLmaq75TLGEdyaDZyiw7ety1/Pxad39mKMCYq7F/KEqv
 f16ltZyfntTDw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1ljj5v-0003Bd-SF; Thu, 20 May 2021 15:52:12 +0200
Date: Thu, 20 May 2021 15:52:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Xiaofei Tan <tanxiaofei@huawei.com>
Subject: Re: [PATCH 6/9] tty: hvc_console: Fix coding style issues of block
 comments
Message-ID: <YKZpi8cmH3mtXT99@hovoldconsulting.com>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
 <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
 <YKJ6ZjT8o5xJmBCr@hovoldconsulting.com>
 <e88b6fcd-bfe1-9812-905a-862825f420ce@huawei.com>
 <YKYcFfKiHT39Gyey@hovoldconsulting.com>
 <7e63a708-64c4-b369-066b-7f83d65bf178@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e63a708-64c4-b369-066b-7f83d65bf178@huawei.com>
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org,
 jirislaby@kernel.org, linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 20, 2021 at 09:21:25PM +0800, Xiaofei Tan wrote:

> > Checkpatch already has too many checks IMO and I'm a bit surprised that
> > it doesn't check this already. Perhaps it's because you used the -f to
> > run checkpatch on in-kernel code, which you should not.
> >
> >>> Second, that sentence is not capitalised so why do add a period?
> >>>
> >>
> >> How about capitalize the sentence, or just remove the period ?
> >
> > How about just leaving this unchanged?
> 
> OK
> And I will keep the patch 8/9, and combine space issues into
> one new patch, and remove the others.

Yeah, 8/9 is arguably a fix even if it's for a very minor issue
(repeated words in a comment).

It doesn't look like any of the white space issues are worth fixing,
though. Such pedantry can usually be addressed when the code in question
is being modified for other reasons.

Johan
