Return-Path: <linuxppc-dev+bounces-15094-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16678CE835F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Dec 2025 22:24:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dg8Nh3FVgz2xHW;
	Tue, 30 Dec 2025 08:24:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767026343;
	cv=none; b=S//030emf7HXS0mG0dKH7gwwvRhpi76qDHdF13Wyuu7h36Kw/Y7RLNo9i/PRnFMw3h7UYLjXuUXmhyq28eJUxHDJisc23CkIRolcx5FFmkBsCMqIDcKp0hkutmElPMDZIsTrgkJXq40IN9QxGLuvA3zEeayKoHJLLCs8jW+i6HdQ1v0MXLHmA/tujs8Tr84U6ENnrQkoJHoCv+s7yBNbx4ukLQlcgHaQeW1sbh60Zp4kcr/GTESZmFca/+AumQ5M7EPwwkZg4+bbOj7+37OFdnOAas2osZKuUoFSA4VxXMR4kfzRD2y87H1zuPeGi0mpZJOVOCuOujNmoAW6SN1/Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767026343; c=relaxed/relaxed;
	bh=ZgWzdiycLWXtNP/ypbyhFNU1Abco6QZKQ+FTqiuFB98=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=G1cNdRekrW7o+oRZXsf+NYk65EBljjdWJ7oKRuVGkVEXnHY3R0zbJh2dbUzyCk6zIpPUcN0pTrkNLncRZUjgbs+kjCJPS6D8RlyHdzH0QKG3uwwtqyTN0IIay3H3LpyspEc75MKeLJiTYCRi8TQMmR8+WeNtXo6g9mMQhQ5wWMCauzqGKdzfpxyd6FIhPucq3WYUYUFSY3ynJRh99hcgAJJTcr1uyn58106154DY9ecSNCVn+BqhD9Nd8/fHRRomJ4MrrHcUPVTGbBIXZ69Gm/CiY+NE4rx3cq0DYELscBX0QpNPfYsVaSuWwUtR3LxrR6PwleWieYso+RAQc8thIg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HLkNdk4h; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=healgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HLkNdk4h;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=healgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dg23p3wBTz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Dec 2025 03:39:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E6C76000A;
	Mon, 29 Dec 2025 16:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B5B3C4CEF7;
	Mon, 29 Dec 2025 16:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767026339;
	bh=GpifLfwkiu9eoC3V+KocP5lCF2mgL1SywA1OCMccwi8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HLkNdk4hdwpfIXAI2Ox8hJv88WpG39J80SwhesPDoJ8n+Bzn38A0UaHPEnUuOMeVU
	 BvWpV7oD+nueOW4XtOhACKEFN0CB5X2IQ9kpSGPrJSGJLhgrV2OHwlFEhhsgQBJRnN
	 RSpc353okdJRve6qkaSCdQC8AQouDVQ/5FHMdvQ9dWGnzY7hjxDfq4BTxCRGeSyOFU
	 uefrw/XXHOYS++YnbEK0t6qyqtfM6vWkI/sJ/VYuPA+aStojG6sWrdmHvOs4a14SjF
	 +nUh2sdJbwKuRKX2QXYtz6rZzlBNGXC3VDf/nguI5vBfyVxxZQE7Q9SNd8kp4/SLz0
	 MQXpxA7/s5ywg==
Date: Mon, 29 Dec 2025 10:38:58 -0600
From: Bjorn Helgaas <healgaas@kernel.org>
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Michal Hocko <mhocko@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI: pnv_php: add WQ_PERCPU to alloc_workqueue users
Message-ID: <20251229163858.GA63361@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251107143335.242342-1-marco.crivellari@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 07, 2025 at 03:33:35PM +0100, Marco Crivellari wrote:
> Currently if a user enqueues a work item using schedule_delayed_work() the
> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
> This lack of consistency cannot be addressed without refactoring the API.
> 
> alloc_workqueue() treats all queues as per-CPU by default, while unbound
> workqueues must opt-in via WQ_UNBOUND.
> 
> This default is suboptimal: most workloads benefit from unbound queues,
> allowing the scheduler to place worker threads where they’re needed and
> reducing noise when CPUs are isolated.
> 
> This continues the effort to refactor workqueue APIs, which began with
> the introduction of new workqueues and a new alloc_workqueue flag in:
> 
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
> 
> This change adds a new WQ_PERCPU flag to explicitly request
> alloc_workqueue() to be per-cpu when WQ_UNBOUND has not been specified.
> 
> With the introduction of the WQ_PERCPU flag (equivalent to !WQ_UNBOUND),
> any alloc_workqueue() caller that doesn’t explicitly specify WQ_UNBOUND
> must now use WQ_PERCPU.
> 
> Once migration is complete, WQ_UNBOUND can be removed and unbound will
> become the implicit default.

Thanks for these patches.  We have:

  [PATCH] PCI: endpoint: add WQ_PERCPU to alloc_workqueue users
  [PATCH] PCI: endpoint: epf-mhi: add WQ_PERCPU to alloc_workqueue users
  [PATCH] PCI: endpoint: pci-epf-test: add WQ_PERCPU to alloc_workqueue users
  [PATCH] PCI: pnv_php: add WQ_PERCPU to alloc_workqueue users
  [PATCH] PCI: shpchp: add WQ_PERCPU to alloc_workqueue users
  [PATCH] PCI: endpoint: replace use of system_wq with system_percpu_wq

IIUC these are all part of the same effort to refactor the workqueue
API and don't really have anything to do with the endpoint or hotplug
drivers themselves.

So I put these all on pci/workqueue and squashed the WQ_PERCPU patches
together because they do the same thing, they have the same commit
log, and there's not really any point in reviewing them separately.

> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index c5345bff9a55..35f1758126c6 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -802,7 +802,7 @@ static struct pnv_php_slot *pnv_php_alloc_slot(struct device_node *dn)
>  	}
>  
>  	/* Allocate workqueue for this slot's interrupt handling */
> -	php_slot->wq = alloc_workqueue("pciehp-%s", 0, 0, php_slot->name);
> +	php_slot->wq = alloc_workqueue("pciehp-%s", WQ_PERCPU, 0, php_slot->name);
>  	if (!php_slot->wq) {
>  		SLOT_WARN(php_slot, "Cannot alloc workqueue\n");
>  		kfree(php_slot->name);
> -- 
> 2.51.1
> 

