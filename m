Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5079B181B3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 15:31:31 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cvXR2ntxzDrMm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 01:31:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.66; helo=mail-wm1-f66.google.com;
 envelope-from=richard.weiyang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nPuDEimI; dkim-atps=neutral
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cvSJ3Pc6zDqxd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 01:27:44 +1100 (AEDT)
Received: by mail-wm1-f66.google.com with SMTP id 11so2326659wmo.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 07:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KTnv9vEWwzWLAfeXWJi38+UqTVjgXBaNXXANxrQ2fKY=;
 b=nPuDEimIQ/sISsBGOc4nQjcb+e7qhFM3eN6R4TryBSAfnh5H0slB6jv4+PLDfV0MzE
 U4SB+aLkgHjTD16I18EeiJfobRjpu8MVMU7KTePPO+rPJc4dx88eEAUvODS5KbPfv9Pz
 R8x7CtYU+szPDZuhpf7SIi540dXi4Nr1lNJet1REBBU6b6RVtGYi0xeGnxFKhOZZN+Gd
 woKsOvnhiROohuSaaUYp+uz9TWEDBECRipt8LHWwbTOPM4/uQQXp5xBQSnY5Q7uKiIKL
 r0032LvAgESNj08te3RM1I7BKbEfQYJ20KUe3JjOZ3jEgA0B3Flcb0wMUezJe2+lO/B0
 hUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=KTnv9vEWwzWLAfeXWJi38+UqTVjgXBaNXXANxrQ2fKY=;
 b=c2lMyfk9r8uHmeexZXUI0FDy0hW7XOcJYg6vrtrzOWwECkehT+sEJPFE1m/dsakPPU
 d14t+9k7DxSYJrtPFBfmA4J/4F55gwi1tYKsd5N2dNNQBGKfkbeV4GBWuZyqyLYXKLE9
 eT3iy1EZZwBTUKCiClcoNeHgWHIAT55Qczzs69AHURg5Xfo+dhJJF1lACA9ZsLAs8NYH
 S54UhfD/LZ1JbLHohsMVoQzCdEdra6M6e8E1LnoNUvtleUW4cOD9AV6T0tdUjsdkY0sv
 fpFCiIzI7uKF1RvbqTwMkL6YAHhWK1ppZpnKc0n90V9e49uLCI6jNwCcMDWq9Z9DN7dG
 TG1g==
X-Gm-Message-State: ANhLgQ0Am/CFZfRlfpLu3LqBFVzBKLIIJ2Mrql81EMGuMLb81QlnEW27
 75m6phxOwdVtTBiiMdPgDVbouM0C
X-Google-Smtp-Source: ADFU+vsMhdZfZocryCxRv+APUZNBwwKZxG6ZP4D4X5Cq6kmksR+h+wEHCdPwtQnDnew002x3tYsIuQ==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr4083405wmj.176.1583936861126; 
 Wed, 11 Mar 2020 07:27:41 -0700 (PDT)
Received: from localhost ([185.92.221.13])
 by smtp.gmail.com with ESMTPSA id d15sm69494666wrp.37.2020.03.11.07.27.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 11 Mar 2020 07:27:40 -0700 (PDT)
Date: Wed, 11 Mar 2020 14:27:40 +0000
From: Wei Yang <richard.weiyang@gmail.com>
To: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH v1 3/5] drivers/base/memory: store mapping between MMOP_*
 and string in an array
Message-ID: <20200311142740.qh5it3lfaoyqzr6i@master>
References: <20200311123026.16071-1-david@redhat.com>
 <20200311123026.16071-4-david@redhat.com>
 <20200311142002.2htiv4llyam2svta@master>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311142002.2htiv4llyam2svta@master>
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
 David Hildenbrand <david@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 11, 2020 at 02:20:02PM +0000, Wei Yang wrote:
>On Wed, Mar 11, 2020 at 01:30:24PM +0100, David Hildenbrand wrote:
>>Let's use a simple array which we can reuse soon. While at it, move the
>>string->mmop conversion out of the device hotplug lock.
>>
>>Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>Cc: Andrew Morton <akpm@linux-foundation.org>
>>Cc: Michal Hocko <mhocko@kernel.org>
>>Cc: Oscar Salvador <osalvador@suse.de>
>>Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>>Cc: Baoquan He <bhe@redhat.com>
>>Cc: Wei Yang <richard.weiyang@gmail.com>
>>Signed-off-by: David Hildenbrand <david@redhat.com>

Ok, I got the reason.

Reviewed-by: Wei Yang <richard.weiyang@gmail.com>

>>---
>> drivers/base/memory.c | 38 +++++++++++++++++++++++---------------
>> 1 file changed, 23 insertions(+), 15 deletions(-)
>>
>>diff --git a/drivers/base/memory.c b/drivers/base/memory.c
>>index e7e77cafef80..8a7f29c0bf97 100644
>>--- a/drivers/base/memory.c
>>+++ b/drivers/base/memory.c
>>@@ -28,6 +28,24 @@
>> 
>> #define MEMORY_CLASS_NAME	"memory"
>> 
>>+static const char *const online_type_to_str[] = {
>>+	[MMOP_OFFLINE] = "offline",
>>+	[MMOP_ONLINE] = "online",
>>+	[MMOP_ONLINE_KERNEL] = "online_kernel",
>>+	[MMOP_ONLINE_MOVABLE] = "online_movable",
>>+};
>>+
>>+static int memhp_online_type_from_str(const char *str)
>>+{
>>+	int i;
>>+
>>+	for (i = 0; i < ARRAY_SIZE(online_type_to_str); i++) {
>>+		if (sysfs_streq(str, online_type_to_str[i]))
>>+			return i;
>>+	}
>>+	return -EINVAL;
>>+}
>>+
>> #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
>> 
>> static int sections_per_block;
>>@@ -236,26 +254,17 @@ static int memory_subsys_offline(struct device *dev)
>> static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>> 			   const char *buf, size_t count)
>> {
>>+	const int online_type = memhp_online_type_from_str(buf);
>
>In your following patch, you did the same conversion. Is it possible to merge
>them into this one?
>
>> 	struct memory_block *mem = to_memory_block(dev);
>>-	int ret, online_type;
>>+	int ret;
>>+
>>+	if (online_type < 0)
>>+		return -EINVAL;
>> 
>> 	ret = lock_device_hotplug_sysfs();
>> 	if (ret)
>> 		return ret;
>> 
>>-	if (sysfs_streq(buf, "online_kernel"))
>>-		online_type = MMOP_ONLINE_KERNEL;
>>-	else if (sysfs_streq(buf, "online_movable"))
>>-		online_type = MMOP_ONLINE_MOVABLE;
>>-	else if (sysfs_streq(buf, "online"))
>>-		online_type = MMOP_ONLINE;
>>-	else if (sysfs_streq(buf, "offline"))
>>-		online_type = MMOP_OFFLINE;
>>-	else {
>>-		ret = -EINVAL;
>>-		goto err;
>>-	}
>>-
>> 	switch (online_type) {
>> 	case MMOP_ONLINE_KERNEL:
>> 	case MMOP_ONLINE_MOVABLE:
>>@@ -271,7 +280,6 @@ static ssize_t state_store(struct device *dev, struct device_attribute *attr,
>> 		ret = -EINVAL; /* should never happen */
>> 	}
>> 
>>-err:
>> 	unlock_device_hotplug();
>> 
>> 	if (ret < 0)
>>-- 
>>2.24.1
>
>-- 
>Wei Yang
>Help you, Help me

-- 
Wei Yang
Help you, Help me
