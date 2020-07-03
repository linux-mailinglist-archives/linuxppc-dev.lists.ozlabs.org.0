Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 857132137A6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 11:27:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yqPP3kttzDqS1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 19:27:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.218.68; helo=mail-ej1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com
 [209.85.218.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yqKf0gySzDrCt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 19:24:21 +1000 (AEST)
Received: by mail-ej1-f68.google.com with SMTP id dr13so33496088ejc.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jul 2020 02:24:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iJLZm8Njvb3Yiim6wQvrOQ/ONlV8hDDQOYhn9693iq0=;
 b=q/JJoNXv76dms/Y6ZY8JCE2fTmmssBoksYRdEK1dumMTlbfTkPZLR0lqk8iy2ehDEM
 XYU9xIbBkuXnu0Y6Pkovelf99rzEuiX+tYlqpwQ+x87V4wjKvih4eUNucEM9/Y1plPTc
 6eWX9afKeZnsyGhQBlzLgRWk2kHMsytR5y06Ac9KuuLYvrYSxcyWMl3RaP9zLyiLpr6l
 JwGzxKodb6JU6L6ZJ6ClC521CozWOnp2jcKhTuxp/1wmPh1b6YGNs4GRUecbvbEpniVT
 L0OuVjaBgbzRqS3NoDcX1fhd5B6mDjuv4LogKr5bcdC9UKDzmEqo5uIc8PtrnV4mb3KE
 V/Fg==
X-Gm-Message-State: AOAM533igFec2gCIvJCn7sacAlRO/2jHG2suIMQNy6RSh9nWw4m62j+Z
 b2m4gAk58zwN3AOMTgstHLg=
X-Google-Smtp-Source: ABdhPJyX1uiNEPa1jrkIIqpxN7mzlISZmIk00tNVQd8wc47hHS0KLZLdKRBE9Qshpnx67YsqYHV2vQ==
X-Received: by 2002:a17:906:19c7:: with SMTP id
 h7mr30603847ejd.403.1593768257301; 
 Fri, 03 Jul 2020 02:24:17 -0700 (PDT)
Received: from localhost (ip-37-188-168-3.eurotel.cz. [37.188.168.3])
 by smtp.gmail.com with ESMTPSA id i10sm11795002edx.42.2020.07.03.02.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 02:24:16 -0700 (PDT)
Date: Fri, 3 Jul 2020 11:24:14 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH v5 3/3] mm/page_alloc: Keep memoryless cpuless node 0
 offline
Message-ID: <20200703092414.GR18446@dhcp22.suse.cz>
References: <20200624092846.9194-1-srikar@linux.vnet.ibm.com>
 <20200624092846.9194-4-srikar@linux.vnet.ibm.com>
 <20200701084200.GN2369@dhcp22.suse.cz>
 <20200701100442.GB17918@linux.vnet.ibm.com>
 <184102af-ecf2-c834-db46-173ab2e66f51@redhat.com>
 <20200701110145.GC17918@linux.vnet.ibm.com>
 <0468f965-8762-76a3-93de-3987cf859927@redhat.com>
 <12945273-d788-710d-e8d7-974966529c7d@redhat.com>
 <20200701122110.GT2369@dhcp22.suse.cz>
 <20200703091001.GJ21462@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703091001.GJ21462@kitsune.suse.cz>
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
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>, Andi Kleen <ak@linux.intel.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, Mel Gorman <mgorman@suse.de>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Cc Andi]

On Fri 03-07-20 11:10:01, Michal Suchanek wrote:
> On Wed, Jul 01, 2020 at 02:21:10PM +0200, Michal Hocko wrote:
> > On Wed 01-07-20 13:30:57, David Hildenbrand wrote:
[...]
> > > Yep, looks like it.
> > > 
> > > [    0.009726] SRAT: PXM 1 -> APIC 0x00 -> Node 0
> > > [    0.009727] SRAT: PXM 1 -> APIC 0x01 -> Node 0
> > > [    0.009727] SRAT: PXM 1 -> APIC 0x02 -> Node 0
> > > [    0.009728] SRAT: PXM 1 -> APIC 0x03 -> Node 0
> > > [    0.009731] ACPI: SRAT: Node 0 PXM 1 [mem 0x00000000-0x0009ffff]
> > > [    0.009732] ACPI: SRAT: Node 0 PXM 1 [mem 0x00100000-0xbfffffff]
> > > [    0.009733] ACPI: SRAT: Node 0 PXM 1 [mem 0x100000000-0x13fffffff]
> > 
> > This begs a question whether ppc can do the same thing?
> Or x86 stop doing it so that you can see on what node you are running?
> 
> What's the point of this indirection other than another way of avoiding
> empty node 0?

Honestly, I do not have any idea. I've traced it down to
Author: Andi Kleen <ak@suse.de>
Date:   Tue Jan 11 15:35:48 2005 -0800

    [PATCH] x86_64: Fix ACPI SRAT NUMA parsing

    Fix fallout from the recent nodemask_t changes. The node ids assigned
    in the SRAT parser were off by one.

    I added a new first_unset_node() function to nodemask.h to allocate
    IDs sanely.

    Signed-off-by: Andi Kleen <ak@suse.de>
    Signed-off-by: Linus Torvalds <torvalds@osdl.org>

which doesn't really tell all that much. The historical baggage and a
long term behavior which is not really trivial to fix I suspect.
-- 
Michal Hocko
SUSE Labs
