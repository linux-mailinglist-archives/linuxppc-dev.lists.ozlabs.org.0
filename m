Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38C2E6745C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jul 2019 19:36:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45lg8K1CzLzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jul 2019 03:36:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwn.net
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45lg623HG4zDqX9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jul 2019 03:34:32 +1000 (AEST)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id B29512CC;
 Fri, 12 Jul 2019 17:34:28 +0000 (UTC)
Date: Fri, 12 Jul 2019 11:34:27 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <alex.shi@linux.alibaba.com>
Subject: Re: [PATCH 01/12] Documentation: move architectures together
Message-ID: <20190712113427.62fa7ffc@lwn.net>
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
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
Cc: linux-s390@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 12 Jul 2019 10:20:07 +0800
Alex Shi <alex.shi@linux.alibaba.com> wrote:

> There are many different archs in Documentation/ dir, it's better to
> move them together in 'Documentation/arch' which follows from kernel source.

So this seems certain to collide badly with Mauro's RST-conversion monster
patch set.

More to the point, though...if we are going to thrash up things this
badly, we want to be sure that we're doing it right so we don't end up
renaming everything again.  Grouping stuff into a new arch/ subdirectory
adds a bit of order, but it doesn't do much toward trying to organize our
documentation for its readers, and it doesn't help us to modernize the
docs and get rid of the old, useless stuff.  A quick check shows that many
of these files have seen no changes other than typo fixes since the
beginning of the Git era.

So, in my mind, this needs some thought.  Maybe we want a
Documentation/arch in the end, but I'm not convinced that we should just
create it and fill it with a snow shovel.  This might be a good thing to
discuss at the kernel summit in September.

Thanks,

jon
