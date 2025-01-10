Return-Path: <linuxppc-dev+bounces-4981-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B77C9A092D5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 15:02:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3Jb2rVLz3cWG;
	Sat, 11 Jan 2025 01:02:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736517774;
	cv=none; b=Bwzo1Fo6RsxqMDOzebeLvp5r7vwxyllY8bK5Z/MtAkQRC5TGUtnSdiSVb3kBEkgSCWBEUvW1zLi/8eT/5EI6Rej1LtNqhG4vRLa5fOWtHjo5bY8WjHNEtPF5qQzJeNwOO8LajAdLyM2t7X6GARvRLfqKNKUPdQrRWfRp9G/JbQnUT5ef1FjriO9YzoOkg2ciAFHyuIN6P+FkDySbmV3uBTQj0ipDDPhSWWh25G4p5aEfkYt4LY+8T1bK5ezBvxo9yXBEZN1iiJ9INHEMgUEo1LBbBS6asc+7R0tO6FhUC8WZj7+K0MLdkSSVcnM3Kpmchgl2o/2x7cmXgiQr3fc13g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736517774; c=relaxed/relaxed;
	bh=ZtM8CdxlkYiqGAke/bmDfXgVLUohRlvgKD0ty7jBgy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVArEWnCSwM2nv9YB+dwmN0USDkGVxgrnH+2yttonBENjgyu72gQGjZWfhFKcbmB/XNrpipNfOxGeYlKB0UsSzJe8/0E5em92VTk4oJdShsJjPO3cOKLx6orKgmaCNfhkK/p2i4o+hoYi1YWiaVl5NCmB4sWV6O/FDwYzV5iosSruYhJpWP0n25g8GVl+ng6xar4J59W/X3RVGJsG9fSLMsRpFXce9yCNs4hipLVxYfh/NXqPfK0vailLwv0Sx4TFZfEnY6TQ6V9AfwJhD5b7GPUJWFPfMpSL/i02+Iq5umlJ6UQLDzoRwJvnDZJZ3evfWlHX+Vmkqo2vWQw5XU43w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1UgEq73O; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=1UgEq73O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV3JY4MCyz3cWF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 01:02:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5817A5C4779;
	Fri, 10 Jan 2025 14:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F6AC4CED6;
	Fri, 10 Jan 2025 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736517770;
	bh=PiHOuTmg4zVKpJegF6ABeMDuMTjgr4kkSmGq4TpISGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=1UgEq73O4FHpe2ME6QHxe7teMM6bDpyu8MXMdN9O8AaLkv60GwON/KHpjZUgYVvmR
	 Ry1Dhq+iyNhko0bi34d1pq+B+TjcxHfguJ0Ye49THfp7BuRgEtJt5K+Ap9BrbOlPnI
	 aeoCFckJv7amvcq7csX9bujUVnd56/4c9I2Y0wo8=
Date: Fri, 10 Jan 2025 15:02:46 +0100
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
Message-ID: <2025011017-tubeless-hanky-0e99@gregkh>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
 <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
 <CAADnVQJMV-zRcDKftZ-MbKEJQ7XGmPteMYCS0Bm5siBEXUK=Fw@mail.gmail.com>
 <2025010914-gangly-trodden-aa96@gregkh>
 <Z3-DcbY60SxoM0dN@infradead.org>
 <2025010930-resurrect-attest-94c9@gregkh>
 <Z3-HZT5kwt18QSQn@infradead.org>
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
In-Reply-To: <Z3-HZT5kwt18QSQn@infradead.org>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025 at 12:23:01AM -0800, Christoph Hellwig wrote:
> On Thu, Jan 09, 2025 at 09:12:03AM +0100, Greg Kroah-Hartman wrote:
> > > Hey, when I duplicated the method to convert sysfs over to a proper
> > > seq_file based approach that avoids buffer overflows you basically
> > > came up with the same line that Alexei had here.
> > 
> > I did?  Sorry about that, I don't remember that.
> 
> It's been a while..
> 
> > As for seq_file for sysfs, is that for binary attributes only, or for
> > all?  I can't recall that at all.
> 
> Non-binary ones.

Ah, yeah, well the churn for "one single value" sysfs files would be
rough and seq_file doesn't really do much, if anything, for them as they
should be all simple strings that never overflow or are complex.

Yes, there are exceptions, so maybe for just them?  I don't want to make
it easier to abuse sysfs files, but if you feel it would really help
out, I'm willing to reconsider it.

thanks,

greg k-h


> 

