Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0081B73CC09
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 19:23:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=BrG6HqxL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QpLYH6LNbz3bsr
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Jun 2023 03:23:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=BrG6HqxL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QpLXN1tKsz30HG
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jun 2023 03:22:42 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 165DB602F5;
	Sat, 24 Jun 2023 17:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB04DC433C8;
	Sat, 24 Jun 2023 17:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1687627359;
	bh=qZ7HAhXoIllSoo8Dsvvl3p5GjbeHzy3A9Grub4rWk8E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BrG6HqxLI6m68A7eXn+yyFYJTFfpipxBToWGYg/6uwx42M0Yq6kfBXFf33vDiCk4B
	 22cSa1r3CTU55ZY9jRlB00VupRHyb/V+2C1EOshvlTgm8Vj6vpZbFMpkKrrqrEa9VV
	 F5nKRAHdynbmcewBtGpMVz4I+iF8dgzi7UMmW7Ec=
Date: Sat, 24 Jun 2023 10:22:38 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 00/16] Add support for DAX vmemmap optimization for
 ppc64
Message-Id: <20230624102238.0a45e74a0ae0e8e696468c1e@linux-foundation.org>
In-Reply-To: <87edm0x68k.fsf@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
	<87edm0x68k.fsf@linux.ibm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, npiggin@gmail.com, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Mike Kravetz <mike.kravetz@oracle.com>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 24 Jun 2023 20:22:27 +0530 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> wrote:

> >  28 files changed, 1032 insertions(+), 77 deletions(-)
> >  create mode 100644 Documentation/powerpc/vmemmap_dedup.rst
> >
> 
> Michael Ellerman merged some of the ppc64 patches. How do
> you like to merge the mm changes? Do you like a repost of patches 6-12?

https://lkml.kernel.org/r/87zg4ugqas.fsf@linux.ibm.com leads me to
believe there will be a v3 series?

Please send whatever is appropriate, against 6.5-rc1 or thereabouts.
