Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D0238DCCF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 May 2021 22:16:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpBT33dL6z3bvK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 06:16:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=VAGw2mZ6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpBSV4GwRz2ymb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 06:16:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
 Reply-To:Cc:Content-ID:Content-Description;
 bh=QtptusBK2DFZU5U4EUUFQ9qW5NSJ3yH22QnaKY4zaAY=; b=VAGw2mZ61u752//F59aPLNqwx4
 Pt/23nEcmrKiiB4e+miug4z5GYkHUw/B66NoVFVSEbauoH7qKPV2vYFwuyppfeWEIroo43Qci1FpX
 9k0b+zLfnStQ/VgyVPemuSiWZeVhGRu1jAGfS6UuAkSMSoHosTO6fMoMicwGFcSwXBksmBL/anjUe
 XxOH7IFliQXpCxUOphDwQ1kTRhmwRE51N+GkEWkk0V4eBzF1PfsZhjP8ve7GFvyjs0C3l/Tg4Q09H
 R+J1rzv7MjAZmDL+XIbDv76aH5JXdp+oPepa4LkCib2ABw9RFis+huEXw6xsorcSZMrQJpM8q/R4Y
 0lOEYA7Q==;
Received: from 108-90-42-56.lightspeed.sntcca.sbcglobal.net ([108.90.42.56]
 helo=[192.168.1.130])
 by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lkuVz-001kRn-AP; Sun, 23 May 2021 20:16:05 +0000
Subject: Re: [PATCH 1/1] powerpc/ps3: Fix error return code in
 ps3_register_devices()
To: Michael Ellerman <mpe@ellerman.id.au>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <20210518065853.7590-1-thunder.leizhen@huawei.com>
 <87tumxioki.fsf@mpe.ellerman.id.au>
From: Geoff Levand <geoff@infradead.org>
Message-ID: <71764790-4be0-d177-37fc-a2d91d47a0da@infradead.org>
Date: Sun, 23 May 2021 13:15:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87tumxioki.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 5/20/21 5:20 AM, Michael Ellerman wrote:
> Zhen Lei <thunder.leizhen@huawei.com> writes:
>> When call ps3_start_probe_thread() failed, further initialization should
>> be stopped and the returned error code should be propagated.
...
>> --- a/arch/powerpc/platforms/ps3/device-init.c
>>  
>>  	result = ps3_start_probe_thread(PS3_BUS_TYPE_STORAGE);
>> +	if (result < 0)
>> +		return result;
> 
> If you bail out here you skip:
> 
>>  	ps3_register_vuart_devices();
> 
> Which I suspect means there will be no console output?
> 
> Presumably the system won't boot if the probe thread fails, but it might
> at least print an oops, whereas if we return we might get nothing at
> all. Though I'm just guessing, I don't know this code that well.

That probe is for the storage devices (PS3_BUS_TYPE_STORAGE).

There are cases where the system is usable even if the storage
devices are not available, for example, when using an NFS root
filesystem.

ps3_start_probe_thread was made to be quite verbose on error
to make up for it's return value not being checked.

> Anyway please leave this code alone unless you're willing to test your
> changes, or at least provide a more thorough justification for them.

Agreed, this change should not be merged.

-Geoff
