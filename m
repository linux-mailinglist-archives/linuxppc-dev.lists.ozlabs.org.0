Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E28215CDA4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 22:57:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JVjg0CbTzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 08:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=jmoyer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Bn7OQKB2; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JVgs4jhGzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 08:55:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581630947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fgc8eEHzweZEt6vDWPHCdsqE62iMp2A4jBEBu5mmwpE=;
 b=Bn7OQKB2f4zQ0+Dc/XHBzA/69wWQW3rhIChbvepfY7wi4Ut1W4NUyUo4wM7n35WACnNRQ4
 kih9BXluYDePulfk+D3VdSUWIjnow0Bc/FtwIPBWukZroghHve7WBObkAK0aqEukEGWOlj
 31mamMu94fLkm9H3DkQByBZFsXGsoOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-KFIxhWeINIGEenkLQv6mnA-1; Thu, 13 Feb 2020 16:55:38 -0500
X-MC-Unique: KFIxhWeINIGEenkLQv6mnA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00EE5100550E;
 Thu, 13 Feb 2020 21:55:37 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com
 (segfault.boston.devel.redhat.com [10.19.60.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2EBB96031D;
 Thu, 13 Feb 2020 21:55:35 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 2/4] libnvdimm/namespace: Enforce
 memremap_compat_align()
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155490897.3343782.14216276134794923581.stgit@dwillia2-desk3.amr.corp.intel.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Thu, 13 Feb 2020 16:55:35 -0500
In-Reply-To: <158155490897.3343782.14216276134794923581.stgit@dwillia2-desk3.amr.corp.intel.com>
 (Dan Williams's message of "Wed, 12 Feb 2020 16:48:29 -0800")
Message-ID: <x49k14q5ezs.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, vishal.l.verma@intel.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> The pmem driver on PowerPC crashes with the following signature when
> instantiating misaligned namespaces that map their capacity via
> memremap_pages().
>
>     BUG: Unable to handle kernel data access at 0xc001000406000000
>     Faulting instruction address: 0xc000000000090790
>     NIP [c000000000090790] arch_add_memory+0xc0/0x130
>     LR [c000000000090744] arch_add_memory+0x74/0x130
>     Call Trace:
>      arch_add_memory+0x74/0x130 (unreliable)
>      memremap_pages+0x74c/0xa30
>      devm_memremap_pages+0x3c/0xa0
>      pmem_attach_disk+0x188/0x770
>      nvdimm_bus_probe+0xd8/0x470
>
> With the assumption that only memremap_pages() has alignment
> constraints, enforce memremap_compat_align() for
> pmem_should_map_pages(), nd_pfn, or nd_dax cases.
>
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Jeff Moyer <jmoyer@redhat.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Link: https://lore.kernel.org/r/158041477336.3889308.4581652885008605170.stgit@dwillia2-desk3.amr.corp.intel.com
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  drivers/nvdimm/namespace_devs.c |   10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/nvdimm/namespace_devs.c b/drivers/nvdimm/namespace_devs.c
> index 032dc61725ff..aff1f32fdb4f 100644
> --- a/drivers/nvdimm/namespace_devs.c
> +++ b/drivers/nvdimm/namespace_devs.c
> @@ -1739,6 +1739,16 @@ struct nd_namespace_common *nvdimm_namespace_common_probe(struct device *dev)
>  		return ERR_PTR(-ENODEV);
>  	}
>  
> +	if (pmem_should_map_pages(dev) || nd_pfn || nd_dax) {
> +		struct nd_namespace_io *nsio = to_nd_namespace_io(&ndns->dev);
> +		resource_size_t start = nsio->res.start;
> +
> +		if (!IS_ALIGNED(start | size, memremap_compat_align())) {
> +			dev_dbg(&ndns->dev, "misaligned, unable to map\n");
> +			return ERR_PTR(-EOPNOTSUPP);
> +		}
> +	}
> +
>  	if (is_namespace_pmem(&ndns->dev)) {
>  		struct nd_namespace_pmem *nspm;
>  

Actually, I take back my ack.  :) This prevents a previously working
namespace from being successfully probed/setup.  I thought we were only
going to enforce the alignment for a newly created namespace?  This should
only check whether the alignment works for the current platform.

-Jeff

