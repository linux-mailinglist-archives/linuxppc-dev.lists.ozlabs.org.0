Return-Path: <linuxppc-dev+bounces-13234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62996C03668
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 22:37:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csyXF4K7Mz3c5T;
	Fri, 24 Oct 2025 07:37:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761251869;
	cv=none; b=X9Zzg1NWlqR5oajmpXyTJBGzJ4fdVda88PCYRcexAelL1Gf6c27u9Udq0Zs2s4nDkbeaVRU3RH+yiYRoM0XOxzh534QbnrzAFHRFH6nVIgfOKQgBLQSBEEXvBqU+u5nPmcEiZANlvLUayM6u/1O6flhH2GJE5U23c5oDmJScfgU9yFGdknfjZcqzXLaeINNGmdzMnbwiTmanQOlu0CSdNxfKUfn39lXrWkpNVvnjnM09R6xezR4Ob8maTIKfQWZayncveety7QXMHpavM7aNd2+nGMCv/+TOGKzgbCIX4GrMFsAFY2naJef+G75Kf3mg72nwr5WMwxd00POnAgixOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761251869; c=relaxed/relaxed;
	bh=cBEDWJpzqHFP3uDgyE8ktlZmyyOJOv/ydr99O1PvRAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LP58p26o6idolsVH+tL0/nZIaaxH00PCUGVYfl98tb+d284ONLr5x2HysG2BHV9c4VwAENAZvlJkhob9pg0IN7V8JQvEPh2UfO+Vroy8Ydq89BAwhjBIo4j0yr3NRHwhyv5HIDkHyyyZHQ5PpfyCrwemW1u8rxjMjJ1visb9dTaqNM5uizKjo50vJRr/BhD6O2OBdwCMbsYqfxPdmAfeM9X0+XuW8lE7xNKOeFcegAlF6fS24RYqUjbGOesO9G/LpGcRn9hOTupC4fAxWuv44MYS5NaeNFbzfqmCVjDXUpjgB8MneZvVt3XuGmZ89evw1xeZMJME50xn8hhLlzWxNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h3ytV2vZ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h3ytV2vZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csyXD2bgYz3c4d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:37:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A68F405AE;
	Thu, 23 Oct 2025 20:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB97C4CEE7;
	Thu, 23 Oct 2025 20:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761251865;
	bh=2YM0+zsZqGChetS9GwXiepmm69IizY2zwtiVz39WIsI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=h3ytV2vZuMNv8NoTWdIl5ICqjQTyzWf22mdhyoQLj6r6nQTkeuImhgjjVp+9kAsea
	 u/KtDwgCJX7Rv5r5N8EmyG/qFIzkjgRzfL79dc5OSALqP4VnXy+rk7HVW73zoDfRm3
	 MLD5BEPsiDjqUXqb627Wsfl+m8sUplWrlcPyHz9YkdbTXB7LKnj49VlwA99i5KbSNj
	 g36nO+KzdgUVocdlOSqwj7dZfHLbJgV7FuGC1O12G3dJaX/okmmegIjm0SA9ByE0YL
	 WcNv4RrCiz868Z38yxnQ0rQXAFQcBAaVHfsK6Se/ACNsHmKKVCspkE0nuLYKvLtkBV
	 bWYzcXP4eN/ew==
Date: Thu, 23 Oct 2025 15:37:44 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	linuxppc-dev@lists.ozlabs.org, linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <20251023203744.GA1314513@bhelgaas>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da79f38f-fdb9-0101-67cc-144ef8d6e1d1@manjaro.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 08:27:25PM +0200, Dragan Simic wrote:
> On Thursday, October 23, 2025 20:06 CEST, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> > platforms") enabled Clock Power Management and L1 PM Substates, but those
> > features depend on CLKREQ# and possibly other device-specific
> > configuration.  We don't know whether CLKREQ# is supported, so we shouldn't
> > blindly enable Clock PM and L1 PM Substates.
> > 
> > Enable only ASPM L0s and L1, and only when both ends of the link advertise
> > support for them.
> > 
> > Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> > Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de/
> > Reported-by: FUKAUMI Naoki <naoki@radxa.com>
> > Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353-9818-3bb2b311da0b@radxa.com/
> > Reported-by: Herve Codina <herve.codina@bootlin.com>
> > Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
> > Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> > Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.com/
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> > ---
> > I intend this for v6.18-rc3.
> > 
> > I think it will fix the issues reported by Diederik and FUKAUMI Naoki (both
> > on Rockchip).  I hope it will fix Christian's report on powerpc, but don't
> > have confirmation.  I think the performance regression Herve reported is
> > related, but this patch doesn't seem to fix it.
> > 
> > FUKAUMI Naoki's successful testing report:
> > https://lore.kernel.org/r/4B275FBD7B747BE6+a3e5b367-9710-4b67-9d66-3ea34fc30866@radxa.com/
> 
> I'm more than happy with the way ASPM patches for DT platforms and
> Rockchip SoCs in particular are unfolding!  Admittedly, we've had
> a rough start with the blanket enabling of ASPM, which followed the
> theory, but the theory often differs from practice, so the combined
> state of this and associated patches from Shawn should be fine.
> 
> Thank you very much for all the effort that included quite a lot
> of back and forth, and please feel free to include
> 
> Acked-by: Dragan Simic <dsimic@manjaro.org>

Added your ack; thanks for all your help!

