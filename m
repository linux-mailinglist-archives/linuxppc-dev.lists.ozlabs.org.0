Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C014A6A4DD9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Feb 2023 23:17:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQZcj530dz3cKB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 09:17:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=npNn47k9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=npNn47k9;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQZbn3Nvdz2xHH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 09:16:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B00F60A48;
	Mon, 27 Feb 2023 22:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0EEC433EF;
	Mon, 27 Feb 2023 22:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1677536207;
	bh=lhIQQrDfUiCYIFpNMIqlj8bCtQYAOQ3RHcT3/exgPA4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=npNn47k9PO7Icc23/f3zW0pP7TnEVN/FznCtQCzLIjTlgBvPtNhLL7E/AdVX3QrzO
	 /I1ardBp944AU4xMRN1ERTPIV+SdcFo+R9St9KgQXnoHyBCJaTRT6KV96m1JCBehPa
	 STRI+C66fMpwKJAKGQTHvB59wTP+rmh6UGml5Nww=
Date: Mon, 27 Feb 2023 14:16:46 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH mm] kasan, powerpc: Don't rename memintrinsics if
 compiler adds prefixes
Message-Id: <20230227141646.084c9a49fcae018852ca60f5@linux-foundation.org>
In-Reply-To: <20230227094726.3833247-1-elver@google.com>
References: <20230227094726.3833247-1-elver@google.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: kernel test robot <lkp@intel.com>, Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Liam Howlett <liam.howlett@oracle.com>, kasan-dev@googlegroups.com, Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Feb 2023 10:47:27 +0100 Marco Elver <elver@google.com> wrote:

> With appropriate compiler support [1], KASAN builds use __asan prefixed
> meminstrinsics, and KASAN no longer overrides memcpy/memset/memmove.
> 
> If compiler support is detected (CC_HAS_KASAN_MEMINTRINSIC_PREFIX),
> define memintrinsics normally (do not prefix '__').
> 
> On powerpc, KASAN is the only user of __mem functions, which are used to
> define instrumented memintrinsics. Alias the normal versions for KASAN
> to use in its implementation.
> 
> Link: https://lore.kernel.org/all/20230224085942.1791837-1-elver@google.com/ [1]
> Link: https://lore.kernel.org/oe-kbuild-all/202302271348.U5lvmo0S-lkp@intel.com/
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marco Elver <elver@google.com>

Seems this is a fix against "kasan: treat meminstrinsic as builtins in
uninstrumented files", so I'll plan to fold this patch into that patch.

