Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B3A18CB41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 11:10:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kKKL536nzDrfw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 21:10:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=bhe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ldf/NL40; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kK7P52xgzDrh9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 21:01:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584698510;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WzV2FN2ok/NhA5NWpOHsyZ7D0zfIBp3v9eJJSSNVJkQ=;
 b=Ldf/NL400QFhgIEG3vM8AetYxopBl16vVyQA+9FL2dEnNU3V/l57e/8PEax+gqjeWHQ++H
 uz1LpixKVICa5j9Sn6UCjeq3MB0nckrjlrrqWCPWO+t5Fp7inyeyCbLObK75nxmssMuk8o
 vE+XkRrQuVD9Pav/wdhDMbGQ96yqFZI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-w0dPq5DaN-2l2TxvoiClSQ-1; Fri, 20 Mar 2020 06:01:49 -0400
X-MC-Unique: w0dPq5DaN-2l2TxvoiClSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0130418B5F78;
 Fri, 20 Mar 2020 10:01:33 +0000 (UTC)
Received: from localhost (ovpn-13-97.pek2.redhat.com [10.72.13.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83DD396F92;
 Fri, 20 Mar 2020 10:01:30 +0000 (UTC)
Date: Fri, 20 Mar 2020 18:01:27 +0800
From: Baoquan He <bhe@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 0/8] mm/memory_hotplug: allow to specify a default
 online_type
Message-ID: <20200320100127.GG2987@MiWiFi-R3L-srv>
References: <20200319131221.14044-1-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200319131221.14044-1-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Michal Hocko <mhocko@suse.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Milan Zamazal <mzamazal@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/19/20 at 02:12pm, David Hildenbrand wrote:
> Distributions nowadays use udev rules ([1] [2]) to specify if and
> how to online hotplugged memory. The rules seem to get more complex with
> many special cases. Due to the various special cases,
> CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE cannot be used. All memory hotplug
> is handled via udev rules.
> 
> Everytime we hotplug memory, the udev rule will come to the same
> conclusion. Especially Hyper-V (but also soon virtio-mem) add a lot of
> memory in separate memory blocks and wait for memory to get onlined by user
> space before continuing to add more memory blocks (to not add memory faster
> than it is getting onlined). This of course slows down the whole memory
> hotplug process.
> 
> To make the job of distributions easier and to avoid udev rules that get
> more and more complicated, let's extend the mechanism provided by
> - /sys/devices/system/memory/auto_online_blocks
> - "memhp_default_state=" on the kernel cmdline
> to be able to specify also "online_movable" as well as "online_kernel"
> 
> v2 -> v3:
> - "hv_balloon: don't check for memhp_auto_online manually"
> -- init_completion() before register_memory_notifier()
> - Minor typo fix
> 
> v1 -> v2:
> - Tweaked some patch descriptions
> - Added
> -- "powernv/memtrace: always online added memory blocks"
> -- "hv_balloon: don't check for memhp_auto_online manually"
> -- "mm/memory_hotplug: unexport memhp_auto_online"
> - "mm/memory_hotplug: convert memhp_auto_online to store an online_type"
> -- No longer touches hv/memtrace code

Ack the series.

Reviewed-by: Baoquan He <bhe@redhat.com>

