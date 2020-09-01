Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CE2259E9E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 20:55:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bgx8s0WyPzDqX1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 04:55:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=iu/mivde; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bgx6902KmzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 04:53:04 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id o68so1346327pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 11:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DW1zJLlrp+b/X5DsaUJywWHpm9f8YdypCEJotWWzal8=;
 b=iu/mivdeQ6AWpfUigREEipYqDA+JBPragzl35o9Nu9ycwxuP1pT/n/GUj28IBjGlJy
 tASUZD6UQpFduus8RxIUHnWDo/ii2QxBTb8+/rddFmc7Q2BvQtdvriL4oOcAbvX3fTik
 a3CX0t1k/eCXUbO98m4G5hAHF2rr9hmEGAwHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DW1zJLlrp+b/X5DsaUJywWHpm9f8YdypCEJotWWzal8=;
 b=JWpDgl13tWrpbrV6o6Y1lxJti6YeNPvDCgFqA0RGOeMIze0eh0Hq9TN9JJ+SKOQlQE
 Gh0zhFP7kE804KUXm+5TTx/oO7NB0VqfM9+qCJt7CwbSWDIvDB6PzEezoq5JdbsPvQ8q
 bVgBUKs1cf9JZMBuCWWdLTfXOACJ7r5cMe4VxO9+zR7Op9qvzPztA48fuoFWCSTo3i20
 7ND6z1sl2qYgh/hrI7TYI01KCMG+qYGJvE8VcT71TsbZoZPSqSGDlj95msw2c7AExMNZ
 SbrEB5qrK0zeAZobEH9+R64qApG2yWzgSnO5Z1C0n9SA4Lf3Irt2RJEMuet/avp+ATfd
 E2rA==
X-Gm-Message-State: AOAM533+l06e0bX1v4iXzglcIir8NaqaJtpvAr1vO99Uu2zbe29+bNVm
 nKQmTeColNuE6bOi21YvKqKHTQ==
X-Google-Smtp-Source: ABdhPJw/YsKunmr1Z0dpXo1/zK3rMUMV+IlY1oP54bh4p+BaEO8LJP6shIZse5erSoELJy0YDj4+Gg==
X-Received: by 2002:a65:4187:: with SMTP id a7mr2642045pgq.102.1598986382061; 
 Tue, 01 Sep 2020 11:53:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id m19sm2192249pjq.18.2020.09.01.11.53.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 11:53:01 -0700 (PDT)
Date: Tue, 1 Sep 2020 11:52:59 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/10] lkdtm: disable set_fs-based tests for !CONFIG_SET_FS
Message-ID: <202009011152.335EE467@keescook>
References: <20200827150030.282762-1-hch@lst.de>
 <20200827150030.282762-6-hch@lst.de>
 <CAHk-=wipbWD66sU7etETXwDW5NRsU2vnbDpXXQ5i94hiTcawyw@mail.gmail.com>
 <20200829092406.GB8833@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200829092406.GB8833@lst.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 29, 2020 at 11:24:06AM +0200, Christoph Hellwig wrote:
> On Thu, Aug 27, 2020 at 11:06:28AM -0700, Linus Torvalds wrote:
> > On Thu, Aug 27, 2020 at 8:00 AM Christoph Hellwig <hch@lst.de> wrote:
> > >
> > > Once we can't manipulate the address limit, we also can't test what
> > > happens when the manipulation is abused.
> > 
> > Just remove these tests entirely.
> > 
> > Once set_fs() doesn't exist on x86, the tests no longer make any sense
> > what-so-ever, because test coverage will be basically zero.
> > 
> > So don't make the code uglier just to maintain a fiction that
> > something is tested when it isn't really.
> 
> Sure fine with me unless Kees screams.

If we don't have set_fs, we don't need the tests. :)

-- 
Kees Cook
