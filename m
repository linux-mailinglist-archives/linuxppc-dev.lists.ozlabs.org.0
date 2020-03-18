Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD3B189F5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 16:12:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jD6y5vc1zDqyB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 02:12:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=63.128.21.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=vkuznets@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=SdmhbB/e; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jCrp702ZzDqll
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 02:00:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584543622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eGl81AXOETQ2vk6QwAuLbQxuIwytBmzR9QEu1doc/+g=;
 b=SdmhbB/eaYT3jfHpGK+gATxl5tmSXiXxd0HoRrQyePgkwDns3ojRboNhFxtXCgpYz1h2ed
 aLQQZ9S7F5YwbRSGzBSM4kXGc6CdXEjh0FAjhKBNctqASjLPxdCch6JgFZQETHXYBfu5fJ
 QBUTIsZ1rjlGd1nbnPw4RwuQcJkVQfg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-xyCtUB_PMSO-ezDabvmaqQ-1; Wed, 18 Mar 2020 11:00:20 -0400
X-MC-Unique: xyCtUB_PMSO-ezDabvmaqQ-1
Received: by mail-wr1-f69.google.com with SMTP id o9so12488039wrw.14
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 08:00:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=vM5m3AgHzQ8TLHWUI0zWYeLWIk49n7q4tlPXYDa1gEQ=;
 b=VE/ZHjwJgk7dzj56K7CmZRu1i42ObFzWrjvqF9rmGord5xtkWyW2Yhmab5P+hcFJc6
 bpyGR3YDaS0ibKYukJM2LChHW7HYopyfWTptzjUDYpJFicwE6zG0a4vA/2/Ta/i8TX6C
 GcZSSoeMNQPlbPQktkYDAas/MaJHxbpm9L7PZ5qwGt/431riJgILzKxEThX0v4mgKmYK
 u/FACtpnjd2fHr5w/GXUEDpMYNfLVN2OWWcSVVZugyHNLcOaSpIOEUP2cFnNpLN8+FFz
 uQtihev50xLjzJpB0Q8Xi9U8QnGtayJspODA3O6HKxqg5Zfjh3L5XoyDwaRZeYXyPxW9
 l9tQ==
X-Gm-Message-State: ANhLgQ3ATBHMKiHYaq5+sXEC4d3vW3NH9Rp45TVPrXfsb+1gfJtpM+tx
 o1jLJ8COGtMhVfwSWHy12sAud4jPMYDptX8pr5vPThIY93WeGLRPHtkoUOv1mtjVQxqijiirQPe
 KAO0ZI4RGCp3vnXjqPwucD7GwlA==
X-Received: by 2002:a5d:474c:: with SMTP id o12mr6171291wrs.156.1584543618829; 
 Wed, 18 Mar 2020 08:00:18 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vv+zT1QJmX75ZvxUY39VsKhPCv6bUGTeJatv+Ce8GRjcg/v0Lus2RekaAdHVMZwveqCGhi86Q==
X-Received: by 2002:a5d:474c:: with SMTP id o12mr6171235wrs.156.1584543618411; 
 Wed, 18 Mar 2020 08:00:18 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id x13sm4631033wmj.5.2020.03.18.08.00.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2020 08:00:17 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 0/8] mm/memory_hotplug: allow to specify a default
 online_type
In-Reply-To: <20200318144119.GD30899@MiWiFi-R3L-srv>
References: <20200317104942.11178-1-david@redhat.com>
 <20200318130517.GC30899@MiWiFi-R3L-srv> <87d0993gto.fsf@vitty.brq.redhat.com>
 <20200318144119.GD30899@MiWiFi-R3L-srv>
Date: Wed, 18 Mar 2020 16:00:15 +0100
Message-ID: <874kul3dz4.fsf@vitty.brq.redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
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
 Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Stephen Hemminger <sthemmin@microsoft.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Yang <richard.weiyang@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Milan Zamazal <mzamazal@redhat.com>,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Baoquan He <bhe@redhat.com> writes:

> Is there a reason hyperV need boot with small memory, then enlarge it
> with huge memory? Since it's a real case in hyperV, I guess there must
> be reason, I am just curious.
>

It doesn't really *need* to but this can be utilized in e.g. 'hot
standby' schemes I believe. Also, it may be enough if the administrator
is just trying to e.g. double the size of RAM but the VM is already
under memory pressure. I wouldn't say that these cases are common but
afair bugs like 'I tried adding more memory to my VM and it just OOMed'
were reported in the past.

--=20
Vitaly

