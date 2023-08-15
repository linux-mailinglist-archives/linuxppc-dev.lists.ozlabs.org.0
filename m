Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E2E77C8A0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 09:34:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KFI+UK7E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQ3230HTzz3cLx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Aug 2023 17:34:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=KFI+UK7E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQ3176Dc4z2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 17:34:03 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-99c353a395cso690170566b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 00:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1692084836; x=1692689636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=KFI+UK7Ev9NoB+QrDddZx9LmrmscknI+E/D4xZ0r2SJDn+V/VJeg6WzDm8K+PE5VNN
         M2LvF3rGyjKn17nbxKUmHNYzOzfjr95LpdXsPqRBGgf2GbmDPiXhPfd8YTIEkrriESHf
         nVwDddGFJiJnMuNDWe+lbiX5vs9w9SOivomOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692084836; x=1692689636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ptPuBEpK+bTuLrHXWomcWZqL5q0T5IOC69Hvw3A95bI=;
        b=hIGMLHOzYPe5GSYrfJNeflxoluGBjKgh9JgVeL2AuaDOvEosrJyWjd+Ah/y4knTKur
         N7eu9WSgRq5nStjstMwHgnd3JtC45lN1y6oP8xz1FH4NkM0JKs3bLLIjrdi5yXy+yBVJ
         HRoaj84kDSDmp7RW86ytMstp7M2OSBLtWB+/HNfjtUSB9ot6QGlLVYun6csNAtTwStZV
         0i120N+GuEhsJxIj27vwXWgmrJyiYpDzWx+v6ZTJ2EpczW0G2g5mnkXWwI4Vot1MeXcR
         OH0MGQ3bwu2REzWhmNIgF98taa8tJudQrBlykPNXci7czWzlUwmeo4wR/tRThvc44YDv
         4+pw==
X-Gm-Message-State: AOJu0YzXl2CSWDlX/TpQPFFV+JD0vHYUEkISezPTPNJA1KdHI5XgoiQt
	nBddfTnh2Bk24dpAnkR6T8R4qCxi1A1w0HnF23OKVhaa
X-Google-Smtp-Source: AGHT+IE5W3JrX8hkBHLEzzDwl09m82MqER3BKcUxiGXTVmENQ53q792ZODRtOH079N5FdZXDqI6a6g==
X-Received: by 2002:a17:906:3013:b0:99b:ed18:7a10 with SMTP id 19-20020a170906301300b0099bed187a10mr9004109ejz.36.1692084835922;
        Tue, 15 Aug 2023 00:33:55 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id qt27-20020a170906ecfb00b0099bd046170fsm6596855ejb.104.2023.08.15.00.33.53
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 00:33:54 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so6396713a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Aug 2023 00:33:53 -0700 (PDT)
X-Received: by 2002:a05:6402:290:b0:523:1004:1c9a with SMTP id
 l16-20020a056402029000b0052310041c9amr8202386edv.35.1692084833506; Tue, 15
 Aug 2023 00:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <202308151426.97be5bd8-oliver.sang@intel.com>
In-Reply-To: <202308151426.97be5bd8-oliver.sang@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 15 Aug 2023 07:33:36 +0000
X-Gmail-Original-Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Message-ID: <CAHk-=whbOEhPUL1m8Ua-+-E7kJXED4xa+duzRF-wJKR84NAPWg@mail.gmail.com>
Subject: Re: [linus:master] [locking] c8afaa1b0f: stress-ng.zero.ops_per_sec
 6.3% improvement
To: kernel test robot <oliver.sang@intel.com>
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
Cc: feng.tang@intel.com, Mateusz Guzik <mjguzik@gmail.com>, linux-ia64@vger.kernel.org, lkp@intel.com, fengwei.yin@intel.com, ying.huang@intel.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-alpha@vger.kernel.org, oe-lkp@lists.linux.dev, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 15 Aug 2023 at 07:12, kernel test robot <oliver.sang@intel.com> wrote:
>
> kernel test robot noticed a 6.3% improvement of stress-ng.zero.ops_per_sec on:

WTF? That's ridiculous. Why would that even test new_inode() at all?
And why would it make any difference anyway to prefetch a new inode?
The 'zero' test claims to just read /dev/zero in a loop...

[ Goes looking ]

>      39.35            -0.3       39.09        perf-profile.calltrace.cycles-pp.inode_sb_list_add.new_inode.shmem_get_inode.__shmem_file_setup.shmem_zero_setup

Ahh. It also does the mmap side, and the shared case ends up always
creating a new inode.

And while the test only tests *reading* and the mmap is read-only, the
/dev/zero file descriptor was opened for writing too, for a different
part of a test.

So even though the mapping is never written to, MAYWRITE is set, and
so the /dev/zero mapping is done as a shared memory mapping and we
can't do it as just a private one.

That's kind of stupid and looks unintentional, but whatever.

End result: that benchmark ends up being at least partly (and a fairly
noticeable part) a shmem setup benchmark, for no actual good reason.

Oh well. I certainly don't mind the removal apparently then also
helping some odd benchmark case, but I don't think this translates to
anything real. Very random.

                    Linus
