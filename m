Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A811BF5B1E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 23:40:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478wG15tyRzF61t
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 09:40:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=virtuozzo.com (client-ip=185.231.240.75; helo=relay.sw.ru;
 envelope-from=aryabinin@virtuozzo.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=virtuozzo.com
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478wCd10wBzF3VD
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 09:38:18 +1100 (AEDT)
Received: from [192.168.15.61] by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <aryabinin@virtuozzo.com>)
 id 1iTCtO-0006xF-D2; Sat, 09 Nov 2019 01:38:10 +0300
Subject: Re: [PATCH v11 0/4] kasan: support backing vmalloc space with real
 shadow memory
To: Andrew Morton <akpm@linux-foundation.org>
References: <20191031093909.9228-1-dja@axtens.net>
From: Andrey Ryabinin <aryabinin@virtuozzo.com>
Message-ID: <3f9d1163-b1e7-ebef-4099-d40093dfe947@virtuozzo.com>
Date: Sat, 9 Nov 2019 01:36:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191031093909.9228-1-dja@axtens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: mark.rutland@arm.com, gor@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 glider@google.com, luto@kernel.org, linuxppc-dev@lists.ozlabs.org,
 dvyukov@google.com, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/31/19 12:39 PM, Daniel Axtens wrote:

> Daniel Axtens (4):
>   kasan: support backing vmalloc space with real shadow memory
>   kasan: add test for vmalloc
>   fork: support VMAP_STACK with KASAN_VMALLOC
>   x86/kasan: support KASAN_VMALLOC
> 
>  Documentation/dev-tools/kasan.rst |  63 ++++++++
>  arch/Kconfig                      |   9 +-
>  arch/x86/Kconfig                  |   1 +
>  arch/x86/mm/kasan_init_64.c       |  61 ++++++++
>  include/linux/kasan.h             |  31 ++++
>  include/linux/moduleloader.h      |   2 +-
>  include/linux/vmalloc.h           |  12 ++
>  kernel/fork.c                     |   4 +
>  lib/Kconfig.kasan                 |  16 +++
>  lib/test_kasan.c                  |  26 ++++
>  mm/kasan/common.c                 | 231 ++++++++++++++++++++++++++++++
>  mm/kasan/generic_report.c         |   3 +
>  mm/kasan/kasan.h                  |   1 +
>  mm/vmalloc.c                      |  53 +++++--
>  14 files changed, 500 insertions(+), 13 deletions(-)
> 

Andrew, could pick this up please?
