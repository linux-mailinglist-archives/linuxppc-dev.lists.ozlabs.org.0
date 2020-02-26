Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF0A170A05
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 21:53:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SShK48kszDqlK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 07:53:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SSfZ1pZgzDqfB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 07:52:21 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id c84so808647wme.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 12:52:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WJFduaxlSsHHS4gNp/foxgTH7UCDLpFZpZFWJkHONbI=;
 b=E6oJ2WETqFaNQ6fl9ZFRHIpW6hi4Edth1iIuSjsjvB7hnbrEOQWxj1pgTUdSqZ3TR8
 oQvXvDEjxJO1viA0IsZgycdWTkNyG7WAKOMdOkJieu8Tm/+WtqtNt6uCdDk9/nZEJs2O
 oyvC6wsmyp37o0rNL/PpamjlJc92189yNoxjQqAVxTLs64YwaqiwOIRfp426QXtEC9Ix
 EDmOyqKs9VdXdp96eh6YdO5pdyz/hv5nysbFJkT4mnI9vVK09GiuqK6UWg8+t1bBMbIx
 Iw8Ic8CP2SLQLD9fVdVPIpcu2OADOxikXyvW0lBDJjStl2M5HhuEMHppcFu3tlyUztWr
 qptQ==
X-Gm-Message-State: APjAAAXdwU6hmfUe773qd0yfyNOK9IZ+x+xwlIPZRDmmyFl1py2hQ2i/
 C6Q06YNYYqh0bEzV4E0jts4=
X-Google-Smtp-Source: APXvYqynGzzZnLeuN+i15owlhUBU+X4Bq1UMtWfOYs19d9h4lZGatMicrImoFFdMiGhIL206VIuNpg==
X-Received: by 2002:a1c:e483:: with SMTP id b125mr707978wmh.187.1582750337898; 
 Wed, 26 Feb 2020 12:52:17 -0800 (PST)
Received: from localhost (ip-37-188-190-100.eurotel.cz. [37.188.190.100])
 by smtp.gmail.com with ESMTPSA id l8sm4487632wmj.2.2020.02.26.12.52.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2020 12:52:17 -0800 (PST)
Date: Wed, 26 Feb 2020 21:52:15 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Rientjes <rientjes@google.com>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
Message-ID: <20200226205215.GW3771@dhcp22.suse.cz>
References: <20200218142620.GF4151@dhcp22.suse.cz>
 <35EE65CF-40E3-4870-AEBC-D326977176DA@linux.vnet.ibm.com>
 <20200218152441.GH4151@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002220337030.2000@www.lameter.com>
 <20200224085812.GB22443@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261823270.8012@www.lameter.com>
 <20200226184152.GQ3771@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261843200.8915@www.lameter.com>
 <20200226190147.GR3771@dhcp22.suse.cz>
 <alpine.DEB.2.21.2002261228060.208847@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2002261228060.208847@chino.kir.corp.google.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Pekka Enberg <penberg@kernel.org>,
 Kirill Tkhai <ktkhai@virtuozzo.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Christopher Lameter <cl@linux.com>, linuxppc-dev@lists.ozlabs.org,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 26-02-20 12:31:56, David Rientjes wrote:
> On Wed, 26 Feb 2020, Michal Hocko wrote:
> 
> > On Wed 26-02-20 18:44:13, Cristopher Lameter wrote:
> > > On Wed, 26 Feb 2020, Michal Hocko wrote:
> > > 
> > > > Besides that kmalloc_node shouldn't really have an implicit GFP_THISNODE
> > > > semantic right? At least I do not see anything like that documented
> > > > anywhere.
> > > 
> > > Kmalloc_node does not support memory policies etc. Only kmalloc does.
> > > kmalloc_node is mostly used by subsystems that have determined the active
> > > nodes and want a targeted allocation on those nodes.
> >  
> > I am sorry but I have hard time to follow your responses here. They open
> > more questions than they answer for me. The primary point here is that
> > kmalloc_node on a memory less node blows up and panics the kernel. I
> > strongly believe this is a bug. We cannot really make all callers of
> > kmalloc_node and co. to be hotplug aware.
> > 
> > Another question is the semantic of kmalloc_node when the node cannot
> > satisfy the request. I have always thought that the allocation would
> > simply fall back to any other node unless __GFP_THISNODE is explicitly
> > specified.
> > 
> 
> Am I right in classifying this as a trade-off between an 
> unlikely(!node_state(nid, N_MEMORY)) directly in kmalloc_node() vs fixing 
> up a caller passing a memoryless nid?

The thing is that any check for node online/populated followed by the
allocation is inherently racy without using memory hotplug locking
around that and I am pretty sure this is a step into a wrong direction.

Is there any problem to initialize slub internal data structures for all
possible nodes? This wouldn't require any checks into hot paths.

-- 
Michal Hocko
SUSE Labs
