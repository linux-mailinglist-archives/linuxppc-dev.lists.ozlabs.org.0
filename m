Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8697146
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 06:48:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CwCv4QbkzDqvd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 14:48:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d41; helo=mail-io1-xd41.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="bULivpwk"; 
 dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Cw9x6f25zDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 14:47:00 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id 18so1931439ioe.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 21:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gIRtYIF7AxvZgTweSNhM0gVt1X73zqBGuI2XK0qc0Ho=;
 b=bULivpwkZq8skxEgjSvrJ7yjHYp6Y+S0gew0BJrXKBMmjGk3HdGZjjs2NBxIWfJ5fR
 uaecHntSXGEIROIET/DWYpWq+SN2Qtm6gv2vwvOCrx2nRiw6wLTTq+29VSTW41JkPOu6
 pH6/CxHwv+GWCoZmqY1rPLOP0qaQEkUo3YpJxrU+UAawdHTrDdw271cmbLZsYL98LXi6
 HF47ssPeIxBMa1pcLc48UFVse7NVgFMnSXXcHHTl4L+MT+G472+bYlNpLevrkKnd7Odr
 DwQdnxW3l0zd8nBlzK6LG+dt5XenQUCj+hzg2laXP+rOoULTISceGFkGPYSBUACZiOjS
 2yXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gIRtYIF7AxvZgTweSNhM0gVt1X73zqBGuI2XK0qc0Ho=;
 b=uGIn07IXmtPNlWE8Rs9Yr2vOTcAxdtX+hGKE34cpZVfrooni1hq2kUuGwn3Bp90vI+
 6UFijALwSfI8AyQLFpvIxUfuBlOrqo4KtnQDWVyC7MS4BIXl+UysLMLA1AXrTXJVHXI0
 AANud9izd/9hFLebXxXU8CnMU2JWKcuv0D52cqm6pYsDqnVjoA64j1f3Du9cN69PqS78
 ZtsuWaZy00LhIYQpF48Tj7ewhlpdFjlSygvsIQ0QyKtH1vnLTbziv0mD0MAOp3JrDude
 J+UbZLzx4eQgdeuZf0RLxmDCKEVb0ZmqY9IeKZ+CS8vB+D7BnAGfWH5uHPmgtfw+P2fu
 dsJw==
X-Gm-Message-State: APjAAAVHH2NusIMZzx7nXHjwlwsyADixDM/V7yOLsfQaLacc6/R6ekS7
 m+BcrnFq7Ht5TJe/bjUbYqQIGWmdFezjXIN5rE0=
X-Google-Smtp-Source: APXvYqwr93g9i4jhCvZZB/5gQgeskOtFRdWntf9zm69cqa695oQ5cPLuIRdnCnyRm3fp2SMNv+nLwJcaN9EqWu8vhPM=
X-Received: by 2002:a6b:6e0e:: with SMTP id d14mr19534535ioh.18.1566362813755; 
 Tue, 20 Aug 2019 21:46:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190821040935.13071-1-anju@linux.vnet.ibm.com>
In-Reply-To: <20190821040935.13071-1-anju@linux.vnet.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 21 Aug 2019 14:46:42 +1000
Message-ID: <CAOSf1CGj1k3nmfBYp9-TWo+V4sbLRXBcFzrbq25hm2YWtW4MWA@mail.gmail.com>
Subject: Re: [PATCH] platform/powernv: Avoid re-registration of imc debugfs
 directory
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>
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

On Wed, Aug 21, 2019 at 2:10 PM Anju T Sudhakar <anju@linux.vnet.ibm.com> wrote:
>
> export_imc_mode_and_cmd() function which creates the debugfs interface for
> imc-mode and imc-command, is invoked when each nest pmu units is
> registered.
> When the first nest pmu unit is registered, export_imc_mode_and_cmd()
> creates 'imc' directory under `/debug/powerpc`. In the subsequent
> invocations debugfs_create_dir() function returns, since the directory
> already exists.
>
> The recent commit <c33d442328f55> (debugfs: make error message a bit more
> verbose), throws a warning if we try to invoke `debugfs_create_dir()`
> with an already existing directory name.
>
> Address this warning by lookup for an existing 'imc' directory,
> and do not invoke debugfs_create_dir(), if the debugfs interface for
> imc already exists.
>
> This patch is based on:
>    https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-July/192979.html
>
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> Tested-by: Nageswara R Sastry <rnsastry@linux.vnet.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/opal-imc.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
> index e04b20625cb9..fc2f0e60a44d 100644
> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -55,14 +55,19 @@ static void export_imc_mode_and_cmd(struct device_node *node,
>         static u64 loc, *imc_mode_addr, *imc_cmd_addr;
>         char mode[16], cmd[16];
>         u32 cb_offset;
> +       struct dentry *dir = NULL;
>         struct imc_mem_info *ptr = pmu_ptr->mem_info;
>
> +

> +       /* Return, if 'imc' interface already exists */
> +       dir = debugfs_lookup("imc", powerpc_debugfs_root);
> +       if (dir) {
> +               dput(dir);
> +               return;
> +       }
>         imc_debugfs_parent = debugfs_create_dir("imc", powerpc_debugfs_root);

Is there a reason why we create the debugfs directory here and not in
opal_imc_counters_probe()? There's logic to remove the debugfs
directory in _probe() already so it seems like a more natural place to
it.

>
> -       /*
> -        * Return here, either because 'imc' directory already exists,
> -        * Or failed to create a new one.
> -        */
> +       /* Return here, if failed to create the directory */
>         if (!imc_debugfs_parent)
>                 return;
>
> --
> 2.20.1
>
