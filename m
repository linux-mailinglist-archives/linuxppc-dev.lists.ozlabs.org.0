Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FB2139535
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 16:50:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xJ2K1xfKzDqDL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 02:50:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=LDxUG2A4; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xJ011PlRzDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 02:48:17 +1100 (AEDT)
Received: from [192.168.1.20] (cpe-24-28-70-126.austin.res.rr.com
 [24.28.70.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF6BB207FD;
 Mon, 13 Jan 2020 15:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578930494;
 bh=64Y2efURakSLcN1lwIcBrqwPysF/1NY6SU6961vQ4U0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LDxUG2A4vSZEYOIHnyY94+K3xXGkoYr/z8jCLp2hY4S+xURYXjlU+6ifHpDGe9GRZ
 R96F5O152C+D80khk3hT/J7ejEpPxWp87gRdqvAwubZ6DzY4ed1C7gI0m5YOLI1Ky+
 qqLpvdSVjiOFUCoGpCGXI7eymqBbjDDT91GLecO8=
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jslaby@suse.com>, Scott Wood <swood@redhat.com>, York Sun
 <york.sun@nxp.com>, "b08248@gmail.com" <b08248@gmail.com>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <8736cj8rvr.fsf@mpe.ellerman.id.au>
 <5f17b997-8a6c-841e-8868-c0877750e598@kernel.org>
 <47d31d84-78ed-fd90-f3d9-8ce968126497@nxp.com>
From: Timur Tabi <timur@kernel.org>
Message-ID: <40f99b1b-0fe8-70a2-66e3-f42d51af581e@kernel.org>
Date: Mon, 13 Jan 2020 09:48:12 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <47d31d84-78ed-fd90-f3d9-8ce968126497@nxp.com>
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
Cc: Diana Madalina Craciun <diana.craciun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/13/20 8:34 AM, Laurentiu Tudor wrote:
> There are a few users that I know of, but I can't tell if that's enough
> to justify keeping the driver.
> 
> [1]https://source.codeaurora.org/external/qoriq/qoriq-yocto-sdk/hypervisor/

IIRC, the driver is the only reasonable way to get a serial console from 
a guest.  So if there are users of the hypervisor, then I think there's 
a good chance at least one is using the byte channel driver.
