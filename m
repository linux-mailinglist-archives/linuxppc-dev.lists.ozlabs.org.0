Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 19154103613
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 09:34:54 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hwwq1cmvzDqw3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 19:34:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::344;
 helo=mail-ot1-x344.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="OGrrZDpa"; 
 dkim-atps=neutral
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hwtz4Kf6zDqWq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 19:33:12 +1100 (AEDT)
Received: by mail-ot1-x344.google.com with SMTP id r24so20463737otk.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 00:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PED6ZYCgPaRUxZYECcuhZmbEWK8QVrh8hGaeK/4Dmy0=;
 b=OGrrZDpatx6bnWp30f05n9y2GXrNbXiMo4e9QnZukpBs2mQBTMYpR68xirJL+yZqcb
 9sdnCPbGWC8kI+Cfxhyw/lPXYDeNYcaKH+DetkEa1FRbIkd8zXX73GJn0lDVma9Yn+DP
 P6ubPYauQ2q07e3JbhnQ03NsomnKDTD7KwaJlE13VEZ8iqI2Jq/KCqru5SQQ6i/f/8d0
 3rQNufU2Y4RZWJkAdK3paThpZyJKuucOdam3UrlGurxKo1MuSDntifUt38w141wp5c9v
 O/N6W558+sxx+m1/G9/XDUoUBRd0zOdZd98QHHgB5P+zsHbStOP8YVWSCC97LFS5QXpv
 AknA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PED6ZYCgPaRUxZYECcuhZmbEWK8QVrh8hGaeK/4Dmy0=;
 b=rCMQpxV5F7RZkXt5LhVqOElx/+gzawgMuPUxd+x3SZGO5lDDxOlYDWndJwygdIiCUN
 PoCAZjXiZNnbRiGuW/8IjrQzuyxQuMndUmF/tzRxzNyLfDIOILdQJGHEsq/yYTCtm7Hu
 +UQkU7Yru4p165Kqt/fQfwdOm0PmbnOypkHVKm3tQtNv1zpMaNkYwfpUeWiDNwIEu9KI
 bQ9+ljWQDC4wWTaQgDEgEfDJ9qg9W/ju8bagQ6ERuhJEoD3UQ5pBDYTOLh8bYl+68NWy
 2My321OvcA7u67hlSdcP/RnfMP3/vxpKdaGdX3avyhcT9aXgNYaFIMe0QkIvOcSmQrQC
 4A2g==
X-Gm-Message-State: APjAAAUfkc6g+32W92hl+N3XKaje2zO0cNE6o6Oc3sJVJvFi6TQAPkQJ
 HQJhbW1VPzO7tyFYiiPnTPWvKcjRKlrRYV12XQ2Paw==
X-Google-Smtp-Source: APXvYqxkDqT6uw4KByP9K4bk7RdCzo7jskMlJLlwbVVqL/s87+pnLIejk259sfDec0B8L3KT9/52IYH0IkH9klKNnPo=
X-Received: by 2002:a9d:3d76:: with SMTP id a109mr1082964otc.233.1574238786622; 
 Wed, 20 Nov 2019 00:33:06 -0800 (PST)
MIME-Version: 1.0
References: <20190820024941.12640-1-dja@axtens.net>
 <877e6vutiu.fsf@dja-thinkpad.axtens.net>
 <878sp57z44.fsf@dja-thinkpad.axtens.net>
 <CANpmjNOCxTxTpbB_LwUQS5jzfQ_2zbZVAc4nKf0FRXmrwO-7sA@mail.gmail.com>
 <87a78xgu8o.fsf@dja-thinkpad.axtens.net>
 <87y2wbf0xx.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <87y2wbf0xx.fsf@dja-thinkpad.axtens.net>
From: Marco Elver <elver@google.com>
Date: Wed, 20 Nov 2019 09:32:55 +0100
Message-ID: <CANpmjNN-=F6GK_jHPUx8OdpboK7nMV=i=sKKfSsKwKEHnMTG0g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kasan: support instrumented bitops combined with
 generic bitops
To: Daniel Axtens <dja@axtens.net>
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
Cc: linux-s390@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Nov 2019 at 08:42, Daniel Axtens <dja@axtens.net> wrote:
>
> > But the docs do seem to indicate that it's atomic (for whatever that
> > means for a single read operation?), so you are right, it should live in
> > instrumented-atomic.h.
>
> Actually, on further inspection, test_bit has lived in
> bitops/non-atomic.h since it was added in 4117b02132d1 ("[PATCH] bitops:
> generic __{,test_and_}{set,clear,change}_bit() and test_bit()")
>
> So to match that, the wrapper should live in instrumented-non-atomic.h
> too.
>
> If test_bit should move, that would need to be a different patch. But I
> don't really know if it makes too much sense to stress about a read
> operation, as opposed to a read/modify/write...

That's fair enough. I suppose this can stay where it is because it's
not hurting anyone per-se, but the only bad thing about it is that
kernel-api documentation will present test_bit() in non-atomic
operations.

Thanks,
-- Marco
