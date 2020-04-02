Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D98419BD54
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 10:09:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tG1X2MwkzDrJY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:09:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tFrv2FrnzDrMC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 19:01:50 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id t128so2369570wma.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 01:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UrBSIQuzAujdG2IKZQy1WDw2nZSqWHmIp0pyFUuT55I=;
 b=AV3DR/LbxwF6IJiK/OStowoX0sU8SlkPa9gDkgRfb3+AlNn1oiMVZd+UGdWVcgDhnc
 8wJ1qcP/UcpUtyBpICC2+sxrO1SgBvKyYSbZxPVYNrxxzGpi9sEaTwiUgUV5Tj1hYqja
 Zs717XyddwMAR2tPVoCI7wS/j9kClGLVabgY0D5al9N3dKdnHZiSLAbLdmcmCLr6suuD
 zyZfknSEBJOe89ChNduIdXYrjlQ3Z3d7k8Sd3m/o/HLxPf/7gwYL3eRR4iWUG8FNO8Il
 iZveLKP9XElkUaWk3NZ8KZ14T/ttvjrEMns0N8LWfHHh4+etc1zNoxhT0A9QuipNqw/a
 indw==
X-Gm-Message-State: AGi0PuZQ3uMyfaPfedHKqyfwpLKfcjXoJotRNHiTErFevHGdplt+MyTo
 qk/nrdp11pG+BsF2OhcybC8=
X-Google-Smtp-Source: APiQypLKMYqb9qsRd12t2lZK0oNaHQe5op/Ct4om+69/3ikerP3v6RKRd1oyx6YEyyBTpuIaTaPA/w==
X-Received: by 2002:a1c:4d16:: with SMTP id o22mr2320220wmh.56.1585814506667; 
 Thu, 02 Apr 2020 01:01:46 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id v21sm5906815wmh.26.2020.04.02.01.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 01:01:45 -0700 (PDT)
Date: Thu, 2 Apr 2020 10:01:44 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH RFC] mm: remove CONFIG_HAVE_MEMBLOCK_NODE_MAP (was: Re:
 [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA)
Message-ID: <20200402080144.GK22681@dhcp22.suse.cz>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
 <20200330074246.GA14243@dhcp22.suse.cz>
 <20200330092127.GB30942@linux.ibm.com>
 <20200330095843.GF14243@dhcp22.suse.cz>
 <20200331215618.GG30942@linux.ibm.com>
 <20200401054227.GC2129@MiWiFi-R3L-srv>
 <20200401075155.GH30942@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200401075155.GH30942@linux.ibm.com>
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
Cc: mmorana@amperecomputing.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, Baoquan He <bhe@redhat.com>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Hoan Tran <Hoan@os.amperecomputing.com>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, lho@amperecomputing.com,
 Vasily Gorbik <gor@linux.ibm.com>, Vlastimil Babka <vbabka@suse.cz>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 01-04-20 10:51:55, Mike Rapoport wrote:
> Hi,
> 
> On Wed, Apr 01, 2020 at 01:42:27PM +0800, Baoquan He wrote:
[...]
> > From above information, we can remove HAVE_MEMBLOCK_NODE_MAP, and
> > replace it with CONFIG_NUMA. That sounds more sensible to store nid into
> > memblock when NUMA support is enabled.
>  
> Replacing CONFIG_HAVE_MEMBLOCK_NODE_MAP with CONFIG_NUMA will work, but
> this will not help cleaning up the whole node/zone initialization mess and
> we'll be stuck with two implementations.

Yeah, this is far from optimal.

> The overhead of enabling HAVE_MEMBLOCK_NODE_MAP is only for init time as
> most architectures will anyway discard the entire memblock, so having it in
> a UMA arch won't be a problem. The only exception is arm that uses
> memblock for pfn_valid(), here we may also think about a solution to
> compensate the addition of nid to the memblock structures. 

Well, we can make memblock_region->nid defined only for CONFIG_NUMA.
memblock_get_region_node would then unconditionally return 0 on UMA.
Essentially the same way we do NUMA for other MM code. I only see few
direct usage of region->nid.
-- 
Michal Hocko
SUSE Labs
