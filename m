Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A775D49677E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 22:43:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgXtH4Snkz3ckT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 08:43:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VuKq2mgJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VuKq2mgJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=rfontana@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=VuKq2mgJ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=VuKq2mgJ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgSKK3qbtz30Pf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 05:17:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642789056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GaacSGyAu6TYOpVxBPJ/k9LHhTirl5xGNv6nlz2aQl4=;
 b=VuKq2mgJboDoOjDAW53Oy4p9OaFLPygIpnceDhxVHhZsiIoNmuDDFpTGoBq1mihYuULEna
 8M3viC/yrN1rmV/KF93RBu7p5upqqYGcjA2BkBhNIzjtj/qVwgbqDnULYmBu2UhP08RV2W
 r3xpM0dqVYT7fEB1Vo2ewcoWWQ0cFf8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642789056;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GaacSGyAu6TYOpVxBPJ/k9LHhTirl5xGNv6nlz2aQl4=;
 b=VuKq2mgJboDoOjDAW53Oy4p9OaFLPygIpnceDhxVHhZsiIoNmuDDFpTGoBq1mihYuULEna
 8M3viC/yrN1rmV/KF93RBu7p5upqqYGcjA2BkBhNIzjtj/qVwgbqDnULYmBu2UhP08RV2W
 r3xpM0dqVYT7fEB1Vo2ewcoWWQ0cFf8=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-Es_IU0nRP1Oj5uXleu1I9g-1; Fri, 21 Jan 2022 13:17:34 -0500
X-MC-Unique: Es_IU0nRP1Oj5uXleu1I9g-1
Received: by mail-ua1-f69.google.com with SMTP id
 t14-20020ab0550e000000b00305905ffc31so6060505uaa.16
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jan 2022 10:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GaacSGyAu6TYOpVxBPJ/k9LHhTirl5xGNv6nlz2aQl4=;
 b=SOgvoJBWaqi4KFuGCbnCLR0fKA73GqMU6oJrqzbrNpzPduIKklbXVSGSCD6HMxFn2n
 C051/TdoyNMw9zceqt8J6YgZlKfmSlF8zdTGRBmN90B9D2f3Vce4TQ6vwU54khSwtCuQ
 TXRXbc+qtSQ+XTPjL7yL2GHyhy1EYjMcoR7hG0KW9OhP5B2aiuVFOPUFwYFvQ9eLV1D2
 Z95x58P7ImkqmD7IPgfYGKGQk50lvs3S0LP8vIq8wZISc6nm/+JJP65Z6/wW0/jwXAOE
 OWmDzXU5vrnj2/nlFjj8pJyrlNsVcFR3aVe+LSR5QOFJXHB98snUDBopoUGWZcS5ASnY
 2Gnw==
X-Gm-Message-State: AOAM531o9vdlSV9K1y6LcR7hJS4GGhMEG27oZh2LxuaMmTaJ2PHAmxog
 FJfndY7NEwUu0OpnN+06k0RXY6qB7+sxBftIaE80AO6K6aZYoeOyA5D5H+1TRLKGzDI8MzPQWMY
 i5/BIWuiCHG1GTD9oGW5cBYrLAs480QBtZXWavLi1Xw==
X-Received: by 2002:a1f:5702:: with SMTP id l2mr2301193vkb.33.1642789053499;
 Fri, 21 Jan 2022 10:17:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyKQVWJ6KXJy3LfcxZ4flOAQ9SGhoyK4JC3P8EQNxA7sLFJZbBXV8PCImDr+/8PzRc9uNEajJchjCAEfDylnfU=
X-Received: by 2002:a1f:5702:: with SMTP id l2mr2301185vkb.33.1642789053268;
 Fri, 21 Jan 2022 10:17:33 -0800 (PST)
MIME-Version: 1.0
References: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
In-Reply-To: <d2c52284244d6dcb3472d2041abe43b456d116df.1642762977.git.christophe.leroy@csgroup.eu>
From: Richard Fontana <rfontana@redhat.com>
Date: Fri, 21 Jan 2022 13:17:22 -0500
Message-ID: <CAC1cPGypAKcAAia4ipgTWNu33HLW=fb0CSroqR=SK-umrOJb-Q@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc: Add missing SPDX license identifiers
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=rfontana@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 22 Jan 2022 08:40:28 +1100
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 21, 2022 at 6:03 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Several files are missing SPDX license identifiers.
>
> Following files are given the following SPDX identifier based on the comments in the top of the file:
>
>         include/asm/ibmebus.h:/* SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD */
 [...]
>         platforms/pseries/ibmebus.c:// SPDX-License-Identifier: GPL-2.0 OR OpenIB BSD

"OpenIB BSD" is not a defined SPDX identifier. There is an SPDX
identifier "Linux-OpenIB"
https://spdx.org/licenses/Linux-OpenIB.html
but I believe that is not a match to what's in these files
(specifically, the wording of the disclaimer), rather I believe what
you want here is BSD-2-Clause, but you may want to check that.

Richard

