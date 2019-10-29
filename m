Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DAAE927F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 23:02:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472ltR4QdnzF1Pp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 09:02:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=nxp.com
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472kxW17zZzF36V
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 08:19:42 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id t8so216073otl.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:19:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ecDqSfSuAIrQpm88YN5y/79NJNgXFx+waZx0U92w3DQ=;
 b=nx/rv+7kmAggmtEqPakaM6Rl7Z6sg5y3kZErpIEt7ohpeKUSwPG11GzZcEhAq4ZE7E
 MhUGn41T8EO3/LANCB3lqnWPsIf9rU0hsBTg7sob1S/LoyFToLs4lAs7+jDdCFZk6iXL
 KsQQ8HkBtq2iYBYooB9FfOeluytu8eEHc6ziOdXmvE7frEKJL7sjjvII+6cAmdPImH1S
 ut5PflObmf5Qs+uIw1xOm6LmY8Gzi8cu6v22zrPnNeiWk9qoOL8CaAx6vMPnM3Zy47AP
 SPTNdaD9AnLgMMwkRaCvmTFjphC6KGFk4gsqeALRz9sH6aqn3p/IL0ISjvvSogTBRn09
 nOVg==
X-Gm-Message-State: APjAAAUcOzKTDeAtNXi4uGbsz26SYHFmzHr2P89YONXVOpz77y55VCw+
 5dVUJuhf+KNAs1OSkxVStyUejW6lCPA=
X-Google-Smtp-Source: APXvYqzSinBduDLH6cr+Se7tKSSz/dLd9IcMScm8Cg5NJb9ZxI9CRVdWr7fDTzzh4fTLY7UaMevdEg==
X-Received: by 2002:a9d:6196:: with SMTP id g22mr917418otk.290.1572383978357; 
 Tue, 29 Oct 2019 14:19:38 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com.
 [209.85.210.41])
 by smtp.gmail.com with ESMTPSA id s66sm48029otb.65.2019.10.29.14.19.37
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Oct 2019 14:19:37 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 89so174266oth.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 14:19:37 -0700 (PDT)
X-Received: by 2002:a05:6830:2322:: with SMTP id
 q2mr14516847otg.74.1572383976764; 
 Tue, 29 Oct 2019 14:19:36 -0700 (PDT)
MIME-Version: 1.0
References: <20191024092644.26583-1-ran.wang_1@nxp.com>
In-Reply-To: <20191024092644.26583-1-ran.wang_1@nxp.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Tue, 29 Oct 2019 16:19:25 -0500
X-Gmail-Original-Message-ID: <CADRPPNSTq8=uH-HLP0qhzR1Ob+BQc5=h53km+z3vumMSBX1ccQ@mail.gmail.com>
Message-ID: <CADRPPNSTq8=uH-HLP0qhzR1Ob+BQc5=h53km+z3vumMSBX1ccQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/3] PM: wakeup: Add routine to help fetch wakeup
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, lkml <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 24, 2019 at 4:29 AM Ran Wang <ran.wang_1@nxp.com> wrote:
>
> Some user might want to go through all registered wakeup sources
> and doing things accordingly. For example, SoC PM driver might need to
> do HW programming to prevent powering down specific IP which wakeup
> source depending on. So add this API to help walk through all registered
> wakeup source objects on that list and return them one by one.
>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> Tested-by: Leonard Crestez <leonard.crestez@nxp.com>
> Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Series applied to soc/fsl for next.  Thanks.

Regards,
Leo
> ---
> Change in v10:
>         - Add 'Reviewed-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>'
>           to commit message.
>
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
