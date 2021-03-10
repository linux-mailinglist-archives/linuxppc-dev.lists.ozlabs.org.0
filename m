Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D861B3344CB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:07:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwdml6Fcpz3dBG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:07:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=142.44.231.140;
 helo=zeniv-ca.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Received: from zeniv-ca.linux.org.uk (zeniv-ca.linux.org.uk [142.44.231.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DwdmS04cXz3bVW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:07:19 +1100 (AEDT)
Received: from viro by zeniv-ca.linux.org.uk with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1lK1ia-004clg-19; Wed, 10 Mar 2021 16:29:52 +0000
Date: Wed, 10 Mar 2021 16:29:51 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 3/9] powerpc/pseries: remove the ppc-cmm file system
Message-ID: <YEjz/+HfILCUwKwb@zeniv-ca.linux.org.uk>
References: <20210309155348.974875-1-hch@lst.de>
 <20210309155348.974875-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309155348.974875-4-hch@lst.de>
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
Cc: Jason Gunthorpe <jgg@nvidia.com>, David Hildenbrand <david@redhat.com>,
 "VMware, Inc." <pv-drivers@vmware.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 Minchan Kim <minchan@kernel.org>, Alex Williamson <alex.williamson@redhat.com>,
 Nadav Amit <namit@vmware.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Nitin Gupta <ngupta@vflare.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 09, 2021 at 04:53:42PM +0100, Christoph Hellwig wrote:
> Just use the generic anon_inode file system.

Umm...  The only problem I see here is the lifetime rules for
that module, and that's not something introduced in this patchset.
Said that, looks like the logics around that place is duplicated in
cmm.c, vmw_balloon.c and virtion_balloon.c and I wonder if it would
be better off with a helper in mm/balloon.c to be used for that setup...
