Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B97A1BCC0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 21:05:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BWLG4Zx2zDqtS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 05:05:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lwn.net
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BWGl6fsPzDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 05:02:06 +1000 (AEST)
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 9121944A;
 Tue, 28 Apr 2020 19:01:29 +0000 (UTC)
Date: Tue, 28 Apr 2020 13:01:28 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v3 00/29] Convert files to ReST - part 2
Message-ID: <20200428130128.22c4b973@lwn.net>
In-Reply-To: <cover.1588021877.git.mchehab+huawei@kernel.org>
References: <cover.1588021877.git.mchehab+huawei@kernel.org>
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 codalist@coda.cs.cmu.edu, linux-xfs@vger.kernel.org, linux-cachefs@redhat.com,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Apr 2020 23:16:52 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This is the second part of a series I wrote sometime ago where I manually
> convert lots of files to be properly parsed by Sphinx as ReST files.
> 
> As it touches on lot of stuff, this series is based on today's linux-next, 
> at tag next-20190617.
> 
> The first version of this series had 57 patches. The first part with 28 patches
> were already merged. Right now, there are still ~76  patches pending applying
> (including this series), and that's because I opted to do ~1 patch per converted
>  directory.
> 
> That sounds too much to be send on a single round. So, I'm opting to split
> it on 3 parts for the conversion, plus a final patch adding orphaned books
> to existing ones. 
> 
> Those patches should probably be good to be merged either by subsystem
> maintainers or via the docs tree.

So I'm happy to merge this set, but there is one thing that worries me a
bit... 

>  fs/cachefiles/Kconfig                         |    4 +-
>  fs/coda/Kconfig                               |    2 +-
>  fs/configfs/inode.c                           |    2 +-
>  fs/configfs/item.c                            |    2 +-
>  fs/fscache/Kconfig                            |    8 +-
>  fs/fscache/cache.c                            |    8 +-
>  fs/fscache/cookie.c                           |    2 +-
>  fs/fscache/object.c                           |    4 +-
>  fs/fscache/operation.c                        |    2 +-
>  fs/locks.c                                    |    2 +-
>  include/linux/configfs.h                      |    2 +-
>  include/linux/fs_context.h                    |    2 +-
>  include/linux/fscache-cache.h                 |    4 +-
>  include/linux/fscache.h                       |   42 +-
>  include/linux/lsm_hooks.h                     |    2 +-

I'd feel a bit better if I could get an ack or two from filesystem folks
before I venture that far out of my own yard...what say you all?

Thanks,

jon
