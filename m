Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BF31922F4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 09:38:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nM2w5sTWzDqpM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 19:38:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=f0mzE+mU; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nM135dtczDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 19:36:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585125413;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sdYIddxfgLwXOGvGXxs8sWbwIPBrEhwforhRRHvBbFw=;
 b=f0mzE+mUUfRagKKSUMw/HYwqSth5aFZWnf50uXS3MdIbkg+epveUABEDy0eIVYnCt76W2k
 rk3AjsgszfRljB9ruKlxdz8nkq5RCCvSrA61nAXON9s5zwUz/95qm2jdbQD6LOS7BEp6p5
 9ADJEFEumO4R4/oW1TsLX4ZhF9C8mhg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-XhB42Jt9P6iZjwf7I6OJXQ-1; Wed, 25 Mar 2020 04:36:49 -0400
X-MC-Unique: XhB42Jt9P6iZjwf7I6OJXQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10349190B2A1;
 Wed, 25 Mar 2020 08:36:47 +0000 (UTC)
Received: from localhost (ovpn-12-88.pek2.redhat.com [10.72.12.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6544A7F1;
 Wed, 25 Mar 2020 08:36:40 +0000 (UTC)
Date: Wed, 25 Mar 2020 16:36:37 +0800
From: Baoquan He <bhe@redhat.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] mm/sparse: Fix kernel crash with pfn_section_valid check
Message-ID: <20200325083637.GJ3039@MiWiFi-R3L-srv>
References: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
 <20200325070643.GH3039@MiWiFi-R3L-srv>
 <20200325073707.GI3039@MiWiFi-R3L-srv>
 <5cdf5334-7fbb-8427-1918-ed67d5f23834@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5cdf5334-7fbb-8427-1918-ed67d5f23834@linux.ibm.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, david@redhat.com,
 linux-kernel@vger.kernel.org, mhocko@kernel.org, linux-mm@kvack.org,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dan.j.williams@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/25/20 at 01:42pm, Aneesh Kumar K.V wrote:
> On 3/25/20 1:07 PM, Baoquan He wrote:
> > On 03/25/20 at 03:06pm, Baoquan He wrote:
> > > On 03/25/20 at 08:49am, Aneesh Kumar K.V wrote:
> > 
> > > >   mm/sparse.c | 2 ++
> > > >   1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/mm/sparse.c b/mm/sparse.c
> > > > index aadb7298dcef..3012d1f3771a 100644
> > > > --- a/mm/sparse.c
> > > > +++ b/mm/sparse.c
> > > > @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
> > > >   			ms->usage = NULL;
> > > >   		}
> > > >   		memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
> > > > +		/* Mark the section invalid */
> > > > +		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
> > > 
> > > Not sure if we should add checking in valid_section() or pfn_valid(),
> > > e.g check ms->usage validation too. Otherwise, this fix looks good to
> > > me.
> > 
> > With SPASEMEM_VMEMAP enabled, we should do validation check on ms->usage
> > before checking any subsection is valid. Since now we do have case
> > in which ms->usage is released, people still try to check it.
> > 
> > diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> > index f0a2c184eb9a..d79bd938852e 100644
> > --- a/include/linux/mmzone.h
> > +++ b/include/linux/mmzone.h
> > @@ -1306,6 +1306,8 @@ static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
> >   {
> >   	int idx = subsection_map_index(pfn);
> > +	if (!ms->usage)
> > +		return 0;
> >   	return test_bit(idx, ms->usage->subsection_map);
> >   }
> >   #else
> > 
> 
> We always check for section valid, before we check if pfn_section_valid().
> 
> static inline int pfn_valid(unsigned long pfn)
> 
> 	struct mem_section *ms;
> 
> 	if (pfn_to_section_nr(pfn) >= NR_MEM_SECTIONS)
> 		return 0;
> 	ms = __nr_to_section(pfn_to_section_nr(pfn));
> 	if (!valid_section(ms))
> 		return 0;
> 	/*
> 	 * Traditionally early sections always returned pfn_valid() for
> 	 * the entire section-sized span.
> 	 */
> 	return early_section(ms) || pfn_section_valid(ms, pfn);
> }
> 
> 
> IMHO adding that if (!ms->usage) is redundant.

Yeah, I tend to agree. Consider this happens in the only small window
between ms->usage releasing and ms->section_mem_map releasing when
removing a section. Just thought adding this check to enhance it even
though we have had your fix, because we only check ms->section_mem_map
in valid_section(). Anyway, your fix looks good to me, see if other
people have any comment.

Thanks
Baoquan

