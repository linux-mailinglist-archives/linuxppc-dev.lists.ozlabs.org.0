Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DED119790
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 06:33:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450clp4SdtzDqSy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 14:33:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=sergey.senozhatsky.work@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="OFGOE2Nw"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 450ckN0n7hzDqCt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 14:32:08 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id x15so2186027pln.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 May 2019 21:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=xvneL+tleAZug+cm73ok0sRVVSDLg417J9gTpEjzm0Y=;
 b=OFGOE2NwOn/bcY8miPOcXwpkHA80Ku8G4fyzOGykVhmR/QDaMsnCcwbIDimS7JTF5x
 gvMg+htASqUGwslWKLMbU1xXdsQaVUcA/xPqXJ0j45BYvpJ3onYF5mDvzaoz3gA3C77B
 ++l12pVN+QFnZjgx39cid1yMH+P3KT0xaTRuupjJwhqpQ78pa3bVqh+Gj22blHzFubzH
 YtdQ7BQvuXX8czCJXHl9ref8MygU9ec9G0beZY9SNC55RzYgkGmMTDmHFBliUjOnie/Y
 rT9nhRDFk346t/w2nxRdrAq6xrkYiBzWcghocJe6EOAGwJeDfMlTeLC4nNAuKqMZeMcw
 bPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xvneL+tleAZug+cm73ok0sRVVSDLg417J9gTpEjzm0Y=;
 b=BvyiMWxrdLWn6jZQibBWdPfEPRPSLsvKd+3m8JwyjSgsQ44GUlGFv0KdnG2ITuoDyB
 6pa+TNISdOZRsCQUVg75SPXfqh+gsNLBNGBOUXqOec9lRpCcO0SRQ4AwXvssgtHe//V1
 3ZDqowuBkKLMqiiK9uBXv3sCOzDuYgaSfFftmNM93JYV/O9vT37GRibv3NRF0U515+tY
 BYetMuE0yX4Rshpk2+HvjZVKUufcdj5tBInB+HOwwZG/bPWlxnU6j2fWMOxPfy3cNaAm
 7Mmr4tn0HmSAeBoIG304Y/wfsYtH9KvxBGAkyiCrfMxNtF0IfTOJ69w7jpUuk4p1sDCe
 AFaw==
X-Gm-Message-State: APjAAAWZxEq11kc7BFK2nEZ3r+ol4w6OFJUELiiB3ecHvhDBBR8r7HyY
 GjJgMjEcf/bY//gH4/LCG1o=
X-Google-Smtp-Source: APXvYqzCVqQG81jyDsA4pwg3oVltor0yDbhImtQRMizI91ol50Lus0a+020M12H8AeI0dti/GS3zRA==
X-Received: by 2002:a17:902:10c:: with SMTP id
 12mr10524545plb.61.1557462725544; 
 Thu, 09 May 2019 21:32:05 -0700 (PDT)
Received: from localhost ([39.7.15.25])
 by smtp.gmail.com with ESMTPSA id y17sm5555133pfb.161.2019.05.09.21.32.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 09 May 2019 21:32:03 -0700 (PDT)
Date: Fri, 10 May 2019 13:32:00 +0900
From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
To: Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
Message-ID: <20190510043200.GC15652@jagdpanzerIV>
References: <20190509121923.8339-1-pmladek@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509121923.8339-1-pmladek@suse.com>
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

On (05/09/19 14:19), Petr Mladek wrote:
> 1. Report on Power:
> 
> Kernel crashes very early during boot with with CONFIG_PPC_KUAP and
> CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG
> 
> The problem is the combination of some new code called via printk(),
> check_pointer() which calls probe_kernel_read(). That then calls
> allow_user_access() (PPC_KUAP) and that uses mmu_has_feature() too early
> (before we've patched features). With the JUMP_LABEL debug enabled that
> causes us to call printk() & dump_stack() and we end up recursing and
> overflowing the stack.

Hmm... hmm... PPC does an .opd-based symbol dereference, which
eventually probe_kernel_read()-s. So early printk(%pS) will do

	printk(%pS)
	 dereference_function_descriptor()
	  probe_kernel_address()
	   dump_stack()
	    printk(%pS)
	     dereference_function_descriptor()
	      probe_kernel_address()
	       dump_stack()
	        printk(%pS)
	         ...

I'd say... that it's not vsprintf that we want to fix, it's
the idea that probe_kernel_address() can dump_stack() on any
platform. On some archs probe_kernel_address()->dump_stack()
is going nowhere:
 dump_stack() does probe_kernel_address(), which calls dump_stack(),
 which calls printk(%pS)->probe_kernel_address() again and again,
 and again.

	-ss
