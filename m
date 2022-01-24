Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966D499935
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 22:44:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjNly3rLCz3cCb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 08:43:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=RHC6VLVv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=dianders@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=RHC6VLVv; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjNlJ15dYz2xDV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 08:43:23 +1100 (AEDT)
Received: by mail-io1-xd32.google.com with SMTP id v6so21290917iom.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 13:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bwyi05nr6wT2ZFWR22PTFFEqIa15MbmZhLkPDJsvpx0=;
 b=RHC6VLVvqaubbaCRsVngcmpEX70I5qMnda30/M7WCCZwC5f0cqpQ3RymomMsBkULmw
 nf5/S3hSqeRVgjITKXpsUWSCPJ1zSs0WErq91oJeo4EwKAl5NWPxbZD95UmjUoLTZfxV
 UKqLgKCXjmYxAMpQTBGbu1bs6koOmgR3YMUPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bwyi05nr6wT2ZFWR22PTFFEqIa15MbmZhLkPDJsvpx0=;
 b=XbxiFnPw1Dmulgd35ZoSdEO1lH947M5bv6jHiiRIKaAeZhmPBkdIYUefqe5jlECFZB
 2i1Ng6ravVrLKjiVUvoya1+VZ62ZY8AIlewB/Q5wuIGqGQbbm9O2d4Ddoy4mjKynSYRt
 jZpMzb9u5vyfxT5q2gBGEVWuagYnD9ysBYPGUDpQEbsrOgjGzZjQtArkBeHoWl6MtPMZ
 azRiUis5Jau3iWXqhptw2jr6/muQAaJnPPp+EH9eFLGtr924xnOGY/nPatU3/C61T4sq
 0KqevPMRxA8tWy4m+FXaBYfgDQAENn33gAvUtDNXHeQTf227frAMg3LXea8Rx32Wpvev
 VCmQ==
X-Gm-Message-State: AOAM533xJG1508x1o6JIwP6WyuwYUp/0dwBIB94R5sW9vgF8nQSSigR8
 UIPtNT+Yr/ApVoCjScHA5YkXE8uZx+22GQ==
X-Google-Smtp-Source: ABdhPJyQkhXWBiM1EXYlxzmHYJUYPwc87uKccFtydXHH+IRpOCqPKud/PgjpRA3DPwiWLNihCJnUEQ==
X-Received: by 2002:a5e:9b0e:: with SMTP id j14mr9371292iok.127.1643060599958; 
 Mon, 24 Jan 2022 13:43:19 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com.
 [209.85.166.48])
 by smtp.gmail.com with ESMTPSA id d7sm7942937ilv.7.2022.01.24.13.43.17
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 13:43:18 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id a12so21299771iod.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 13:43:17 -0800 (PST)
X-Received: by 2002:a02:9043:: with SMTP id y3mr7723156jaf.263.1643060597485; 
 Mon, 24 Jan 2022 13:43:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
In-Reply-To: <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jan 2022 13:43:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMUA+8RFOSkVQTmBDrHPSYSG5VBVA_EKKQuBjF0ZZKpQ@mail.gmail.com>
Message-ID: <CAD=FV=VMUA+8RFOSkVQTmBDrHPSYSG5VBVA_EKKQuBjF0ZZKpQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] modules: Add CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, Jan 24, 2022 at 1:22 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2022,8 +2022,11 @@ static int kdb_lsmod(int argc, const char **argv)
>                 if (mod->state == MODULE_STATE_UNFORMED)
>                         continue;
>
> -               kdb_printf("%-20s%8u  0x%px ", mod->name,
> -                          mod->core_layout.size, (void *)mod);
> +               kdb_printf("%-20s%8u", mod->name, mod->core_layout.size);
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +               kdb_printf("/%8u  0x%px ", mod->data_layout.size);

Just counting percentages and arguments, it seems like something's
wrong in the above print statement.

-Doug
