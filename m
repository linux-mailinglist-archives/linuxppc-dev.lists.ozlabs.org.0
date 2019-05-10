Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A681319A0F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 10:52:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450kVy1v5lzDqV6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 18:52:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=sergey.senozhatsky.work@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OQ92lVBs"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450kTX3Sk7zDqRh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 18:51:26 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id z16so2679600pgv.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gL9lx8kVDxGBvBDPY9ofQJR5Y2JHIPbQZd/gZRgawmg=;
 b=OQ92lVBs9QTSEI+m13cYS13d0/0pR5CaNigXu41OihDpr1PXII9RPeev5oofTgQeT5
 tzWHJPRVksgdeMEmBLdiSTmw4aZ99QBK202mO1y5D2SV0yiM3Cmc65kPoSn6WK9ve+i2
 WzqzuZYDee8pllOGV+ZWYu7kIzym6K/megZTIsgn4boqc+YuBf7yXDKoLx9u+TaZWyV2
 ZbcSMXOvVQc6P3GzOMmbTs9sYDxMgIgS1fnWySOEHFZm2HYcbj0hTfX34BxN7BqI5flW
 pYyXsBrLLUrYXD7hLLP9GLtBgvme95OwYDZUyt+bOFS+sDESyDFsKE8SsSvIe509KoOj
 CxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gL9lx8kVDxGBvBDPY9ofQJR5Y2JHIPbQZd/gZRgawmg=;
 b=XCudEaugiULcVr795ltjl8Ee839kdZODfSr1MBpsa0nDx9mmMXdm0OQm3tW/V6CCJS
 XR/ySlmEFRl92FeoBpFO2IKxPvq0gywUh5GtJw/nvX8A2ZMfZsYi10hiECiPbjxcZdum
 5p4qQulXbVRYOTm/zFF9Z2pamQcui/lYCZNELlqoxCpT6bMNWI9H1BFgceX6K1C4IVH3
 zzBGOBOBAnSgK6uz6PdUUCMQxu1KV1WyVEcwvdbhQWf9F+9VL+jcLF1fr+M7MjJsBbU3
 YJ+6pZ2tA1htPPlSxbuePC7s78fFfG/kWv3lstkUk/JSBkHHIE8XvKN9aDLRxVx6bZ4i
 nc7g==
X-Gm-Message-State: APjAAAXsez7To2PqNNoGA9mfCoDHg0T1Qsw/OTXlrshm+EchiHuBi7AU
 AsY52z29w0/3L84AKElI+Ys=
X-Google-Smtp-Source: APXvYqz73bpUIGnNQKzUcF4Kv0BOgEYh18rjzWzVuPqLZqaSK693aC3PMkYpkGDq0RRylFJyRjOoKw==
X-Received: by 2002:a63:6f0b:: with SMTP id k11mr11887557pgc.342.1557478284993; 
 Fri, 10 May 2019 01:51:24 -0700 (PDT)
Received: from localhost ([39.7.15.25])
 by smtp.gmail.com with ESMTPSA id b63sm8458414pfj.54.2019.05.10.01.51.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 10 May 2019 01:51:23 -0700 (PDT)
Date: Fri, 10 May 2019 17:51:21 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190510085121.GA17632@jagdpanzerIV>
References: <20190510081635.GA4533@jagdpanzerIV>
 <20190510084213.22149-1-pmladek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510084213.22149-1-pmladek@suse.com>
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
Cc: linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (05/10/19 10:42), Petr Mladek wrote:
[..]
> Fixes: 3e5903eb9cff70730 ("vsprintf: Prevent crash when dereferencing invalid pointers")
> Signed-off-by: Petr Mladek <pmladek@suse.com>

FWIW
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
