Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE99108583
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 00:20:19 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LmNc0X5zzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 10:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47LmLk57WtzDqXG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 10:18:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="cicZLyeZ"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47LmLh1Nf0z8t3H
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 10:18:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47LmLh12kdz9sPf; Mon, 25 Nov 2019 10:18:36 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=netronome.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=jakub.kicinski@netronome.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=netronome-com.20150623.gappssmtp.com
 header.i=@netronome-com.20150623.gappssmtp.com header.b="cicZLyeZ"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47LmLg6bB8z9sPV
 for <linuxppc-dev@ozlabs.org>; Mon, 25 Nov 2019 10:18:34 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id b137so3790132pga.6
 for <linuxppc-dev@ozlabs.org>; Sun, 24 Nov 2019 15:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=RQBmwWdIIGgnDdpvfkEM//aOqRA5KBb41NFCx63N7s8=;
 b=cicZLyeZUh1ZA/1xCHw1eP8L8XEmzJ90PY5aDtWxQ9Aqq1sgKXjE2fdCuw0qblc/bT
 s2lB5uAouGCo/8VtARjRZJtl0dqwYHWJyGLT0QwXZSMa8lz3n5Lf4B+WFvtjQI27vyNy
 tZ9p1kA163MHTM2h5tHLrjZ+ljOjcB51zP75SohuxLtIBmqBjJu5ZiX8cTP1FbgAAfnE
 hbiFlO8IDdsp3Dw1hlgdGvsDKsnP1QPEmej+oUqkaJDeZ/M7h5qiCAMUy7Yr0Hf6vw6W
 qVfIMgrqncFIlbL/wrDAD6i35tqvkMrVtAeTodMaRYEuKJlTjBTFurvuAPoiMieM5X7J
 H3AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=RQBmwWdIIGgnDdpvfkEM//aOqRA5KBb41NFCx63N7s8=;
 b=EWZiDRyPg3D7wmD5LJ+GB1dlgt0ah1xXg//Qpbh2x8IQ/eiMI0TNvvevwEZLLT88bc
 6CMcWC/GZpXL+UNF+MAir4MrAFeErhEh2G4t85hCZtHKqPtpkRDbwxyRVpJUH+Drj9Cb
 B/wKfaXBdd3YXIL8gOeowY9xf6leju5fPx+t2JV6NHkYl5BQTh14Og1A1+bRgI7NNLEB
 e7tzsYRFbjhWT/23Ppftc3O0MCjNY40V7ojj7Sm2JA+AREXzoFItcrxtCm4j0e0Thgvq
 Ad7BnfIAfLGQmDmmpZ7zsTL79EL6VkXke/wTbs4wMg/4fBsb35QsIiYt+t6xki06BHZ7
 whTA==
X-Gm-Message-State: APjAAAWZWbDa8BDJnRz3A3WPMBbjMU8RYKkVz8H9KNOQ0TsGjcT8KOMC
 gC+kPDk0AljwnrKiH7jZor+GkQ==
X-Google-Smtp-Source: APXvYqwfqee9EFV7qi5/de/OZmKTc+OVsA3hRqpxIOyEHHYm8ud3mIiED6B+pv+05DPGITadwK78cg==
X-Received: by 2002:a62:e308:: with SMTP id g8mr31804436pfh.121.1574637511579; 
 Sun, 24 Nov 2019 15:18:31 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id c17sm5559731pfo.42.2019.11.24.15.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2019 15:18:31 -0800 (PST)
Date: Sun, 24 Nov 2019 15:18:25 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2] powerpc: Add const qual to local_read() parameter
Message-ID: <20191124151825.70d15916@cakuba.netronome.com>
In-Reply-To: <20191120011451.28168-1-mpe@ellerman.id.au>
References: <20191120011451.28168-1-mpe@ellerman.id.au>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: sfr@canb.auug.org.au, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@ozlabs.org, edumazet@google.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 20 Nov 2019 12:14:51 +1100, Michael Ellerman wrote:
> From: Eric Dumazet <edumazet@google.com>
> 
> A patch in net-next triggered a compile error on powerpc:
> 
>   include/linux/u64_stats_sync.h: In function 'u64_stats_read':
>   include/asm-generic/local64.h:30:37: warning: passing argument 1 of 'local_read' discards 'const' qualifier from pointer target type
> 
> This seems reasonable to relax powerpc local_read() requirements.
> 
> Fixes: 316580b69d0a ("u64_stats: provide u64_stats_t type")
> Signed-off-by: Eric Dumazet <edumazet@google.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>

Applied to net-next now, thanks.
