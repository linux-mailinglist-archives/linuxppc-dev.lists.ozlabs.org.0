Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2230F10FDF1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 13:45:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S1tG6bYKzDq9M
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2019 23:45:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="m8Z9EA16"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S1qC6FlzzDqV1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2019 23:43:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y32EyG9QTIAAfBfEpUvYlhT+mcWXafYYc7fjM/sPObM=; b=m8Z9EA16p0cdhP5aXa2cDeouD
 8v18exxvbDL2VZ+g12YOFJL8h4D64m1aUWCjUztX9coGysKzDNmS82ECczmiSSugoSgZ9I8fL9733
 yByR1W4OgWm9Ji+79sSU19wUMIbaL9vhWILbJzqBWIYJTITSALTfX8PQqTR6ncq9isowfjM5tK81V
 DhgMGFKKI5B5HnMtJhJFcrzkzezv2TLmE+jL2cmZiZL0voqrqklRcOy//ON418iZSdT3QArUEvbuM
 ATlvjkn6wfb7OXS8n+w6/tzVdX7N06vOEiLtYT8y+Qz025I88HodvPHRaxMl+zkd3oThPgqxf9AOL
 VUr5RTx1g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1ic7Vo-0007i6-VW; Tue, 03 Dec 2019 12:42:40 +0000
Date: Tue, 3 Dec 2019 04:42:40 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Alastair D'Silva <alastair@au1.ibm.com>
Subject: Re: [PATCH v2 00/27] Add support for OpenCAPI SCM devices
Message-ID: <20191203124240.GT20752@bombadil.infradead.org>
References: <20191203034655.51561-1-alastair@au1.ibm.com>
 <20191203035057.GR20752@bombadil.infradead.org>
 <1e3892815b9684e3fb4f84bd1935ea7e68cd07d8.camel@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e3892815b9684e3fb4f84bd1935ea7e68cd07d8.camel@au1.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Keith Busch <keith.busch@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, Vishal Verma <vishal.l.verma@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Frederic Barrat <fbarrat@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 03, 2019 at 03:01:17PM +1100, Alastair D'Silva wrote:
> On Mon, 2019-12-02 at 19:50 -0800, Matthew Wilcox wrote:
> > On Tue, Dec 03, 2019 at 02:46:28PM +1100, Alastair D'Silva wrote:
> > > This series adds support for OpenCAPI SCM devices, exposing
> > 
> > Could we _not_ introduce yet another term for persistent memory?
> > 
> 
> "Storage Class Memory" is an industry wide term, and is used repeatedly
> in the device specifications. It's not something that has been pulled
> out of thin air.

"Somebody else also wrote down Storage Class Memory".  Don't care.
Google gets 750k hits for Persistent Memory and 150k hits for
Storage Class Memory.  This term lost.

> The term is also already in use within the 'papr_scm' driver.

The acronym "SCM" is already in use.  Socket Control Messages go back
to early Unix (SCM_RIGHTS, SCM_CREDENTIALS, etc).  Really, you're just
making the case that IBM already uses the term SCM.  You should stop.
