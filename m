Return-Path: <linuxppc-dev+bounces-12574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7178EB9E62D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 11:34:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXT7t0Shxz2yrP;
	Thu, 25 Sep 2025 19:34:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758792873;
	cv=none; b=nSCpbhie/zX/nAxuWgs0xTYXXyc2bxVPdNsrGsd1ckaQ6lIPX/Oi6yLnMuv1cF3boLZAQFeawMe2Q1qEhVwZeQ2Uz3LHfXlmf4Ku2YL4GSUSlgly7jein+Yrxp33QbLZ72HuBcIVgTQdzCEfIV5kUHoa1qpVz/I2fSI1e7NErjNzFLbD5GIlGoiHBI4lHmrwAbhhDV0WgmQtJ/a2EPjbhEkGQiC5/faQgC1QVAwaiAZioPX0Us3NpjRIcVy18COwepGUQ4TWMn9iz5PBfojpG+sn0I9zKS1V7zP2aSw2xwOeAHkvLgoFaMIB3jviK0c86KMuBxhgb84Xg0QwlYaJDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758792873; c=relaxed/relaxed;
	bh=hsqWIMgXNh+XoIi8h5OXkdsE3PTVEf/A55fR6b7S5b8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V252je60s68dBCRfIsbJGJabjcZK5Cihx7wJB1VvY4uXMckHPb24xNQNPyMXglVR0uTifzLaH7ThqLhx+JVskrjk/3ip2sqF5X8LTOVz6lP0nUqQS6mGBFHZPK6P9NFIwoYgMuy2kEr9S3Lx2U/AcI4M6tMFXbipN+Sip6IRJ5DOnkpzXEGCfBlsN6ml+AAJVOlDxyh2tN3Xy3MI7Ar/o1opROizeDoBEyB53iVaFjnVjiA+HujQs4NFoUXgCb6XqIxQctb6UiPEU2DPTAm3SRlzqIO8MYiVlUsof9RDlu3kfImPV0NzyybW6Q/AbHTaozta1sN/UahqsFj42bKdTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j9C1R7dT; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j9C1R7dT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXT7r1TX5z2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 19:34:32 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C040A43DCA;
	Thu, 25 Sep 2025 09:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D08C4CEF0;
	Thu, 25 Sep 2025 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758792869;
	bh=zhLCyo5R7EKVDWnkns2gJ5vK7ZjyanVB4ZoLdpUCNSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j9C1R7dTphqDn936rCHEjvRdwp1C6POkkYrek+iR0jbe0WP7/KvUswV9j3pvP1Qfu
	 L3WSYVA5WXLdVBthtQVsSMEzCHT6sjwyhnIkN3b/rCNQvAwE3r2IVzHQKGc727LYaW
	 vLFHnSIeyVM6WZxtbHwyNAByS1jrPpmH/vLsi7lXUpbqtboZ50mFJ1si4fIFbetccT
	 TM9Sf/13LEgKptpT3pjaWkR1sLsFPBR8UZY18Ittvsl9LRcfmwiW3HjrOP+rBVMR15
	 6nm5DCjweITgPz6MKF0N7alTBx6yt5GNhpJSfEyi82kHOW3Bw+bzoDbm0g7z26/F2E
	 ccH+/s75kvIAg==
Date: Thu, 25 Sep 2025 12:34:20 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Donet Tom <donettom@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH 1/2] drivers/base/node: merge register_one_node() and
 register_node() to a single function.
Message-ID: <aNUMnK23qKTjgEdO@kernel.org>
References: <cover.1758736423.git.donettom@linux.ibm.com>
 <40257b5228dec05e5b252f02438608eb8d681a2d.1758736423.git.donettom@linux.ibm.com>
 <0de65980-4333-434a-ae7d-2b7be46c2cca@redhat.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0de65980-4333-434a-ae7d-2b7be46c2cca@redhat.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 25, 2025 at 10:54:07AM +0200, David Hildenbrand wrote:
> On 24.09.25 20:40, Donet Tom wrote:
> > register_one_node() and register_node() are small functions.
> > This patch merges them into a single function named register_node()
> > to improve code readability.
> > 
> > No functional changes are introduced.
> > 
> > Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> > ---
> 
> [...]
> 
> >   /**
> >    * unregister_node - unregister a node device
> >    * @node: node going away
> > @@ -869,7 +842,13 @@ void register_memory_blocks_under_node_hotplug(int nid, unsigned long start_pfn,
> >   }
> >   #endif /* CONFIG_MEMORY_HOTPLUG */
> > -int register_one_node(int nid)
> > +/*
> 
> We can directly convert this to proper kernel doc by using /**
> 
> > + * register_node - Setup a sysfs device for a node.
> > + * @nid - Node number to use when creating the device.
> > + *
> > + * Initialize and register the node device.
> 
> and briefly describing what the return value means
> 
> "Returns 0 on success, ..."

For kernel-doc it should be

Return: 0 on success, ...

> 
> > + */
> > +int register_node(int nid)
> >   {
> >   	int error;
> >   	int cpu;
> > @@ -880,14 +859,23 @@ int register_one_node(int nid)
> >   		return -ENOMEM;
> >   	INIT_LIST_HEAD(&node->access_list);
> > -	node_devices[nid] = node;
> > -	error = register_node(node_devices[nid], nid);
> > +	node->dev.id = nid;
> > +	node->dev.bus = &node_subsys;
> > +	node->dev.release = node_device_release;
> > +	node->dev.groups = node_dev_groups;
> > +
> > +	error = device_register(&node->dev);
> >   	if (error) {
> > -		node_devices[nid] = NULL;
> 
> Wondering why we did have this temporary setting of the node_devices[] in
> there. But I cannot immediately spot why it was required.

register_cpu_under_node() references node_devices, so that assignment can
be moved just before the loop that adds CPUs to node.
 
> -- 
> Cheers
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

