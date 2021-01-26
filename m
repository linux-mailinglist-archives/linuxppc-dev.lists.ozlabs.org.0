Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3A13036B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 07:40:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPxty5f7kzDqWv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 17:40:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPxrh5z72zDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 17:38:26 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E1D7468BFE; Tue, 26 Jan 2021 07:38:17 +0100 (CET)
Date: Tue, 26 Jan 2021 07:38:17 +0100
From: Christoph Hellwig <hch@lst.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/5] powerpc/xive: remove unnecessary unmap_kernel_range
Message-ID: <20210126063817.GC26674@lst.de>
References: <20210126045404.2492588-1-npiggin@gmail.com>
 <20210126045404.2492588-4-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126045404.2492588-4-npiggin@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 26, 2021 at 02:54:02PM +1000, Nicholas Piggin wrote:
> iounmap will remove ptes.

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
