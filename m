Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2EE5806CA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 23:31:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsCs7755rz3bw7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 07:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XTWzP+/M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=XTWzP+/M;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LsCrV00x2z3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 07:30:31 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id w205so8224597pfc.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 14:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wLeFnHeL7vjlKLn8EGTK3JTliauPikeFfDHsD2Hn0tU=;
        b=XTWzP+/My95HROYMjfb+t8+gWtkKCzB2NVlrMWvMvTAG2ddPIUNbbx/VGnQDLo5s83
         0Q3+YubYnDC9NCpHwR5CNCdOPDeweLAO/wpX/lERQS6TBstdTnPj4PVNT7C09ODKv4dc
         n7YR9CYi0ysDjG40GM5zhVmU+ZOB4CFTbWBdrf8rQyrCnGywIJjiD9IYGYz/0bac708j
         IL+CLgwYFF58uI5Tb/pRW1nl7Jjn++YmCn91SOrxweBOwc8NBAr7I3JfRr9JyjTQbRDS
         5bM8Cu/2f3aLm8O+8YhiSsF8+rMZcq0AM1LdnCSbuH4joKYQDzs0jg/LbDNMXuA9Lzwd
         xM5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wLeFnHeL7vjlKLn8EGTK3JTliauPikeFfDHsD2Hn0tU=;
        b=vGQiwuofVtxti3G5GO58KCNjaan/zSoLQ3a7bBDTYjIkqBYdmyFhfnD2dF0/uKkRlD
         oxqlQloqKDIvL8Rei346l0AM4PoWNjuQqnbRmxXGY7B09+9D2JFKZQRc+SdCYkPT3YhC
         b/f0axGKZmT2tGTgfcfAJ3CCDahrfnSl8n6b0yMCDlhEh2+RNhq70qSJiWyPvzCQVAwf
         Sdw9Dxb6yHQRoJLc/K2Mz1cqZqS7DCIHwg5lkbeiRArrTBxpP+BOFP3Yb06YgI9ruCpe
         lPlb/6EFSoRLKez/tEv28xMksb5/Lyp+SGyuek4rcUPLAcp8HAijoVDai5cLbREA4QlS
         PUUg==
X-Gm-Message-State: AJIora/Xg8wQnBtMFv614b6KzF5dceciEd38CBZXBcX6bcYvbWvuHj9R
	J9PcvGW/IzEBt66YVBVQxv0=
X-Google-Smtp-Source: AGRyM1tpYITPOSLmtnwiMWtXvd7QNjLwwbnlTkrM/UJTcSzE7nhET1ps5q26rjMX0UVHLKlKPFLCGA==
X-Received: by 2002:a05:6a00:15c3:b0:52b:1675:6dfc with SMTP id o3-20020a056a0015c300b0052b16756dfcmr14849019pfu.52.1658784628335;
        Mon, 25 Jul 2022 14:30:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s14-20020a17090a13ce00b001eee8998f2esm11555790pjf.17.2022.07.25.14.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 14:30:27 -0700 (PDT)
Date: Mon, 25 Jul 2022 14:30:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Message-ID: <20220725213026.GA1319556@roeck-us.net>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
 <20220713202335.1217647-5-cheloha@linux.ibm.com>
 <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
 <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 11:11:41AM -0500, Scott Cheloha wrote:
> On Wed, Jul 13, 2022 at 01:50:14PM -0700, Guenter Roeck wrote:
> > On 7/13/22 13:23, Scott Cheloha wrote:
> > > PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> > > guest control of one or more virtual watchdog timers.  The timers have
> > > millisecond granularity.  The guest is terminated when a timer
> > > expires.
> > > 
> > > This patch adds a watchdog driver for these timers, "pseries-wdt".
> > > 
> > > pseries_wdt_probe() currently assumes the existence of only one
> > > platform device and always assigns it watchdogNumber 1.  If we ever
> > > expose more than one timer to userspace we will need to devise a way
> > > to assign a distinct watchdogNumber to each platform device at device
> > > registration time.
> > > 
> > > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> > 
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> Guenter, Michael,
> 
> Which tree is taking this series?
> 
The series includes non-watchdog changes, so my expectation was that some
other tree would take it.

Guenter

> watchdog-next or PPC development?
> 
> -Scott
