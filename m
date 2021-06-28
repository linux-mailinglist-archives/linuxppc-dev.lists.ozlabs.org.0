Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845623B68A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jun 2021 20:40:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GDGdg2pFjz3bdn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jun 2021 04:40:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.51; helo=mail-pj1-f51.google.com;
 envelope-from=moritz.fischer.private@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GDGdG2Mpsz307m
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jun 2021 04:40:33 +1000 (AEST)
Received: by mail-pj1-f51.google.com with SMTP id
 mn20-20020a17090b1894b02901707fc074e8so456120pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jun 2021 11:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t33UQ33a9u7T7hl2VjGPYacvipLC+DJfwN0oYI3tbdA=;
 b=aAV4bP4pPoz2pADNu9IkV8/GeoYTEL3GJTli9iyUJpKFD0OUG61eF/jNmXrnOnDfxh
 9j2hqUDA9LlzAHMp02IlLGDtsMMvNQ1X+mUNnlh1fjcppFxn1gZMlj9VTz9UbVoiZO6+
 ga7IX6JVkMHLF4o2JVUaGoisruVxVk5akZkMJBz+a66EwFaIluIfdUDiakhNAwp/e7n2
 6dra0nKJ1PvmNhw7R3QxIZmrw+iWyK0KiVFfgedJ91DWeuMpNc8ydpoZnQPsAyBvAnVA
 ykG9QzK7gII96jckwJTrJIDv6pCRLL3dt7vTDtfXP05BizbOlnu1iLNfK4N2kGbe50U0
 a0rQ==
X-Gm-Message-State: AOAM5316e3zs+tEPhUAfKEY8fNwntb6tRWUg1S7YdxDmYtcVdyG4Fs41
 hjmqmCCKnmJENxa6Ae35Tt8=
X-Google-Smtp-Source: ABdhPJwFv7X0ZsN9IyqFwDLoc+nI2ihpePRwMm6qFwPp65TtsWX6OottLedU4r0bEFcHQEouXhywNQ==
X-Received: by 2002:a17:90a:bf03:: with SMTP id
 c3mr3972427pjs.47.1624905629885; 
 Mon, 28 Jun 2021 11:40:29 -0700 (PDT)
Received: from localhost ([2601:647:5b00:1161:a4cc:eef9:fbc0:2781])
 by smtp.gmail.com with ESMTPSA id gl17sm226682pjb.13.2021.06.28.11.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 11:40:29 -0700 (PDT)
Date: Mon, 28 Jun 2021 11:40:28 -0700
From: Moritz Fischer <mdf@kernel.org>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [RFC] fpga: dfl: fme: Fix cpu hotplug code
Message-ID: <YNoXnHq+nlJhO8o6@epycbox.lan>
References: <20210628071546.167088-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210628071546.167088-1-kjain@linux.ibm.com>
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
Cc: mark.rutland@arm.com, maddy@linux.vnet.ibm.com, luwei.kang@intel.com,
 rnsastry@linux.ibm.com, trix@redhat.com, linux-fpga@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 atrajeev@linux.vnet.ibm.com, mdf@kernel.org, will@kernel.org,
 yilun.xu@intel.com, hao.wu@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 28, 2021 at 12:45:46PM +0530, Kajol Jain wrote:
> Commit 724142f8c42a ("fpga: dfl: fme: add performance
> reporting support") added performance reporting support
> for FPGA management engine via perf.
> 
> It also added cpu hotplug feature but it didn't add
> pmu migration call in cpu offline function.
> This can create an issue incase the current designated
> cpu being used to collect fme pmu data got offline,
> as based on current code we are not migrating fme pmu to
> new target cpu. Because of that perf will still try to
> fetch data from that offline cpu and hence we will not
> get counter data.
> 
> Patch fixed this issue by adding pmu_migrate_context call
> in fme_perf_offline_cpu function.
> 
> Fixes: 724142f8c42a ("fpga: dfl: fme: add performance reporting support")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

You might want to Cc: stable@vger.kernel.org if it fixes an actual bug.
> ---
>  drivers/fpga/dfl-fme-perf.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> ---
> - This fix patch is not tested (as I don't have required environment).
>   But issue mentioned in the commit msg can be re-created, by starting any
>   fme_perf event and while its still running, offline current designated
>   cpu pointed by cpumask file. Since current code didn't migrating pmu,
>   perf gonna try getting counts from that offlined cpu and hence we will
>   not get event data.
> ---
> diff --git a/drivers/fpga/dfl-fme-perf.c b/drivers/fpga/dfl-fme-perf.c
> index 4299145ef347..b9a54583e505 100644
> --- a/drivers/fpga/dfl-fme-perf.c
> +++ b/drivers/fpga/dfl-fme-perf.c
> @@ -953,6 +953,10 @@ static int fme_perf_offline_cpu(unsigned int cpu, struct hlist_node *node)
>  		return 0;
>  
>  	priv->cpu = target;
> +
> +	/* Migrate fme_perf pmu events to the new target cpu */
> +	perf_pmu_migrate_context(&priv->pmu, cpu, target);
> +
>  	return 0;
>  }
>  
> -- 
> 2.31.1
> 
- Moritz
