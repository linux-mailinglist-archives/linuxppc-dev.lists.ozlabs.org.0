Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 959AB372A96
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 15:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZKj14ZdQz30F3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 23:01:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZKhd4bYqz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 23:00:49 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CA8C368AFE; Tue,  4 May 2021 15:00:39 +0200 (CEST)
Date: Tue, 4 May 2021 15:00:39 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: remove the nvlink2 pci_vfio subdriver v2
Message-ID: <20210504130039.GA7711@lst.de>
References: <20210326061311.1497642-1-hch@lst.de>
 <20210504142236.76994047@bahia.lan> <YJFFG1tSP0dUCxcX@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJFFG1tSP0dUCxcX@kroah.com>
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
Cc: qemu-devel@nongnu.org, Daniel Vetter <daniel@ffwll.ch>, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Greg Kurz <groug@kaod.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-api@vger.kernel.org, qemu-ppc@nongnu.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 04, 2021 at 02:59:07PM +0200, Greg Kroah-Hartman wrote:
> > Hi Christoph,
> > 
> > FYI, these uapi changes break build of QEMU.
> 
> What uapi changes?
> 
> What exactly breaks?
> 
> Why does QEMU require kernel driver stuff?

Looks like it pull in the uapi struct definitions unconditionally
instead of having a local copy.  We could fix that by just putting
them back, but to me this seems like a rather broken configuration
in qemu when it pulls in headers from the running/installed kernel
without any feature checks before using them.
