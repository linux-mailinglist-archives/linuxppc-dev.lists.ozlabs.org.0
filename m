Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3466F34A0FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 06:25:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F69RD18dhz3btd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 16:25:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=LGBtSy6x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=LGBtSy6x; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F69Qp29Wvz30MT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 16:25:05 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so3720858pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 22:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DNpRt98fJG6kHRhTsOHE3bYts0c3S4iiO+xiZE8Qyz8=;
 b=LGBtSy6xtL30J7odjS5ti71Mph7wNpTWoBEGILUmfEMmgAwvQ/+Y6nCaN4t6nU7sEK
 DoaQn/UV54e16K2IZmAWaIUNgDzwO8eoxlZe+Bdxg7hmVl4rMPurUAg1gyhzKjuDsC7P
 7RYC1LOcSH2iP700ZripBb8avk/EDaSvYaI0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DNpRt98fJG6kHRhTsOHE3bYts0c3S4iiO+xiZE8Qyz8=;
 b=IH/e/YtXPX296LdIBqaRwXDl4dgHEWalk1ixKoJPZn/uuh5gCKuf0ltRZLEqsuOiCr
 tI3M8x+BmcfkxMGeHmSdfy3KbBx5tNzn//uSkTuZCtRWEj0Cas3tjtWGS+S0etoZkzs+
 gcgNdXf4ubv0QCwvtd68pbMPV9HDvYS6l3Q1q5JM7YDqaFPB0SooUdGf7R4M0YF9nx31
 Fl/+WCKNnM7SjN6ja96m9YbIrt4T0rb2SGvFfgV+Bw3FoN4D0ve52qjEHDV/ourb/eZW
 OFLE6/7XELQPuJLyWFSBU84FOQprimKkkJpblA4EeNAHh7HHC6CI6IbYPaHWGndryaY5
 AFfA==
X-Gm-Message-State: AOAM530wqHyW5NJRj7dhHK7qwF9NXJ8dNCP5p6YpZBBVAFS0vvtCZxS+
 mXu810BtsPq7dRAkXG9hxp+4gA==
X-Google-Smtp-Source: ABdhPJxf5jYnEELZ6yAiMAI/df/mNa4VUzyBRnsmdlUCXj07KCRjTW3105EzdGp2IgcRCLZIVVCW0Q==
X-Received: by 2002:a17:902:708b:b029:e6:77ca:3cb6 with SMTP id
 z11-20020a170902708bb02900e677ca3cb6mr13639461plk.84.1616736303106; 
 Thu, 25 Mar 2021 22:25:03 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id n25sm7454205pgv.66.2021.03.25.22.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 22:25:02 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Daniel Henrique Barboza <danielhb413@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/1] hotplug-cpu.c: show 'last online CPU' error in
 dlpar_cpu_offline()
In-Reply-To: <20210323205056.52768-2-danielhb413@gmail.com>
References: <20210323205056.52768-1-danielhb413@gmail.com>
 <20210323205056.52768-2-danielhb413@gmail.com>
Date: Fri, 26 Mar 2021 16:24:59 +1100
Message-ID: <871rc28p1w.fsf@linkitivity.dja.id.au>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel,

Two small nitpicks:

> This patch adds a 'last online' check in dlpar_cpu_offline() to catch
> the 'last online CPU' offline error, eturning a more informative error
                                       ^--- s/eturning/returning/;


> +			/* device_offline() will return -EBUSY (via cpu_down())
> +			 * if there is only one CPU left. Check it here to fail
> +			 * earlier and with a more informative error message,
> +			 * while also retaining the cpu_add_remove_lock to be sure
> +			 * that no CPUs are being online/offlined during this
> +			 * check. */

Checkpatch has a small issue with this comment:

WARNING: Block comments use a trailing */ on a separate line
#50: FILE: arch/powerpc/platforms/pseries/hotplug-cpu.c:279:
+			 * check. */

Apart from that, this patch seems sane to me, but I haven't been able to
test it.

Kind regards,
Daniel
