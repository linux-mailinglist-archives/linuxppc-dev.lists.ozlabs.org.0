Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA53C139ED2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 02:16:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xXbc0Bq2zDqMV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jan 2020 12:16:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=timur@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=xjQfoiih; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xXWv0zrjzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2020 12:13:15 +1100 (AEDT)
Received: from [192.168.1.20] (cpe-24-28-70-126.austin.res.rr.com
 [24.28.70.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7143207FF;
 Tue, 14 Jan 2020 01:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578964392;
 bh=0gpl/fZLuDcM6R2f88rRQhFEHgQPzojGamoAcz0JAow=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=xjQfoiihel1d1unJsEk43pkau7rk+TfPg80uNoSkr/zwFGN9pBWyGB4AsRfz+zR4o
 xlhYWpnWc49QiHgpWj7zDCvbJaVzR/qlB8fXR5X48NAHcgX7mv6lujb6d5pdXh7Yu8
 Sqpm1pJs28C298U+aQwAlLGph8h7xjwB68TqlgnI=
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
From: Timur Tabi <timur@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
Message-ID: <726a71ce-b9e6-cec4-a4d0-ec6a8c604989@kernel.org>
Date: Mon, 13 Jan 2020 19:13:10 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:68.0)
 Gecko/20100101 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: b08248@gmail.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jslaby@suse.com>, york sun <york.sun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>, swood@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/13/20 7:10 PM, Timur Tabi wrote:
> 
> I would prefer that ev_byte_channel_send() is updated to access only 
> 'count' bytes.  If that means adding a memcpy to the 
> ev_byte_channel_send() itself, then so be it.  Trying to figure out how 
> to stuff n bytes into 4 32-bit registers is probably not worth the effort.

Looks like ev_byte_channel_receive() has the same bug, but in reverse.
