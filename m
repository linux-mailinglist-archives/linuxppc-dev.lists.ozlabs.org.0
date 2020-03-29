Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B52196AB7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 04:58:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48qgJv4jWszDqdq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Mar 2020 13:58:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=willy@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48qgH30PL6zDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Mar 2020 13:57:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=4yXTPf18akGL4F1+3ogioOkX9iKPvYO8hyOrfJXVtE8=; b=JQUR5R0lE7xi/bwp2+wCOJ6n+2
 jr/hNpXfA6Sap1y57jeS+TIIvZ50P9Y0zhfobUFlky6zEHnrl36iUVGituZcetweLxImlDgR+0iir
 d3QCGnZfRnPVOSoC/nsRLR2bhPsiB+W2w8sFoZ77juMrW4OGkTFvQUvqhPA08FEK7I5Eg97c5tGib
 Zw7dB5t65kxfGeoY0SAo/6dRwhdi9zSLhZhYeBRJ2LSRPBWI8gvyMpqmHcCHQ0sWsQbZXQvsWH/mT
 6hETfSx0PyDhWRS+X/9G+thvPoa8q1ZMjK5EVIvLqln8TC7mmm8ZUKLOFxK9rhl7dENKu5keZOLVK
 thM8OiZQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jIO7V-00020F-KY; Sun, 29 Mar 2020 02:56:17 +0000
Date: Sat, 28 Mar 2020 19:56:17 -0700
From: Matthew Wilcox <willy@infradead.org>
To: Alastair D'Silva <alastair@d-silva.org>
Subject: Re: [PATCH v4 10/25] nvdimm: Add driver for OpenCAPI Persistent Memory
Message-ID: <20200329025617.GT22483@bombadil.infradead.org>
References: <20200327071202.2159885-1-alastair@d-silva.org>
 <20200327071202.2159885-11-alastair@d-silva.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200327071202.2159885-11-alastair@d-silva.org>
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
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 27, 2020 at 06:11:47PM +1100, Alastair D'Silva wrote:
> +static struct mutex minors_idr_lock;
> +static struct idr minors_idr;
...
> +	mutex_lock(&minors_idr_lock);
> +	minor = idr_alloc(&minors_idr, ocxlpmem, 0, NUM_MINORS, GFP_KERNEL);
> +	mutex_unlock(&minors_idr_lock);
...
> +	mutex_lock(&minors_idr_lock);
> +	idr_remove(&minors_idr, MINOR(ocxlpmem->dev.devt));
> +	mutex_unlock(&minors_idr_lock);
...
> +	mutex_init(&minors_idr_lock);
> +	idr_init(&minors_idr);

Unless you look up ocxlpmem by minor number later in the patch series (and
most of the series didn't make it to my mailbox), this can just be an ida.

static DEFINE_IDA(minors);
...
minor = ida_alloc_max(&minors, NUM_MINORS, GFP_KERNEL);
...
ida_free(&minors, MINOR(ocxlpmem->dev.devt));
...
and you can drop the dynamic initialisation.  And the mutex.
