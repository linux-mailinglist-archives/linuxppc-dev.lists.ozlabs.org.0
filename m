Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1AB38B2B8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 17:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmCrx6cZLz30Cc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 01:12:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Y/B4dHHh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=Y/B4dHHh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmCrT38Yyz2y6F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 01:11:51 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABE24600D1;
 Thu, 20 May 2021 15:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621523509;
 bh=eFI5rpQJhU6aKiz7M8+Q4aUTrQg2nZYVDF4zrydbhhI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y/B4dHHhjeBn8turYwFunjFQ9HFK+qY2IH/3HqY4hb8q9WMtZwprLoDysMYgcZUtS
 y6xZN2b0knJu6n9S9zUFRd986f66pngXR2TFF2mYYQWNy719xFTCkv2CF6EDdFhFE3
 rhzzYPLkrUs7AbwCLzko3IftEvrdeHkmWShLKk3M=
Date: Thu, 20 May 2021 17:11:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xiaofei Tan <tanxiaofei@huawei.com>
Subject: Re: [PATCH 0/9] tty: hvc_console: Fix some coding style issues
Message-ID: <YKZ8M8j5/bUJxLq5@kroah.com>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, jirislaby@kernel.org,
 linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 17, 2021 at 02:37:04PM +0800, Xiaofei Tan wrote:
> Fix some issues reported by checkpatch.pl. All of them are
> coding style issues, no function changes.
> 
> Xiaofei Tan (9):
>   tty: hvc_console: Fix spaces required around that '='
>   tty: hvc_console: Fix "foo * bar" should be "foo *bar"
>   tty: hvc_console: Remove trailing whitespace
>   tty: hvc_console: Fix issues of code indent should use tabs
>   tty: hvc_console: Delete spaces prohibited around open parenthesis '('
>     and ')'
>   tty: hvc_console: Fix coding style issues of block comments
>   tty: hvc_console: Add a blank line after declarations
>   tty: hvc_console: Remove the repeated words 'no' and 'from'
>   tty: hvc_console: Move open brace { on the previous line
> 
>  drivers/tty/hvc/hvc_console.c | 37 ++++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 15 deletions(-)

Do you use this driver?  If so, great, I'm sure there are other "real"
issues in it that need some work.  But as Johan points out, doing
drive-by checkpatch cleanups on random files that you do not use, isn't
the best thing to do.

If you just want to do this type of work, please do so in
drivers/staging/ as it is most welcome there if you wish to get involved
in kernel work to get experience before doing "real" stuff.

thanks,
g
reg k-h
