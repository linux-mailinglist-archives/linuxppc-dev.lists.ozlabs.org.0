Return-Path: <linuxppc-dev+bounces-10197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B5EB0261C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jul 2025 23:05:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bf43v34HVz30W9;
	Sat, 12 Jul 2025 07:05:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752267915;
	cv=none; b=fg6lare3v50wN/i/Jbq6dPuxCbL7u36IrQO0qB121XDDBmm+hruxwBrdgL+fFMoCdMASWvh1xRinLsmjnZAiwP/9Pc1uL+qPC081dLT2/OoXZAasMCyNwM+9GO4QjtO5qZd07YZKP61vxi3P4xeqqvWumsN2W+9sjVVj9pVnlsuvnff9Tgd8yjlXdq7hi7dYJOTfxLmFIKhGg5zATWd8cAqF2uuJBD9VqlDNfXyaF1h8P8vG/k0Ej8/DFvL7llj9oxUYSxbmwLechO6ELBKyvK3Yrsr87w0vEZ5HofCxoZNm7LrLgqyDrTU1IYRiyay7GtkuTWkbtAsxw5kCaN243g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752267915; c=relaxed/relaxed;
	bh=FxQhDGnNJBk0mu7COhBzCXPg3VelU5IoQ/JkaqvYIFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BdqL/PQRJZVF8wHacmX8rLM7ht/O2tynQ1/uYsjDi12wROfiZYplcwRERs4Jg9dbp4lhVi2DHs1GKnqwZXctohnMd+ik4bq3sfwaz1z6XCCmFBBdKusBNdwmlw2EI7iZRy4AjkAJAxxNDIIeps+XjmbE7jlDxONCW7xQOuvf3J0OqNrYhfHP55s+mwhJGSWe2FwOffnVnHxulDeLj8OXDSJx50rGK1FartUFvrKd1IpwrYhmBIRCF/pzIU8OF/unHx7oJIsSVZqwGCB20gjeEfJK/w+KyQCpaPxlHqyoZaPafmAZrVooj8HhrXV4PIx0gVxvR6T+6agA4svLRAg6ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Va0teick; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Va0teick;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bf43t2x5lz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Jul 2025 07:05:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E25761439;
	Fri, 11 Jul 2025 21:05:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 920A3C4CEED;
	Fri, 11 Jul 2025 21:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752267911;
	bh=uHv2HgJnKbhKwjNP1Z1NjX9olIzNk5naCNk8EoEhros=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Va0teickhjzFgErQ9hAONAf8bZW3XPHI+c2FMG/SBppey4C0hi8xjsm9cRdTGb40B
	 jOPCgyQctdfLGL7M222hOeqgsM4EbSAqw+LBCKn3fyxvmJjaLS/WNEnBTUyvsRrE4o
	 LsKkIJyBEsP+WU9HgK46sKvy25tW1GXPIr50/PHfUwwN0TpdSVARlEd6ppl9DbcsJ+
	 rTdqH+svHAVaP+UQb6eWTQCP6Z4+wr1cNjJtEC1UtoSxGXvKdJOLSEeRXueJMpGIFZ
	 f8OtNzEDIDhsZ0IQh/uX5CtIsFf/juPLpxwmdpjSiJFUX2HXP0v11wI2CKNWlYne7H
	 R8s0Kt9soYEhw==
Date: Fri, 11 Jul 2025 16:05:10 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Krishna Kumar <krishnak@linux.ibm.com>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
Message-ID: <20250711210510.GA2306333@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1841754281.1353162.1752257887865.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jul 11, 2025 at 01:18:07PM -0500, Timothy Pearson wrote:
> ----- Original Message -----
> > From: "Krishna Kumar" <krishnak@linux.ibm.com>
> > To: "Bjorn Helgaas" <helgaas@kernel.org>, "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> > <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> > "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> > <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Lukas Wunner" <lukas@wunner.de>
> > Sent: Monday, July 7, 2025 3:01:00 AM
> > Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention indicator
> 
> > Thanks all for the review and Thanks a bunch to Timothy for fixing the PE Freeze
> > issue. The hotplug issues are like you fix N issue and N+1 th issue will come
> > with new HW.
> > 
> > We had a meeting of around 1.5 -2.0 hr with demo, code review and log review and
> > we decided to let these fixes go ahead. I am consolidating what we discussed -
> > 
> > 
> > 1. Let these fixes go ahead as it solves wider and much needed customer issue
> > and its urgently needed for time being. We have verified in live demo that
> > nothing is broken from legacy flow and
> > 
> > PE/PHB freeze, race condition, hung, oops etc has been solved correctly.
> > Basically it fixes below issues -
> > 
> > root-port(phb) -> switch(having4 port)--> 2 nvme devices
> > 
> > 1st case - only removal of EP-nvme device (surprise hotplug disables msi at root
> > port), soft removal may work
> > 2nd case  - If we remove switch itself (surprise hotplug disable msi at root
> > port) .
> 
> Just a quick follow up to see if anything else is needed from my end
> before this merge can occur?

I was waiting for a v3 to fix at least these:

  - Subject line style matching history in drivers/pci/hotplug/ (use
    "git log --oneline" to see it)

  - Broken subject line wrapping into commit log

  - Spelling fixes

  - Comment reformat to match prevailing style

  - Note attention indicator behavior changes in commit log

  - Some minor refactoring

Basically everything mentioned in the responses to the original
posting.  Or was there a v3 that I missed?

Bjorn

