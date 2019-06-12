Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B6419F9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 03:28:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Nq5j0kd9zDr0q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 11:28:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=nadav.amit@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="agp8Ljxg"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Nq3p28bFzDqvj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 11:27:14 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j2so8570449pfe.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 18:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CtAUnKccNVM3Ar1NimuBm5cYjQQHpUUV35G3NGl7I18=;
 b=agp8LjxgsiKUNBRzMQ6B1lsikXTP9MXAxScOYcZnsKclD0N+jlNVoUl/hzW4poyT5e
 3L5Kpn7BSqpfe4Vqr0OMLbW+npbpmydrSh4Nk6mj5SGyx5Jj6jf653H8VmcdoFa5nFlP
 PVXiNmiBrwZEiKboElbWiL4LdjFKAAbWcoG28ZIwtcy8dPhR9hlh49PJ6xikrmMZLHzP
 20qVkn6ttaCMzY1I08lsTIN5eoleBIFYn7aRuLf/OzGJBwoDwiiv7JFIo5WL8ooodEKt
 b/SI9mnoX3vTwRgRrKm2an9+aTc8TPah2tNonQDJrq5z+DrzQV1yJmuEkhrXeIPbcuOQ
 mhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=CtAUnKccNVM3Ar1NimuBm5cYjQQHpUUV35G3NGl7I18=;
 b=cc7oquR2W0o9lSTFeYGsBu3vtoNbyMe+FG5jhBkszPJQoS1xy+gfUKwhbZSZYuHRIA
 FxZPYxIRtdX+Z4A4s+Th6OFXDl6s+ooSTZysUeHWk8X1l7cxOc2Nu9onAwG22gSmPQD0
 gwjPvAEDtlFzXkXmcrCNOOwZqZthpGwUbO6i6jvNNWKSBzUHJ/btwwPtVUGSib1zOAw+
 fdF4s6xERFf3BBWNkorBx/n1uSkJVBDrizu157ch6fC8tg308KMI1TTzsjKZkIVI49sY
 Cb6bZzfjVcXFg9CHTE5v/qXxFdP2NQB5cZJZ6/B5HLPpcV60L8MDr/u3mbqRFzHSQ4t6
 FuPA==
X-Gm-Message-State: APjAAAX0eQL/h1kbh+04MZVk22KL8opkbzq20SHcRwZ0NinpCY9WZ0sH
 TJ9W2KPIdyEmUrRmNo4G6cY=
X-Google-Smtp-Source: APXvYqyJ4j/UPWrjvOrQasPCqbyNI8I79UTnDUErLKqAMrK1NLwjt0JJmzYLlyxhcupMkfrOP1908w==
X-Received: by 2002:a17:90a:cb87:: with SMTP id
 a7mr10403544pju.130.1560302831475; 
 Tue, 11 Jun 2019 18:27:11 -0700 (PDT)
Received: from [10.2.189.129] ([66.170.99.2])
 by smtp.gmail.com with ESMTPSA id c10sm3547108pjq.14.2019.06.11.18.27.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Jun 2019 18:27:10 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH 16/16] mm: pass get_user_pages_fast iterator arguments in
 a structure
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <1560300464.nijubslu3h.astroid@bobo.none>
Date: Tue, 11 Jun 2019 18:27:09 -0700
Content-Transfer-Encoding: 7bit
Message-Id: <0441EC80-B09F-4722-B186-E42EB6A83386@gmail.com>
References: <20190611144102.8848-1-hch@lst.de>
 <20190611144102.8848-17-hch@lst.de> <1560300464.nijubslu3h.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@lst.de>
X-Mailer: Apple Mail (2.3445.104.11)
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
Cc: the arch/x86 maintainers <x86@kernel.org>, Rich Felker <dalias@libc.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org,
 James Hogan <jhogan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Khalid Aziz <khalid.aziz@oracle.com>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 Paul Mackerras <paulus@samba.org>, Andrey Konovalov <andreyknvl@google.com>,
 sparclinux@vger.kernel.org, linux-mips@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> On Jun 11, 2019, at 5:52 PM, Nicholas Piggin <npiggin@gmail.com> wrote:
> 
> Christoph Hellwig's on June 12, 2019 12:41 am:
>> Instead of passing a set of always repeated arguments down the
>> get_user_pages_fast iterators, create a struct gup_args to hold them and
>> pass that by reference.  This leads to an over 100 byte .text size
>> reduction for x86-64.
> 
> What does this do for performance? I've found this pattern can be
> bad for store aliasing detection.

Note that sometimes such an optimization can also have adverse effect due to
stack protector code that gcc emits when you use such structs.

Matthew Wilcox encountered such a case:
https://patchwork.kernel.org/patch/10702741/
