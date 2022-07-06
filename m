Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D228F56856B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:24:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdFyY5gZsz3c93
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:24:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r3d8Sn60;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r3d8Sn60;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdFxy3Rznz2xs1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:23:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C1447B8090C;
	Wed,  6 Jul 2022 10:23:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66378C3411C;
	Wed,  6 Jul 2022 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657103026;
	bh=dLwzuTcTJxjrJx5KFBvSWF4B9fKuiLNpighCnwFB9SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r3d8Sn60XaOmiKvgC3MOYMR7aJCPV9sa+ThJL4mLaoaZRDiqrd/YbPttsKHC/cFmP
	 6Le00OLABS0eTmv+jKnGpO8i24euFEfypI3BW2XauGUgQs3prUv9Whh7a1/5kRP8Gf
	 Kod7Y/M/7P+O3LDOJzpcoyh8JSdYgReYLEWgZHig90B+6lM5QYOqii9xT0BebwEKaG
	 dhzVxVb9N3esvNMkxGqq3Fjnwm2sGpMDZNUt4rMGjzNbQ5rMZoHvXpD8VgqHkv1beg
	 QscILbwGkbSDmdEOg7h3igFNJ1DAyB+GXG5oJMe+1eiuQ1abvvnUxZTUZ5xh3Rw0zQ
	 Up2DHKItPM3EQ==
Received: by pali.im (Postfix)
	id D5C8A7BA; Wed,  6 Jul 2022 12:23:43 +0200 (CEST)
Date: Wed, 6 Jul 2022 12:23:43 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pci: Add config option for using OF 'reg' for
 PCI domain
Message-ID: <20220706102343.7vui5ymz5kr5sexi@pali>
References: <20220504175718.29011-1-pali@kernel.org>
 <87edzxc6r7.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87edzxc6r7.fsf@mpe.ellerman.id.au>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday 10 June 2022 17:33:32 Michael Ellerman wrote:
> Pali Rohár <pali@kernel.org> writes:
> > Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on
> > device-tree properties"), powerpc kernel always fallback to PCI domain
> > assignment from OF / Device Tree 'reg' property of the PCI controller.
> >
> > PCI code for other Linux architectures use increasing assignment of the PCI
> > domain for individual controllers (assign the first free number), like it
> > was also for powerpc prior mentioned commit.
> >
> > Upgrading powerpc kernels from LTS 4.4 version (which does not contain
> > mentioned commit) to new LTS versions brings a regression in domain
> > assignment.
> 
> I'm sorry this broke your system. But I don't really consider it a
> regression, the kernel provides no guarantee about the PCI domain
> numbering across LTS releases.
> 
> Prior to the change the numbering was just based on the order the PHBs
> were discovered in the device tree, which is not robust. A cosmetic
> refactor of the device tree source could cause PHBs to be discovered in
> a different order.
> 
> Similarly a change in firmware PCI discovery or device tree generation
> could cause the numbering to change.
> 
> If you have scripts that are looking for certain devices they can use
> the vendor/device fields in sysfs to find the actual devices they want,
> not just whatever happens to be at 0000:01:00.0.
> 
> > Fix this issue by introducing a new option CONFIG_PPC_PCI_DOMAIN_FROM_OF_REG
> > When this options is disabled then powerpc kernel would assign PCI domains
> > in the similar way like it is doing kernel for other architectures and also
> > how it was done prior that commit.
> 
> I really don't want a config option for that.
> 
> There is a device tree property "linux,pci-domain", described in
> Documentation/devicetree/bindings/pci/pci.txt.
> 
> Can you try adding that to your device tree and updating
> get_phb_number() to look for it?
> 
> cheers

I sent another proposal in V2, now also with "linux,pci-domain" support.
