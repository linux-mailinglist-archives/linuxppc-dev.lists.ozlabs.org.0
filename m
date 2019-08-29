Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E85A11EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 08:42:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JtLz37pZzDrN2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 16:42:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JtJs4DSBzDrKh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 16:40:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="q1HORZW0"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46JtJs3Gg5z8vpr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 16:40:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46JtJs2cjLz9sN1; Thu, 29 Aug 2019 16:40:13 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="q1HORZW0"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46JtJr0f68z9sNm
 for <linuxppc-dev@ozlabs.org>; Thu, 29 Aug 2019 16:40:11 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id o3so1090316plb.13
 for <linuxppc-dev@ozlabs.org>; Wed, 28 Aug 2019 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ORK7X7Ak0hv9l57pH4NKaklPes9OoYBlRdCvb9W3dTo=;
 b=q1HORZW0OWUjI/oO7K00q9t+5S+cjgOt8RQe/7PnPWJMWD9OhqHBvLnu4qgDe/tVT/
 gTg+qo2wqsSu9VsdHm7FxWpN0UtNKq45SLZlnHpeGQuaC8HD1/H2wu36mcgAqbKSvIu0
 vkouxC4mK+bdT56ChNbGZAgyewi1tZ9h+qpfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ORK7X7Ak0hv9l57pH4NKaklPes9OoYBlRdCvb9W3dTo=;
 b=unXH4G9AKOya7RjXCQRCz4+rE/XLWAt+AZklwYO7UN6mRmPID1XpvtmzJgNlfO8vfr
 0e73yt4NUyOKvTCfPN474QW4uUAjFRdwtMKDwprubJYMYXMNzJcXhyzF/O00xkFv+uaU
 Kp65OkrtHhtx6Vh3DzzlC4KIa7YLiVTVxaMblJOT1q0pXai6vQW1InWY37WWGkYNScdC
 unzeGc7Wlwv1tWrydYL2mqQOxlDjgonTYNtPINQUYngMyKI16aHV5XYnGPsJ8C4Xk/cS
 mZZt9ejsuxA+GlpxTZB8SYsC6DigAHRt6OlIzLNfnqM6rdBZCHinIijuDMGRd5zDPoUr
 DCAw==
X-Gm-Message-State: APjAAAWk716T3tivQxIsrbtLv4OOnLGrOYnJekvz+z0a3HR6syL+dNcq
 MZhsXfydPqp3Sfnftce1NdSNrQ==
X-Google-Smtp-Source: APXvYqxDJtWozUOTxlziw7Ld/8on+Ta0l+4nJ5okDn71QH5EXiS01UtjM/Lq+WdusL28oQRhpF6Dwg==
X-Received: by 2002:a17:902:a50a:: with SMTP id
 s10mr8198619plq.108.1567060808510; 
 Wed, 28 Aug 2019 23:40:08 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id r3sm1634491pfr.101.2019.08.28.23.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 23:40:07 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org,
 kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v5 1/2] powerpc/xmon: Allow listing and clearing
 breakpoints in read-only mode
In-Reply-To: <20190828034613.14750-2-cmr@informatik.wtf>
References: <20190828034613.14750-1-cmr@informatik.wtf>
 <20190828034613.14750-2-cmr@informatik.wtf>
Date: Thu, 29 Aug 2019 16:40:03 +1000
Message-ID: <87ef14v5j0.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Chris,

> Read-only mode should not prevent listing and clearing any active
> breakpoints.

I tested this and it works for me:

Tested-by: Daniel Axtens <dja@axtens.net>

> +		if (xmon_is_ro || !scanhex(&a)) {

It took me a while to figure out what this line does: as I understand
it, the 'b' command can also be used to install a breakpoint (as well as
bi/bd). If we are in ro mode or if the input after 'b' doesn't scan as a
hex string, print the list of breakpoints instead. Anyway, I'm now
happy with it, so:

Reviewed-by: Daniel Axtens <dja@axtens.net>

Regards,
Daniel

>  			/* print all breakpoints */
>  			printf("   type            address\n");
>  			if (dabr.enabled) {
> -- 
> 2.23.0
