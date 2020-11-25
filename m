Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 498772C3A22
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 08:32:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgszt2FHFzDqsd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 18:32:42 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=dsl+i09R; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=dsl+i09R; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgsxC5gLMzDqMd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 18:30:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606289420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3DSrYj+gqE7fmTGGcLGiNd0q/oeDN1ODN+0Xluwkpc=;
 b=dsl+i09RZAdJ1lSShUGzc/UxlseV3QU7WIkHDBRIP0wK9BkkmrYpsgoEqc/RL5YWGYwAdM
 0NnM01Qk53ZU7gI4gJvvF+mgPPToSU4g0GH+I/LEwdVNqQUCPSkfDYmz0H9erALoryJR+0
 f2/9duKW/EdZ8O2LDeJG7+0wI9OCPUY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606289420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D3DSrYj+gqE7fmTGGcLGiNd0q/oeDN1ODN+0Xluwkpc=;
 b=dsl+i09RZAdJ1lSShUGzc/UxlseV3QU7WIkHDBRIP0wK9BkkmrYpsgoEqc/RL5YWGYwAdM
 0NnM01Qk53ZU7gI4gJvvF+mgPPToSU4g0GH+I/LEwdVNqQUCPSkfDYmz0H9erALoryJR+0
 f2/9duKW/EdZ8O2LDeJG7+0wI9OCPUY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-HGAXgTQcP7C0r00a5_OLvQ-1; Wed, 25 Nov 2020 02:30:15 -0500
X-MC-Unique: HGAXgTQcP7C0r00a5_OLvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 161A618C89E0;
 Wed, 25 Nov 2020 07:30:13 +0000 (UTC)
Received: from [10.36.113.83] (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDFAF10023B0;
 Wed, 25 Nov 2020 07:30:06 +0000 (UTC)
Subject: Re: [PATCH 1/2] genirq: add an affinity parameter to
 irq_create_mapping()
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20201124200308.1110744-1-lvivier@redhat.com>
 <20201124200308.1110744-2-lvivier@redhat.com>
 <87h7pel7ng.fsf@nanos.tec.linutronix.de>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <8e9002d0-086f-1e7d-4b94-45b6d49f7917@redhat.com>
Date: Wed, 25 Nov 2020 08:30:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87h7pel7ng.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
 linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/11/2020 23:19, Thomas Gleixner wrote:
> On Tue, Nov 24 2020 at 21:03, Laurent Vivier wrote:
>> This parameter is needed to pass it to irq_domain_alloc_descs().
>>
>> This seems to have been missed by
>> o06ee6d571f0e ("genirq: Add affinity hint to irq allocation")
> 
> No, this has not been missed at all. There was and is no reason to do
> this.
> 
>> This is needed to implement proper support for multiqueue with
>> pseries.
> 
> And because pseries needs this _all_ callers need to be changed?
> 
>>  123 files changed, 171 insertions(+), 146 deletions(-)
> 
> Lots of churn for nothing. 99% of the callers will never need that.
> 
> What's wrong with simply adding an interface which takes that parameter,
> make the existing one an inline wrapper and and leave the rest alone?

Nothing. I'm going to do like that.

Thank you for your comment.

Laurent

