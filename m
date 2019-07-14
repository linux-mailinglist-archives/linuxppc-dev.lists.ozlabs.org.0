Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C31AA67FD0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Jul 2019 17:22:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45mr594VcVzDqYK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 01:22:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.alibaba.com
 (client-ip=47.88.44.37; helo=out4437.biz.mail.alibaba.com;
 envelope-from=alex.shi@linux.alibaba.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.alibaba.com
Received: from out4437.biz.mail.alibaba.com (out4437.biz.mail.alibaba.com
 [47.88.44.37])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45mr3D0w6KzDqTT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 01:21:08 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=17; SR=0; TI=SMTPD_---0TWrpoRa_1563117663; 
Received: from IT-FVFX43SYHV2H.lan(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWrpoRa_1563117663) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 14 Jul 2019 23:21:03 +0800
Subject: Re: [PATCH 01/12] Documentation: move architectures together
To: Jonathan Corbet <corbet@lwn.net>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
 <20190712113427.62fa7ffc@lwn.net>
From: Alex Shi <alex.shi@linux.alibaba.com>
Message-ID: <36c522c5-975e-e38e-daad-0f3d9f93b186@linux.alibaba.com>
Date: Sun, 14 Jul 2019 23:21:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712113427.62fa7ffc@lwn.net>
Content-Type: text/plain; charset=gbk
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

Hi Jon,

Thanks for quick response!

ÔÚ 2019/7/13 ÉÏÎç1:34, Jonathan Corbet Ð´µÀ:
> On Fri, 12 Jul 2019 10:20:07 +0800
> Alex Shi <alex.shi@linux.alibaba.com> wrote:
> 
>> There are many different archs in Documentation/ dir, it's better to
>> move them together in 'Documentation/arch' which follows from kernel source.
> 
> So this seems certain to collide badly with Mauro's RST-conversion monster
> patch set.

I don't mean that, sorry, and we can figure out if both of them are worthy to be picked up.

> 
> More to the point, though...if we are going to thrash up things this
> badly, we want to be sure that we're doing it right so we don't end up
> renaming everything again.  Grouping stuff into a new arch/ subdirectory
> adds a bit of order, but it doesn't do much toward trying to organize our
> documentation for its readers, and it doesn't help us to modernize the
> docs and get rid of the old, useless stuff.  A quick check shows that many
> of these files have seen no changes other than typo fixes since the
> beginning of the Git era.

Right, there is some docs which need to be update or even drop, and a reorder would be a timing to push each of arch maintainer to do something, isn't it? Anyway, reordering  documents like kernel source dir could be one of choices. :)

> 
> So, in my mind, this needs some thought.  Maybe we want a
> Documentation/arch in the end, but I'm not convinced that we should just
> create it and fill it with a snow shovel.  This might be a good thing to
> discuss at the kernel summit in September.

Thanks for considering, anyway, it could be a good start to get hands dirty whether the arch dir is needed. 

Thanks
Alex
