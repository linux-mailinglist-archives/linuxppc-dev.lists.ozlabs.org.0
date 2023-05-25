Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9277711803
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 22:21:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRzwQ5pTfz3fGK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 06:21:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oiC2XGhN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oiC2XGhN;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRzvW6v1Bz3cfp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 06:20:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DE92864A34;
	Thu, 25 May 2023 20:20:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D613BC433D2;
	Thu, 25 May 2023 20:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685046036;
	bh=TRdhRXxXUIYfs640uIn+I4Rf6UAXCv8idpkcYdsSebM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiC2XGhNWUAmWE7pr8r3QtJ9JQsEo/jXvve3lXs2r5Y+W4R2mTSVXer6rhbIqd0H3
	 uoSQkJ728HLdXkJmf2eWWiJHTRm/fGQOsi2eZMGN8iMwau2U+ioJb0W4RoKYGYtykh
	 z9scTeHJfdOUnqeX313qP2xIMkwidI5DxymtOtruiJkZ/HiGGdvi3+NdefCU8HC/4L
	 yVF6ukcziPPo5ghUZkvreoJAGRzTQdLIctyd1RS1O+YIm3/yAJVKFl1SAT+U6nvVPE
	 TUmcZj1oUZgh7b4Odb9/HzteZyqvh1+JrTl0ADJm08qL98dpyZZ8OeR78PQJMngFPN
	 0x/EvMWBkU0Qw==
Date: Thu, 25 May 2023 23:20:11 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Vishal Moola <vishal.moola@gmail.com>
Subject: Re: [PATCH v2 01/34] mm: Add PAGE_TYPE_OP folio functions
Message-ID: <20230525202011.GZ4967@kernel.org>
References: <20230501192829.17086-1-vishal.moola@gmail.com>
 <20230501192829.17086-2-vishal.moola@gmail.com>
 <20230525085555.GV4967@kernel.org>
 <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOzc2pxx489C26NnS9NHkUQY9PYiagzt-nYK6LnkJ1N3NYQWzg@mail.gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Matthew Wilcox <willy@infradead.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 25, 2023 at 10:00:23AM -0700, Vishal Moola wrote:
> On Thu, May 25, 2023 at 1:56 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > Hi,
> >
> > On Mon, May 01, 2023 at 12:27:56PM -0700, Vishal Moola (Oracle) wrote:
> > > No folio equivalents for page type operations have been defined, so
> > > define them for later folio conversions.
> >
> > Can you please elaborate why would we need folios for page table descriptors?
> 
> Thanks for the review!
> 
> These macros are for callers that care about the page type, i.e. Table and
> Buddy. Aside from accounting for those cases, the page tables don't use folios.
> These are more for the cleanliness of those callers.

But why using folio APIs for PageType will be cleaner than using page APIs?
Do you have an example?

-- 
Sincerely yours,
Mike.
