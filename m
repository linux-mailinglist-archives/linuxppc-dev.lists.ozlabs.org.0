Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B112C4236
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:36:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3Nh5GDczDqsR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:36:20 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=NEXbUicR; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=bXADDBx/; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch2pK6fg7zDqPv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 01:10:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606313395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7x1+zQZq5AdNReGA03HZCNw2qvTVYRyYsN6XftQCxU=;
 b=NEXbUicRAKa+i1bJ0W2VHi3TH1RDv5AQejaUfVnSbgz/sC9687g2Bbe9LUI8rDlye5hL8d
 DuiusWeIlzQHHH7jCrPnSmGXJpu6ehOMCWXsGxk6nPL5eOZE8F8HlBpmfjyKkqEbv31PKB
 KC/M+W3lW0QsgkpldwuA1oolTLDYTN4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606313396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L7x1+zQZq5AdNReGA03HZCNw2qvTVYRyYsN6XftQCxU=;
 b=bXADDBx/agRl1zGw5WYFPLmJEbPiOMjh8w2JtDe769ovQsbsPN6pWDOImIKYvbO9qLOLPj
 Lp9vkfPdxleoLSxJOB0ATdo62ne8AmMSms9BhHrKgbhwF6bxxtUmwqp1JtyGASVSMRkEQz
 BFP8kXOkANm5x6fYYX/MlUga4kV5l5g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-oVkqOzzQNAWKywPe2GBTeA-1; Wed, 25 Nov 2020 09:09:52 -0500
X-MC-Unique: oVkqOzzQNAWKywPe2GBTeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D261185E482;
 Wed, 25 Nov 2020 14:09:50 +0000 (UTC)
Received: from [10.36.113.83] (ovpn-113-83.ams2.redhat.com [10.36.113.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CB195D9CA;
 Wed, 25 Nov 2020 14:09:42 +0000 (UTC)
Subject: Re: [PATCH v2 1/2] genirq: add an irq_create_mapping_affinity()
 function
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
References: <20201125111657.1141295-1-lvivier@redhat.com>
 <20201125111657.1141295-2-lvivier@redhat.com>
 <87sg8xk1yi.fsf@nanos.tec.linutronix.de>
From: Laurent Vivier <lvivier@redhat.com>
Message-ID: <e32641f7-0993-8923-7d74-5ac57a60f10d@redhat.com>
Date: Wed, 25 Nov 2020 15:09:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <87sg8xk1yi.fsf@nanos.tec.linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Marc Zyngier <maz@kernel.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, Greg Kurz <groug@kaod.org>,
 linux-block@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/11/2020 14:20, Thomas Gleixner wrote:
> Laurent,
> 
> On Wed, Nov 25 2020 at 12:16, Laurent Vivier wrote:
> 
> The proper subsystem prefix is: 'genirq/irqdomain:' and the first letter
> after the colon wants to be uppercase.

Ok.

>> This function adds an affinity parameter to irq_create_mapping().
>> This parameter is needed to pass it to irq_domain_alloc_descs().
> 
> A changelog has to explain the WHY. 'The parameter is needed' is not
> really useful information.
> 

The reason of this change is explained in PATCH 2.

I have two patches, one to change the interface with no functional change (PATCH 1) and
one to fix the problem (PATCH 2). Moreover they don't cover the same subsystems.

I can either:
- merge the two patches
- or make a reference in the changelog of PATCH 1 to PATCH 2
  (something like "(see folowing patch "powerpc/pseries: pass MSI affinity to
   irq_create_mapping()")")
- or copy some information from PATCH 2
  (something like "this parameter is needed by rtas_setup_msi_irqs() to pass the affinity
   to irq_domain_alloc_descs() to fix multiqueue affinity")

What do you prefer?

Thanks,
Laurent

