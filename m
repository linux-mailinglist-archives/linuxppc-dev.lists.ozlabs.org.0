Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B941B76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 07:08:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nvz04Q4jzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 15:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=anastas.io
 (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.b="U4/Qm/UW"; 
 dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NvwG3Ny1zDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 15:06:06 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id AB5D37EB12;
 Wed, 12 Jun 2019 00:05:33 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1560315934; bh=JmNQa/c6KbLI6KKibyDrhrsAHL3+uNQDIHUuyhhQQ4U=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=U4/Qm/UWvScJN/IWxZhgSNHF3Q07Nz/7V3Ii73nTuAxcbo4Wu0urVflK5x0y0T+EF
 H1xCuzERJQulHThWZbBK+7okArd1iOqWsqB1uqX16IqPq5b0R4d7xdqtgUxU2cogeF
 dtH7uWZlss7v4lnZmJ0ogvhCd5v5LfUwNXCWqcvujemb23sa5aYDBpQ9725kVb9YWD
 SHAPmQJJ96beVBw4ZKCfPIcvW850vkxR3RrYt1ZPYgaI/hq/yjvcFuE84idQnZ85Y8
 bkW8ppO9kMOZrNTywWX8HjBNNd4geSOj7g0gNaJPhBxgG4BW7s1DnCwcqOLfC2ien8
 m99wIUVgw6k0w==
Subject: Re: [PATCH kernel v3 0/3] powerpc/ioda2: Yet another attempt to allow
 DMA masks between 32 and 59
From: Shawn Anastasio <shawn@anastas.io>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20190530070355.121802-1-aik@ozlabs.ru>
 <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
Message-ID: <1e3de274-aec4-6e69-5e37-be15ea888deb@anastas.io>
Date: Wed, 12 Jun 2019 00:05:31 -0500
MIME-Version: 1.0
In-Reply-To: <deb34b5f-9472-2156-e58d-8dbcb0a38979@anastas.io>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, Oliver O'Halloran <oohall@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 6/5/19 11:11 PM, Shawn Anastasio wrote:
> On 5/30/19 2:03 AM, Alexey Kardashevskiy wrote:
>> This is an attempt to allow DMA masks between 32..59 which are not large
>> enough to use either a PHB3 bypass mode or a sketchy bypass. Depending
>> on the max order, up to 40 is usually available.
>>
>>
>> This is based on v5.2-rc2.
>>
>> Please comment. Thanks.
> 
> I have tested this patch set with an AMD GPU that's limited to <64bit
> DMA (I believe it's 40 or 42 bit). It successfully allows the card to
> operate without falling back to 32-bit DMA mode as it does without
> the patches.
> 
> Relevant kernel log message:
> ```
> [    0.311211] pci 0033:01     : [PE# 00] Enabling 64-bit DMA bypass
> ```
> 
> Tested-by: Shawn Anastasio <shawn@anastas.io>

After a few days of further testing, I've started to run into stability
issues with the patch applied and used with an AMD GPU. Specifically,
the system sometimes spontaneously crashes. Not just EEH errors either,
the whole system shuts down in what looks like a checkstop.

Perhaps some subtle corruption is occurring?
