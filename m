Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CCA145C4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jan 2020 20:11:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 482w3y4HpVzDqSH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jan 2020 06:11:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.65; helo=mail-wr1-f65.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 482w1f0hKVzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jan 2020 06:09:08 +1100 (AEDT)
Received: by mail-wr1-f65.google.com with SMTP id g17so302470wro.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jan 2020 11:09:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jDrouBSrTch1oRjGKu1kF0MMLpGbHzjzsyn2ncqxth4=;
 b=ADy1ps0UmjnhHl52qLX2njjkel8WKKwjoCHboSGjWTsqn9dTiTNG1w+a35aW6j5ouH
 b+a/9sqVYetnZ8O+pid/wDxaCp8Z+g0O6aXyWcV8XrPv43VUX8n3rr0isSJVDC1JiPjE
 mZL98DTTDkextILbYGPYbmP1TXb2nWKFMvuLEqIiU1f+kxB8Sm4xlfXeNSWfwINPVuq3
 gffMqMdVQ5lJsjad3+XhDvhi90P8uvfx7BKIoQtXBl8AQ3bXLQX2etUNUTWz7FZYubdQ
 5pdEGDwvqh8BSJUjTfyXjhnPrW6m0eYRiUQ1Qg0kBej1A0Ea0GOHGlMDrB2AsYS33SPi
 6hEQ==
X-Gm-Message-State: APjAAAUvTwlQnrePT8PzxH1f7dbp35F+yPMQx+ywam5QWaJL9oBS0PD0
 luzw2rmL3/u5nhxzrs11UF0=
X-Google-Smtp-Source: APXvYqzMXEKmV9WZyNBUnEiqdP7WtvzjVGR6C9yz/OiUdoKzI0eFO2vOshMLGfSUDVyLMFtEMLdlbg==
X-Received: by 2002:adf:e290:: with SMTP id v16mr13251085wri.16.1579720145425; 
 Wed, 22 Jan 2020 11:09:05 -0800 (PST)
Received: from localhost (ip-37-188-226-95.eurotel.cz. [37.188.226.95])
 by smtp.gmail.com with ESMTPSA id x11sm5147651wmg.46.2020.01.22.11.09.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2020 11:09:04 -0800 (PST)
Date: Wed, 22 Jan 2020 20:09:03 +0100
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH RFC v1] mm: is_mem_section_removable() overhaul
Message-ID: <20200122190903.GD29276@dhcp22.suse.cz>
References: <a5f0bd8d-de5e-9f27-5c94-7746a3d20a95@redhat.com>
 <20200121120714.GJ29276@dhcp22.suse.cz>
 <a29b49b9-28ad-44fa-6c0b-90cd43902f29@redhat.com>
 <20200122104230.GU29276@dhcp22.suse.cz>
 <98b6c208-b4dd-9052-43f6-543068c649cc@redhat.com>
 <816ddd66-c90b-76f1-f4a0-72fe41263edd@redhat.com>
 <20200122164618.GY29276@dhcp22.suse.cz>
 <626d344e-8243-c161-cd07-ed1276eba73d@redhat.com>
 <20200122183809.GB29276@dhcp22.suse.cz>
 <f35cbe9e-b8bf-127e-698f-d08972d30614@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f35cbe9e-b8bf-127e-698f-d08972d30614@redhat.com>
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

On Wed 22-01-20 19:46:15, David Hildenbrand wrote:
> On 22.01.20 19:38, Michal Hocko wrote:
[...]
> > How exactly is check + offline more optimal then offline which makes
> > check as its first step? I will get to your later points after this is
> > clarified.
> 
> Scanning (almost) lockless is more efficient than bouncing back and
> forth with the device_hotplug_lock, mem_hotplug_lock, cpu_hotplug_lock
> and zone locks - as far as I understand.

All but the zone lock shouldn't be really contended and as such
shouldn't cause any troubles. zone->lock really depends on the page
allocator usage of course. But as soon as we have a contention then it
is just more likely that the result is less reliable.

I would be also really curious about how much actual time could be saved
by this - some real numbers - because hotplug operations shouldn't
happen so often that this would stand out. At least that is my
understanding.

> And as far as I understood, that was the whole reason of the original
> commit.

Well, I have my doubts but it might be just me and I might be wrong. My
experience from a large part of the memory hotplug functionality is that
it was driven by a good intention but without a due diligence to think
behind the most obvious usecase. Having a removable flag on the memblock
sounds like a neat idea of course. But an inherently racy flag is just
borderline useful.

Anyway, I will stop at this moment and wait for real usecases.

Thanks!
-- 
Michal Hocko
SUSE Labs
