Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB54382F6B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkLkn0w86z304C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 00:15:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AH+rpM7l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=johan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=AH+rpM7l; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkLkM3y0Gz2ym4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 00:15:07 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A05EF616ED;
 Mon, 17 May 2021 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621260904;
 bh=UiFMXSRuVmmK2AdeQooSJ00/WD/WTu2bQsu3juWAFvs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AH+rpM7lRDsvRy6hN78bapKSTbRFQ00On0HKFsS5K+/6NBDpEn5A7Hp0sWXd0yTvs
 hg59vnRTZeii/H24mf16Pk3JU+bXeZ54mSpxAHbRC7t1ocjoo/5u6CEVtNtK6VhAlR
 PBQdESytERsO/EhkyqWivLo5nzV9JJ5nIb+KEQojqBNasY3NEcWm0uLSrs5p1aYhu5
 mommExuT2XSTbCTC7iCUz5NUg2H19kPkZ15oPTI4p+KdczS1bYS8SKvReKoVTQ0yHH
 qZl9qS/FgvWdUy89AIVHEHrTE/Tez2NPt/w3EcDMqFGieF3yDysS5QyWP2sslOKAY8
 t8R0wMW40VbHw==
Received: from johan by xi.lan with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1lie1O-0004IP-HI; Mon, 17 May 2021 16:15:03 +0200
Date: Mon, 17 May 2021 16:15:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Xiaofei Tan <tanxiaofei@huawei.com>
Subject: Re: [PATCH 6/9] tty: hvc_console: Fix coding style issues of block
 comments
Message-ID: <YKJ6ZjT8o5xJmBCr@hovoldconsulting.com>
References: <1621233433-27094-1-git-send-email-tanxiaofei@huawei.com>
 <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621233433-27094-7-git-send-email-tanxiaofei@huawei.com>
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

On Mon, May 17, 2021 at 02:37:10PM +0800, Xiaofei Tan wrote:
> Fix coding style issues of block comments, reported by checkpatch.pl.
> Besides, add a period at the end of the sentenses.
> 
> Signed-off-by: Xiaofei Tan <tanxiaofei@huawei.com>
> ---
>  drivers/tty/hvc/hvc_console.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.c
> index 39018e5..a61cdf0 100644
> --- a/drivers/tty/hvc/hvc_console.c
> +++ b/drivers/tty/hvc/hvc_console.c
> @@ -177,7 +177,8 @@ static void hvc_console_print(struct console *co, const char *b,
>  			r = cons_ops[index]->put_chars(vtermnos[index], c, i);
>  			if (r <= 0) {
>  				/* throw away characters on error
> -				 * but spin in case of -EAGAIN */
> +				 * but spin in case of -EAGAIN.
> +				 */

How is this an improvement? First, the multi-line comment style is

	/*
	 * ...
	 */

Second, that sentence is not capitalised so why do add a period?

Third, why are you sending checkpatch.pl cleanups for files outside of
staging?

Unless doing some real changes to the files in question as well this is
mostly just churn and noise that makes it harder to backport fixes and
do code forensics for no real gain.

Greg may disagree, but I don't think we should be encouraging this kind
of patches.

Johan
