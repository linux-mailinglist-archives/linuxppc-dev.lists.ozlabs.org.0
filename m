Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A8D51E578
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 10:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwKlk179Jz3cBP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 18:06:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=d7sa/vJy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=d7sa/vJy; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwKl32v4Kz2xD3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 18:06:23 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id v10so7903686pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 May 2022 01:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=aWQfnp8p3Sa/CZYziUv8sJFvgH/DhWMow1Ki0jzKInQ=;
 b=d7sa/vJyLfF9BR72n72H6iTcORw0kbeaXS21B2+FXdbG66FYCW7FBC02LCRup2bO0T
 VbztyRzKE447Dsr5bQyIcT/N6Q1+c4/IXMaJT3GrJsKz9ltWgOCmeIOcoalYl/8o+V6Q
 JCxhKqmLoYC0fCUjLs/ACK38p33kuWfTfdyYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aWQfnp8p3Sa/CZYziUv8sJFvgH/DhWMow1Ki0jzKInQ=;
 b=BJyqrbWU2+5lXcnyg+PHUqVDHRH7MqWIjXyItCrC1gvM8CFwKkvTamOGww1bg38yZV
 483MAdkQLVzCXdpSLYKy8fJJ3jnJsqvfJsGozWNzflmmrew398gxYGVSS6+YAtcyh9Ej
 LRj8YLwbA7IV++ADhzWVFGkw2smI++QPe/9ZscocUpfIysbWYT2bd/ZNloaMI+wLHl4x
 Lx4+4zIS8uyOzmshJYtWL9Gc8JdhYfHXNxhZ+Vwj85zkPfyYIUEgaJOgMApXv5KqnWdd
 717b9iVAhO6zMrsfu/o9+1J0aSTIuaGa+0/dIMoQI+mw0u0rThI39irKlHqUhFE2SWZ8
 AIYA==
X-Gm-Message-State: AOAM532O+FNidi8snJK7IKVoSwgLino+ZmTrm+8IoxWS7lcayS94KBVK
 ueYilGkB6rIawpYuhsQFcaI8O0K6ERTXuQ==
X-Google-Smtp-Source: ABdhPJyPh1ezOw2sy0EQ6kjmLgD1rSsrITTXAJHnhVIq/PJRePuQKh9Kel3rSaI68O428UlbxAszUg==
X-Received: by 2002:a63:6fc4:0:b0:393:9567:16dc with SMTP id
 k187-20020a636fc4000000b00393956716dcmr5757855pgc.593.1651910779774; 
 Sat, 07 May 2022 01:06:19 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id
 j192-20020a638bc9000000b003c14af505fcsm4564376pge.20.2022.05.07.01.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 01:06:19 -0700 (PDT)
Date: Sat, 7 May 2022 01:06:18 -0700
From: Kees Cook <keescook@chromium.org>
To: Miguel Ojeda <ojeda@kernel.org>
Subject: Re: [PATCH v6 00/23] Rust support
Message-ID: <202205070056.ACC3C3D@keescook>
References: <20220507052451.12890-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220507052451.12890-1-ojeda@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-kselftest@vger.kernel.org,
 live-patching@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 07, 2022 at 07:23:58AM +0200, Miguel Ojeda wrote:
> ## Patch series status
> 
> The Rust support is still to be considered experimental. However,
> support is good enough that kernel developers can start working on the
> Rust abstractions for subsystems and write drivers and other modules.

I'd really like to see this landed for a few reasons:

- It's under active development, and I'd rather review the changes
  "normally", incrementally, etc. Right now it can be hard to re-review
  some of the "mostly the same each version" patches in the series.

- I'd like to break the catch-22 of "ask for a new driver to be
  written in rust but the rust support isn't landed" vs "the rust
  support isn't landed because there aren't enough drivers". It
  really feels like "release early, release often" is needed here;
  it's hard to develop against -next. :)

Should we give it a try for this coming merge window?

-- 
Kees Cook
