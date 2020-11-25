Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 029F82C412C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 14:34:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ch20n6xKDzDqlm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 00:34:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=tglx@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=zfCRgVqm; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=RVIMh+DQ; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ch1jC41hRzDqfv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 00:20:30 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1606310421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fb1yTCfVx8pU95ckndYGNJP7rgnPUEX5zBWS1/t7lBo=;
 b=zfCRgVqmQUanbSMxfM/AJBOVwzgLL+DQrzJCrYt0JDvFzGOKPG77UXL46Q+/Y0xr3vQD8c
 vcRH8CqoiNaIqybeabsAF6TpLsiPmS4Xj+ZfYrP5yjM5hmLL9arfuIJZFRn9fv7y8sQN/p
 fHmhReSvpEcJTQJKF+c2m4LXh1F5KGF6G+Nb7l5u8wgFx3fNGv99Jo/Ou3xlPK3CNCfGZV
 4eh6SQuD7NzGO2bFdt9HxPc64Wjtr+ulOR5XtvlplLP0xQw4fsmppWiq23ceve/9jlG0iJ
 TjUp/wuqXY1iAf9Ge2dpXQlO7/fdsL5h9FWyj/Gn9P2fh9t1pki7H9U36BR85Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1606310421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Fb1yTCfVx8pU95ckndYGNJP7rgnPUEX5zBWS1/t7lBo=;
 b=RVIMh+DQ2MU+geLoHmWuSvDZ1IFvbZM1Ns3HEQAkmO0PTHfdyXlwZqOtkQjMfbj9D4C0YM
 bRnfHM/KOZ1pynAw==
To: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] genirq: add an irq_create_mapping_affinity()
 function
In-Reply-To: <20201125111657.1141295-2-lvivier@redhat.com>
References: <20201125111657.1141295-1-lvivier@redhat.com>
 <20201125111657.1141295-2-lvivier@redhat.com>
Date: Wed, 25 Nov 2020 14:20:21 +0100
Message-ID: <87sg8xk1yi.fsf@nanos.tec.linutronix.de>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Marc Zyngier <maz@kernel.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, linux-pci@vger.kernel.org,
 Greg Kurz <groug@kaod.org>, linux-block@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent,

On Wed, Nov 25 2020 at 12:16, Laurent Vivier wrote:

The proper subsystem prefix is: 'genirq/irqdomain:' and the first letter
after the colon wants to be uppercase.

> This function adds an affinity parameter to irq_create_mapping().
> This parameter is needed to pass it to irq_domain_alloc_descs().

A changelog has to explain the WHY. 'The parameter is needed' is not
really useful information.

Thanks,

        tglx

