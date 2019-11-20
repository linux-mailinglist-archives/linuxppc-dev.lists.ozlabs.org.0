Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 070FD103578
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 08:45:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Hvqt2VpmzDqsJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Nov 2019 18:45:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="D5sJ4Q1D"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Hvmy4BKKzDqlB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 18:42:57 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id z188so12937726pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Nov 2019 23:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=02fPVIRaO1XujNDxX9CuuJM8AmBmXK/c/uAOUSL7B7k=;
 b=D5sJ4Q1DZ+jmx2DVVm+1lddxjWMyscFIn0ZB/gaJuX/YWXSDnLWVB21GQ32sqegcRf
 1735ifZ8P8hOiEklKsS6kwdQLIvUpfn/DKVERKUpoGkGBB/u13X8qNp9FjzDc2YaGxw3
 A1uULK7fqhZ6Tlt2onYPaBEz6YkRDu+lZPWQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=02fPVIRaO1XujNDxX9CuuJM8AmBmXK/c/uAOUSL7B7k=;
 b=eb/BEWe6ffB54zVjoIWbz2fcXpOycW8h42hepDj/NreYtc42nqAQQ0r6wy05rncGEE
 EtZSA10HfZi7HkomKpMHvZ4XHxfBqWM1cZcdqB5OPFzKB74AFI1Qs2SeTinNZG5EI7H+
 ixG+N16Q1SJdsDJBiqjAiF/ayHjY1vqbYO2RBdupepE6fTFZ1ENNiZm4SGS3Z0gAQWWT
 xVfoW1VfqHW5EJjBMSnbKz8snca1rUcgAy1glRFgBKu4wOYC7EG4dD5QNnSx9lXiliE5
 ZvcGxLFNEZLvpCNv7q0ayjF6NqUMJbr9Beos3V1DWEA8mUrIntjeoYhRQmQK6rNWqUkh
 T1Bg==
X-Gm-Message-State: APjAAAXV6SHaFwwIGQ9tOlrc0af+bLsclXY4WBtznXlS11ZAiUvwSY3k
 ETZ347DOBWL8DvFx2bUOjm0ANQ==
X-Google-Smtp-Source: APXvYqwm/x+WpaWJH4fsf1nTV8LKmnU/DjjJqE0nKakMSYxtLixOURk0cUOdKb/YWAirX92JzeUQPA==
X-Received: by 2002:a62:7847:: with SMTP id t68mr2372866pfc.140.1574235774458; 
 Tue, 19 Nov 2019 23:42:54 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-9c57-4778-d90c-fd6d.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:9c57:4778:d90c:fd6d])
 by smtp.gmail.com with ESMTPSA id 186sm31138852pfb.99.2019.11.19.23.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 23:42:53 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v2 1/2] kasan: support instrumented bitops combined with
 generic bitops
In-Reply-To: <87a78xgu8o.fsf@dja-thinkpad.axtens.net>
References: <20190820024941.12640-1-dja@axtens.net>
 <877e6vutiu.fsf@dja-thinkpad.axtens.net>
 <878sp57z44.fsf@dja-thinkpad.axtens.net>
 <CANpmjNOCxTxTpbB_LwUQS5jzfQ_2zbZVAc4nKf0FRXmrwO-7sA@mail.gmail.com>
 <87a78xgu8o.fsf@dja-thinkpad.axtens.net>
Date: Wed, 20 Nov 2019 18:42:50 +1100
Message-ID: <87y2wbf0xx.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-s390@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 linux-arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> But the docs do seem to indicate that it's atomic (for whatever that
> means for a single read operation?), so you are right, it should live in
> instrumented-atomic.h.

Actually, on further inspection, test_bit has lived in
bitops/non-atomic.h since it was added in 4117b02132d1 ("[PATCH] bitops:
generic __{,test_and_}{set,clear,change}_bit() and test_bit()")

So to match that, the wrapper should live in instrumented-non-atomic.h
too.

If test_bit should move, that would need to be a different patch. But I
don't really know if it makes too much sense to stress about a read
operation, as opposed to a read/modify/write...

Regards,
Daniel
