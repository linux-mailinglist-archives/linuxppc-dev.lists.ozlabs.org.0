Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4032C33C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 23:21:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cgdm91WCRzDqWt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 09:21:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=193.142.43.55;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=KTCOU6z7; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=r3f45/W7; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cgdk041qHzDqWX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 09:19:52 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606256388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQPfZ1J61H/ekBBAaR7V+BMvtX4EMI5nVnNHoIml4cY=;
 b=KTCOU6z7nYzCZBSY4aJF/Aw1YsI/0XmAB81NTW165bZxAvN6oPmLaSaBFZhUZVWjynlOxq
 nCqWsnt4RieChFXuP867sMeXaPnmW8u9fsV/Gbn1BRdJFB0VNGb0IMyJuyKWV5fpQyC6Jt
 Q2+/iL9J5edexGyDWyELgePpPZ/YShwU3DYFxcjZYOgjnfc4gYsnB7RdcnNPrWff7unbZG
 ZaY9pqTia2ITN3vQpLhyzkscxHZNhl11PdmcdDEZzzZQZGjxDtppP10EiOsvCL4XOkbx9r
 wAODJhjVw1jxFk0zsJcwnnxhVVX+iuhSgj/FNYp2v3UlVTFEEzGMaR8nasrQfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606256388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UQPfZ1J61H/ekBBAaR7V+BMvtX4EMI5nVnNHoIml4cY=;
 b=r3f45/W7npRZRZ1ON6VohbAgkqBJpwE8zrsNWH62oAgAok6llT9gv4Vwh4nOwx5LB/Q3g3
 Ri3BgRrqGnP3aaDw==
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] genirq: add an affinity parameter to
 irq_create_mapping()
In-Reply-To: <20201124200308.1110744-2-lvivier@redhat.com>
References: <20201124200308.1110744-1-lvivier@redhat.com>
 <20201124200308.1110744-2-lvivier@redhat.com>
Date: Tue, 24 Nov 2020 23:19:47 +0100
Message-ID: <87h7pel7ng.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 linux-pci@vger.kernel.org, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Marc Zyngier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 24 2020 at 21:03, Laurent Vivier wrote:
> This parameter is needed to pass it to irq_domain_alloc_descs().
>
> This seems to have been missed by
> o06ee6d571f0e ("genirq: Add affinity hint to irq allocation")

No, this has not been missed at all. There was and is no reason to do
this.

> This is needed to implement proper support for multiqueue with
> pseries.

And because pseries needs this _all_ callers need to be changed?

>  123 files changed, 171 insertions(+), 146 deletions(-)

Lots of churn for nothing. 99% of the callers will never need that.

What's wrong with simply adding an interface which takes that parameter,
make the existing one an inline wrapper and and leave the rest alone?

Thanks,

        tglx



