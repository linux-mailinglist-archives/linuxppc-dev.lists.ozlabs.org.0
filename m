Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C625A900F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 09:25:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJCHr686Kz2yN9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 17:25:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Deo+YD+Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Deo+YD+Q;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJCHG20PJz2xGR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 17:24:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 1F0F7CE246D;
	Thu,  1 Sep 2022 07:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC12FC433D6;
	Thu,  1 Sep 2022 07:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662017093;
	bh=stL9+yzK0zgdLie5xf0hjyraAlajedBKEBb65rMMvRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Deo+YD+Qtg4Ei+JHnT2yXSe+uKnWw8TmyJIetCBkvgsk1Q7LlzsyoYoLTsOfoIi9H
	 OwhDTSuHW6wmK1UEXZdoB3V1y6jPaa6Gnl+RYAHD8O9Y3LVX5IfL7CRFiOeksw36Wm
	 EYmdTybxXyum1jTy27Dch3Ul5cE/l8TcGSQ6IV0XZkNiYbEcW7Nus1P8ePSG+R584J
	 ytYy7VQ/lm2hstwOzR4PGDiapbPxiRVClotXRc2TZgKCgbQB6oL7YeI8VElF+RKMDD
	 D5IhD/lqXpNx9SApSSGxj9pQdWDifYzzwY17Ei+NamHJpcHkmogcZb4K3wswvbiX13
	 GO2I5M6b6Bowg==
Received: by pali.im (Postfix)
	id E3E127B8; Thu,  1 Sep 2022 09:24:49 +0200 (CEST)
Date: Thu, 1 Sep 2022 09:24:49 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pci: Enable PCI domains in /proc when PCI bus
 numbers are not unique
Message-ID: <20220901072449.hswlq5fpnqrhgvcf@pali>
References: <20220820115113.30581-1-pali@kernel.org>
 <878rnclq47.fsf@mpe.ellerman.id.au>
 <20220825083713.4glfivegmodluiun@pali>
 <87wnanu4vf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wnanu4vf.fsf@mpe.ellerman.id.au>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 01 September 2022 13:53:56 Michael Ellerman wrote:
> Pali Rohár <pali@kernel.org> writes:
> > On Thursday 25 August 2022 17:49:28 Michael Ellerman wrote:
> >> Pali Rohár <pali@kernel.org> writes:
> >> > On 32-bit powerpc systems with more PCIe controllers and more PCI domains,
> >> > where on more PCI domains are same PCI numbers, when kernel is compiled
> >> > with CONFIG_PROC_FS=y and CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT=y
> >> > options, kernel prints "proc_dir_entry 'pci/01' already registered" error
> >> > message.
> >> 
> >> Thanks, I'll pick this up.
> >> 
> >> > This regression started appearing after commit 566356813082 ("powerpc/pci:
> >> > Add config option for using all 256 PCI buses") in case in each mPCIe slot
> >> > is connected PCIe card and therefore PCI bus 1 is populated in for every
> >> > PCIe controller / PCI domain.
> >> >
> >> > The reason is that PCI procfs code expects that when PCI bus numbers are
> >> > not unique across all PCI domains, function pci_proc_domain() returns true
> >> > for domain dependent buses.
> >> >
> >> > Fix this issue by setting PCI_ENABLE_PROC_DOMAINS and PCI_COMPAT_DOMAIN_0
> >> > flags for 32-bit powerpc code when CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> >> > is enabled. Same approach is already implemented for 64-bit powerpc code
> >> > (where PCI bus numbers are always domain dependent).
> >> 
> >> We also have the same in ppc4xx_pci_find_bridges().
> >> 
> >> And if we can eventually make CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
> >> the standard behaviour on 32-bit then everything would behave the same
> >> and we could simplify pci_proc_domain() to match what other arches do.
> >
> > I sent two patches which do another steps to achieve it:
> > https://lore.kernel.org/linuxppc-dev/20220817163927.24453-1-pali@kernel.org/t/#u
> >
> > Main blocker is pci-OF-bus-map which is in direct conflict with
> > CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT and which used on chrp and pmac.
> > And I have no idea if pci-OF-bus-map is still needed or not.
> 
> Yeah thanks, I saw those patches.
> 
> I can't find any code that refers to pci-OF-bus-map, so I'm inclined to
> remove it entirely.
> 
> But I'll do some more searching to see if I can find any references to
> it in old code.
> 
> cheers

From the code itself I have feeling that some external programs or maybe
some firmware can access or use this property. But I have really no idea.
