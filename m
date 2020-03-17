Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6050A188B50
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 17:58:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hfX04swvzDqkx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 03:58:56 +1100 (AEDT)
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
 header.s=mimecast20190719 header.b=CtL78Je9; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [63.128.21.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hdsx5RcRzDqlL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 03:29:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584462562;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yQFhJkeMlClPNzJr9WGcWOa+gyd2HFJg9MdUprRfJ3w=;
 b=CtL78Je9BTpDxS9W0Um87D4/mkckubmuQjoN1dGq+FFqo1ojrz82M2K1qvdiLYhTunwrG0
 H5WrIP2gWTj75320cXTBwqjhrOIkkuLrclOzRydZlQkxG21elllYBY4JD3pP9n40xoK4RK
 6HT5+Fer8WaCzL3BUnhD/m+e326ssvU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-u0TIHALEOd2LesF3Zwxwyw-1; Tue, 17 Mar 2020 12:29:15 -0400
X-MC-Unique: u0TIHALEOd2LesF3Zwxwyw-1
Received: by mail-wr1-f71.google.com with SMTP id p2so8382438wrw.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 09:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=hJ9IRxNEXJZnQrunYJpAkXFYXEUKw/iYEqZiM94FqR4=;
 b=W/FX/7reyMi3jebL8P/vAR44AP3jtPCXkhovcmZGMuR1y+xbMyW/NyJCtQFlKYwy70
 fDTzZ2FgRr+cimiHgSRrgX7nBqWyUBGwEFi6LKUZyvDThdXEGWwpZfLO98rEBziA9Cmz
 BlVozsXf669W7Vt55RqBN8MXIs0K8jckff6MUUsXP9W/0kh7V47IXALVS7slDXHoEyEZ
 J85mbfzAaevwTxz2jbZb+JzAeFJ+2wfs8LV4MYNplSQsa3qRNWQO7u5PYKfrgyyjWw4u
 qR9y/J0qT7OcQdDbqfnHvlpKQbCiyNDU4hgNzFGer0fzA+LMZOTLvFmrooJkrntIgEth
 GtCA==
X-Gm-Message-State: ANhLgQ3nM1Zj+MRJ8Jm2VBF1kWJfTe8MXV82dhctwCTeNX8DF+numpdx
 HFT4g4yWg9n2ZpfH3duKrRu4tRbp29mUTq7PzuRCfsC++AbL2jm8V22Cr/+JmJexefBkuSHHtAL
 dI8Rluzu1JlGOpkLIYf0vZTeWwA==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr155410wmf.50.1584462553803;
 Tue, 17 Mar 2020 09:29:13 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu7fxbd1NOj1Fd8X5IeMCfKPLtyDx4k9CrBADtVAaVO0WdO+/adOUSeBrq8Zo7JnejqPA35DQ==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr155367wmf.50.1584462553538;
 Tue, 17 Mar 2020 09:29:13 -0700 (PDT)
Received: from vitty.brq.redhat.com (g-server-2.ign.cz. [91.219.240.2])
 by smtp.gmail.com with ESMTPSA id 19sm4550594wma.3.2020.03.17.09.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 09:29:11 -0700 (PDT)
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/8] hv_balloon: don't check for memhp_auto_online
 manually
In-Reply-To: <20200317104942.11178-6-david@redhat.com>
References: <20200317104942.11178-1-david@redhat.com>
 <20200317104942.11178-6-david@redhat.com>
Date: Tue, 17 Mar 2020 17:29:09 +0100
Message-ID: <877dzj3pyi.fsf@vitty.brq.redhat.com>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 Baoquan He <bhe@redhat.com>, David Hildenbrand <david@redhat.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Wei Yang <richard.weiyang@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> We get the MEM_ONLINE notifier call if memory is added right from the
> kernel via add_memory() or later from user space.
>
> Let's get rid of the "ha_waiting" flag - the wait event has an inbuilt
> mechanism (->done) for that. Initialize the wait event only once and
> reinitialize before adding memory. Unconditionally call complete() and
> wait_for_completion_timeout().
>
> If there are no waiters, complete() will only increment ->done - which
> will be reset by reinit_completion(). If complete() has already been
> called, wait_for_completion_timeout() will not wait.
>
> There is still the chance for a small race between concurrent
> reinit_completion() and complete(). If complete() wins, we would not
> wait - which is tolerable (and the race exists in current code as
> well).

How can we see concurent reinit_completion() and complete()? Obvioulsy,
we are not onlining new memory in kernel and hv_mem_hot_add() calls are
serialized, we're waiting up to 5*HZ for the added block to come online
before proceeding to the next one. Or do you mean we actually hit this
5*HZ timeout, proceeded to the next block and immediately after
reinit_completion() we saw complete() for the previously added block?
This is tolerable indeed, we're making forward progress (and this all is
'best effort' anyway).

>
> Note: We only wait for "some" memory to get onlined, which seems to be
>       good enough for now.
>
> Cc: "K. Y. Srinivasan" <kys@microsoft.com>
> Cc: Haiyang Zhang <haiyangz@microsoft.com>
> Cc: Stephen Hemminger <sthemmin@microsoft.com>
> Cc: Wei Liu <wei.liu@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michal Hocko <mhocko@kernel.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: linux-hyperv@vger.kernel.org
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  drivers/hv/hv_balloon.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
>
> diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
> index a02ce43d778d..af5e09f08130 100644
> --- a/drivers/hv/hv_balloon.c
> +++ b/drivers/hv/hv_balloon.c
> @@ -533,7 +533,6 @@ struct hv_dynmem_device {
>  =09 * State to synchronize hot-add.
>  =09 */
>  =09struct completion  ol_waitevent;
> -=09bool ha_waiting;
>  =09/*
>  =09 * This thread handles hot-add
>  =09 * requests from the host as well as notifying
> @@ -634,10 +633,7 @@ static int hv_memory_notifier(struct notifier_block =
*nb, unsigned long val,
>  =09switch (val) {
>  =09case MEM_ONLINE:
>  =09case MEM_CANCEL_ONLINE:
> -=09=09if (dm_device.ha_waiting) {
> -=09=09=09dm_device.ha_waiting =3D false;
> -=09=09=09complete(&dm_device.ol_waitevent);
> -=09=09}
> +=09=09complete(&dm_device.ol_waitevent);
>  =09=09break;
> =20
>  =09case MEM_OFFLINE:
> @@ -726,8 +722,7 @@ static void hv_mem_hot_add(unsigned long start, unsig=
ned long size,
>  =09=09has->covered_end_pfn +=3D  processed_pfn;
>  =09=09spin_unlock_irqrestore(&dm_device.ha_lock, flags);
> =20
> -=09=09init_completion(&dm_device.ol_waitevent);
> -=09=09dm_device.ha_waiting =3D !memhp_auto_online;
> +=09=09reinit_completion(&dm_device.ol_waitevent);
> =20
>  =09=09nid =3D memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
>  =09=09ret =3D add_memory(nid, PFN_PHYS((start_pfn)),
> @@ -753,15 +748,14 @@ static void hv_mem_hot_add(unsigned long start, uns=
igned long size,
>  =09=09}
> =20
>  =09=09/*
> -=09=09 * Wait for the memory block to be onlined when memory onlining
> -=09=09 * is done outside of kernel (memhp_auto_online). Since the hot
> -=09=09 * add has succeeded, it is ok to proceed even if the pages in
> -=09=09 * the hot added region have not been "onlined" within the
> -=09=09 * allowed time.
> +=09=09 * Wait for memory to get onlined. If the kernel onlined the
> +=09=09 * memory when adding it, this will return directly. Otherwise,
> +=09=09 * it will wait for user space to online the memory. This helps
> +=09=09 * to avoid adding memory faster than it is getting onlined. As
> +=09=09 * adding succeeded, it is ok to proceed even if the memory was
> +=09=09 * not onlined in time.
>  =09=09 */
> -=09=09if (dm_device.ha_waiting)
> -=09=09=09wait_for_completion_timeout(&dm_device.ol_waitevent,
> -=09=09=09=09=09=09    5*HZ);
> +=09=09wait_for_completion_timeout(&dm_device.ol_waitevent, 5 * HZ);
>  =09=09post_status(&dm_device);
>  =09}
>  }
> @@ -1707,6 +1701,7 @@ static int balloon_probe(struct hv_device *dev,
>  #ifdef CONFIG_MEMORY_HOTPLUG
>  =09set_online_page_callback(&hv_online_page);
>  =09register_memory_notifier(&hv_memory_nb);
> +=09init_completion(&dm_device.ol_waitevent);
>  #endif
> =20
>  =09hv_set_drvdata(dev, &dm_device);

Reviewed-by: Vitaly Kuznetsov <vkuznets@redhat.com>

--=20
Vitaly

