Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A42661E83A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:23:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453ky70KgSzDqQM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:23:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=sergey.senozhatsky.work@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="o375KU68"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453kw003bKzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:21:19 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id g9so807558plm.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 23:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vpr9qeWej7/xdaLzfL7kzDfFrVNMEMZWeQ2yDGuvcWA=;
 b=o375KU68c6cq1L9rhDvFqMLy/36KzkumU5eyglTJpzMIPwAslM+THguYtGV24yszrB
 AfYo9WtSVI4YPeApa2se9off1OySDBkrKN7buQLJmfCNI/aUK7RfjMnE/bGxwyACd7HW
 g43h4W/w7cF1ebM7p3GlKDoMC/No0MM/60V7FFaBW4jE3VheGcBQfsSDliKPbh80RMYI
 dOTUBqDXrX4eE2LtTtSOQAHYRUCrNB5AZxKgRYAE1MmJfuYWQBqZx6l5sqSUhtrZ1gg1
 924TKUokkcN8xRTqUfEE68pHktdBzMgi/pqoWUNqh/12ErYeobF1s95PpggCN9DKAtsk
 f1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vpr9qeWej7/xdaLzfL7kzDfFrVNMEMZWeQ2yDGuvcWA=;
 b=SV7YnE+9hFOeHULGXoayIiRxePZVi8TpcuFxXC7Gv2oVK9kMhJF11adMdXnhDAsLRr
 w9mJ9h4AVKxspkvlYS91e3wJ6Xbqo2IsStoegFf5I/RTrg9WI+zE4oIKkObYEBPH9qSV
 FEpr6J1izXqhP4ZB8p0Eywh2GS4BffCWtFBYrzn0zkmsAg5Fvulj8oBmEAAT9sjG/OGb
 G2vXRCdGHVJMaUpycMRYQPVQLFqM/JWdo3zYKWyyQDDcNhQ1bpqzxJ/rojA5zM+wZzqj
 gs3cdqfcmzl2ddmlJd2ayK+Lqei9KV9tO0rhlIKk8RlODWrWHHzuENVsxGF/BhSBgBCD
 FUCg==
X-Gm-Message-State: APjAAAUE2oBh6yX9xRglkgG02IB7gYklKyFA8tyPIlEZTLmF2+fvZAcX
 N5+G+Lrvvm+GL36Ac+zXhTw=
X-Google-Smtp-Source: APXvYqzRJKRDGGgSFBUw3D9wrq2bEKNWyL8HrksRCPNPrE+2T1MlywAkkHnSpqiXENFfwknkCI68dQ==
X-Received: by 2002:a17:902:6bc8:: with SMTP id
 m8mr41177371plt.227.1557901275995; 
 Tue, 14 May 2019 23:21:15 -0700 (PDT)
Received: from localhost ([110.70.52.120])
 by smtp.gmail.com with ESMTPSA id f4sm1300687pfn.118.2019.05.14.23.21.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 23:21:14 -0700 (PDT)
Date: Wed, 15 May 2019 15:21:11 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190515062111.GA30030@jagdpanzerIV>
References: <20190510122401.21a598f6@gandalf.local.home>
 <daf4dfd1-7f4f-8b92-6866-437c3a2be28b@c-s.fr>
 <096d6c9c17b3484484d9d9d3f3aa3a7c@AcuMS.aculab.com>
 <20190513091320.GK9224@smile.fi.intel.com>
 <20190513124220.wty2qbnz4wo52h3x@pathway.suse.cz>
 <20190514020730.GA651@jagdpanzerIV>
 <45348cf615fe40d383c1a25688d4a88f@AcuMS.aculab.com>
 <CAMuHMdXaMObq9h2Sb49PW1-HUysPeaWXB7wJmKFz=xLmSoUDZg@mail.gmail.com>
 <20190514143751.48e81e05@oasis.local.home>
 <CAMuHMdUhy3uB+G23uXh__F2Y_Jsam5uS1Q5jJC95kWAOEM8WRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUhy3uB+G23uXh__F2Y_Jsam5uS1Q5jJC95kWAOEM8WRA@mail.gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@aculab.com>, Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On (05/14/19 21:13), Geert Uytterhoeven wrote:
> I would immediately understand there's a missing IS_ERR() check in a
> function that can return  -EINVAL, without having to add a new printk()
> to find out what kind of bogus value has been received, and without
> having to reboot, and trying to reproduce...

But chances are that missing IS_ERR() will crash the kernel sooner
or later (in general case), if not in sprintf() then somewhere else.

	-ss
