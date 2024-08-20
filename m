Return-Path: <linuxppc-dev+bounces-191-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B5E957ABA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 03:05:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnrr2259Fz2yDg;
	Tue, 20 Aug 2024 11:05:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=145.40.73.55
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=Ohr8uPnM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wnrr15nYdz2xt7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 11:05:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 772B6CE09EA;
	Tue, 20 Aug 2024 01:05:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA95FC32782;
	Tue, 20 Aug 2024 01:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1724115949;
	bh=0U7jOid/uP8Y+iIqM7ITqWrx8b2Snwx2qFv6PcPMlns=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Ohr8uPnMeT9PqbC27FNE2NUgwBSpD2Am8ljUhb2MkNtpvuqCxRgINXdfU+7Z5Ok4Q
	 oLhpzo7qQb2Jy/L9reXhcowB+4RKVOZlFzvsJaEDLoJ4G/pXRebjYmXlqoj8xddMJJ
	 umSfjfzu/bhamoXfiWzuJ1aWiSlwUJ4EuI/WZtuw=
Date: Mon, 19 Aug 2024 18:05:48 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>,
 Brian Cain <bcain@quicinc.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 christophe.leroy@csgroup.eu, jeffxu@google.com, Liam.Howlett@oracle.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, oliver.sang@intel.com,
 pedro.falcato@gmail.com, linux-um@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon <linux-hexagon@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct
 vm_special_mapping
Message-Id: <20240819180548.9f5dac3ac0bd09a26c0d0948@linux-foundation.org>
In-Reply-To: <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com>
References: <20240812082605.743814-1-mpe@ellerman.id.au>
	<20240819185253.GA2333884@thelio-3990X>
	<CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
	<20240819195120.GA1113263@thelio-3990X>
	<CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
	<CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 19 Aug 2024 13:16:32 -0700 Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Mon, 19 Aug 2024 at 13:15, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Ok, I did a quick hack-job to remove that disgusting
> > install_special_mapping() legacy case.
> >
> > With this [..]
> 
> I forgot to actually attach that "this". Here it is. For real, this time.

Thanks.  Do you think your one-liner remains desirable with this fix in
place?

