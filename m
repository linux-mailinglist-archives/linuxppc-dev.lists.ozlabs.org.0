Return-Path: <linuxppc-dev+bounces-2761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAFA9B92AF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2024 14:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xg2Sw3ZKBz3013;
	Sat,  2 Nov 2024 00:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730469360;
	cv=none; b=W7HY9PeqBOKmq8qe4Kzq0CekXkcEYxXU34lCyOJecTNingl8q8RXC19VY9SpHX+VLipiUEJ7gXVRfWMGUOPkgr9p6AQvLFS9NdnE/vVQIAP0TglviRnH6D7oCt4bj3IhC80KmMGzTcLEKSU6nlTkSJvK3gIEbtWZQOw/NqK5GD8EPYMZBWo3HyHoC53ljkobYufPsjnWjFjYr/6Mtm8j8aUzk3r5xBKo1o24x9S6xn4LG9GUbG9eXiUxtENCQu5s1S4hRIsLY44bPQbG7NIM8yMvwI+TyY3FJ4WrfsmN6bCEOEHC33DBjk2DrObNQz7O00Ql3B4BZFXZKqSyVp1ueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730469360; c=relaxed/relaxed;
	bh=xn3BGj5rueIK+u3o7ZyxP/4jQ0FSVGthDIKijkHcOog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b99HvUxa4uuCD70IkhYK1I+sfCWIf2K90B+gJd0U2WyS8SGMPHhOzXS1scTGf0/yM4b9tSCEpUTpQtvGDTrwWUp0UVHwUOy03NomoLm0eQ1VrfkIFXQYgsHXm+B+j0PeMdN9B0/LWqjKy9wb8eahgh17IdwHjVwvTuTvUUVvoM/shPHh+LC/a7dbHraZQR+ovoL/A5DalH3bJJcn57ivJjxtn11+J/xJgFawN8oPAWzqXHGp2LCnkZ2yLMigq1WW9k2ZinIX2hqOkVmZ7RSDM+02kTnxfhPKpDg+c5STLyA/r54G+bKwpchY/pesDZaZq0gHQiCA4XaS+PHQMvwrzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=utaJgKuW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=utaJgKuW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xg2St5x3pz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Nov 2024 00:55:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1C58D5C756F;
	Thu, 31 Oct 2024 04:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F524C4CEC3;
	Thu, 31 Oct 2024 04:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730349418;
	bh=crAxu3XzybivA/UWLoSfAvCkBgRP49xKq21qgkwbOd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=utaJgKuW2qdmNpLTa9i1TAP5d7O/4PXDe8KJH+0Qc1o8S8gml/sgEWuoO3Vjf7B00
	 6jQdJ+LVR7sdYX3VctcOXYm56kdbo1l549HiA3P55LKbwfLomhaJ8HCnxIlXG746BM
	 4TrlUZDo7SHtQOic8Z+dGMHt0TeNnnmNm+EdPev5JCC9gbEMzQl7FOiFkzPQbnnFGw
	 SqVn3iIOts2sPtdfIHdgNTtd4h6R/J83ai0aiDPykuW/Z8iaLwnqsJg2zYwwByzBVb
	 eSE7dSMlDGhaIkwA++e83TYNvdDRJDCaGjlGgNcZ9cBJmv/C5EM5ao3eSAQ8QoNT2B
	 3witkW4FbfgPg==
Date: Wed, 30 Oct 2024 21:36:56 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Matthew Maurer <mmaurer@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-modules@vger.kernel.org, linux-kbuild@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v8 1/3] modules: Support extended MODVERSIONS info
Message-ID: <ZyMJaFcF4dTTzNgK@bombadil.infradead.org>
References: <20241030-extended-modversions-v8-0-93acdef62ce8@google.com>
 <20241030-extended-modversions-v8-1-93acdef62ce8@google.com>
 <874j4tcbhf.fsf@mpe.ellerman.id.au>
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
In-Reply-To: <874j4tcbhf.fsf@mpe.ellerman.id.au>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 31, 2024 at 12:22:36PM +1100, Michael Ellerman wrote:
> Matthew Maurer <mmaurer@google.com> writes:
> > Adds a new format for MODVERSIONS which stores each field in a separate
> > ELF section. This initially adds support for variable length names, but
> > could later be used to add additional fields to MODVERSIONS in a
> > backwards compatible way if needed. Any new fields will be ignored by
> > old user tooling, unlike the current format where user tooling cannot
> > tolerate adjustments to the format (for example making the name field
> > longer).
> >
> > Since PPC munges its version records to strip leading dots, we reproduce
> > the munging for the new format. Other architectures do not appear to
> > have architecture-specific usage of this information.
> >
> > Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> > Signed-off-by: Matthew Maurer <mmaurer@google.com>
> > ---
> >  arch/powerpc/kernel/module_64.c | 24 ++++++++++-
>   
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

Michael, Matthew, why make everyone deal with this instead of just
making this an arch thing and ppc would be the only one doing it?

  Luis

