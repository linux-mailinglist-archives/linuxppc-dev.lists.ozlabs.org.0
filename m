Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3356AE1556
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 11:08:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46yl0y5B17zDqQv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2019 20:08:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ykyn0BBCzDqLf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 20:06:56 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id g81so16724846oib.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2019 02:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FBj8GLla1LYyB2CdUTD0DNJdp/9JV1zJyBmNqUMEb5E=;
 b=s8VNqWJl9hGY5Q3sr7Gq8dVXasnQIMlWoVdjxUhmD3/+4T1k0DZw+nbckaiHdjSuSM
 U1hMhueLsvtmoPF07EY6j8f2Gf1/N1q5NUMl2pSJIOTX6eRKWY3RjwXtBaPOJBPPfdWB
 6znq+x7IjH8bvyewT6qHZ2WhcoMOJsVwwj7UqO8fNwb1zjpUrGTtY8ReLP7cxszwWezR
 pUA+O4rbtnXRszoAn1LySaj7Cmus8Gc+90IEjW8T078vrrwrOgV++yzgbtLHahEw1A/F
 DKn8BIJ5Obj+TjdnaWAu9vc4ehf/9+tKjUxMcdybBGubjiHl93s2GWTnouD4hiEzNWZP
 qE+w==
X-Gm-Message-State: APjAAAVzIzZeHCIPq/Hg/iyjUn7RTLQuAgbDCy4QpKwN/D17jEClAsjq
 zLh9F5a0n8ReWYpWeIg7sPOqUemnRd22rflE0kE=
X-Google-Smtp-Source: APXvYqyTirHnxPx9RjJnt0t5BfWKP5pSpiJnq+2XRPKiTpfW8z3VJ5oCRR5WKfiwapiGyf/vUU3yqd6A2ed8cyxSsVw=
X-Received: by 2002:aca:5885:: with SMTP id m127mr6878786oib.110.1571821614375; 
 Wed, 23 Oct 2019 02:06:54 -0700 (PDT)
MIME-Version: 1.0
References: <20191023082423.12569-1-ran.wang_1@nxp.com>
In-Reply-To: <20191023082423.12569-1-ran.wang_1@nxp.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Oct 2019 11:06:43 +0200
Message-ID: <CAJZ5v0jvQaREhg94f-COdYTt58gMP7YvqdEH0oYiS9Z56tg-XQ@mail.gmail.com>
Subject: Re: [PATCH v9 1/3] PM: wakeup: Add routine to help fetch wakeup
 source object.
To: Ran Wang <ran.wang_1@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, Li Biwen <biwen.li@nxp.com>,
 Huang Anson <anson.huang@nxp.com>, Len Brown <len.brown@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Li Yang <leoyang.li@nxp.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 23, 2019 at 10:24 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Some user might want to go through all registered wakeup sources
> and doing things accordingly. For example, SoC PM driver might need to
> do HW programming to prevent powering down specific IP which wakeup
> source depending on. So add this API to help walk through all registered
> wakeup source objects on that list and return them one by one.
>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Tested-by: Leonard Crestez <leonard.crestez@nxp.com>

OK, thanks for making all of the requested changes:

Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

and please feel free to push this through the appropriate
arch/platform tree.  Alternatively, please let me know if you want me
to take this series, but then I need an ACK from the appropriate
maintainer(s) on patch 3.

> ---
> Change in v9:
>         - Supplement comments for wakeup_sources_read_lock(),
>           wakeup_sources_read_unlock, wakeup_sources_walk_start and
>           wakeup_sources_walk_next().
>
> Change in v8:
>         - Rename wakeup_source_get_next() to wakeup_sources_walk_next().
>         - Add wakeup_sources_read_lock() to take over locking job of
>           wakeup_source_get_star().
>         - Rename wakeup_source_get_start() to wakeup_sources_walk_start().
>         - Replace wakeup_source_get_stop() with wakeup_sources_read_unlock().
>         - Define macro for_each_wakeup_source(ws).
>
> Change in v7:
>         - Remove define of member *dev in wake_irq to fix conflict with commit
>         c8377adfa781 ("PM / wakeup: Show wakeup sources stats in sysfs"), user
>         will use ws->dev->parent instead.
>         - Remove '#include <linux/of_device.h>' because it is not used.
>
> Change in v6:
>         - Add wakeup_source_get_star() and wakeup_source_get_stop() to aligned
>         with wakeup_sources_stats_seq_start/nex/stop.
>
> Change in v5:
>         - Update commit message, add decription of walk through all wakeup
>         source objects.
>         - Add SCU protection in function wakeup_source_get_next().
>         - Rename wakeup_source member 'attached_dev' to 'dev' and move it up
>         (before wakeirq).
>
> Change in v4:
>         - None.
>
> Change in v3:
>         - Adjust indentation of *attached_dev;.
>
> Change in v2:
>         - None.
>
>  drivers/base/power/wakeup.c | 54 +++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_wakeup.h   |  9 ++++++++
>  2 files changed, 63 insertions(+)
>
> diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
> index 5817b51..70a9edb 100644
> --- a/drivers/base/power/wakeup.c
> +++ b/drivers/base/power/wakeup.c
> @@ -248,6 +248,60 @@ void wakeup_source_unregister(struct wakeup_source *ws)
>  EXPORT_SYMBOL_GPL(wakeup_source_unregister);
>
>  /**
> + * wakeup_sources_read_lock - Lock wakeup source list for read.
> + *
> + * Returns an index of srcu lock for struct wakeup_srcu.
> + * This index must be passed to the matching wakeup_sources_read_unlock().
> + */
> +int wakeup_sources_read_lock(void)
> +{
> +       return srcu_read_lock(&wakeup_srcu);
> +}
> +EXPORT_SYMBOL_GPL(wakeup_sources_read_lock);
> +
> +/**
> + * wakeup_sources_read_unlock - Unlock wakeup source list.
> + * @idx: return value from corresponding wakeup_sources_read_lock()
> + */
> +void wakeup_sources_read_unlock(int idx)
> +{
> +       srcu_read_unlock(&wakeup_srcu, idx);
> +}
> +EXPORT_SYMBOL_GPL(wakeup_sources_read_unlock);
> +
> +/**
> + * wakeup_sources_walk_start - Begin a walk on wakeup source list
> + *
> + * Returns first object of the list of wakeup sources.
> + *
> + * Note that to be safe, wakeup sources list needs to be locked by calling
> + * wakeup_source_read_lock() for this.
> + */
> +struct wakeup_source *wakeup_sources_walk_start(void)
> +{
> +       struct list_head *ws_head = &wakeup_sources;
> +
> +       return list_entry_rcu(ws_head->next, struct wakeup_source, entry);
> +}
> +EXPORT_SYMBOL_GPL(wakeup_sources_walk_start);
> +
> +/**
> + * wakeup_sources_walk_next - Get next wakeup source from the list
> + * @ws: Previous wakeup source object
> + *
> + * Note that to be safe, wakeup sources list needs to be locked by calling
> + * wakeup_source_read_lock() for this.
> + */
> +struct wakeup_source *wakeup_sources_walk_next(struct wakeup_source *ws)
> +{
> +       struct list_head *ws_head = &wakeup_sources;
> +
> +       return list_next_or_null_rcu(ws_head, &ws->entry,
> +                               struct wakeup_source, entry);
> +}
> +EXPORT_SYMBOL_GPL(wakeup_sources_walk_next);
> +
> +/**
>   * device_wakeup_attach - Attach a wakeup source object to a device object.
>   * @dev: Device to handle.
>   * @ws: Wakeup source object to attach to @dev.
> diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
> index 661efa0..aa3da66 100644
> --- a/include/linux/pm_wakeup.h
> +++ b/include/linux/pm_wakeup.h
> @@ -63,6 +63,11 @@ struct wakeup_source {
>         bool                    autosleep_enabled:1;
>  };
>
> +#define for_each_wakeup_source(ws) \
> +       for ((ws) = wakeup_sources_walk_start();        \
> +            (ws);                                      \
> +            (ws) = wakeup_sources_walk_next((ws)))
> +
>  #ifdef CONFIG_PM_SLEEP
>
>  /*
> @@ -92,6 +97,10 @@ extern void wakeup_source_remove(struct wakeup_source *ws);
>  extern struct wakeup_source *wakeup_source_register(struct device *dev,
>                                                     const char *name);
>  extern void wakeup_source_unregister(struct wakeup_source *ws);
> +extern int wakeup_sources_read_lock(void);
> +extern void wakeup_sources_read_unlock(int idx);
> +extern struct wakeup_source *wakeup_sources_walk_start(void);
> +extern struct wakeup_source *wakeup_sources_walk_next(struct wakeup_source *ws);
>  extern int device_wakeup_enable(struct device *dev);
>  extern int device_wakeup_disable(struct device *dev);
>  extern void device_set_wakeup_capable(struct device *dev, bool capable);
> --
> 2.7.4
>
