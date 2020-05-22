Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C0B1DEE62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 19:36:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49TDF24vGtzDqwC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 May 2020 03:36:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=mrLZoriV; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49TDBT4KhdzDqvN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 May 2020 03:34:22 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id f4so5282554pgi.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 10:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=vpvOtYEoQPYr60AvQ4lbOXVaOz+PqOzSuTIlFxZC7hs=;
 b=mrLZoriVWpSjIlqWcoKRs7Vf38HcNAIbk1aA1aj5M9bm3Kplf4mG3Nlg9o2f8mXie9
 Fzh3k6kQqtcs2C2Z92Xjo5uCe7mXGGZJ7OhLbKqmeBdBJLXUSvy785BjEvi9KRPXlUyV
 Jt9fS28KExNgHI2bGC8ZrNS0cBGoCgm/quS1o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vpvOtYEoQPYr60AvQ4lbOXVaOz+PqOzSuTIlFxZC7hs=;
 b=Wwev+qrHmrQYspER2kMqXQtLE07CGjBWM2+urwp7ARxVpxJXk/DarHthIy674zx4Gz
 LZoE0o1gBhIdKKjAxgRw2LCOEdbCdVtA6B4MuZYYQW5aBOuT+8KHTz+z9GMZai9YJPo3
 HkqscQLvnec0Zqw9DuzlFqDC2zZMn5PrM7qMHKwBVvQus15UdYTU74yJdLwDYudRSdEk
 qZFnnCCMCNJSivJql37eN7oAQ7kfGoHwac6pysDbBiDSlTmL3Be+MC8KHiBMciBTZDhW
 nxAP8DY7OJamX4CreY/5wkno89Qq/QuQWI/SPASRO3nJ153MRM1vK9/tYyMauA6/PHue
 zWLg==
X-Gm-Message-State: AOAM533tiQrDxPs1vDitMpMdLAlNs64hw861O6JNeUrhwtmFW0nytNiK
 7QuJXEKPvw7uBInVu3DibutL6w==
X-Google-Smtp-Source: ABdhPJw3mEZJxGUEwT+YtZuRAtkaUC2r/G5yxPoHLWK7Hcz3C0nz+4i4d6ISwNAJSlDeH54wMalB+Q==
X-Received: by 2002:a63:b64e:: with SMTP id v14mr15087127pgt.164.1590168859526; 
 Fri, 22 May 2020 10:34:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id q4sm7769112pfu.42.2020.05.22.10.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 10:34:18 -0700 (PDT)
Date: Fri, 22 May 2020 10:34:17 -0700
From: Kees Cook <keescook@chromium.org>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH v4 2/6] printk: honor the max_reason field in kmsg_dumper
Message-ID: <202005221032.859452DFA0@keescook>
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-3-keescook@chromium.org>
 <20200522165120.GL3464@linux-b0ei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200522165120.GL3464@linux-b0ei>
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
Cc: devicetree@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 22, 2020 at 06:51:20PM +0200, Petr Mladek wrote:
> On Fri 2020-05-15 11:44:30, Kees Cook wrote:
> > From: Pavel Tatashin <pasha.tatashin@soleen.com>
> > 
> > kmsg_dump() allows to dump kmesg buffer for various system events: oops,
> > panic, reboot, etc. It provides an interface to register a callback call
> > for clients, and in that callback interface there is a field "max_reason"
> > which gets ignored unless always_kmsg_dump is passed as kernel parameter.
> 
> Strictly speaking, this is not fully true. "max_reason" field is not
> ignored when set to KMSG_DUMP_PANIC even when always_kmsg_dump was not set.
> 
> It should be something like:
> 
> "which gets ignored for reason higher than KMSG_DUMP_OOPS unless
> always_kmsg_dump is passed as kernel parameter".
> 
> Heh, I wonder if anyone will be able to parse this ;-)

Ah yeah, good point. I've reworded things like this:


    kmsg_dump() allows to dump kmesg buffer for various system events: oops,
    panic, reboot, etc. It provides an interface to register a callback
    call for clients, and in that callback interface there is a field
    "max_reason", but it was getting ignored when set to any "reason"
    higher than KMSG_DUMP_OOPS unless "always_kmsg_dump" was passed as
    kernel parameter.

    Allow clients to actually control their "max_reason", and keep the
    current behavior when "max_reason" is not set.

> Otherwise, it looks good to me. With the updated commit message:
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>

Thanks!

-- 
Kees Cook
