Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C1015F862
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 22:02:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48K5Rw0Jl4zDqkD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Feb 2020 08:02:36 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=CO8COIjk; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48K5N82BhCzDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Feb 2020 07:59:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581713955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 references:references; bh=xlGrvI1xaS/R+PG6hF0vkvw8F7V03CIoauMXv5nvLHg=;
 b=CO8COIjkx1Z/7HJ9d5deLRfhg/tPX548Sp71Q3Q9T6rvUXJVOpejF4sXqpQWvJrNHHayK9
 fWZCWrKeRC8x1kvp2+lFljYwYS1PbgiWRzzQQci0AT6wtPq5mXwps1AZFXx2mGgISRlOGv
 OdNH2h8GRl6vUp/GEzbLnyUCm7iW3DE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-115-GvUqMV_VNn-dvokEBCfy1w-1; Fri, 14 Feb 2020 15:59:13 -0500
X-MC-Unique: GvUqMV_VNn-dvokEBCfy1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F188100550E;
 Fri, 14 Feb 2020 20:59:11 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com
 (segfault.boston.devel.redhat.com [10.19.60.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA2628AC42;
 Fri, 14 Feb 2020 20:59:09 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 1/4] mm/memremap_pages: Introduce
 memremap_compat_align()
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155490379.3343782.10305190793306743949.stgit@dwillia2-desk3.amr.corp.intel.com>
 <x498sl677cf.fsf@segfault.boston.devel.redhat.com>
 <CAPcyv4i8xNEsdX=8c2+ehf24U2AFcc-sKmAPS9UoVvm8z0aRng@mail.gmail.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Fri, 14 Feb 2020 15:59:08 -0500
Message-ID: <x49k14odgwz.fsf@segfault.boston.devel.redhat.com>
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Vishal L Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> On Thu, Feb 13, 2020 at 8:58 AM Jeff Moyer <jmoyer@redhat.com> wrote:

>> I have just a couple of questions.
>>
>> First, can you please add a comment above the generic implementation of
>> memremap_compat_align describing its purpose, and why a platform might
>> want to override it?
>
> Sure, how about:
>
> /*
>  * The memremap() and memremap_pages() interfaces are alternately used
>  * to map persistent memory namespaces. These interfaces place different
>  * constraints on the alignment and size of the mapping (namespace).
>  * memremap() can map individual PAGE_SIZE pages. memremap_pages() can
>  * only map subsections (2MB), and at least one architecture (PowerPC)
>  * the minimum mapping granularity of memremap_pages() is 16MB.
>  *
>  * The role of memremap_compat_align() is to communicate the minimum
>  * arch supported alignment of a namespace such that it can freely
>  * switch modes without violating the arch constraint. Namely, do not
>  * allow a namespace to be PAGE_SIZE aligned since that namespace may be
>  * reconfigured into a mode that requires SUBSECTION_SIZE alignment.
>  */

Well, if we modify the x86 variant to be PAGE_SIZE, I think that text
won't work.  How about:

/*
 * memremap_compat_align should return the minimum alignment for
 * mapping memory via memremap() and memremap_pages().  For x86, this
 * is the system PAGE_SIZE.  Other architectures may impose different
 * restrictions, as is seen on powerpc where the minimum alignment is
 * tied to the linear mapping page size.
 *
 * When creating persistent memory namespaces, the alignment is forced
 * to the least common denominator (MEMREMAP_COMPAT_ALIGN_MAX,
 * currently 16MB).  However, older kernels did not enforce this
 * behavior, so we allow mapping namespaces with smaller alignments,
 * so long as the platform supports it.  See nvdimm_namespace_common_probe.
 */

-Jeff

