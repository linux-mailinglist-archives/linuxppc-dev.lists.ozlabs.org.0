Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF861A3099
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 10:01:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yYWB6JZKzDrCN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 18:01:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yYT25mL5zDr9W
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 17:59:34 +1000 (AEST)
Received: by mail-wm1-f67.google.com with SMTP id f20so3178221wmh.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 00:59:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7aTkrJXqv2ZbDFk7CEzBnxc6D6u1o+Ia6P0f4mFbFV8=;
 b=eXo3k3e86t2vxnMWYrpSxeV92tnHRg8+1cKZOf1V01kmYqpXnayh78/074z10CuCNX
 0tFhYwsj9A1t/Zcpe7UwUPzJivwdKl/JP6vqoEfp+d664WapyKLC+KlQ+qn7przDEaCT
 LF1+a6EwjVZETDes3f2RM78gYtu6ViU0Mg5ty6Ca/FydE/2HSvobzwGeb0o6rxGztCZa
 Aj3kZG1F5LDiWBq2gVp4zenfPDoCgTP9DQ6Ynz/9lHHhm4A1ZDEhlggDRI0pohW/hYVN
 d2ZDgExLb3x0517PMfErnZz5GgJT0IqA/6ZOSP+QBW9tAKoRP+6xOQ1VQICFgEY4AFcR
 JmWg==
X-Gm-Message-State: AGi0PuaOTG4J22h38ivwzj0K7T5F4wj+TUJOpG/hwR/8fO+X7ur+VDXm
 7LUtdg6uJWL98+EYkgF27Po=
X-Google-Smtp-Source: APiQypLF3rX8q4/0ETJueh+0y6VY0OOa4Qm9U2dPCpWP+b4Cb0cvwVi9cfda2DXukoQvwZZcCvJTsQ==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr9019734wml.181.1586419170075; 
 Thu, 09 Apr 2020 00:59:30 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id b82sm2901790wmh.1.2020.04.09.00.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Apr 2020 00:59:28 -0700 (PDT)
Date: Thu, 9 Apr 2020 09:59:27 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v1 1/2] powerpc/pseries/hotplug-memory: stop checking
 is_mem_section_removable()
Message-ID: <20200409075927.GC18386@dhcp22.suse.cz>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-2-david@redhat.com>
 <87sghdjf1y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87sghdjf1y.fsf@mpe.ellerman.id.au>
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
Cc: Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>,
 linux-kernel@vger.kernel.org, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 09-04-20 17:26:01, Michael Ellerman wrote:
> David Hildenbrand <david@redhat.com> writes:
> 
> > In commit 53cdc1cb29e8 ("drivers/base/memory.c: indicate all memory
> > blocks as removable"), the user space interface to compute whether a memory
> > block can be offlined (exposed via
> > /sys/devices/system/memory/memoryX/removable) has effectively been
> > deprecated. We want to remove the leftovers of the kernel implementation.
> >
> > When offlining a memory block (mm/memory_hotplug.c:__offline_pages()),
> > we'll start by:
> > 1. Testing if it contains any holes, and reject if so
> > 2. Testing if pages belong to different zones, and reject if so
> > 3. Isolating the page range, checking if it contains any unmovable pages
> >
> > Using is_mem_section_removable() before trying to offline is not only racy,
> > it can easily result in false positives/negatives. Let's stop manually
> > checking is_mem_section_removable(), and let device_offline() handle it
> > completely instead. We can remove the racy is_mem_section_removable()
> > implementation next.
> >
> > We now take more locks (e.g., memory hotplug lock when offlining and the
> > zone lock when isolating), but maybe we should optimize that
> > implementation instead if this ever becomes a real problem (after all,
> > memory unplug is already an expensive operation). We started using
> > is_mem_section_removable() in commit 51925fb3c5c9 ("powerpc/pseries:
> > Implement memory hotplug remove in the kernel"), with the initial
> > hotremove support of lmbs.
> 
> It's also not very pretty in dmesg.
> 
> Before:
> 
>   pseries-hotplug-mem: Attempting to hot-add 10 LMB(s)
>   pseries-hotplug-mem: Memory hot-add failed, removing any added LMBs
>   dlpar: Could not handle DLPAR request "memory add count 10"

Yeah, there is more output but isn't that useful? Or put it differently
what is the actual problem from having those messages in the kernel log?

From the below you can clearly tell that there are kernel allocations
which prevent hot remove from happening.

If the overall size of the debugging output is a concern then we can
think of a way to reduce it. E.g. once you have a couple of pages
reported then all others from the same block are likely not interesting
much.
-- 
Michal Hocko
SUSE Labs
