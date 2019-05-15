Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E671F5BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:41:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453wgG1Mn8zDqRy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:40:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.195; helo=mail-oi1-f195.google.com;
 envelope-from=mathieu.malaterre@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=debian.org
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453wc51sBRzDqKh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:38:12 +1000 (AEST)
Received: by mail-oi1-f195.google.com with SMTP id w144so1808604oie.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 06:38:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pAA+Nt/HZhHjbsP0fXWoqjBm7blz6engXy9d/4XTJ0c=;
 b=tmxARx1BuJZBmLkWjRnlE13ON8BCER3NK7iu687LAR9KcAuWK7vB7BcHBEni9BZ4bb
 8VO/6A5o33CdpDuKSySWLejByFsV01miKi9mGgGcoeRq7UdBlMvIyNctIhpql34TkoCI
 WI94F3EE8hD8uGGu48PUkbnxFKc79x60shvzb2A+HCG2PSqm3ffCpYnWqq6Ie0BvK71t
 luE6EabHmPAyMLN3afOU58gYtnclNIrSnvknfkf6RDmoYbHavWMjkuh5c8GE1aIQKJx0
 4ZhmFkoM2HOgCkuSC52q0rsGo2LM99bDmLrpbDENsEg8RevSFfaSiUAITCnZ/yEOptqu
 DTIg==
X-Gm-Message-State: APjAAAWGwX6PHYZhiOo5kOtzozW2ikVuwVBDtie9qbFhqpXmJG8pLcuB
 NDBq6PhddA6CO5otJSEiyzlzFzfR2Ael3POFUns=
X-Google-Smtp-Source: APXvYqwCEdN7GTQNIX94hSRLtxI8aePnG+JjdeXJgZzJjL5ZYSCn1KBJ/I+jHCLAJHDM+QWD8XDRgnl13GgYNfyv/tM=
X-Received: by 2002:aca:cd85:: with SMTP id d127mr7034417oig.96.1557927489291; 
 Wed, 15 May 2019 06:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190515120942.3812-1-malat@debian.org>
 <20190515131441.GA3072@infradead.org>
In-Reply-To: <20190515131441.GA3072@infradead.org>
From: Mathieu Malaterre <malat@debian.org>
Date: Wed, 15 May 2019 15:37:57 +0200
Message-ID: <CA+7wUswMoeFdCBqnvMV6ZEbZShY2w23P5CMPktVavwYNL87_wQ@mail.gmail.com>
Subject: Re: [PATCH] powerpc: silence a -Wcast-function-type warning in
 dawr_write_file_bool
To: Christoph Hellwig <hch@infradead.org>
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
Cc: Michael Neuling <mikey@neuling.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Wed, May 15, 2019 at 3:14 PM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Wed, May 15, 2019 at 02:09:42PM +0200, Mathieu Malaterre wrote:
> > In commit c1fe190c0672 ("powerpc: Add force enable of DAWR on P9
> > option") the following piece of code was added:
> >
> >    smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> >
> > Since GCC 8 this trigger the following warning about incompatible
> > function types:
>
> And the warning is there for a reason, and should not be hidden
> behind a cast.  This should instead be fixed by something like this:

<meme: I have no idea what I am doing>
OK, thanks for the quick feedback, will send a v2 asap.

> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index da307dd93ee3..a26b67a1be83 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -384,6 +384,12 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
>  bool dawr_force_enable;
>  EXPORT_SYMBOL_GPL(dawr_force_enable);
>
> +
> +static void set_dawr_cb(void *info)
> +{
> +       set_dawr(info);
> +}
> +
>  static ssize_t dawr_write_file_bool(struct file *file,
>                                     const char __user *user_buf,
>                                     size_t count, loff_t *ppos)
> @@ -403,7 +409,7 @@ static ssize_t dawr_write_file_bool(struct file *file,
>
>         /* If we are clearing, make sure all CPUs have the DAWR cleared */
>         if (!dawr_force_enable)
> -               smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
> +               smp_call_function(set_dawr_cb, &null_brk, 0);
>
>         return rc;
>  }
