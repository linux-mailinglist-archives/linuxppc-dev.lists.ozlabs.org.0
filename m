Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3E420ABC5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:19:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tQDD0LpjzDqwV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:19:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::144;
 helo=mail-il1-x144.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Nf23Yopn; dkim-atps=neutral
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPzg5bzJzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 15:08:31 +1000 (AEST)
Received: by mail-il1-x144.google.com with SMTP id r12so198280ilh.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+++5X0ok/USTU61EKWCP5dPyvgzHG4i1ZVAChxJGx3o=;
 b=Nf23YopnETE+lsG66cgbGnDcqqgRnlxshzu2iV5MZ/jZhMhgHSmTDICYbOA/r+joqD
 vnawen+CMLbcli01QiEV8XzYRZTlx+ElK98BPWbym06ggGOTfHaoYJQOAo8XXqzPMMtC
 Kf1Ltj7gIGQmDGu1pzDm+PAe40rWbwDoxabPFXJNakZvb9BTGannxbZLlz5xhcntuxZf
 kEUZAROB6Wr4HtaRrlYTayt8UjguoNw8CesSTCldwawCDLb7G82mxXBJrj3rn4fjN1UW
 Vw9lNWFPwr5FpjWJlzvYB2UyU8zszUzcCFCkoQENazOKuh3jTSai3jMh+lqhhh8EYOrt
 Zqkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+++5X0ok/USTU61EKWCP5dPyvgzHG4i1ZVAChxJGx3o=;
 b=kfn7yvfNLdL3vzIKWkeWSD0kZlvooEZgJjuk4b+G23ex7Wp9+GFML1ZXItD107+/Ci
 9n+BPdOWI2UkybGDbtIsX5AaBsviHbLm5o2BtqEAxG9kiSodX6F0zO6dU/OAt4i5RbFM
 YlirtADD7BkgErnFwH17hJ1yq/FRKu4Ue82eUA/Qb9Gfgq1VOWzwz99gVNDzVBCl5iyA
 O8aSYBySTNuKilqZXK0IbLzFbjBaaW1as4ZkzmZHhFnlG3Vy79thwQ4KiTJzDtliQF+e
 eSAtYTkXckzN0FUAoH779+pLZjgnUOezoT036qcriByeHWb+mkv/NUhEP9uR6ZocmBct
 KPyA==
X-Gm-Message-State: AOAM533C1i8xCB7W801ITVYbcswh5pDgfaZF46Do0atwQk8IGamqicuk
 1dzAxu+wG7wff9cQlcAJBQ8lFKsxEZHq00G4igE=
X-Google-Smtp-Source: ABdhPJwwiR+vv3sZjFX+cxG3iAxsMdcJD3N6BgyEp7DC+YefFYE7UBoqxqv/ORy1SPyYAshpA+8eIBaWTjDOTwaBtCI=
X-Received: by 2002:a92:d1cd:: with SMTP id u13mr1451493ilg.258.1593148107771; 
 Thu, 25 Jun 2020 22:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <f81f645ba66b760c31f25014f03a0c3a4970f993.1592975969.git.sbobroff@linux.ibm.com>
In-Reply-To: <f81f645ba66b760c31f25014f03a0c3a4970f993.1592975969.git.sbobroff@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 26 Jun 2020 15:08:15 +1000
Message-ID: <CAOSf1CH0s9uReOv9d_gpYp8mAXA0Wp09fKKZB_tbrvFH+LG-YQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/1] powerpc/eeh: Provide a unique ID for each EEH
 recovery
To: Sam Bobroff <sbobroff@linux.ibm.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 24, 2020 at 3:20 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> Give a unique ID to each recovery event, to ease log parsing and
> prepare for parallel recovery.
>
> Also add some new messages with a very simple format that may be
> useful to log-parsers.
>
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
> This patch should be applied on top of my recent(ish) set:
> "powerpc/eeh: Synchronization for safety".

If you're going to do a respin I'd post these as a single series and
rebase it on mainline. There's a bit of drift.

> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 68e6dfa526a5..54f921ff7621 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -197,7 +197,8 @@ EXPORT_SYMBOL_GPL(eeh_recovery_must_be_locked);
>   * for the indicated PCI device, and puts them into a buffer
>   * for RTAS error logging.
>   */
> -static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
> +static size_t eeh_dump_dev_log(unsigned int event_id, struct eeh_dev *edev,
> +                              char *buf, size_t len)

If we're going to pass around some event context then IMO we should
pass around the eeh_event itself rather than just an ID number. That
would give us somewhere to put any extra per-event context (such as
the saved stacktrace) rather than dumping it into eeh_pe.

We'd probably have to fix the "special" events so they're signalled by
some means other than a NULL event pointer.

*snip*


> @@ -280,19 +283,26 @@ static void eeh_pe_report_pdev(struct pci_dev *pdev, eeh_report_fn fn,
>                 driver = eeh_pcid_get(pdev);
>
>                 if (!driver)
> -                       pci_info(pdev, "no driver");
> +                       pci_info(pdev, "EEH(%u): no driver", event_id);
>                 else if (!driver->err_handler)
> -                       pci_info(pdev, "driver not EEH aware");
> +                       pci_info(pdev, "EEH(%u): driver not EEH aware", event_id);
>                 else if (late)
> -                       pci_info(pdev, "driver bound too late");
> +                       pci_info(pdev, "EEH(%u): driver bound too late", event_id);
>                 else {
> -                       new_result = fn(pdev, driver);

> +                       pr_warn("EEH(%u): EVENT=HANDLER_CALL DEVICE=%04x:%02x:%02x.%x DRIVER='%s' HANDLER='%s'\n",

WHY ARE WE YELLING




> @@ -579,7 +598,8 @@ static void *eeh_add_virt_device(struct eeh_dev *edev)
>   * lock is dropped (which it must be in order to take the PCI rescan/remove
>   * lock without risking a deadlock).
>   */
> -static void eeh_rmv_device(struct pci_dev *pdev, void *userdata)
> +static void eeh_rmv_device(unsigned int event_id,
> +                          struct pci_dev *pdev, void *userdata)
>  {
>         struct eeh_dev *edev;
>         struct pci_driver *driver;
> @@ -588,8 +608,8 @@ static void eeh_rmv_device(struct pci_dev *pdev, void *userdata)
>
>         edev = pci_dev_to_eeh_dev(pdev);
>         if (!edev) {
> -               pci_warn(pdev, "EEH: Device removed during processing (#%d)\n",
> -                        __LINE__);
> +               pci_warn(pdev, "EEH(%u): Device removed during processing (#%d)\n",
> +                        event_id, __LINE__);

It's already there, but what's with the __LINE__ ?

> diff --git a/arch/powerpc/kernel/eeh_event.c b/arch/powerpc/kernel/eeh_event.c
> index a7a8dc182efb..bd38d6fe5449 100644
> --- a/arch/powerpc/kernel/eeh_event.c
> +++ b/arch/powerpc/kernel/eeh_event.c
> @@ -26,6 +26,9 @@ static DEFINE_SPINLOCK(eeh_eventlist_lock);
>  static DECLARE_COMPLETION(eeh_eventlist_event);
>  static LIST_HEAD(eeh_eventlist);
>

> +/* Event ID 0 is reserved for special events */
> +static atomic_t eeh_event_id = ATOMIC_INIT(1);
> +

I don't think using zero for all special events is a good idea.
Special events are just events that are detected by the EEH
notification interrupt. Unlike the MMIO / config space detection
mechanism we don't have any device or PE context available in the
interrupt handler so the work of figuring out where the error came
from is punted to the recovery thread.

IMO this function probably shouldn't be calling
eeh_handle_normal_event() at all. Instead it should queue a new
eeh_event (with a unique ID) for each error it finds. That way
handling a "special" event just consists of scanning for which PHB /
PE is currently broken and the actual recovery path is identical. If
we switched to using a threaded IRQ handler (which can block) for the
EEH notification interrupts we could probably kill off special events
entirely.

> @@ -1338,7 +1367,7 @@ void eeh_handle_special_event(void)
>                 if (rc == EEH_NEXT_ERR_FROZEN_PE ||
>                     rc == EEH_NEXT_ERR_FENCED_PHB) {
>                         eeh_pe_state_mark(pe, EEH_PE_RECOVERING);
> -                       eeh_handle_normal_event(pe);
> +                       eeh_handle_normal_event(0, pe);

I think that needs to be a unique ID even if we keep this function
calling eeh_handle_normal_event() directly.

>                 } else {
>                         eeh_for_each_pe(pe, tmp_pe)
>                                 eeh_pe_for_each_dev(tmp_pe, edev, tmp_edev)
> @@ -1347,7 +1376,7 @@ void eeh_handle_special_event(void)
>                         /* Notify all devices to be down */
>                         eeh_pe_state_clear(pe, EEH_PE_PRI_BUS, true);
>                         eeh_set_channel_state(pe, pci_channel_io_perm_failure);
> -                       eeh_pe_report(
> +                       eeh_pe_report(0,
>                                 "error_detected(permanent failure)", pe,
>                                 eeh_report_failure, NULL);
