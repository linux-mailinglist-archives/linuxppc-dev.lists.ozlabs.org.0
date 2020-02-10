Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5D157E1B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 16:06:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GTkK0xx1zDqM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 02:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uImQGabY; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GTdv46qczDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 02:02:09 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id t26so7841855ioi.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 07:02:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bhMwZCYROirrJMoN5ENbQVM31GkKgHRjbPr+9bhi68s=;
 b=uImQGabY9dxOZONqTfKUL5gE1YbSZdXoJ8AWTRjzEHCFO7x8127xTjm4QQwIjpWIVB
 jrgOeGxFcmfdngVwXgLzHMvbmpZbQNeRyYmkCFDRMKzM8yppUhFMHb6WLK9qQl8oLhqC
 jNa0HenIjQLy+ohapkQQ4ci3ZGTupit7jPRweeMsjyZkln1gQs1JgJcRvbKK+2xWXd6D
 x8m8WVAGeEHODeM99C8aGyHwmXTOgXyZ5yqPEgOjVu+ClX9bF+98A6FaNy163TZRr5IJ
 P9U9+arKycX7zzDMFgbkc64HfLZUPPjzIBaJPoIWQLLooOvdcn00Nw69bs1OiUB4OjTQ
 4VXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bhMwZCYROirrJMoN5ENbQVM31GkKgHRjbPr+9bhi68s=;
 b=UaNwOSz9jLEUigrZY4bAMr1N12QzI8EGvfBPBKpZJS5qtpROLnYzS6JQvjLtjnAn/O
 9WeD6Siyxkx8YvRSWkrT+AlzY1gdU7JkjChcL4/NWLfhKWmRx3+hORrrKsLUAq9222AS
 r0yDAU2YwEbuqArN3+8ED1yrXbkplJQEVCnHkX9NS31oROYhaSOKCY4dHbeaHsGoogQY
 yKHfIfRKrfOQaChAD0ZIRURVSmbOU9oYhG+sxMmgYKSk2MVS3QfDx2VYX9WgwrLHZXzs
 /p2n0Yiy6bckb56Gmopeu5de4aMWtC/NrL2dfz+XK536Nrb6nJkKH0Xw/MCyhVRH7B7l
 CBaA==
X-Gm-Message-State: APjAAAVpBSisSrRp2tPLYnFI7TVS5PygpI/7BPDjEWy2+QY5+H9RREeb
 XvLHUF8k/ppOE+zjENtss7jyYf4RzI8ZJ+bQPt4=
X-Google-Smtp-Source: APXvYqyPnVtT5nH7L0EYMs6xaLx+NOHB7rwRvqU4Z1bh2gtYeyUtXSbA9kAV3MDESOSvEfpVZfpbl96NqCLZcY0b05Q=
X-Received: by 2002:a02:8525:: with SMTP id g34mr10179487jai.72.1581346925348; 
 Mon, 10 Feb 2020 07:02:05 -0800 (PST)
MIME-Version: 1.0
References: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
 <20200209105901.1620958-6-gregkh@linuxfoundation.org>
In-Reply-To: <20200209105901.1620958-6-gregkh@linuxfoundation.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 11 Feb 2020 02:01:53 +1100
Message-ID: <CAOSf1CEKwjDkp-=SMjmJfQirxdGCkadougZbdDS6FK1muNNCZw@mail.gmail.com>
Subject: Re: [PATCH 6/6] powerpc: powernv: no need to check return value of
 debugfs_create functions
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Paul Mackerras <paulus@samba.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 10, 2020 at 12:12 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> When calling debugfs functions, there is no need to ever check the
> return value.  The function can work or not, but the code logic should
> never do something different based on this.

For memtrace debugfs is the only way to actually use the feature. It'd
be nice if it still printed out *something* if it failed to create the
files rather than just being mysteriously absent, but maybe debugfs
itself does that. Looks fine otherwise.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  arch/powerpc/platforms/powernv/memtrace.c  |  7 ----
>  arch/powerpc/platforms/powernv/opal-imc.c  | 24 ++++----------
>  arch/powerpc/platforms/powernv/pci-ioda.c  |  5 ---
>  arch/powerpc/platforms/powernv/vas-debug.c | 37 ++--------------------
>  4 files changed, 10 insertions(+), 63 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/memtrace.c b/arch/powerpc/platforms/powernv/memtrace.c
> index eb2e75dac369..d6d64f8718e6 100644
> --- a/arch/powerpc/platforms/powernv/memtrace.c
> +++ b/arch/powerpc/platforms/powernv/memtrace.c
> @@ -187,11 +187,6 @@ static int memtrace_init_debugfs(void)
>
>                 snprintf(ent->name, 16, "%08x", ent->nid);
>                 dir = debugfs_create_dir(ent->name, memtrace_debugfs_dir);
> -               if (!dir) {
> -                       pr_err("Failed to create debugfs directory for node %d\n",
> -                               ent->nid);
> -                       return -1;
> -               }
>
>                 ent->dir = dir;
>                 debugfs_create_file("trace", 0400, dir, ent, &memtrace_fops);
> @@ -314,8 +309,6 @@ static int memtrace_init(void)
>  {
>         memtrace_debugfs_dir = debugfs_create_dir("memtrace",
>                                                   powerpc_debugfs_root);
> -       if (!memtrace_debugfs_dir)
> -               return -1;
>
>         debugfs_create_file("enable", 0600, memtrace_debugfs_dir,
>                             NULL, &memtrace_init_fops);
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
> index 000b350d4060..968b9a4d1cd9 100644
> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -35,11 +35,10 @@ static int imc_mem_set(void *data, u64 val)
>  }
>  DEFINE_DEBUGFS_ATTRIBUTE(fops_imc_x64, imc_mem_get, imc_mem_set, "0x%016llx\n");
>
> -static struct dentry *imc_debugfs_create_x64(const char *name, umode_t mode,
> -                                            struct dentry *parent, u64  *value)
> +static void imc_debugfs_create_x64(const char *name, umode_t mode,
> +                                  struct dentry *parent, u64  *value)
>  {
> -       return debugfs_create_file_unsafe(name, mode, parent,
> -                                         value, &fops_imc_x64);
> +       debugfs_create_file_unsafe(name, mode, parent, value, &fops_imc_x64);
>  }
>
>  /*
> @@ -59,9 +58,6 @@ static void export_imc_mode_and_cmd(struct device_node *node,
>
>         imc_debugfs_parent = debugfs_create_dir("imc", powerpc_debugfs_root);
>
> -       if (!imc_debugfs_parent)
> -               return;
> -
>         if (of_property_read_u32(node, "cb_offset", &cb_offset))
>                 cb_offset = IMC_CNTL_BLK_OFFSET;
>
> @@ -69,21 +65,15 @@ static void export_imc_mode_and_cmd(struct device_node *node,
>                 loc = (u64)(ptr->vbase) + cb_offset;
>                 imc_mode_addr = (u64 *)(loc + IMC_CNTL_BLK_MODE_OFFSET);
>                 sprintf(mode, "imc_mode_%d", (u32)(ptr->id));
> -               if (!imc_debugfs_create_x64(mode, 0600, imc_debugfs_parent,
> -                                           imc_mode_addr))
> -                       goto err;
> +               imc_debugfs_create_x64(mode, 0600, imc_debugfs_parent,
> +                                      imc_mode_addr);
>
>                 imc_cmd_addr = (u64 *)(loc + IMC_CNTL_BLK_CMD_OFFSET);
>                 sprintf(cmd, "imc_cmd_%d", (u32)(ptr->id));
> -               if (!imc_debugfs_create_x64(cmd, 0600, imc_debugfs_parent,
> -                                           imc_cmd_addr))
> -                       goto err;
> +               imc_debugfs_create_x64(cmd, 0600, imc_debugfs_parent,
> +                                      imc_cmd_addr);
>                 ptr++;
>         }
> -       return;
> -
> -err:
> -       debugfs_remove_recursive(imc_debugfs_parent);
>  }
>
>  /*
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index 22c22cd7bd82..57d3a6af1d52 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -3174,11 +3174,6 @@ static void pnv_pci_ioda_create_dbgfs(void)
>
>                 sprintf(name, "PCI%04x", hose->global_number);
>                 phb->dbgfs = debugfs_create_dir(name, powerpc_debugfs_root);
> -               if (!phb->dbgfs) {
> -                       pr_warn("%s: Error on creating debugfs on PHB#%x\n",
> -                               __func__, hose->global_number);
> -                       continue;
> -               }
>
>                 debugfs_create_file_unsafe("dump_diag_regs", 0200, phb->dbgfs,
>                                            phb, &pnv_pci_diag_data_fops);
> diff --git a/arch/powerpc/platforms/powernv/vas-debug.c b/arch/powerpc/platforms/powernv/vas-debug.c
> index 09e63df53c30..44035a3d6414 100644
> --- a/arch/powerpc/platforms/powernv/vas-debug.c
> +++ b/arch/powerpc/platforms/powernv/vas-debug.c
> @@ -115,7 +115,7 @@ void vas_window_free_dbgdir(struct vas_window *window)
>
>  void vas_window_init_dbgdir(struct vas_window *window)
>  {
> -       struct dentry *f, *d;
> +       struct dentry *d;
>
>         if (!window->vinst->dbgdir)
>                 return;
> @@ -127,28 +127,10 @@ void vas_window_init_dbgdir(struct vas_window *window)
>         snprintf(window->dbgname, 16, "w%d", window->winid);
>
>         d = debugfs_create_dir(window->dbgname, window->vinst->dbgdir);
> -       if (IS_ERR(d))
> -               goto free_name;
> -
>         window->dbgdir = d;
>
> -       f = debugfs_create_file("info", 0444, d, window, &info_fops);
> -       if (IS_ERR(f))
> -               goto remove_dir;
> -
> -       f = debugfs_create_file("hvwc", 0444, d, window, &hvwc_fops);
> -       if (IS_ERR(f))
> -               goto remove_dir;
> -
> -       return;
> -
> -remove_dir:
> -       debugfs_remove_recursive(window->dbgdir);
> -       window->dbgdir = NULL;
> -
> -free_name:
> -       kfree(window->dbgname);
> -       window->dbgname = NULL;
> +       debugfs_create_file("info", 0444, d, window, &info_fops);
> +       debugfs_create_file("hvwc", 0444, d, window, &hvwc_fops);
>  }
>
>  void vas_instance_init_dbgdir(struct vas_instance *vinst)
> @@ -156,8 +138,6 @@ void vas_instance_init_dbgdir(struct vas_instance *vinst)
>         struct dentry *d;
>
>         vas_init_dbgdir();
> -       if (!vas_debugfs)
> -               return;
>
>         vinst->dbgname = kzalloc(16, GFP_KERNEL);
>         if (!vinst->dbgname)
> @@ -166,16 +146,7 @@ void vas_instance_init_dbgdir(struct vas_instance *vinst)
>         snprintf(vinst->dbgname, 16, "v%d", vinst->vas_id);
>
>         d = debugfs_create_dir(vinst->dbgname, vas_debugfs);
> -       if (IS_ERR(d))
> -               goto free_name;
> -
>         vinst->dbgdir = d;
> -       return;
> -
> -free_name:
> -       kfree(vinst->dbgname);
> -       vinst->dbgname = NULL;
> -       vinst->dbgdir = NULL;
>  }
>
>  /*
> @@ -191,6 +162,4 @@ void vas_init_dbgdir(void)
>
>         first_time = false;
>         vas_debugfs = debugfs_create_dir("vas", NULL);
> -       if (IS_ERR(vas_debugfs))
> -               vas_debugfs = NULL;
>  }
> --
> 2.25.0
>
