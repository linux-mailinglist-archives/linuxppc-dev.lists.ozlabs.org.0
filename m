Return-Path: <linuxppc-dev+bounces-192-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470E957AC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 03:11:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnryr01P4z2yFQ;
	Tue, 20 Aug 2024 11:11:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::529"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=BMdI87ha;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wnryp5dxhz2yFK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 11:11:45 +1000 (AEST)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so4154534a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 18:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724116302; x=1724721102; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J5Wu1obaVVIh98VUfFJoSH8iTiA4TVMtHy8zZl6wgS4=;
        b=BMdI87ha1ufVsF+fzUkgBw3ow4XhlXgC9fU8cbIMzbvzMz3AIbfoMqUf3u3hnEdfVX
         /J12lEwJyzxsDq5OpeWypMxtd2v5MoBdmwvJCV7AGVNg4akntQoBYR6WFapeGdeoD7qj
         1+ACLmU8wv7LiApDLXUOBmNTz04UsHpm0KFcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724116302; x=1724721102;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5Wu1obaVVIh98VUfFJoSH8iTiA4TVMtHy8zZl6wgS4=;
        b=hzjYWbxFhEnFLnd8t5AtiwLHBK9YkpjXPlgs4O5NwlB5XdudpzHVKd1t1NIBfTDrC0
         rlI4fPvQtJymIjIYxmL2T6d5orKxtS+yfhnzOXmQRjjQDFFGRYRaFoKBko9xfj4s2AvF
         nKeysnfzTphLoN+5tuUzLKqZ4aOdChgYYfLk7CbnM7fqBNJKdb7n1bq3lVporndqOclL
         M1SkeYcJr5X1+GfX6iZXr+vc2cnev816Y/Iaao7VqAKT0MVWJEAxq39IJBTOAaQsE90i
         rnSX809+GFmsjFaK13ClvPnhsW04mITmhhYosoMdX6pgmrvxVHvMW14VY2/2tT+1oPBi
         zoAg==
X-Forwarded-Encrypted: i=1; AJvYcCXreQf1dVSPKokLliAhsQ0z08vi7XAWM5WHIT0b5RO6xBiNISJPbTC2bdL7yQMlHGrKy61vPVjOX1I9jLfMjTVxJwF/XeGGYn8MAnVZbg==
X-Gm-Message-State: AOJu0YybF31dkPGK5woLVguA79//Kdz1n9vSKTZXch5I+9BiMPSwfXNH
	kiFPEzEB+xacuVJFNQ60Ryr02iLFE+TONVsBjt7juhtIAZHuo947ZSnBQk6AbjPTrPz1YLCI6QS
	MA/812Q==
X-Google-Smtp-Source: AGHT+IHAJi2EZPqS5hSdCkxlWRuaLFXGVG8J3EjbDvX22KhVdM0ep6AOPikxTsBo9KPjTDT2zgIjFw==
X-Received: by 2002:a05:6402:370b:b0:5aa:32bb:161 with SMTP id 4fb4d7f45d1cf-5bf0d1e7c46mr329985a12.22.1724116302223;
        Mon, 19 Aug 2024 18:11:42 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbdfa6a7sm6228555a12.40.2024.08.19.18.11.41
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 18:11:42 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5bec4e00978so4154519a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2024 18:11:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWYYuVuEQXbhwWS52v+Sl8m9+ehroEwUuJ6mBeUSsgpUoc8+s4i+ndiBtxx9CIUnxLAUr8lVV6m0ifV0FKQPlRoAqIy4uPdLvfpavU9Nw==
X-Received: by 2002:a05:6402:1d50:b0:5b8:f69b:65e8 with SMTP id
 4fb4d7f45d1cf-5bf0cfbca19mr536978a12.0.1724116301657; Mon, 19 Aug 2024
 18:11:41 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20240812082605.743814-1-mpe@ellerman.id.au> <20240819185253.GA2333884@thelio-3990X>
 <CAHk-=wj9QPhG4CjiX8YLRC1wHj_Qs-T8wJi0WEhkfp0cszvB9w@mail.gmail.com>
 <20240819195120.GA1113263@thelio-3990X> <CAHk-=wgsDJ+sA1T01YT-z5TXs3zxJ54f0VDApkZ1pgcr8T=myQ@mail.gmail.com>
 <CAHk-=wjzYKrwSDK3PFMC1C2x37aKzEuC7dVxg0kGt8h+vjZfjQ@mail.gmail.com> <20240819180548.9f5dac3ac0bd09a26c0d0948@linux-foundation.org>
In-Reply-To: <20240819180548.9f5dac3ac0bd09a26c0d0948@linux-foundation.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 19 Aug 2024 18:11:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiyxQMG7gK5d=_UEcHF2PV3EoCFrENEhRvJH9Qsk7cOeA@mail.gmail.com>
Message-ID: <CAHk-=wiyxQMG7gK5d=_UEcHF2PV3EoCFrENEhRvJH9Qsk7cOeA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm: Add optional close() to struct vm_special_mapping
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Guo Ren <guoren@kernel.org>, Brian Cain <bcain@quicinc.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Michael Ellerman <mpe@ellerman.id.au>, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, christophe.leroy@csgroup.eu, jeffxu@google.com, 
	Liam.Howlett@oracle.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, 
	oliver.sang@intel.com, pedro.falcato@gmail.com, linux-um@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon <linux-hexagon@vger.kernel.org>, 
	Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Aug 2024 at 18:05, Andrew Morton <akpm@linux-foundation.org> wrote:
>
> >
> > I forgot to actually attach that "this". Here it is. For real, this time.
>
> Thanks.  Do you think your one-liner remains desirable with this fix in
> place?

That patch actually removes the whole 'legacy_special_mapping_vmops'
that my one-liner then removed the '.close' field from, so no - my
one-liner just becomes a non-issue.

NOTE! That patch of mine *will* conflict with Michael's patch series,
since my patch to remove legacy_special_mapping_vmops was done on top
of my current -git tree. But it should be an obvious conflict, in that
it just means that the addition of .close never happens.

               Linus

