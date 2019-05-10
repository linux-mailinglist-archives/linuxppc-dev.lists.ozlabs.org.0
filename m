Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 049D8197E8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 07:08:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450dXF0LfCzDqS2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 15:08:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=sergey.senozhatsky.work@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="c0UMDkfB"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450dVr73ZyzDqRW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 15:07:15 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id f12so219100plt.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 22:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FjMDX6OXptCPbOEPZorERjXrFHT+sQLeZXg4fcoOVO4=;
 b=c0UMDkfB6tTjOuuL7w77f9bWKLRAazsReBhnmqpNGDM0k59e6X/kl3C4Pe6J9eHUen
 VFAkbAqGjUIJBx7hvW7Fh6dqtrYSHH9XX2PvuEVj32Jy9VNtfv95QPZNAgVJgPRL3BKO
 OyB6K6sIcnJOt80RK+9Kgdu4JyMQCO4sdI1JvFP7WzWDVWm7oHYsqPIL5NCA8RM1tJ12
 ggKw4hwLADwL4j8sXY2gT6/wneNWSju7qCVIsYvNXQPH+QrW25KdR1AYG7U4Rz8in6rI
 qNWUTknwUpjjpgfRE8r4QpfQla/BLjPtT0IOYTbpCwB99LwTtNvLRfDE7OPzwXu3cz1B
 Lx1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FjMDX6OXptCPbOEPZorERjXrFHT+sQLeZXg4fcoOVO4=;
 b=D+U43g7tqVtJHZwpNMQLE18v2TPqTAglTd+LcinfnBvs1bH4CKBo9s3V1hp8zilYv0
 F6hOFKVDfTW8J+kWgyhXRPxrzRU2E2woSqEvQfAFEg5tuTCDEkE1afj+LRwAuDNX89W6
 sEB/AHDVmefQUhrPYQ8JPQDq04K/GtAXJHUj5A5hV2+IU07eoRk2D20fBGnQ6XnORO6K
 rAIte7ACBXWOGWo56FoWTrAtIGrUaaN1uchj/tE4c11YwSC/Xd8Q2F0xCCvkDXf77+Al
 j9PYoAiT3LqOk4/FKiDsOr4CFC+T3G7tzyjc/6qqWs7O7OjOSIB/ywabPIAanWb5ag4s
 jWow==
X-Gm-Message-State: APjAAAWWB5jn5bloIGUz9TdTIOgJCgiWQ4ZG1UNwzbDE4ZLKJFRDwj/i
 AogfSNTM+WKj3yW8IPHuUIM=
X-Google-Smtp-Source: APXvYqzNL5x5L+kA/IjbOlsUuaCt+dnLaiieinMh/bSrZ4GSD+ciNLFNHlYGUDHIszX5LplSP6e0cA==
X-Received: by 2002:a17:902:8c85:: with SMTP id
 t5mr10664151plo.23.1557464834204; 
 Thu, 09 May 2019 22:07:14 -0700 (PDT)
Received: from localhost ([39.7.15.25])
 by smtp.gmail.com with ESMTPSA id d67sm5741186pfa.35.2019.05.09.22.07.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 22:07:13 -0700 (PDT)
Date: Fri, 10 May 2019 14:07:09 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190510050709.GA1831@jagdpanzerIV>
References: <20190509121923.8339-1-pmladek@suse.com>
 <20190510043200.GC15652@jagdpanzerIV>
 <CAHk-=wiP+hwSqEW0dM6AYNWUR7jXDkeueq69et6ahfUgV7hC3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiP+hwSqEW0dM6AYNWUR7jXDkeueq69et6ahfUgV7hC3w@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
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
Cc: Petr Mladek <pmladek@suse.com>, linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (05/09/19 21:47), Linus Torvalds wrote:
>    [ Sorry about html and mobile crud, I'm not at the computer right now ]
>    How about we just undo the whole misguided probe_kernel_address() thing?

But the problem will remain - %pS/%pF on PPC (and some other arch-s)
do dereference_function_descriptor(), which calls probe_kernel_address().
So if probe_kernel_address() starts to dump_stack(), then we are heading
towards stack overflow. Unless I'm totally missing something.

	-ss
