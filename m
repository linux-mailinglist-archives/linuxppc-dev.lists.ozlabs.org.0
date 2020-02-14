Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF0315F7AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 21:27:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K4gM2vCqzDqlZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 07:27:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jmoyer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=AziJFHbB; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K4V44HSCzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 07:19:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581711559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zUUGrdP4j1cXvm1eFGmQNpbG1sQHN9lpbJso5oFN/oI=;
 b=AziJFHbBnQPrmNoNznCC1hHbeJf4RX3mbg5E2zPkyKljwpYGrwxr+EWokaRlHSB9APYtIC
 Hdh5hynHwEPk3xZ71765hQ7rmdIYybWqqBMYYslNfmukUohxdcbROZ9SYgs/zwOA5J4Ag5
 vcIzuTsYqOrCdA2E3L0X5KlPJl58jOg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-BGeSogtHN2ixrrdRK5EOyg-1; Fri, 14 Feb 2020 15:19:10 -0500
X-MC-Unique: BGeSogtHN2ixrrdRK5EOyg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28490108592A;
 Fri, 14 Feb 2020 20:19:09 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com
 (segfault.boston.devel.redhat.com [10.19.60.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 687605C1D8;
 Fri, 14 Feb 2020 20:19:08 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 4/4] libnvdimm/region: Introduce an 'align' attribute
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155491952.3343782.4541070487858304628.stgit@dwillia2-desk3.amr.corp.intel.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Fri, 14 Feb 2020 15:19:07 -0500
In-Reply-To: <158155491952.3343782.4541070487858304628.stgit@dwillia2-desk3.amr.corp.intel.com>
 (Dan Williams's message of "Wed, 12 Feb 2020 16:48:39 -0800")
Message-ID: <x495zg8exc4.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

> The align attribute applies an alignment constraint for namespace
> creation in a region. Whereas the 'align' attribute of a namespace
> applied alignment padding via an info block, the 'align' attribute
> applies alignment constraints to the free space allocation.
>
> The default for 'align' is the maximum known memremap_compat_align()
> across all archs (16MiB from PowerPC at time of writing) multiplied by
> the number of interleave ways if there is blk-aliasing. The minimum is
> PAGE_SIZE and allows for the creation of cross-arch incompatible
> namespaces, just as previous kernels allowed, but the expectation is
> cross-arch and mode-independent compatibility by default.
>
> The regression risk with this change is limited to cases that were
> dependent on the ability to create unaligned namespaces, *and* for some
> reason are unable to opt-out of aligned namespaces by writing to
> 'regionX/align'. If such a scenario arises the default can be flipped
> from opt-out to opt-in of compat-aligned namespace creation, but that is
> a last resort. The kernel will otherwise continue to support existing
> defined misaligned namespaces.
>
> Unfortunately this change needs to touch several parts of the
> implementation at once:
>
> - region/available_size: expand busy extents to current align
> - region/max_available_extent: expand busy extents to current align
> - namespace/size: trim free space to current align
>
> ...to keep the free space accounting conforming to the dynamic align
> setting.
>
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reported-by: Jeff Moyer <jmoyer@redhat.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Link: https://lore.kernel.org/r/158041478371.3889308.14542630147672668068.stgit@dwillia2-desk3.amr.corp.intel.com
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>

This looks good to me.

Reviewed-by: Jeff Moyer <jmoyer@redhat.com>

