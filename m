Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C096F7B13
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 04:36:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCFFD1K2jz3fHq
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 12:36:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bPL3OQA2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=bPL3OQA2;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCFDJ04fvz3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 12:35:59 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51f1b6e8179so788707a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 19:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683254155; x=1685846155;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evsRyVdUpm9tZ3zbpYtyLZiIFPAu7MWLlo8c04t+4vY=;
        b=bPL3OQA2wcMMOXheYlA8QxViGjC7iCOlxPhX4fuvTbvsINcXnCzBLieoUCDzT+56/k
         9oa+q6KgEYTU31LDEubBwLHoV00eSRef0d7RY6p7N+38ZnXUiPoVuqktGot/CApk96Jy
         mkcd9MflN/bd4aJpaHOyZrzKqFPxkUSgtFeghcahGyjw1M4LGoXeflS5xTbaaMroQ3lN
         TDdNlHzCw9doNfMqYFNpEN+WF6Q8tEWDbjhFSHNaJRFseTWy9ZNqsOe1xYRvqprN7XWn
         oaXxe0JlYPbYRI/LrFIdnf60TDci+s8NR28f2bWdctusrv2FqThGA2JB0SFqFGVL9us2
         jnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683254155; x=1685846155;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evsRyVdUpm9tZ3zbpYtyLZiIFPAu7MWLlo8c04t+4vY=;
        b=SIm7w4NHj2rpjY92lz9gIRVuI8HjPoOnGWjRQJpcIQgAz6DPF2OCeiik2A3unOKVbU
         FdQZyvM5BlcgAUaLNdf1zvhNbkqSfbPYFqM+vjYMTswi7d0F0RRKG44yhaUgkOyArPde
         PwGgVateuCeFJ47msINbC0qujD2sPn0iMrfaLxFGvLIjK/rNZ+FRNfivEJi9YkOdYA2P
         UKXeWn3wRzTmZP8PWxQu/dY9/G3XXBSp0g8tUKWbf3rVAwNtdz8c6DgUSokFuQNFo76/
         JXX7rAwp9wLSFMpN4q824LWmRPHyy0cMSyb20/mfrfIIuXr82bX85cxwMUTEQiDg57Lw
         TQrw==
X-Gm-Message-State: AC+VfDwK2ouiENAHYWFFoj11zpbf00iV5K0kdKAMr9vTkhawnqZSX7TV
	/4vBS/L+3SWLT2vTVIYKza0=
X-Google-Smtp-Source: ACHHUZ7SP5ujyT52IJy91MGux44+fALAl/Za+uzONf57QZ4t+E/ySlwSCIJZv2DqIpZSwxLv82pD9g==
X-Received: by 2002:a05:6a21:999a:b0:fc:8dfb:3195 with SMTP id ve26-20020a056a21999a00b000fc8dfb3195mr5404412pzb.23.1683254154649;
        Thu, 04 May 2023 19:35:54 -0700 (PDT)
Received: from localhost ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id g18-20020a62e312000000b0062dd9a8c1b8sm407591pfh.100.2023.05.04.19.35.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 19:35:53 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 May 2023 12:35:39 +1000
Message-Id: <CSDZSKA38AEF.FY7J3JXBJX4I@wheely>
Subject: Re: [PATCH v4 13/17] watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
In-Reply-To: <20230504151100.v4.13.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
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
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> From: Colin Cross <ccross@android.com>
>
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.

Powerpc's watchdog has an SMP checker, did you see it? It's all to
all rather than buddy which makes it more complicated but arguably
bit better functionality.

Thanks,
Nick
