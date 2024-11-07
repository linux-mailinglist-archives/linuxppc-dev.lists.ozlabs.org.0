Return-Path: <linuxppc-dev+bounces-3017-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB579C0EB6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 20:17:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XksJq15p0z3bqW;
	Fri,  8 Nov 2024 06:17:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731007035;
	cv=none; b=o3Z3w+rl/04VmIqlQogAXOnIYVbPkjCaVa4swBMoINBJTUa2UcAa1UiWtPu6xfAljMFDsqFm/kpc8Pt3bYEnZv7ELRRqWCb/Be7fQlYpQ7J0AUZubTkA7NbxI7UWyiW2fE1rnA+I6s9KQsoH62JLxrvIpmFYAiPDV45VtiOLFTTEMOLn1A+LY7MrDU8QNqpe6U1D6iiKq4hLJLF7p99SsigCTMDLIiH7PKcejmUEJBu/HnMxlR88jWF30rZy02fW4UIIjQN3rnhv39x61kl2yJz9iLMDlymFZcVfiVUSGlJM4kmzDOQbCQdbkeNR+KMpAHpcVNwEDSK96gSV5U4GYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731007035; c=relaxed/relaxed;
	bh=u01eU9oveAdZwMiXkX5Lhok/poXFlGe3WZ/pvoCQx2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqN5eRyLjoBdff8Yktf5O0y1CaSI8lxlq/urkEnvxaFZeIad6oMB1lYuZNs15pTbGAsQ53MlldDHDqWqdsd+tqZ8VMR03kvq9EoGB662tE/DVN4zkTyjCedNPxyIsZB8uwkX57qjFyaFNSEicp6mnAkq9Ej3p6E4DmSlGeSa4pym7upfYGOMTUoRW9U6DfKW90xC/sLja0W1F4l0jT2LDYEjcNc80yLH6n9q0Z1/asiB1KTgm3mHiw8l5AbtmH96CLUpq+ZLOaYYGJY+jvMXU1tpBL8UW0PJjoK35Lrm6gHGreZgg86uaHIHjBj7kzlmnrYLSxnEGyJRaKaqPjNyNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XksJm5PFKz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 06:17:12 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 4A7JEnsX024637;
	Thu, 7 Nov 2024 13:14:50 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 4A7JEnn2024636;
	Thu, 7 Nov 2024 13:14:49 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Thu, 7 Nov 2024 13:14:49 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, arnd@arndb.de, nathan@kernel.org
Subject: Re: [PATCH] powerpc/Makefile: Allow overriding CPP
Message-ID: <20241107191449.GJ29862@gate.crashing.org>
References: <20241107112646.32401-1-mpe@ellerman.id.au>
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
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107112646.32401-1-mpe@ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 07, 2024 at 10:26:46PM +1100, Michael Ellerman wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Unlike all other arches, powerpc doesn't allow the user to override CPP,
> because it sets it unconditionally in the arch Makefile. This can lead
> to strange build failures.
> 
> Instead add the required flags to KBUILD_CPPFLAGS, which are passed
> to CPP, CC and AS invocations by the generic Makefile logic.

You can also use "CPP ?=" instead of "CPP =".  Your solution is better
I think, but, FYI, FFR :-)


Segher

