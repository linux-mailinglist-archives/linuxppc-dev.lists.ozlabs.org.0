Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6700F3734C2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 07:44:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZlyc3FKPz30KL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 15:44:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZlyC1vN2z2xfp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 15:44:01 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 837E268AFE; Wed,  5 May 2021 07:43:57 +0200 (CEST)
Date: Wed, 5 May 2021 07:43:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH] vfio/pci: Revert nvlink removal uAPI breakage
Message-ID: <20210505054357.GA12728@lst.de>
References: <162014341432.3807030.11054087109120670135.stgit@omen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <162014341432.3807030.11054087109120670135.stgit@omen>
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
Cc: kvm@vger.kernel.org, qemu-devel@nongnu.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, groug@kaod.org, qemu-ppc@nongnu.org,
 daniel@ffwll.ch, linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
