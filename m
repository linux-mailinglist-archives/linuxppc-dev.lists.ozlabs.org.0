Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA861717BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:44:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Ssms38tgzDqyg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:44:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Ss4700tvzDr2l
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 23:12:22 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id j16so2706798otl.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 04:12:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wAy/HoXlPsKGVv3Arb2L5dXTkVg8l5DWVj+VU2leEfY=;
 b=fHm6vatzHirAupBdkdSQPaqFsChjE552CId9ZDNZy4GEyDnWkELeIsH0ycOa9S1OX8
 UIrMBWlwtnAvVlJIVnUQNsQi0VFMKGOeYtX54i2XvIV5St7/V3OuzLrrJL9h4nfhFI54
 n1jGdZ0TbrVSCI3dtXADWO9b6i3J/nXI/XCOh51SqaHl+nkCPq/oEX0NQEOWt3v16bx5
 Q5UgcF4y79Wjox930F+cXtE4rVSQFX4ePM9KPOfxriH6f+MJSEEEBxPjzFG9G2Q1XITw
 DIFGCXGIKCmDbqXyN8vv1eYRHQBCGZ7FL4P+xG+IdY2MNCfb1QYg21IOcF2yP043CRO8
 sHoQ==
X-Gm-Message-State: APjAAAU2QVgukkliEP+vy+pe+Mxaq5zcVIggpNlVxoOCwVQ4KFIIE1PD
 9QWtdyrGm88Lk0oaTg9zBkE=
X-Google-Smtp-Source: APXvYqy57WOtkiVEsLREk9cIvpOLT2XJeuMjo9L51/5HtEeQwhafxUUEiHowfCJ3CzEaUupx1TqcOg==
X-Received: by 2002:a05:6830:1e2d:: with SMTP id
 t13mr3169668otr.128.1582805537162; 
 Thu, 27 Feb 2020 04:12:17 -0800 (PST)
Received: from localhost (prg-ext-pat.suse.com. [213.151.95.130])
 by smtp.gmail.com with ESMTPSA id a15sm822938otf.75.2020.02.27.04.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 04:12:16 -0800 (PST)
Date: Thu, 27 Feb 2020 13:12:14 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>, Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200227121214.GE3771@dhcp22.suse.cz>
References: <D6F45EDD-9F2E-4593-B630-55E5BD7DE915@linux.vnet.ibm.com>
 <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
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
Cc: Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 26-02-20 23:29:24, Vlastimil Babka wrote:
> On 2/26/20 10:45 PM, Vlastimil Babka wrote:
> > 
> > 
> > if (node == NUMA_NO_NODE)
> >     page = alloc_pages(flags, order);
> > else
> >     page = __alloc_pages_node(node, flags, order);
> > 
> > So yeah looks like SLUB's kmalloc_node() is supposed to behave like the
> > page allocator's __alloc_pages_node() and respect __GFP_THISNODE but not
> > enforce it by itself. There's probably just some missing data structure
> > initialization somewhere right now for memoryless nodes.
> 
> Upon more digging, I think the problem could manifest if
> node_to_mem_node(0) (_node_numa_mem_[0]) returned 0 instead of 1,
> because it wasn't initialized properly for a memoryless node. Can you
> e.g. print it somewhere?

A very good hint indeed. I would do this
diff --git a/include/linux/topology.h b/include/linux/topology.h
index eb2fe6edd73c..d9f1b6737e4d 100644
--- a/include/linux/topology.h
+++ b/include/linux/topology.h
@@ -137,6 +137,8 @@ static inline void set_numa_mem(int node)
 {
 	this_cpu_write(_numa_mem_, node);
 	_node_numa_mem_[numa_node_id()] = node;
+	pr_info("%s %d -> %d\n", __FUNCTION__, numa_node_id(), node);
+	dump_stack();
 }
 #endif
 
Btw. it would be also helpful to get
`faddr2line ___slab_alloc+0x334' from your kernel Sachin.
-- 
Michal Hocko
SUSE Labs
