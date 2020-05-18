Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD8D1D8B3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 00:47:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QvKm062DzDqLg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:47:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=MuYRIVnE; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QvHb5nQdzDqhT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 08:45:47 +1000 (AEST)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 932BB20872
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 22:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589841944;
 bh=XfKXHLG5c8FT5TY6LG4xidXysQtjuuuDl5PLygVDD40=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MuYRIVnE2DSWmPBGMnbamr3O+0hGKf/Bl6uaT3DP33KA6mX7erCmwuZM4SPErtMHb
 zxDpCdpHA8MmBa7P7rwgae7w0JDs+Zut5EtNqu98rbtaXInvttquwHfTbTkclcI+mh
 XxaazHbyWsRzaLIcqOiaMU7j9d7Q9GhTa1pOkjDM=
Received: by mail-ot1-f43.google.com with SMTP id x22so6019103otq.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 15:45:44 -0700 (PDT)
X-Gm-Message-State: AOAM532CIywzVhGFsBKpAlvp3fN/MpHoNfCNK46eoq24e1VZ/sIi1jgp
 hovHCUrl1QpOIVDZlcLIzU9OBWQEwbog5tWJ0g==
X-Google-Smtp-Source: ABdhPJxu0m9gkVQut9aVGjgQQ2NUcWNLFiY9vQROeuhJMX4N1vLfpbLxBcLSs5y8YgBCBnxORqLdwX5yrdd7uW2Cynk=
X-Received: by 2002:a9d:5c8a:: with SMTP id a10mr9915859oti.129.1589841943759; 
 Mon, 18 May 2020 15:45:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200515184434.8470-1-keescook@chromium.org>
 <20200515184434.8470-7-keescook@chromium.org>
In-Reply-To: <20200515184434.8470-7-keescook@chromium.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 18 May 2020 16:45:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLVgdUEP74nJOHOBD2abK=3YfCqX9GmL2iXdPNctcRdjw@mail.gmail.com>
Message-ID: <CAL_JsqLVgdUEP74nJOHOBD2abK=3YfCqX9GmL2iXdPNctcRdjw@mail.gmail.com>
Subject: Re: [PATCH v4 6/6] ramoops: Add max_reason optional field to ramoops
 DT node
To: Kees Cook <keescook@chromium.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Pavel Tatashin <pasha.tatashin@soleen.com>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 15, 2020 at 12:44 PM Kees Cook <keescook@chromium.org> wrote:
>
> From: Pavel Tatashin <pasha.tatashin@soleen.com>

Subject still has 'max_reason'.

>
> Currently, it is possible to dump kmsges for panic, or oops.
> With max_reason it is possible to dump messages for other

And here.

> kmesg_dump events, for example reboot, halt, shutdown, kexec.
>
> Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
> Link: https://lore.kernel.org/lkml/20200506211523.15077-6-keescook@chromium.org/
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  .../devicetree/bindings/reserved-memory/ramoops.txt | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> index 0eba562fe5c6..b7886fea368c 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> +++ b/Documentation/devicetree/bindings/reserved-memory/ramoops.txt
> @@ -30,7 +30,7 @@ Optional properties:
>  - ecc-size: enables ECC support and specifies ECC buffer size in bytes
>    (defaults to 0: no ECC)
>
> -- record-size: maximum size in bytes of each dump done on oops/panic
> +- record-size: maximum size in bytes of each kmsg dump.
>    (defaults to 0: disabled)
>
>  - console-size: size in bytes of log buffer reserved for kernel messages
> @@ -45,7 +45,16 @@ Optional properties:
>  - unbuffered: if present, use unbuffered mappings to map the reserved region
>    (defaults to buffered mappings)
>
> -- no-dump-oops: if present, only dump panics (defaults to panics and oops)
> +- max-reason: if present, sets maximum type of kmsg dump reasons to store
> +  (defaults to 2: log Oopses and Panics). This can be set to INT_MAX to
> +  store all kmsg dumps. See include/linux/kmsg_dump.h KMSG_DUMP_* for other
> +  kmsg dump reason values. Setting this to 0 (KMSG_DUMP_UNDEF), means the
> +  reason filtering will be controlled by the printk.always_kmsg_dump boot
> +  param: if unset, it will be KMSG_DUMP_OOPS, otherwise KMSG_DUMP_MAX.
> +
> +- no-dump-oops: deprecated, use max_reason instead. If present, and
> +  max_reason is not specified, it is equivalent to max_reason = 1

And here (3 times).

> +  (KMSG_DUMP_PANIC).
>
>  - flags: if present, pass ramoops behavioral flags (defaults to 0,
>    see include/linux/pstore_ram.h RAMOOPS_FLAG_* for flag values).
> --
> 2.20.1
>
