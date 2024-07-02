Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FED6923CCB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 13:46:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WD1Mv18bhz3fx1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 21:46:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WD1MT5VKYz3fqs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 21:46:12 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 385AC68AA6; Tue,  2 Jul 2024 13:46:02 +0200 (CEST)
Date: Tue, 2 Jul 2024 13:46:01 +0200
From: Christoph Hellwig <hch@lst.de>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 06/13] mm/memory: Add dax_insert_pfn
Message-ID: <20240702114601.GA15426@lst.de>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com> <50013c1ee52b5bb1213571bff66780568455f54c.1719386613.git-series.apopple@nvidia.com> <eb3120fd-44db-4cb3-af3c-a13f9e71380b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb3120fd-44db-4cb3-af3c-a13f9e71380b@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, linux-doc@vger.kernel.org, djwong@kernel.org, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, Alistair Popple <apopple@nvidia.com>, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 02, 2024 at 09:18:31AM +0200, David Hildenbrand wrote:
> We have this comparably nasty vmf_insert_mixed() that FS dax abused to 
> insert into !VM_MIXED VMAs. Is that abuse now stopping and are there maybe 
> ways to get rid of vmf_insert_mixed()?

Unfortunately it is also used by a few drm drivers and not just DAX.
