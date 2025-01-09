Return-Path: <linuxppc-dev+bounces-4899-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 594F0A06F93
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 08:57:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTHFW617sz30ht;
	Thu,  9 Jan 2025 18:57:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736409455;
	cv=none; b=ZrwkW4JcBncaknGs4sGJJ67Wf5fP5dyEJ3NSyoc4XTdiUKL8WR3GI5dviwseCiVN2/gWozS+rGaDvWWYKUGKqWb5hqfN9sDy2gackdfu0jn8cJ/2aF7ypwL1LWUN/euXrrgUF+nL+25qwS89nC1ULpigs0y6muZLceDooum2rNS6JZWnAXK/5zfP55af1mFQM1dXRx0BKJdYNy+qSHB8vllp7BN5WbSWTT6iWPoN/Q9IcqZshPUPbeSeG8zsf5cLsBdZ8jqYjmhuMrbuq8mboQ8AEOoRIRCgu4T3raUSKgCgfxA8ndRMr5ip82PdrxbLfvWZmD7es9fC9gx4xYju/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736409455; c=relaxed/relaxed;
	bh=4IuucZ7Qxpx9JBGWW0dkFfdTcRybNIZZIoS5Em1Dg7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7UZgUQJ+UXAjgnUZNUlSFZphyVNl2BzQdO/sotGn2vU82hhtiyGieR4oOBGFStllMb2EAsVhj1UsjA6KMMKX2Q3JHSRB1Oe85lDhez95Lm18i4TnC8JOXmJedKUGFXvh/VFxOJjBAlOB0c8+c7hqV3O3NLs1jK4RV54Lk+xU+ImRuBrPPhSR3B8maGtYswcRbh+V6zUrzi/0nZv8TUcpfRIhKXQ3YrGqlUl336fI7sreZtdGAxct8kz7EdxrlFHTkYKzjkjvHcVZoH35xheK5kxDkG8p3NDAC35VNrpNm5JdTVdaeo95bpBAwZGm8ut+iAiLN+aHTjQbkb8SPF2IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0eH39eGh; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0eH39eGh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTHFV2mg5z30hf
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 18:57:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D320A4135B;
	Thu,  9 Jan 2025 07:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B10C4CED2;
	Thu,  9 Jan 2025 07:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736409447;
	bh=la/AGYY75gNYY12SISkKn5wPrr5eGjIcyo23Hqc0rAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0eH39eGhMX8OPsBsF7mpcicMTjnKnyc/btU0UDMpYSoY0cwPEtwdkrCg9jt9cqc72
	 xwWOru/ApEbXd3aWI4vXRsBtmP8wiHiw+BjJC1kck32CnkKzl8kcjeNvjlJNVSiE8Q
	 lNHzio/+K8tM2k5MTABboHo3dwIFP5ucwxktGhNA=
Date: Thu, 9 Jan 2025 08:56:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	ppc-dev <linuxppc-dev@lists.ozlabs.org>,
	LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org,
	bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] sysfs: constify bin_attribute argument of
 sysfs_bin_attr_simple_read()
Message-ID: <2025010914-gangly-trodden-aa96@gregkh>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
 <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
 <CAADnVQJMV-zRcDKftZ-MbKEJQ7XGmPteMYCS0Bm5siBEXUK=Fw@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQJMV-zRcDKftZ-MbKEJQ7XGmPteMYCS0Bm5siBEXUK=Fw@mail.gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 09:45:45AM -0800, Alexei Starovoitov wrote:
> On Tue, Dec 31, 2024 at 2:30 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> >
> > On 2024-12-30 16:50:41-0800, Alexei Starovoitov wrote:
> > > On Sat, Dec 28, 2024 at 12:43 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> > > >
> > > > Most users use this function through the BIN_ATTR_SIMPLE* macros,
> > > > they can handle the switch transparently.
> > > >
> > > > This series is meant to be merged through the driver core tree.
> > >
> > > hmm. why?
> >
> > Patch 1 changes the signature of sysfs_bin_attr_simple_read().
> > Before patch 1 sysfs_bin_attr_simple_read() needs to be assigned to the
> > callback member .read, after patch 1 it's .read_new.
> > (Both callbacks work exactly the same, except for their signature,
> > .read_new is only a transition mechanism and will go away again)
> >
> > > I'd rather take patches 2 and 3 into bpf-next to avoid
> > > potential conflicts.
> > > Patch 1 looks orthogonal and independent.
> >
> > If you pick up 2 and 3 through bpf-next you would need to adapt these
> > assignments. As soon as both patch 1 and the modified 2 and 3 hit
> > Linus' tree, the build would break due to mismatches function pointers.
> > (Casting function pointers to avoid the mismatch will blow up with KCFI)
> 
> I see. All these steps to constify is frankly a mess.
> You're wasting cpu and memory for this read vs read_new
> when const is not much more than syntactic sugar in C.
> You should have done one tree wide patch without doing this _new() hack.
> 
> Anyway, rant over. Carry patches 2,3. Hopefully they won't conflict.
> But I don't want to see any constification patches in bpf land
> that come with such pointless runtime penalty.

The "pointless" penalty will go away once we convert all instances, and
really, it's just one pointer check, sysfs files should NOT be a hot
path for anything real, and one more pointer check should be cached and
not measurable compared to the real logic behind the binary data coming
from the hardware/kernel, right?

sysfs is NOT tuned for speed at all, so adding more checks like this
should be fine.

thanks,

greg k-h

