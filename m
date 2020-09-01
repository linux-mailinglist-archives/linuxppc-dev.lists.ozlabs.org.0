Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E059259EE0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 20:59:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgxFb3D51zDqXR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 04:59:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ebiQOl0H; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgxCX0FTKzDqNC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 04:57:41 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id nv17so1084491pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=myAjLsXJJ5WrIyplttBLOJrb3cYFWSnfDJgomMmHBsY=;
 b=ebiQOl0HdWb1qsZ8K4nAaddfFhbr3U7deevLOcXXTD6OLvfKSnSROhSsCjgZ7mCdSU
 KEk3JPhKcmdeA0QtKKnHHoNdav2XUrlVbf6RKDK+ixxHf+lELn4fBRXQcE7RzE2wmQCF
 jhg7c/3b8g07wxtC6uK6VnR8kOyuLPgRU1LbY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=myAjLsXJJ5WrIyplttBLOJrb3cYFWSnfDJgomMmHBsY=;
 b=dqkTzzrTWr+6DMdmmwN0JMPjPVIDiAFMJdJATXHnNO9gahT0I6LQK4MIWQl3/KiE7K
 nuIz5L9XljDvMF7xnMebtXjnehj66Jt2ObVkd/8mcQ2XxBXNA5yj9Tcm+DTAcdMScylL
 +VKeQtj/LpC2R35XjL3ODdQuXHjgDmV8PGM7xgmIJZHZqWU+jRqJlGkeWpDIdwrcLt6f
 dqYdu26t23/OmsDPDd1CaqqIJsHlG36UfWCXKWUEwvnz4SxB9P+MPAHcjkvN9/sRy6dM
 3J7U1TmdTSEMWn1FJicTeujLK8jzcVhNm82bS4xU9V8xWueRQbwsXxUWjPN5NmI7R7/5
 N/sQ==
X-Gm-Message-State: AOAM531zhe3O0ZgzEnn3cGTHowcANJxI3y5PtgNUSwpX4IAgPh9LvTFL
 BtdRsuQENpDLJzVFDA2dPDJ1eQ==
X-Google-Smtp-Source: ABdhPJxM7CI6ObOTA/dAnpNqk4c7bPseM/evKd+pRwbVQYq3IOIRkOFgQb1ors7cvRWIw5JowuZv0w==
X-Received: by 2002:a17:90a:450d:: with SMTP id
 u13mr2718413pjg.99.1598986659307; 
 Tue, 01 Sep 2020 11:57:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id b10sm1613877pff.85.2020.09.01.11.57.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 11:57:38 -0700 (PDT)
Date: Tue, 1 Sep 2020 11:57:37 -0700
From: Kees Cook <keescook@chromium.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 05/10] lkdtm: disable set_fs-based tests for !CONFIG_SET_FS
Message-ID: <202009011156.0F49882@keescook>
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

To clarify: if any of x86, arm64, arm, powerpc, riscv, and s390 are
using set_fs(), I want to keep this test. "ugly" is fine in lkdtm. :)

-- 
Kees Cook
