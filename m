Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8D796C25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 00:26:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ClkP152DzDrBm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 08:26:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ClhJ3kS8zDqvL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 08:24:14 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E13A868B20; Wed, 21 Aug 2019 00:24:07 +0200 (CEST)
Date: Wed, 21 Aug 2019 00:24:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH v2 02/12] powerpc/ps3: replace __ioremap() by
 ioremap_prot()
Message-ID: <20190820222407.GA18433@lst.de>
References: <cover.1566309262.git.christophe.leroy@c-s.fr>
 <36bff5d875ff562889c5e12dab63e5d7c5d1fbd8.1566309262.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36bff5d875ff562889c5e12dab63e5d7c5d1fbd8.1566309262.git.christophe.leroy@c-s.fr>
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, hch@lst.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 20, 2019 at 02:07:10PM +0000, Christophe Leroy wrote:
> __ioremap() is similar to ioremap_prot() except that ioremap_prot()
> does a few sanity changes in addition.
> 
> The flags used by PS3 are not impacted by those changes so for
> PS3 both functions are equivalent.
> 
> At the same time, drop parts of the comment that have been invalid
> since commit e58e87adc8bf ("powerpc/mm: Update _PAGE_KERNEL_RO")
> 
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
