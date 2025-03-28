Return-Path: <linuxppc-dev+bounces-7375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E7A75297
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Mar 2025 23:53:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZPbQt0sVnz2yqN;
	Sat, 29 Mar 2025 09:53:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743202390;
	cv=none; b=PK/gc11urTuOane7i25iiSDpTWIK3VRn6O+9oiTC+hO177xQtjAcNdPmIwNKdXaBcL/6yFgof6aXUyaNkv7XnZfiYJsLhK3RItHe6Ipf+5W5knPgu+0YLWXiOfbVq23hubfFFz1jlStAerI6pW+uD3G4Qto3emOn1fT6d6+1H2/4VkDKIyim+/UDgLU4Nw/mapCVb77GYWolvjLkRHiP2vAdvrjS7HBMz4GePMDUxulvKot0u+IayrYBYzkcMqvf+sYzRf0P1ewtnkGUyUW9FBTvE3sHuAWdXZsSeSjDAPzeZor4ZSqxKWBB177Fz3Cmec4uAXYF4c9f679GWGizHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743202390; c=relaxed/relaxed;
	bh=Hjn6OQfKcnQqzXpH9VPAPsfgl9EOnFCHDZpoojninHo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=B+PqtdLfsdq2Rr1uR1AjGgQtjxTZ/6GSzFfJiIh/5Gr5REbdp3ynXww07ezhH+6KFftX/R27hsOwc5sWRtKJdzuiPEo/leWmmUInowI7Xc5V7sOcpMZMzhIUh/9E8ksvwP/dW6kPt7vnEortYyGRYX4hyYFBg1SwGAcOIvnFN8vGa1hXu6lVhrEcEswXAzQ8eyz6RpyGTDDmURBBn1xkcRlva+VKEJo03TvuhcZpFlxJ7Ubx2jsL1gFFxCmO6DiY0gpFGJ9eiwnInzDm3mbT4U3XzXh/5Lm+CWITgkJaupcr3uEWJSiBO5YP7jni4onnpJt6oEA2VLZcADLrqy0q3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ILMyTjyB; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ILMyTjyB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZPbQr3hKnz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Mar 2025 09:53:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C37B9A43040;
	Fri, 28 Mar 2025 22:47:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 353EEC4CEE4;
	Fri, 28 Mar 2025 22:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1743202383;
	bh=uMHCMkIp1JpzwK/KslzBXCnJB3B/qFWTnmOMAK1in40=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ILMyTjyBso7K5+o4nbs26Pn5cHVWQm2GLLUBUU6L6Xi+fwqx2KCM3V3LBajgA8puB
	 KnrvP/bQN8GP5OomQ+aEM6tjBdfck+qoFXs8ztHAbcsuc/oeySEGgq4ad2PiOAdMnP
	 tYCiaYsel0JulQkbsLDNglaz+OTqx9udrazM6AgY=
Date: Fri, 28 Mar 2025 15:53:01 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Brendan Higgins
 <brendan.higgins@linux.dev>, David Gow <davidgow@google.com>, Rae Moar
 <rmoar@google.com>, Maxime Ripard <mripard@kernel.org>, Kees Cook
 <kees@kernel.org>, Alessandro Carminati <acarmina@redhat.com>,
 linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, Arnd
 Bergmann <arnd@arndb.de>, =?ISO-8859-1?Q?Ma=EDra?= Canal
 <mcanal@igalia.com>, Dan Carpenter <dan.carpenter@linaro.org>, Daniel Diaz
 <daniel.diaz@linaro.org>, Arthur Grillo <arthurgrillo@riseup.net>, Naresh
 Kamboju <naresh.kamboju@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, Daniel Vetter <daniel@ffwll.ch>, Thomas
 Zimmermann <tzimmermann@suse.de>, Alessandro Carminati
 <alessandro.carminati@gmail.com>, Jani Nikula <jani.nikula@intel.com>,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, loongarch@lists.linux.dev, x86@kernel.org
Subject: Re: [PATCH v4 00/14] Add support for suppressing warning backtraces
Message-Id: <20250328155301.ab5514e2ab8043512a8527bd@linux-foundation.org>
In-Reply-To: <a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
References: <20250313114329.284104-1-acarmina@redhat.com>
	<202503131016.5DCEAEC945@keescook>
	<20250313-abiding-vivid-robin-159dfa@houat>
	<c8287bde-fa1c-4113-af22-4701d40d386e@roeck-us.net>
	<20250313150505.cf1568bf7197a52a8ab302e6@linux-foundation.org>
	<a998f3fa-495c-4165-884a-a11c5cb61e96@linuxfoundation.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 28 Mar 2025 16:14:55 -0600 Shuah Khan <skhan@linuxfoundation.org> wrote:

> On 3/13/25 16:05, Andrew Morton wrote:
> > On Thu, 13 Mar 2025 11:31:12 -0700 Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> On Thu, Mar 13, 2025 at 06:24:25PM +0100, Maxime Ripard wrote:
> >>>>
> >>>> Yeah, as with my prior review, I'm a fan of this. It makes a bunch of my
> >>>> very noisy tests much easier to deal with.
> >>>
> >>> And for the record, we're also affected by this in DRM and would very
> >>> much like to get it merged in one shape or another.
> >>>
> >>
> >> I was unable to get maintainers of major architectures interested enough
> >> to provide feedback, and did not see a path forward. Maybe Alessandro
> >> has more success than me.
> > 
> > I'll put them into mm.git, to advance things a bit.
> 
> I haven't heard from kunit maintainers yet. This thread got lost
> in inbox due to travel.
> 
> David/Brendan/Rae, Okay to take this series?
> 
>
> Andrew, Okay to take this through your tree - this needs merging.


The review for 07/14 made me expect an update - perhaps tweak the asm
constraints and add a comment.  This can be addressed later, as long as
we don't forget.

However
https://lkml.kernel.org/r/20250324104702.12139E73-hca@linux.ibm.com
needs to be addressed before a merge.  The series in mm.git breaks the
s390 build.



