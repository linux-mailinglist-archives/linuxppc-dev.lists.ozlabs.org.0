Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2529E181B2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 15:29:39 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cvVS2W4WzDr8R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 01:29:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.68; helo=mail-wr1-f68.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=aePPmYDn; dkim-atps=neutral
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
 [209.85.221.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cvR06qjyzDqtQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 01:26:36 +1100 (AEDT)
Received: by mail-wr1-f68.google.com with SMTP id s5so2899767wrg.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CsTbLtbFJBK1CBJJUlE0MFl94CmaUOLGCz5Mkq+OEkw=;
 b=aePPmYDnoI4RewHsJ7PIf4IJD1UEiDm22ZxJsfHqe0fflICqXL+sNoyCZnK4fIsMEA
 rSmtVqB++yTeLqfn79SFyplP5gdxjQzJsjtkaLFA8FVWiDCNLa2u1FG+Fls6KW9qG98Y
 OGXrCwkwT9GAth1nZ2zt5vh2WpoEQf4wEDDC3X3llrNY+26gZ/cVfestr4/EEyv1j9QM
 +rP6pOS/w3SQgo0PuN+oWHdGZzMGwQbCkKxyPsXwKJxgSP05PChvyUUhbOReiZGRLUBg
 cDfMqXVLiBZIUfAKEoMDbhqJdzs4V5ZJGvfbv0t+4YD5kAves9NGiRbQdwjs0S4tB9hu
 HEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=CsTbLtbFJBK1CBJJUlE0MFl94CmaUOLGCz5Mkq+OEkw=;
 b=MsE9ZoX7K2s0gJG2K9d/MKiZpk1GK5V+UF7i+TwyZco+ec+h62Uc1GMDi8ok68aNKX
 57JMPk481tJhQfU/+Qh1qdJuihZ9TMOyGtNzfM5LsbNCijUZiTWKCTp2uMghQcI5CxJG
 Ugr7k5uR7kMLVeuG4IOr3O8PLx2mvj4Bti0BADFh9u98s/fHvhKmMAmta8edeb3qKmnN
 kBJb0hr/F2hOHk5448kjcEbxCZrF1jr4WNN78nQ4PJac8F53s+PWP90WlXRB9HMj0Kst
 uaspDyUAVmViNKyLKGB5J3OC1I7KsEFWPi8ioH1mb+johdQbxGZBWIGh7OaXq02e+dql
 FZQQ==
X-Gm-Message-State: ANhLgQ3DbGCMoMGhXcVhw0EqSFVs/cYntPDDLXNWVnX3RTSL0fK7w+j+
 fZQsFC6zvisS320SPPju//Y=
X-Google-Smtp-Source: ADFU+vs4N9H4NmCIYVGtkISk1DRai7Z1/9w16SPv6LvlOjT+MD/1Y3ePN+L7ARQFCQwtIeNpFr5Iyw==
X-Received: by 2002:a5d:6086:: with SMTP id w6mr4715591wrt.224.1583936793924; 
 Wed, 11 Mar 2020 07:26:33 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id c72sm8381117wme.35.2020.03.11.07.26.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:26:33 -0700 (PDT)
Date: Wed, 11 Mar 2020 14:26:32 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 5/5] mm/memory_hotplug: allow to specify a default
 online_type
Message-ID: <20200311142632.xvdwqk2lun4ookez@master>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-6-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-6-david@redhat.com>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Reply-To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-hyperv@vger.kernel.org, Baoquan He <bhe@redhat.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Wei Yang <richard.weiyang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 11, 2020 at 01:30:26PM +0100, David Hildenbrand wrote:
>For now, distributions implement advanced udev rules to essentially
>- Don't online any hotplugged memory (s390x)
>- Online all memory to ZONE_NORMAL (e.g., most virt environments like
>  hyperv)
>- Online all memory to ZONE_MOVABLE in case the zone imbalance is taken
>  care of (e.g., bare metal, special virt environments)
>
>In summary: All memory is usually onlined the same way, however, the
>kernel always has to ask userspace to come up with the same answer.
>E.g., HyperV always waits for a memory block to get onlined before
>continuing, otherwise it might end up adding memory faster than
>hotplugging it, which can result in strange OOM situations.
>
>Let's allow to specify a default online_type, not just "online" and
>"offline". This allows distributions to configure the default online_type
>when booting up and be done with it.
>
>We can now specify "offline", "online", "online_movable" and
>"online_kernel" via
>- "memhp_default_state=" on the kernel cmdline
>- /sys/devices/systemn/memory/auto_online_blocks
>just like we are able to specify for a single memory block via
>/sys/devices/systemn/memory/memoryX/state
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Michal Hocko <mhocko@kernel.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>

Ok, I got the reason to leave the change on string compare here.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>---
> drivers/base/memory.c          | 11 +++++------
> include/linux/memory_hotplug.h |  2 ++
> mm/memory_hotplug.c            |  8 ++++----
> 3 files changed, 11 insertions(+), 10 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index 8d3e16dab69f..2b09b68b9f78 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -35,7 +35,7 @@ static const char *const online_type_to_str[] = {
> 	[MMOP_ONLINE_MOVABLE] = "online_movable",
> };
> 
>-static int memhp_online_type_from_str(const char *str)
>+int memhp_online_type_from_str(const char *str)
> {
> 	int i;
> 
>@@ -394,13 +394,12 @@ static ssize_t auto_online_blocks_store(struct device *dev,
> 					struct device_attribute *attr,
> 					const char *buf, size_t count)
> {
>-	if (sysfs_streq(buf, "online"))
>-		memhp_default_online_type = MMOP_ONLINE;
>-	else if (sysfs_streq(buf, "offline"))
>-		memhp_default_online_type = MMOP_OFFLINE;
>-	else
>+	const int online_type = memhp_online_type_from_str(buf);
>+
>+	if (online_type < 0)
> 		return -EINVAL;
> 
>+	memhp_default_online_type = online_type;
> 	return count;
> }
> 
>diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
>index c6e090b34c4b..ef55115320fb 100644
>--- a/include/linux/memory_hotplug.h
>+++ b/include/linux/memory_hotplug.h
>@@ -117,6 +117,8 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
> 			struct mhp_restrictions *restrictions);
> extern u64 max_mem_size;
> 
>+extern int memhp_online_type_from_str(const char *str);
>+
> /* Default online_type (MMOP_*) when new memory blocks are added. */
> extern int memhp_default_online_type;
> /* If movable_node boot option specified */
>diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>index 01443c70aa27..4a96273eafa7 100644
>--- a/mm/memory_hotplug.c
>+++ b/mm/memory_hotplug.c
>@@ -75,10 +75,10 @@ EXPORT_SYMBOL_GPL(memhp_default_online_type);
> 
> static int __init setup_memhp_default_state(char *str)
> {
>-	if (!strcmp(str, "online"))
>-		memhp_default_online_type = MMOP_ONLINE;
>-	else if (!strcmp(str, "offline"))
>-		memhp_default_online_type = MMOP_OFFLINE;
>+	const int online_type = memhp_online_type_from_str(str);
>+
>+	if (online_type >= 0)
>+		memhp_default_online_type = online_type;
> 
> 	return 1;
> }
>-- 
>2.24.1

-- 
Wei Yang
Help you, Help me
