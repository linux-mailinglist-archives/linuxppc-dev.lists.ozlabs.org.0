Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055F145BA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 19:39:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482vMw24lFzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 05:39:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.65; helo=mail-wm1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482vL31LXMzDqJX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 05:38:17 +1100 (AEDT)
Received: by mail-wm1-f65.google.com with SMTP id t23so152035wmi.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 10:38:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=966BgYgZRUlLppOTZ8GZw5dVZmBTcRyeqAhJa9bwYzU=;
 b=tWeTMCxM4dQZuOCKgKUWMuWN1QFLvHewSgRnVsx0uRLTsrFe9NIlS6jffgdqurUyXZ
 j36hTQX/eKS9jASS0LzpXsxkWXHIHIcZKc11TPaxci79A2t1aJU2QpiKHka6dyrKuPlV
 LXQW2PdcWln/TIHgjPxGsIkHqGjO8YMzOx/pQClJeoxvSSrNj1QuzxTIrrH3JfldjnS7
 dOZjMInZfiV/OeXUTXBJsSXQRUw7QLhVoOzri5/uje0JBdgJihTEE/MOvF431qAnLIOH
 5hdK1rthBEN0aj9YOesJwLcFY8e7JqhhN8ZhhLp4MPRL7N2CvI88gtHz++7Zop9aMl/q
 gC6g==
X-Gm-Message-State: APjAAAVULNXsQttesbL0nV4aIjauebdeid+C8sojanKpJ9oMeXkPxV2c
 mlECr0EpvGM3qUOtoEGczjs=
X-Google-Smtp-Source: APXvYqytlJusKX0Kz3YLI2vL5MLf0VI1Z1xBBIdMBORZVE6octNROw4k0V6HC2FB29J3ObqpMFnQGw==
X-Received: by 2002:a05:600c:2c06:: with SMTP id
 q6mr4482299wmg.154.1579718294349; 
 Wed, 22 Jan 2020 10:38:14 -0800 (PST)
Received: from localhost (ip-37-188-245-167.eurotel.cz. [37.188.245.167])
 by smtp.gmail.com with ESMTPSA id j12sm63168372wrw.54.2020.01.22.10.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 10:38:13 -0800 (PST)
Date: Wed, 22 Jan 2020 19:38:09 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Message-ID: <20200122183809.GB29276@dhcp22.suse.cz>
References: <CAPcyv4jvmYRbX9i+1_LvHoTDGABadHbYH3NVkqczKsQ4fsf74g@mail.gmail.com>
 <20200120074816.GG18451@dhcp22.suse.cz>
 <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
 <20200121120714.GJ29276@dhcp22.suse.cz>
 <a29b49b9-28ad-44fa-6c0b-90cd43902f29@redhat.com>
 <20200122104230.GU29276@dhcp22.suse.cz>
 <98b6c208-b4dd-9052-43f6-543068c649cc@redhat.com>
 <816ddd66-c90b-76f1-f4a0-72fe41263edd@redhat.com>
 <20200122164618.GY29276@dhcp22.suse.cz>
 <626d344e-8243-c161-cd07-ed1276eba73d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <626d344e-8243-c161-cd07-ed1276eba73d@redhat.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Paul Mackerras <paulus@samba.org>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Allison Randal <allison@lohutok.net>, lantianyu1986@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 22-01-20 19:15:47, David Hildenbrand wrote:
> On 22.01.20 17:46, Michal Hocko wrote:
> > On Wed 22-01-20 12:58:16, David Hildenbrand wrote:
[...]
> >> Especially interesting for IBM z Systems, whereby memory
> >> onlining/offlining will trigger the actual population of memory in the
> >> hypervisor. So if an admin wants to offline some memory (to give it back
> >> to the hypervisor), it would use lsmem to identify such blocks first,
> >> instead of trying random blocks until one offlining request succeeds.
> > 
> > I am sorry for being dense here but I still do not understand why s390
> 
> It's good that we talk about it :) It's hard to reconstruct actual use
> cases from tools and some documentation only ...
> 
> Side note (just FYI): One difference on s390x compared to other
> architectures (AFAIKS) is that once memory is offline, you might not be
> allowed (by the hypervisor) to online it again - because it was
> effectively unplugged. Such memory is not removed via remove_memory(),
> it's simply kept offline.

I have a very vague understanding of s390 specialities but this is not
really relevant to the discussion AFAICS because this happens _after_
offlining.
 
> > and the way how it does the hotremove matters here. Afterall there are
> > no arch specific operations done until the memory is offlined. Also
> > randomly checking memory blocks and then hoping that the offline will
> > succeed is not way much different from just trying the offline the
> > block. Both have to crawl through the pfn range and bail out on the
> > unmovable memory.
> 
> I think in general we have to approaches to memory unplugging.
> 
> 1. Know explicitly what you want to unplug (e.g., a DIMM spanning
> multiple memory blocks).
> 
> 2. Find random memory blocks you can offline/unplug.
> 
> 
> For 1, I think we both agree that we don't need this. Just try to
> offline and you know if it worked.
> 
> Now of course, for 2 you can try random blocks until you succeeded. From
> a sysadmin point of view that's very inefficient. From a powerpc-utils
> point of view, that's inefficient.

How exactly is check + offline more optimal then offline which makes
check as its first step? I will get to your later points after this is
clarified.
-- 
Michal Hocko
SUSE Labs
