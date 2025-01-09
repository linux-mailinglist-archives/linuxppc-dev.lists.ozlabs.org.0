Return-Path: <linuxppc-dev+bounces-4901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAFA06FC5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 09:13:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTHbG4jw8z2xjK;
	Thu,  9 Jan 2025 19:12:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736410378;
	cv=none; b=CWOfZk+YnQbz9c5oT07/hygasbrKkv/9+WLAinBvnpR0du98QuZVU3Y+BrZEn9wt5Mm/ItQ0QjpCMwVinPowf3Tvsxhi51W1QXqd7c8CSZ0NefqjIUoWeVwC7RJfNZGjKLc9ZP7cAC3sN6fCyu2EvuUg7+Z9y5vKqnYTT6VcGA6KM/nLMVgLc1rAXm3dY5GM0T3tBIPSsNKNOui1rbC5bh+dItTpw1Hbxi+qO+Oo+fslVTYCz7NQlubqxTDT+KpFgYAi0NKp54oGEIPOHQ2GyB1m/iXfApq9njzU+OPPCkA4Y1wz/5dGUy0cPMszr65SHreNYzP4iB+vj7DnubhCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736410378; c=relaxed/relaxed;
	bh=huPY0B9/fxBP9PVESbecKN90O/AFGT77qocs4aM2HQk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTOzKs7HJY72MIBNqM3DuqcPE1TREnQvzusLEof/CGEmj0VA7SrAWbSrv8pEH2vfFG6CDjS/+Y3GLrDidTfYZeXgBLYI9VBddxeKqenCu/8QdqwknwU8fqzJi22mc1jMJGpxmRRbjB+UJJ98U9cCKH96PtGxgnXGgVYeZYGH70BDjBwj8PKop7L75kpf/GTPqq1jjjyEAiGk7JKvgC5MYRXv5LX/W1H9ozMacvQszHha2JxznLR48/TpHIiawjpt0FjCWXx4LvrtyZr/AMHURBe7AlvLCX3/W76VvHgMkpRkWGj0b5YANK/+9L5J5XSOWOAifRfbCJM3Ol7xrD58pA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FrrMBTfz; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FrrMBTfz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTHbF4cQKz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 19:12:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B29CFA413E0;
	Thu,  9 Jan 2025 08:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6212CC4CEDF;
	Thu,  9 Jan 2025 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736410374;
	bh=uVCQv/CBIXNIpASM0DI4JtJeCT5olizPHDkJTyHS+lI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FrrMBTfzNtXQ/slQQIzUvLn/JvqfmTWbbmaxK147f17gHXA9dgG/DAqaiIEE4V0p2
	 XjJL7CrL6beOUzI/i24yH1b84FJ18kcrPu8+IbC2WVaZ7Csc8bysfffEO9l0H1kcfK
	 ew/fnE1srRQnYw6SESiPp8ZceBF9N2bNnElaSX4A=
Date: Thu, 9 Jan 2025 09:12:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
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
Message-ID: <2025010930-resurrect-attest-94c9@gregkh>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
 <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
 <CAADnVQJMV-zRcDKftZ-MbKEJQ7XGmPteMYCS0Bm5siBEXUK=Fw@mail.gmail.com>
 <2025010914-gangly-trodden-aa96@gregkh>
 <Z3-DcbY60SxoM0dN@infradead.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z3-DcbY60SxoM0dN@infradead.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025 at 12:06:09AM -0800, Christoph Hellwig wrote:
> On Thu, Jan 09, 2025 at 08:56:37AM +0100, Greg Kroah-Hartman wrote:
> > The "pointless" penalty will go away once we convert all instances, and
> > really, it's just one pointer check, sysfs files should NOT be a hot
> > path for anything real, and one more pointer check should be cached and
> > not measurable compared to the real logic behind the binary data coming
> > from the hardware/kernel, right?
> > 
> > sysfs is NOT tuned for speed at all, so adding more checks like this
> > should be fine.
> 
> Hey, when I duplicated the method to convert sysfs over to a proper
> seq_file based approach that avoids buffer overflows you basically
> came up with the same line that Alexei had here.

I did?  Sorry about that, I don't remember that.

> And that is a lot
> more useful than constification. Not that I mind the latter, but it
> would be better if it could be done without leaving both variants
> in for long.

I agree, we should get the read_new stuff out in the next kernel cycle I
hope.

As for seq_file for sysfs, is that for binary attributes only, or for
all?  I can't recall that at all.

thanks,

greg k-h

