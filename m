Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32082189D73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 14:56:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jBRK2xVpzDqvl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 00:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jBNR1XZ5zDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 00:54:14 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id b2so24297639wrj.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 06:54:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ngy8A2YvpuwSAkIHITqsxwhgr3uY9q04Wj+xXFxPERw=;
 b=tblbidTemLDtsXszQ4PtNvAzFRnX6q2o5ETPrT7PjSuXCkgDg8spmXAVmssjaVaANv
 58f95aCOTMMXvAj3OHY338XW0iynFKY5xVqcz3C6OGH5vMAo2IlXjeByYothnTez2WuB
 Kft8OrT9ZaeKrKup77LExeX/yUsf5aUEMt3dKvme9TQo9f2N41TdgMn1RNg7CDAghmIe
 S4DSL4FYV34KZOKougvGmQrcEQZPcUOKQKkyrSKpapeO1he0iIWwaa4C0heIQWbjoyxs
 NT3kxeoKCpCMoWH+brWFj4Zv4Mfw9+HBPkGVod/64UdSyvYGdQAbYtO34OjcaYH2j8p8
 lcUA==
X-Gm-Message-State: ANhLgQ01jEnrEQK7DvWTTAw2Peal7HylgAYZJg1wcYcHDkCi+9uhgiIK
 vnS0fFsWO/LBpuDOsX/BI+8=
X-Google-Smtp-Source: ADFU+vt7+qT3flEZeTSP4vvFvbKpC/QUOdsY3jrET0kgzQHel35UwsgLvygyXmij4VftsNdLAZApgw==
X-Received: by 2002:a05:6000:11d0:: with SMTP id
 i16mr5649369wrx.319.1584539651261; 
 Wed, 18 Mar 2020 06:54:11 -0700 (PDT)
Received: from localhost (ip-37-188-180-89.eurotel.cz. [37.188.180.89])
 by smtp.gmail.com with ESMTPSA id n2sm1696410wro.25.2020.03.18.06.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 06:54:10 -0700 (PDT)
Date: Wed, 18 Mar 2020 14:54:08 +0100
From: Michal Hocko <mhocko@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 0/8] mm/memory_hotplug: allow to specify a default
 online_type
Message-ID: <20200318135408.GP21362@dhcp22.suse.cz>
References: <20200317104942.11178-1-david@redhat.com>
 <20200318130517.GC30899@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318130517.GC30899@MiWiFi-R3L-srv>
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
Cc: Yumei Huang <yuhuang@redhat.com>, linux-hyperv@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Wei Yang <richard.weiyang@gmail.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>,
 Milan Zamazal <mzamazal@redhat.com>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Mammedov <imammedo@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed 18-03-20 21:05:17, Baoquan He wrote:
> On 03/17/20 at 11:49am, David Hildenbrand wrote:
> > Distributions nowadays use udev rules ([1] [2]) to specify if and
> > how to online hotplugged memory. The rules seem to get more complex with
> > many special cases. Due to the various special cases,
> > CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE cannot be used. All memory hotplug
> > is handled via udev rules.
> > 
> > Everytime we hotplug memory, the udev rule will come to the same
> > conclusion. Especially Hyper-V (but also soon virtio-mem) add a lot of
> > memory in separate memory blocks and wait for memory to get onlined by user
> > space before continuing to add more memory blocks (to not add memory faster
> > than it is getting onlined). This of course slows down the whole memory
> > hotplug process.
> > 
> > To make the job of distributions easier and to avoid udev rules that get
> > more and more complicated, let's extend the mechanism provided by
> > - /sys/devices/system/memory/auto_online_blocks
> > - "memhp_default_state=" on the kernel cmdline
> > to be able to specify also "online_movable" as well as "online_kernel"
> 
> This patch series looks good, thanks. Since Andrew has merged it to -mm again,
> I won't add my Reviewed-by to bother. 

JFYI, Andrew usually adds R-b or A-b tags as they are posted.

-- 
Michal Hocko
SUSE Labs
