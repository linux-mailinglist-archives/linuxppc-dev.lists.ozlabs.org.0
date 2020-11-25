Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 072762C4286
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 15:57:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch3rw0NNqzDqyH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 01:57:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=maz@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=hwGOzEWe; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch3nZ34v8zDqMv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 01:54:26 +1100 (AEDT)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B2F6206B5;
 Wed, 25 Nov 2020 14:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606316063;
 bh=tHkXsp0lYry+LrxVumeVX78AT7FJzfcqs1X3jktXgN0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hwGOzEWeVZia6AU1cymJ7WZ6js+joX28GR1U4JTqy6BD2mMckiMcBOF+CYurZK7L6
 bDuWwL4nLFxty8Yusdfg28cQQnzAO94P28hR0leptdyJinLMFTS5DOpfa4YEdDhCmn
 wR5nipU8wsdwL033EwxZO7YN0B+/2gJtXHeI6BHQ=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <maz@kernel.org>)
 id 1khwBZ-00DY7S-Fm; Wed, 25 Nov 2020 14:54:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 25 Nov 2020 14:54:21 +0000
From: Marc Zyngier <maz@kernel.org>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH v2 1/2] genirq: add an irq_create_mapping_affinity()
 function
In-Reply-To: <e32641f7-0993-8923-7d74-5ac57a60f10d@redhat.com>
References: <20201125111657.1141295-1-lvivier@redhat.com>
 <20201125111657.1141295-2-lvivier@redhat.com>
 <87sg8xk1yi.fsf@nanos.tec.linutronix.de>
 <e32641f7-0993-8923-7d74-5ac57a60f10d@redhat.com>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <5100171ff6d4c3efffe008e1e0bf3707@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: lvivier@redhat.com, tglx@linutronix.de,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, paulus@samba.org,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 benh@kernel.crashing.org, mst@redhat.com, groug@kaod.org, hch@lst.de,
 mpe@ellerman.id.au
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
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

On 2020-11-25 14:09, Laurent Vivier wrote:
> On 25/11/2020 14:20, Thomas Gleixner wrote:
>> Laurent,
>> 
>> On Wed, Nov 25 2020 at 12:16, Laurent Vivier wrote:
>> 
>> The proper subsystem prefix is: 'genirq/irqdomain:' and the first 
>> letter
>> after the colon wants to be uppercase.
> 
> Ok.
> 
>>> This function adds an affinity parameter to irq_create_mapping().
>>> This parameter is needed to pass it to irq_domain_alloc_descs().
>> 
>> A changelog has to explain the WHY. 'The parameter is needed' is not
>> really useful information.
>> 
> 
> The reason of this change is explained in PATCH 2.
> 
> I have two patches, one to change the interface with no functional
> change (PATCH 1) and
> one to fix the problem (PATCH 2). Moreover they don't cover the same 
> subsystems.
> 
> I can either:
> - merge the two patches
> - or make a reference in the changelog of PATCH 1 to PATCH 2
>   (something like "(see folowing patch "powerpc/pseries: pass MSI 
> affinity to
>    irq_create_mapping()")")
> - or copy some information from PATCH 2
>   (something like "this parameter is needed by rtas_setup_msi_irqs()
> to pass the affinity
>    to irq_domain_alloc_descs() to fix multiqueue affinity")
> 
> What do you prefer?

How about something like this for the first patch:

"There is currently no way to convey the affinity of an interrupt
  via irq_create_mapping(), which creates issues for devices that
  expect that affinity to be managed by the kernel.

  In order to sort this out, rename irq_create_mapping() to
  irq_create_mapping_affinity() with an additional affinity parameter
  that can conveniently passed down to irq_domain_alloc_descs().

  irq_create_mapping() is then re-implemented as a wrapper around
  irq_create_mapping_affinity()."

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
