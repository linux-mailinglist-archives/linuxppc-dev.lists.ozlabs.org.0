Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A094576D8A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 13:35:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlR4P1PMWz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 21:35:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RJe1fSMV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RJe1fSMV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlR3l0lN0z3bcv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 21:35:14 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 412C260FB8;
	Sat, 16 Jul 2022 11:35:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BC54C34115;
	Sat, 16 Jul 2022 11:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657971310;
	bh=1Nv+mrJbMC45A/7YReRl2eFPsTnci26We2C7a/b5Mzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RJe1fSMV5+cEBdR7OMYrY9fZdu/PpceJZ5o5CTouutuwbhIwfjx/GsNWZV9Q/F823
	 jXarhqth2tqCOg1ix2FLIYe8Xa4QtKzP3nsiFUHot2EgtLts/UpJ+KxGSy+GK1nbMh
	 tDMGNI/9q9c7wsR8kw97fKwDrYVc9+I4ljxXII15hZAm05ARyR1szRaPKiMee+19hy
	 GNbt8w79Oj3n6XiuW4Z/RUg5UI3JWCKINCdPAvzGjGPLF/yzQXk2jf1efl3jBGCCSD
	 sc50r8NcGNPjzFF760LL0fG+C6/lGvXTiUpjM9GYFwKw0UsfTUC9jaPA0qz30TFiTy
	 frli5dg1lr9lA==
Received: by pali.im (Postfix)
	id 4079EA52; Sat, 16 Jul 2022 13:35:07 +0200 (CEST)
Date: Sat, 16 Jul 2022 13:35:07 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] powerpc/pci: Add config option for using OF 'reg'
 for PCI domain
Message-ID: <20220716113507.c6loaltpuaj4hrs5@pali>
References: <20220706102148.5060-1-pali@kernel.org>
 <17fb8d12-60f9-09d5-91fa-09d5a5a9a4fd@igalia.com>
 <20220715171132.ujaexzm4ipad7o4f@pali>
 <15432ee0-3a33-0b53-b39b-f8b53a7e4345@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <15432ee0-3a33-0b53-b39b-f8b53a7e4345@igalia.com>
User-Agent: NeoMutt/20180716
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Guowen Shan <gshan@redhat.com>, linux-kernel@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 15 July 2022 15:32:56 Guilherme G. Piccoli wrote:
> On 15/07/2022 14:11, Pali Rohár wrote:
> > [...]
> >>
> >> I found this sentence a bit weird, "in the similar way like it is doing
> >> kernel for other architectures", but other than that:
> > 
> > If you have some idea how to improve commit description, let me know and
> > I can change it.
> > 
> 
> Oh, for example: "in similar way the kernel is doing for other
> architectures". The sentence idea is perfectly fine, it's just that it's
> a bit oddly constructed IMHO heh
> 
> Cheers!

Ou, sorry. English is not my first nor second language.

Michael, should I resend this patch series with Guilherme's suggestion
for changing working in commit description? Or will you adjust it
manually?
