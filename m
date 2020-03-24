Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630D190A78
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 11:16:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mnGt6xSgzDqwn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 21:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=G5O8P1Bq; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mnCt2lNxzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 21:14:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585044851;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2W46V6KH08v3G104dBcGJzXANovvtij5IaA5Zt56vzQ=;
 b=G5O8P1Bql1HY2fjaeNwCAX33m9lUWl9Ii48n5Hm1kUPMrYWHp7Qmnbvzqj9/3bvdEZDItk
 6MxhjxQ4fmI+KUZlktUURtjs1s2MjKM5xKHLkBRzufn/ubIIQyhbikDBOC9BAs90Rkj55o
 JBSbaklZU3Q6bXGCEXXedU6MHIXZ148=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-IKXQvLG0N9qrhjTwir3UOg-1; Tue, 24 Mar 2020 06:14:09 -0400
X-MC-Unique: IKXQvLG0N9qrhjTwir3UOg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99A3F8010E8;
 Tue, 24 Mar 2020 10:14:07 +0000 (UTC)
Received: from localhost (ovpn-12-69.pek2.redhat.com [10.72.12.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EB17A19C6A;
 Tue, 24 Mar 2020 10:14:04 +0000 (UTC)
Date: Tue, 24 Mar 2020 18:14:01 +0800
From: Baoquan He <bhe@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [5.6.0-rc7] Kernel crash while running ndctl tests
Message-ID: <20200324101401.GA9942@MiWiFi-R3L-srv>
References: <CF20E440-4DCB-4EFD-88B6-0AB98DC7FBD4@linux.vnet.ibm.com>
 <87a746cdva.fsf@linux.ibm.com>
 <33E32320-C371-4A41-A3E1-4B9D2DDAFBFC@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33E32320-C371-4A41-A3E1-4B9D2DDAFBFC@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/24/20 at 03:06pm, Sachin Sant wrote:
> 
> 
> > On 24-Mar-2020, at 2:45 PM, Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> wrote:
> > 
> > Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> > 
> >> While running ndctl[1] tests against 5.6.0-rc7 following crash is encountered.
> >> 
> >> Bisect leads me to  commit d41e2f3bd546 
> >> mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case
> >> 
> >> Reverting this commit helps and the tests complete without any crash.
> > 
> > 
> > Can you try this change?
> > 
> > diff --git a/mm/sparse.c b/mm/sparse.c
> > index aadb7298dcef..3012d1f3771a 100644
> > --- a/mm/sparse.c
> > +++ b/mm/sparse.c
> > @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
> > 			ms->usage = NULL;
> > 		}
> > 		memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
> > +		/* Mark the section invalid */
> > +		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
> > 	}
> > 
> > 	if (section_is_early && memmap)
> > 
> 
> This patch works for me. The test ran successfully without any crash/failure.

Hi Aneesh,

Could you make a formal patch to post, since Sachin has tested and
confirmed it works?

> 
> Thanks
> -Sachin
> 
> > a pfn_valid check involves pnf_section_valid() check if section is
> > having MEM_MAP. In this case we did end up  setting the ms->uage = NULL.
> > So when we do that tupdate the section to not have MEM_MAP.
> > 
> > -aneesh
> 

