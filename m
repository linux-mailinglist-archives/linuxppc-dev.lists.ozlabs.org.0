Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9DC139280
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 14:52:00 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xFPn5tpSzDqN3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 00:51:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=Cf8izTSc; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xFKv3Xp1zDqDD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 00:48:34 +1100 (AEDT)
Received: from [192.168.1.20] (cpe-24-28-70-126.austin.res.rr.com
 [24.28.70.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AFDE72081E;
 Mon, 13 Jan 2020 13:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578923312;
 bh=ojdxLNukr1LCuPlXur/rQUkQqfSv9iZSOs2G8sP4wwY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Cf8izTScmMR/NCG22p5t4DbZrq1Zineva+mN68neN2TkESLjmmSXAShR876GXOsVv
 wYXJIQEZA7UYf0AHhrx7VHZnhpW1pWOLpkXbNqCCfutGZCS34/OqiUzKpsyhR18L56
 N2Qi8jK04c9AdLAkhWrZLnWA/rLYrgi1fMHVaBQQ=
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
To: Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Scott Wood <swood@redhat.com>, york sun
 <york.sun@nxp.com>, b08248@gmail.com
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <8736cj8rvr.fsf@mpe.ellerman.id.au>
From: Timur Tabi <timur@kernel.org>
Message-ID: <5f17b997-8a6c-841e-8868-c0877750e598@kernel.org>
Date: Mon, 13 Jan 2020 07:48:30 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <8736cj8rvr.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/13/20 6:26 AM, Michael Ellerman wrote:
> I've never heard of it, and I have no idea how to test it.
> 
> It's not used by qemu, I guess there is/was a Freescale hypervisor that
> used it.

Yes, there is/was a Freescale hypervisor that I and a few others worked 
on.  I've added a couple people on CC that might be able to tell the 
current disposition of it.

> But maybe it's time to remove it if it's not being maintained/used by
> anyone?

I wouldn't be completely opposed to that if there really are no more 
users.  There really weren't any users even when I wrote the driver.

I haven't had a chance to study the patch, but my first instinct is that 
there's got to be a better way to fix this than introducing a memcpy.
