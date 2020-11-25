Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFA72C4295
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 16:06:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch43Q2LsxzDqBv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 02:06:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=lvivier@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=cLSX/4Ad; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=cLSX/4Ad; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch3wV59q7zDqyZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 02:00:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606316421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CXMNoli6SWbemBse5ozpvpLatWo5IkE/EXXw6CqrOI=;
 b=cLSX/4AdkVKja0n2iuQum+YO5VlhCX54CB/0Bikt+e1NDKJTrnp65unQRc7He2ni6dpmv4
 PUa9ejDVU2H+Uq5FDdH1i9nw91j/iq4eJV1eiGypyY0yLJsi/fyw4wiMPKe2awzloxiHz4
 DP0eC8H4OaVhggmOZ8arLNZWThhlzIs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606316421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+CXMNoli6SWbemBse5ozpvpLatWo5IkE/EXXw6CqrOI=;
 b=cLSX/4AdkVKja0n2iuQum+YO5VlhCX54CB/0Bikt+e1NDKJTrnp65unQRc7He2ni6dpmv4
 PUa9ejDVU2H+Uq5FDdH1i9nw91j/iq4eJV1eiGypyY0yLJsi/fyw4wiMPKe2awzloxiHz4
 DP0eC8H4OaVhggmOZ8arLNZWThhlzIs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-kdgw0Nc4PcC7oVvvUUP0EQ-1; Wed, 25 Nov 2020 10:00:17 -0500
X-MC-Unique: kdgw0Nc4PcC7oVvvUUP0EQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 633E71E7CF;
 Wed, 25 Nov 2020 15:00:15 +0000 (UTC)
Received: from [10.36.113.83] (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 822A019D61;
 Wed, 25 Nov 2020 15:00:04 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] genirq: add an irq_create_mapping_affinity()
 function
To: Marc Zyngier <maz@kernel.org>
References: <20201125111657.1141295-1-lvivier@redhat.com>
 <20201125111657.1141295-2-lvivier@redhat.com>
 <87sg8xk1yi.fsf@nanos.tec.linutronix.de>
 <e32641f7-0993-8923-7d74-5ac57a60f10d@redhat.com>
 <5100171ff6d4c3efffe008e1e0bf3707@kernel.org>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <84cdd8d0-8b8f-cc8e-9672-2661f6377114@redhat.com>
Date: Wed, 25 Nov 2020 16:00:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <5100171ff6d4c3efffe008e1e0bf3707@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Greg Kurz <groug@kaod.org>,
 linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/11/2020 15:54, Marc Zyngier wrote:
> On 2020-11-25 14:09, Laurent Vivier wrote:
>> On 25/11/2020 14:20, Thomas Gleixner wrote:
>>> Laurent,
>>>
>>> On Wed, Nov 25 2020 at 12:16, Laurent Vivier wrote:
>>>
>>> The proper subsystem prefix is: 'genirq/irqdomain:' and the first letter
>>> after the colon wants to be uppercase.
>>
>> Ok.
>>
>>>> This function adds an affinity parameter to irq_create_mapping().
>>>> This parameter is needed to pass it to irq_domain_alloc_descs().
>>>
>>> A changelog has to explain the WHY. 'The parameter is needed' is not
>>> really useful information.
>>>
>>
>> The reason of this change is explained in PATCH 2.
>>
>> I have two patches, one to change the interface with no functional
>> change (PATCH 1) and
>> one to fix the problem (PATCH 2). Moreover they don't cover the same subsystems.
>>
>> I can either:
>> - merge the two patches
>> - or make a reference in the changelog of PATCH 1 to PATCH 2
>>   (something like "(see folowing patch "powerpc/pseries: pass MSI affinity to
>>    irq_create_mapping()")")
>> - or copy some information from PATCH 2
>>   (something like "this parameter is needed by rtas_setup_msi_irqs()
>> to pass the affinity
>>    to irq_domain_alloc_descs() to fix multiqueue affinity")
>>
>> What do you prefer?
> 
> How about something like this for the first patch:
> 
> "There is currently no way to convey the affinity of an interrupt
>  via irq_create_mapping(), which creates issues for devices that
>  expect that affinity to be managed by the kernel.
> 
>  In order to sort this out, rename irq_create_mapping() to
>  irq_create_mapping_affinity() with an additional affinity parameter
>  that can conveniently passed down to irq_domain_alloc_descs().
> 
>  irq_create_mapping() is then re-implemented as a wrapper around
>  irq_create_mapping_affinity()."

It looks perfect. I update the changelog with that.

Thanks,
Laurent

