Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A0268419C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:57:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NpPH6h9lzDqr6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 10:57:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="NiAwzvuW"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NpMb6pnQzDqpR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 10:55:55 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id v9so6202877pgr.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 17:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=JNCR25wKoUF8GmXR1+h5Qxc2sputayqDi9OAgx3GkdA=;
 b=NiAwzvuW1158vo7YqCqImrGi+gOspOS5ptLbXAIoG+Z9ze7uMdcN2eGWAsbNMH7+TG
 3ZkAe/orroen/eLz2qm7eGvkJnmLfn0Ao/sWgWXpra1h3e97Fbq8GTUU6tsqNa0XX05a
 hylXtqpcRAnnO0Mj6KHPmtmbR1ePDFiDX84pGRfqnwJNRN6N/PrW6Cr39MB8mYO7MJlz
 5R3W6R2v9YZy+6iSs2yC/ugh7qMnOvJh1iKbpPuLSnT/ouMOHYhMPkWq+xopLIjw9uu9
 yeTUr5c2xq1OasjqxvVRtr5VrtPFnBVEv4hsmatE9KIsBtR0qj+CcdswIM50TMbSCQvN
 o6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=JNCR25wKoUF8GmXR1+h5Qxc2sputayqDi9OAgx3GkdA=;
 b=R0axrEt0XoS6ty041ufYVg10sJEOa6GoMD97jMsWza67o5P2CykFX6GWHYq5E/Tkih
 zJJMohaBewFVbINERLNtDWGQe5SC1YFH4DTaNkrMuSsbSXssAz1ZZsZBvDZOeBwbY/mi
 xwJrn8K3km4c0vwqSoTkHpAlXvIGSLLjYNPM6UwfBiLgUKciQ9B/l68dOeGX2fBtazS0
 EAm1FqvMBPkkvOaZByXXNcoPzXHcic1yIvBI2F/K09gpNOcusGpgneNRiCI7BCmcEpTB
 jSMb9Wiyd632Ab8NT2cj0Lqiub8CgQMJjAu92j0GuOWaIDKO6UbbGVokSDY+UgcXKJCm
 n4PQ==
X-Gm-Message-State: APjAAAXbR9B+TJ9arDi/EPweQZVjMyY2dD+lCDuAqBc71FpZd0HP9+CG
 plW6W0xzq5LDMnkbRZHKIuQ=
X-Google-Smtp-Source: APXvYqwFJLADjuhoiaHTsjm93GY2KEIrK+4logzMa1qKh7V/rBYbqMu9MhPfYO/mkPAOmVvGgW7CCQ==
X-Received: by 2002:a63:b07:: with SMTP id 7mr22723250pgl.21.1560300952204;
 Tue, 11 Jun 2019 17:55:52 -0700 (PDT)
Received: from localhost (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id u2sm3765259pjv.9.2019.06.11.17.55.50
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 17:55:51 -0700 (PDT)
Date: Wed, 12 Jun 2019 10:52:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
To: Rich Felker <dalias@libc.org>, "David S. Miller" <davem@davemloft.net>,
 Christoph Hellwig <hch@lst.de>, James Hogan <jhogan@kernel.org>, Paul Burton
 <paul.burton@mips.com>, Linus Torvalds <torvalds@linux-foundation.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de>
In-Reply-To: <20190611144102.8848-17-hch@lst.de>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560300464.nijubslu3h.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-sh@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>,
 x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Khalid Aziz <khalid.aziz@oracle.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig's on June 12, 2019 12:41 am:
> Instead of passing a set of always repeated arguments down the
> get_user_pages_fast iterators, create a struct gup_args to hold them and
> pass that by reference.  This leads to an over 100 byte .text size
> reduction for x86-64.

What does this do for performance? I've found this pattern can be
bad for store aliasing detection.

Thanks,
Nick
=
