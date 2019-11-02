Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F7ECC78
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 01:42:49 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474gJR1RwjzF5SM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Nov 2019 11:42:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d;
 helo=mail-il1-x12d.google.com; envelope-from=nathana@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="uBqGl/fE"; 
 dkim-atps=neutral
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474gGF3snSzF7HZ
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2019 11:40:47 +1100 (AEDT)
Received: by mail-il1-x12d.google.com with SMTP id a13so10148585ilp.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Nov 2019 17:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=j1w3geOUMLY6F0WvwQRSxld1TM+sks3RLGpQdNqp+vM=;
 b=uBqGl/fEjEiSdo84nKW8bq2GlpH0iS54w9QEkqWpiZdTT3V7C3UouQAJ+XoLzEJS9z
 JGe+jhWR1zYgYbudMglgSaxs1hm/1YALP89EEd4+h81RSrYKdHj+6z9iosL+IA2JqNHA
 CsfLQ8aL4/lGTA7aCvoWcIrxd4z7ib9b7CvnGVUki0eN4GZfxZc5IAUYaPqcrJYKSbrf
 gb4BPu1o+PqSVXKcjgFo2Td9aANvGKzF17yGvMUCoDTWeOAiraCtsfHP6RfT9lLBkFUH
 h0B/vSg+rmALpdbHtSeTMMz84ERUCQ7gMBkKEL5YjNbN8pzzW2Tunb1yhp2xZGzg+TRp
 uYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=j1w3geOUMLY6F0WvwQRSxld1TM+sks3RLGpQdNqp+vM=;
 b=dl1Vi7otJ09HWw+/Mc3WhWD1ng94ThALa6B59RZ1DuEIGN27USLgK8REKJ8qiy0d0K
 IZprDI/KO03kmn+DQGhjjEMc7190f8gmxR74IcgvLNuoEvYWZxEKT787LA+5+I6k5+zQ
 WR2nXPxoe5cESB/MbhJNrKtqDdpsl9ahM+RtaghIsMP2XG4pDK6cNhTCLRG9MU27b5Xv
 Ed2pTEttxbAWfFYzDom7v24f0g2J+dM3LoZX9K8+cWZ0IHZNCId3vILLd7358fj21FXl
 W+fV4HLEDGIkyXY41a56YXhQZ+GKiFkaArzu35N/f1LZqUroaWyqeTKaqhU9f6L/sUJ1
 w46Q==
X-Gm-Message-State: APjAAAX+/LrfpV5waC6ap+qsLNSmvPjiKAt62aJIwrI9+ICjfdZ3RwI7
 QRBedHnv2vZuXWwptCC5heQGcWe6jMO16UQwqCZYhArN
X-Google-Smtp-Source: APXvYqzJ3jYcghGpZhKU3CCtMqckrJHR+92W4bl07xWkxNJvXgkAPeVPs9ctb/pqYZQ0BiEsyFCrMDpZeGk8ABHy4P4=
X-Received: by 2002:a92:bb95:: with SMTP id x21mr15401258ilk.128.1572655244205; 
 Fri, 01 Nov 2019 17:40:44 -0700 (PDT)
MIME-Version: 1.0
From: Nathan <nathana@gmail.com>
Date: Fri, 1 Nov 2019 17:40:05 -0700
Message-ID: <CABVqaQbcgQ2=1Se0RvVTmK7MUasRy5iB_dF2ah8Syfk_6woPUA@mail.gmail.com>
Subject: Defunct Abatron / BDI2000?
To: linuxppc-dev@lists.ozlabs.org
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I am profusely sorry for adding noise to this list with this semi-OT
post, but I'm becoming increasingly desperate, and I suspect the odds
of running into someone with one of these units here are pretty good.

If there is anyone here who has a BDI2K with the QorIQ P-series
(P3/4/5) target firmware, and wouldn't mind reaching out to me
(off-list is fine, and probably the most polite to everyone else), I
would really, really, really appreciate it.

I'm no embedded systems engineer, but I've got one of these JTAG pods
on loan as I managed to brick a commercial board based on P3041 SoC
and I'm trying to find a way to reflash non-corrupted code to the
on-board parallel NOR.  The board has a confirmed 16-pin COP header on
it, but of course the BDI unit I have access to has MPC85xx target
firmware installed on it.

From what I can tell, not only is this a pretty old debugger model
anyway (and not the most recent one that its manufacturer produced),
but the company who manufactured it (Abatron) appears to have
shuttered their doors over a year ago...the web site is gone and
they've abandoned their domain name, so I have no way of reaching out
to any of the people involved in this product.

Short of making this unit talk to this board, from what I can tell my
only remaining options are to pay hundreds or thousands of $ for some
other JTAG interface that is still actively manufactured and supported
(which I can't justify doing in order to fix this *one* board *one*
time), or to find somebody who can desolder the flash chip so that I
can reflash it with an offline programmer (which I'd really prefer to
avoid).

Thanks so much,

-- Nathan
