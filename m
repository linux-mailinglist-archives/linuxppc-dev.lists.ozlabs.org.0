Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C3104181B1C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 15:24:59 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cvP439tBzDqg3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 01:24:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.67; helo=mail-wm1-f67.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XPZBKHUz; dkim-atps=neutral
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cvHX15H4zDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 01:20:07 +1100 (AEDT)
Received: by mail-wm1-f67.google.com with SMTP id g62so2351352wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=U8yHxOLld6I5yONtEEjc1KYpMfk+7prWIw3BzC1un4I=;
 b=XPZBKHUzoxtFiu/PBGZnp0TlZJM7RHTR+pRT3HJmGJGEzlUfiPsSCfxa86Kjh+2qxg
 nfzi+qJIaliw91wL4h/v5MEVCFwDWiv5kYkfNrkcFrAK50mruIgOyvLnuhraVwcyz/T+
 +caYMZLv+5eWwP1Tq7ocIDcc1Tfmoc2/La9I5YBDPVTo4TXDqmmLbOKfv4MI92bmeN3b
 eK3S+N7LCjikrA7tRfFTxtIVdj97FWJ8kLFfqNifcV9hf1GEy1pIbxxcTa9BfTiYKO21
 +TiuPN48K2Vpk821PF7hLxze5YkrYxGkZmEyrwfXKvovX71eikmV3M35gWi+sVMLFclT
 kYPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=U8yHxOLld6I5yONtEEjc1KYpMfk+7prWIw3BzC1un4I=;
 b=N2X0QN/xXwn5ActZZ8cjJljckHfermgOs8VtnP1GKDsQLCmq4DJ2L3BTeTtJObKz9H
 7dxsCqDTtCuFDnwCcd1w/yPkLN8YiSVI/iHUPsF6faX9puDfUumKEAyKuCs10Gl+5JWM
 +7AqoiwLecxhCuACkebt8NN5sywt2718EW1C5uAHfarT19fp7j03/I6PpTZ9rD+bSNXa
 jjRsfT0goG3EOR0kNanS/csQEf0waHJ2cCFqDlfkA/0MLTilFMmuQq/aQF8+qtkn7YsH
 3poTPlUSUib7PYzYnGJnRh4dQxSek/v6rJhg0zCtAzXrnXXLu/bTQh08pYqxuO/uUqru
 IBoA==
X-Gm-Message-State: ANhLgQ2we89Njy5kWZUdQ/FM7IG6Zm44w97MIk4Mm0yQOrr91uuuKQgt
 OWwc72baJ0hHeMK2Mg912cM=
X-Google-Smtp-Source: ADFU+vu6XvNhjX9fUk/vGR9XwGi4Kb+PTmIwG/KCc8VoVTWG4HjFikyiQTu493sCs87Z+jnc8lzQFQ==
X-Received: by 2002:a7b:c354:: with SMTP id l20mr3892521wmj.40.1583936404859; 
 Wed, 11 Mar 2020 07:20:04 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id i6sm6083016wru.40.2020.03.11.07.20.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:20:03 -0700 (PDT)
Date: Wed, 11 Mar 2020 14:20:02 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 3/5] drivers/base/memory: store mapping between MMOP_*
 and string in an array
Message-ID: <20200311142002.2htiv4llyam2svta@master>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-4-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123026.16071-4-david@redhat.com>
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

On Wed, Mar 11, 2020 at 01:30:24PM +0100, David Hildenbrand wrote:
>Let's use a simple array which we can reuse soon. While at it, move the
>string->mmop conversion out of the device hotplug lock.
>
>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>Cc: Andrew Morton <akpm@linux-foundation.org>
>Cc: Michal Hocko <mhocko@kernel.org>
>Cc: Oscar Salvador <osalvador@suse.de>
>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>Cc: Baoquan He <bhe@redhat.com>
>Cc: Wei Yang <richard.weiyang@gmail.com>
>Signed-off-by: David Hildenbrand <david@redhat.com>
>---
> drivers/base/memory.c | 38 +++++++++++++++++++++++---------------
> 1 file changed, 23 insertions(+), 15 deletions(-)
>
>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>index e7e77cafef80..8a7f29c0bf97 100644
>--- a/drivers/base/memory.c
>+++ b/drivers/base/memory.c
>@@ -28,6 +28,24 @@
> 
> #define MEMORY_CLASS_NAME	"memory"
> 
>+static const char *const online_type_to_str[] = {
>+	[MMOP_OFFLINE] = "offline",
>+	[MMOP_ONLINE] = "online",
>+	[MMOP_ONLINE_KERNEL] = "online_kernel",
>+	[MMOP_ONLINE_MOVABLE] = "online_movable",
>+};
>+
>+static int memhp_online_type_from_str(const char *str)
>+{
>+	int i;
>+
>+	for (i = 0; i < ARRAY_SIZE(online_type_to_str); i++) {
>+		if (sysfs_streq(str, online_type_to_str[i]))
>+			return i;
>+	}
>+	return -EINVAL;
>+}
>+
> #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
> 
> static int sections_per_block;
>@@ -236,26 +254,17 @@ static int memory_subsys_offline(struct device *dev)
> static ssize_t state_store(struct device *dev, struct device_attribute *attr,
> 			   const char *buf, size_t count)
> {
>+	const int online_type = memhp_online_type_from_str(buf);

In your following patch, you did the same conversion. Is it possible to merge
them into this one?

> 	struct memory_block *mem = to_memory_block(dev);
>-	int ret, online_type;
>+	int ret;
>+
>+	if (online_type < 0)
>+		return -EINVAL;
> 
> 	ret = lock_device_hotplug_sysfs();
> 	if (ret)
> 		return ret;
> 
>-	if (sysfs_streq(buf, "online_kernel"))
>-		online_type = MMOP_ONLINE_KERNEL;
>-	else if (sysfs_streq(buf, "online_movable"))
>-		online_type = MMOP_ONLINE_MOVABLE;
>-	else if (sysfs_streq(buf, "online"))
>-		online_type = MMOP_ONLINE;
>-	else if (sysfs_streq(buf, "offline"))
>-		online_type = MMOP_OFFLINE;
>-	else {
>-		ret = -EINVAL;
>-		goto err;
>-	}
>-
> 	switch (online_type) {
> 	case MMOP_ONLINE_KERNEL:
> 	case MMOP_ONLINE_MOVABLE:
>@@ -271,7 +280,6 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
> 		ret = -EINVAL; /* should never happen */
> 	}
> 
>-err:
> 	unlock_device_hotplug();
> 
> 	if (ret < 0)
>-- 
>2.24.1

-- 
Wei Yang
Help you, Help me
