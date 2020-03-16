Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47402186773
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 10:08:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gr7d1RcszDqM3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 20:08:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gr5w5l8VzDqDX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 20:06:58 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id 6so16698160wmi.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 02:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Eia2N/xoriWTxgPunD084+bbaPhpeo+lfldsdFtSAnI=;
 b=dVcbkLMA54y7uZfQfuWKujCqGc3ihe7q5kF3s2i2aV0dyNcKn0mxwujIfxkQpKzcWk
 OVcYaE1PNb+QnwwVfXVH0lbrqy4QfET/1PtWl8vWycLlXXAtFxDhl9fiqG8/x8bFFBl4
 dKFmLklnpe45fcpBNRJ4q/wqLANnLFo1ylpDLW/jHKfaO3UOuVSuQAPcREZYh+6MAmEf
 cgekbcJbOduSF/PkFJcwEtkxNYu4/LtwxG6mKxBVymLkGy89iawlMLPMFLVVAQctuKin
 epvGQDgW/x75ggqHczZ8aMwuoMcih1BQTVZ1qiAZq5NE+lczvS2IXhdu8vfmqxP7t1hb
 ogFw==
X-Gm-Message-State: ANhLgQ22FMwj29vpP0iC249kQKQaLUcRHuZSI0XVNPMUE+jTAOlzbuCS
 ZpSHgMN6riMZHUezRJSz/Wk=
X-Google-Smtp-Source: ADFU+vtWeEHQfTqTCceANDY21DeDfSr1E66N0BzW2u0PvcijS9Xo2cHFyYaR8gANISu8rCi+ihQx5A==
X-Received: by 2002:a1c:f204:: with SMTP id s4mr22977836wmc.127.1584349615207; 
 Mon, 16 Mar 2020 02:06:55 -0700 (PDT)
Received: from localhost (ip-37-188-254-25.eurotel.cz. [37.188.254.25])
 by smtp.gmail.com with ESMTPSA id m17sm11793854wrw.3.2020.03.16.02.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 02:06:54 -0700 (PDT)
Date: Mon, 16 Mar 2020 10:06:52 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH 1/3] powerpc/numa: Set numa_node for all possible cpus
Message-ID: <20200316090652.GC11482@dhcp22.suse.cz>
References: <20200311110237.5731-1-srikar@linux.vnet.ibm.com>
 <20200311110237.5731-2-srikar@linux.vnet.ibm.com>
 <20200311115735.GM23944@dhcp22.suse.cz>
 <20200312052707.GA3277@linux.vnet.ibm.com>
 <C5560C71-483A-41FB-BDE9-526F1E0CFA36@linux.vnet.ibm.com>
 <5e5c736a-a88c-7c76-fc3d-7bc765e8dcba@suse.cz>
 <20200312131438.GB3277@linux.vnet.ibm.com>
 <61437352-8b54-38fa-4471-044a65c9d05a@suse.cz>
 <20200312161310.GC3277@linux.vnet.ibm.com>
 <e115048c-be38-c298-b8d1-d4b513e7d2fb@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e115048c-be38-c298-b8d1-d4b513e7d2fb@suse.cz>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, Mel Gorman <mgorman@suse.de>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Christopher Lameter <cl@linux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 12-03-20 17:41:58, Vlastimil Babka wrote:
[...]
> with nid present in:
> N_POSSIBLE - pgdat might not exist, node_to_mem_node() must return some online

I would rather have a dummy pgdat for those. Have a look at 
$ git grep "NODE_DATA.*->" | wc -l
63

Who knows how many else we have there. I haven't looked more closely.
Besides that what is a real reason to not have pgdat ther and force all
users of a $random node from those that the platform considers possible
for special casing? Is that a memory overhead? Is that really a thing?

Somebody has suggested to tweak some of the low level routines to do the
special casing but I really have to say I do not like that. We shouldn't
use the first online node or anything like that. We should simply always
follow the topology presented by FW and of that we need to have a pgdat.
-- 
Michal Hocko
SUSE Labs
