Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B3017B5C9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 05:43:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YZjz17vrzDqxf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 15:43:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=VmRK0Dp2; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YZgk054CzDqLH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 15:41:05 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id gc16so1220355pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 20:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=gDhoLBPbw39blGHjDAPLsZALagPQFSiHgjEK3HrRMQo=;
 b=VmRK0Dp2RVwIyaAN7aMhtRBKF5cEmvwtl6Nd9ixBrmGaGkBXUu1pnNQBBE+5vHoOh0
 mwmpCgJKqgrf6r0elW83qT/IzjF/e6kg2YPCRakOzQGSFzTInw86FNzFpYYHAiCFismg
 +s9fbucjeKhlTO791Dn/N9kizGcnXnAJOJ7yQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=gDhoLBPbw39blGHjDAPLsZALagPQFSiHgjEK3HrRMQo=;
 b=WXcE+TRSl8iLuA0lGTpvrUJwR0b/briNBv4B69gO/Nc8c4D0pyDanzilT/pe/jCd7l
 hRjC1qjwNGvZb40qJouFqXgOYTdmyFaC1aFTyw6rexRgD5xIX+Rb0/6l5BoW9Im53/64
 hTT0k42SMW7+MN/sz5QpiPYo34xX00oiWWu8uaibwwRvR/G5tRkImgEjX+ANFpe6XtCc
 WhEUFu62XdFdHBgshToSBniK3R9/1rA4TgkLAWGkMqVFj+MbcTqSjnEYdaHtd4cEHmxh
 81+OCt6D28eXUBcfY/1xFLhwqXgI5lvvkIRuaU6ViBtn3DpiGQ8mECzpMZBoNvZ/I8ne
 k0mA==
X-Gm-Message-State: ANhLgQ0dpY1Q6m3OVHDOOn7hpXiOYB7cMiyyYY/D4fq9XeqXDIwVKqwC
 wxTylHsGSHRY4koBPDadc8osFA==
X-Google-Smtp-Source: ADFU+vvHZGq0r/Ysul608LdjBAkSwwxQQSKr0vtzxxJhK6+S0WBYwokXjnMvq8eGVDCckPVh8M0EGw==
X-Received: by 2002:a17:902:ab97:: with SMTP id
 f23mr1245738plr.182.1583469662406; 
 Thu, 05 Mar 2020 20:41:02 -0800 (PST)
Received: from localhost
 (2001-44b8-111e-5c00-e8e4-7e74-35be-5756.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:e8e4:7e74:35be:5756])
 by smtp.gmail.com with ESMTPSA id i6sm7572497pjt.3.2020.03.05.20.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 20:41:01 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc: setup_64: set up PACA earlier to avoid kcov
 problems
In-Reply-To: <59e8a506-572a-f355-e0ca-9c75758a9b65@linux.ibm.com>
References: <20200213052327.24207-1-dja@axtens.net>
 <59e8a506-572a-f355-e0ca-9c75758a9b65@linux.ibm.com>
Date: Fri, 06 Mar 2020 15:40:57 +1100
Message-ID: <87zhcup02u.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> There's some special handling for CPU_FTR_HVMODE in 
> cpufeatures_setup_cpu() in kernel/dt_cpu_ftrs.c:
>
>          /* Initialize the base environment -- clear FSCR/HFSCR.  */
>          hv_mode = !!(mfmsr() & MSR_HV);
>          if (hv_mode) {
>                  /* CPU_FTR_HVMODE is used early in PACA setup */
>                  cur_cpu_spec->cpu_features |= CPU_FTR_HVMODE;
>                  mtspr(SPRN_HFSCR, 0);
>          }
>
> With this patch, the comment about PACA setup I assume is no longer 
> true. It looks like we still rely on hv_mode being set to deal with 
> discrepancies between the device tree and the MSR.

This code confuses me. IIUC it sets the CPU feature if we're in HV mode,
which will catch the case where the HV bit is set in the MSR but for
some reason it's not listed in the DT. With my patch, we'll directly
test the MSR so we don't need the cpu feature set for that.

However, the CPU feature is tested elsewhere, so I think the correct
behaviour is to keep the code but drop the comment. Having said that
bootstrapping is hard so lmk if I've misunderstood.

Regards,
Daniel
>
> -- 
> Andrew Donnellan              OzLabs, ADL Canberra
> ajd@linux.ibm.com             IBM Australia Limited
