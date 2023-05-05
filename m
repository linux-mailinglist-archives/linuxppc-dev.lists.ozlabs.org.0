Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9616F7B2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 04:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCFQY0X52z3chj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 12:44:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QbKGfhq0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QbKGfhq0;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCFPh15SJz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 12:44:06 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-64115e652eeso16772130b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 19:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683254644; x=1685846644;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6p6u1lFjW4Kf09rSTKWsXMKlDYVeiQSooaSY9v1sr/Q=;
        b=QbKGfhq0/VukYKNOHSY0v6xool59GlcBA7iNCg/HZdPbfNOI2U2wcnjPXAdf3zpDkj
         neU9jKCAtRwHCKxj/dP2KmEw7WoZ+/fSgnPuru60Zr2cLV8DFMTJpFsvQUp0osYoWylv
         rT8pWaBnXgiHvYDJMiG4neHu+4VqKhfWNnr1tIHtYOjRAWtH4DTqcyx92QPeDmU7q82E
         frpiNSAXqak7qrwnnS0dIUPjc5fXWsiEuhJKdxFLctM5Zvbjdi+fLfjCp2V83M1r4jnH
         XnrKN5LRxqq3UGh5iew5MwCe4VHRQcAXT4k2Gtdn/87diQ/0Tf+k5/0FugOrgI2Vifc8
         agSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683254644; x=1685846644;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6p6u1lFjW4Kf09rSTKWsXMKlDYVeiQSooaSY9v1sr/Q=;
        b=ZxAtNJpf5YP6rhQ146bYvu/V9JulmO92sTWYb4t6nRnu+TSHgpYJ9CmxpLUuiWRhHq
         IYRZjN7y21y+ylpiq7TULidngNY2muSs3J651wEifnI76/AciIns9QSUV2pB5SWU+QNB
         1QK36BY81Un4CDaxUFVxf1EwB+NZLxaa7II9P+dqiBKIt91Niei/VSo1mJUjujXAQzSZ
         JszqvNuJPr0J7vn2oe+HcmTnQ7/rznTGJixLafQF/URKJzWMz7u1JbBbIRX4kTTqeK7o
         lQyWp46rw9GzJua2kmXNciCw7nyVJvWBZIZI+uKHwYGkhv8Q4cfsCNR+bwry6hdwQ1HF
         3/jA==
X-Gm-Message-State: AC+VfDxW2Jb0vKM5FJJ4oQt07+4jneFCECCw4jYlP1Rwjc5HztDI0pcU
	TvjCbAd4jjBDTq2PX/Dqafw=
X-Google-Smtp-Source: ACHHUZ4FBwflGrFFYjYNCYAzAyBJY99qsAdoPf2uCzMYjlcj4Lp1AfSMQ3BwlsR14zq5zCM3V2Gwxg==
X-Received: by 2002:a05:6a20:4309:b0:f4:c0d6:87c with SMTP id h9-20020a056a20430900b000f4c0d6087cmr202733pzk.14.1683254643632;
        Thu, 04 May 2023 19:44:03 -0700 (PDT)
Received: from localhost ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id n7-20020aa79047000000b00642ea56f06fsm435666pfo.0.2023.05.04.19.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 19:44:02 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 May 2023 12:43:49 +1000
Message-Id: <CSDZYTDN5EHC.1AOZO6QV1UGJR@wheely>
Subject: Re: [PATCH v4 01/17] watchdog/perf: Define dummy
 watchdog_update_hrtimer_threshold() on correct config
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
In-Reply-To: <20230504151100.v4.1.I8cbb2f4fa740528fcfade4f5439b6cdcdd059251@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> The real watchdog_update_hrtimer_threshold() is defined in
> watchdog_hardlockup_perf.c. That file is included if

In kernel/watchdog_hld.c.

> CONFIG_HARDLOCKUP_DETECTOR_PERF and the function is defined in that
> file if CONFIG_HARDLOCKUP_CHECK_TIMESTAMP.
>
> The dummy version of the function in "nmi.h" didn't get that quite
> right. While this doesn't appear to be a huge deal, it's nice to make
> it consistent.

It doesn't break builds because CHECK_TIMESTAMP is only defined by
x86 so others don't get a double definition, and x86 uses perf lockup
detector, so it gets the out of line version.

So has no functional change but should be fixed.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Fixes: 7edaeb6841df ("kernel/watchdog: Prevent false positives with turbo=
 modes")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Define dummy watchdog_update_hrtimer_threshold() ...") new for v4.
>
>  include/linux/nmi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 048c0b9aa623..771d77b62bc1 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -197,7 +197,7 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh);
>  #endif
> =20
>  #if defined(CONFIG_HARDLOCKUP_CHECK_TIMESTAMP) && \
> -    defined(CONFIG_HARDLOCKUP_DETECTOR)
> +    defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
>  void watchdog_update_hrtimer_threshold(u64 period);
>  #else
>  static inline void watchdog_update_hrtimer_threshold(u64 period) { }
> --=20
> 2.40.1.521.gf1e218fcd8-goog

