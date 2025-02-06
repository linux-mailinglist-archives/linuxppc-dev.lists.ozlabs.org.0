Return-Path: <linuxppc-dev+bounces-5902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EA0A2AA16
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Feb 2025 14:38:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpdTP4q7zz30CL;
	Fri,  7 Feb 2025 00:38:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738849081;
	cv=none; b=B+wwSYaVw/O+fmL87KOc1MuaCfjdYVQ+qi73zWwwtDC4Xf1xIhUDEmH04OmTXqvVXPOVjFDZKB7uWPQkAOhajJ+jnm8vPrfUWm+t2M6l3YSjVUNfvkTv/shZhUCfh9G7eJIzlTHh6k1YpdRBRAhbQxz8IEbl8OOYGBAvS8tWPpHAxfz1KmmwznE+HYNgOInIDf3iJMbv1wHvJHdy+2DpbVf+zbvA8F25cqKctbesZW+uqf7SHbGnD8HsyBPoHxRaGFQ08claOPoBma4ZsoTlAnwagXGvhTXhTzBFNic9HNnT5y+5Ja6sHqUUg5iQevczvRLpiB/IzAO92N7OCoGgCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738849081; c=relaxed/relaxed;
	bh=5N+Al59YmEDtBoKSzwKPTh6WUXLbEAKXSUpJ7QukWWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fm+2BbiNWjlzeijsu8d+FjEYbF5Yh21K3dxSD3YW7GfUOI/P8sEHkEOxh0Q9WGgeAtAF+uVD0xSH8ILLLQiqr1pzcE6TXTJtBXum2XZ/0smU1kAlIaAoA8B6t2KCe7DUgp8a4g9HLS3shFqSmU44t2vS+9rO+fH6xvliMLfX3e9IuKlOaF/daPuGeHSyJTnOiJNa2MliAWXpRVyqwtriivn2yHf34LUQGX1OVwMTav0lGu3/Q+ZPf7YHdXoOxzfunsFqLJAzMG4YNVnDcn1UzS1onkJvgLrz7fdVSAgEi5owGcwKDcx7hg4tGCPrFbEwjoztpezXWVDlGPZ6UczGOA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dv5AuJBV; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dv5AuJBV; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vgoyal@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dv5AuJBV;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dv5AuJBV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=vgoyal@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YpdTN3DSbz3089
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2025 00:37:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738849073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5N+Al59YmEDtBoKSzwKPTh6WUXLbEAKXSUpJ7QukWWw=;
	b=dv5AuJBVq2vzNPk2BWqp0H0hPwA6KyS0YqU77gNaJp3QO5ql2aVRFKSbg2BmA9p47Lgodw
	wGLvm+yTL1hgmb6cg+o6IuXdISKttoHM/p0pCqBPFjVX52KYATb06JBczmCw5XbnTPugEJ
	D4gF07wt1CdLlj0Y86jQZ0/LOyNEcfY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738849073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5N+Al59YmEDtBoKSzwKPTh6WUXLbEAKXSUpJ7QukWWw=;
	b=dv5AuJBVq2vzNPk2BWqp0H0hPwA6KyS0YqU77gNaJp3QO5ql2aVRFKSbg2BmA9p47Lgodw
	wGLvm+yTL1hgmb6cg+o6IuXdISKttoHM/p0pCqBPFjVX52KYATb06JBczmCw5XbnTPugEJ
	D4gF07wt1CdLlj0Y86jQZ0/LOyNEcfY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-537-Z1CCXbCkNJ6JlHV_rykxEg-1; Thu,
 06 Feb 2025 08:37:51 -0500
X-MC-Unique: Z1CCXbCkNJ6JlHV_rykxEg-1
X-Mimecast-MFC-AGG-ID: Z1CCXbCkNJ6JlHV_rykxEg
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A21C18DFE39;
	Thu,  6 Feb 2025 13:37:14 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.22.64.235])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4FC6618004A7;
	Thu,  6 Feb 2025 13:37:09 +0000 (UTC)
Received: by fedora.redhat.com (Postfix, from userid 1000)
	id 9E1E56AA45D; Thu,  6 Feb 2025 08:37:07 -0500 (EST)
Date: Thu, 6 Feb 2025 08:37:07 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, alison.schofield@intel.com, lina@asahilina.net,
	zhang.lyra@gmail.com, gerald.schaefer@linux.ibm.com,
	vishal.l.verma@intel.com, dave.jiang@intel.com, logang@deltatee.com,
	bhelgaas@google.com, jack@suse.cz, jgg@ziepe.ca,
	catalin.marinas@arm.com, will@kernel.org, mpe@ellerman.id.au,
	npiggin@gmail.com, dave.hansen@linux.intel.com, ira.weiny@intel.com,
	willy@infradead.org, djwong@kernel.org, tytso@mit.edu,
	linmiaohe@huawei.com, david@redhat.com, peterx@redhat.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	david@fromorbit.com, chenhuacai@kernel.org, kernel@xen0n.name,
	loongarch@lists.linux.dev, Hanna Czenczek <hreitz@redhat.com>,
	German Maglione <gmaglione@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH v6 01/26] fuse: Fix dax truncate/punch_hole fault path
Message-ID: <Z6S7A-51SdPco_3Z@redhat.com>
References: <cover.11189864684e31260d1408779fac9db80122047b.1736488799.git-series.apopple@nvidia.com>
 <bfae590045c7fc37b7ccef10b9cec318012979fd.1736488799.git-series.apopple@nvidia.com>
 <Z6NhkR8ZEso4F-Wx@redhat.com>
 <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67a3fde7da328_2d2c2942b@dwillia2-xfh.jf.intel.com.notmuch>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 05, 2025 at 04:10:15PM -0800, Dan Williams wrote:
> Vivek Goyal wrote:
> > On Fri, Jan 10, 2025 at 05:00:29PM +1100, Alistair Popple wrote:
> > > FS DAX requires file systems to call into the DAX layout prior to unlinking
> > > inodes to ensure there is no ongoing DMA or other remote access to the
> > > direct mapped page. The fuse file system implements
> > > fuse_dax_break_layouts() to do this which includes a comment indicating
> > > that passing dmap_end == 0 leads to unmapping of the whole file.
> > > 
> > > However this is not true - passing dmap_end == 0 will not unmap anything
> > > before dmap_start, and further more dax_layout_busy_page_range() will not
> > > scan any of the range to see if there maybe ongoing DMA access to the
> > > range. Fix this by passing -1 for dmap_end to fuse_dax_break_layouts()
> > > which will invalidate the entire file range to
> > > dax_layout_busy_page_range().
> > 
> > Hi Alistair,
> > 
> > Thanks for fixing DAX related issues for virtiofs. I am wondering how are
> > you testing DAX with virtiofs. AFAIK, we don't have DAX support in Rust
> > virtiofsd. C version of virtiofsd used to have out of the tree patches
> > for DAX. But C version got deprecated long time ago.
> > 
> > Do you have another implementation of virtiofsd somewhere else which
> > supports DAX and allows for testing DAX related changes?
> 
> I have personally never seen a virtiofs-dax test. It sounds like you are
> saying we can deprecate that support if there are no longer any users.
> Or, do you expect that C-virtiofsd is alive in the ecosystem?

Ashai Lina responded that they need and test DAX using libkrun.

C version of virtiofsd is now gone. We are actively working and testing
Rust version of virtiofsd. We have not been able to add DAX support to
it yet for various reasons. 

Biggest unsolved problem with viritofsd DAX mode is guest process should
get a SIGBUS if it tries to access a file beyond the file. This can happen
if file has been truncated on the host (while it is still mapped inside
the guest). 

I had tried to summarize the problem in this presentation in the section
"KVM Page fault error handling".

https://kvm-forum.qemu.org/2020/KVMForum2020_APF.pdf

This is a tricky problem to handle. Once this gets handled, it becomes
safer to use DAX with virtiofs. Otherwise you can't share the filesystem
with other guests in DAX mode and use cases are limited.

And then there are challenges at QEMU level. virtiofsd needs additional
vhost-user commands to implement DAX and these never went upstream in
QEMU. I hope these challenges are sorted at some point of time.

I think virtiofs DAX is a very cool piece of technology. I would not like
to deprecate it. It has its own problems and challenges and once we
are able to solve these, it might see wider usage/adoption.

Thanks
Vivek


