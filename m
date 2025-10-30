Return-Path: <linuxppc-dev+bounces-13607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B7C22859
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 23:12:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyJHh6wqgz2yyx;
	Fri, 31 Oct 2025 09:12:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761862320;
	cv=none; b=Fx9vYr4w8VoA6udHDpm6OndoVWshIZx9Y8vP5E3YrrDRK5a9MfIaXHn0d0k9IJjrCqD2PcXYwUu6jwDgqZg1KycUW5z9b3ZGvz8Qm2Q/Vsh37zbIBAYkFenPMhChCOAeA9pqliiEJ9Q5PH3ycJoGRSLxSPwO7mwLLzvJ29P2ejdD4P6iKgkBZB5UIbr1qMn9/OFV2O/CCsi3yBSQDWwNhecbP/WmiMVs4CFI2U5Ja8IayiQ8KBH7Tdx2NOUigPq5rksc1i9eC1dPYAnwETysqUTw3a2amNy+vOH0OCw2LqZRrseZdJeIlutW10jq0OMX8x99cjo1akKDwV9RW4p5Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761862320; c=relaxed/relaxed;
	bh=jMltdkaTKqQ/KYV1V8VL20aNrRaoMmTtWgH6ArbLJwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MuUteEgKMkzs8Z98ODk+9YM2shRR3oQJE7LfZFFmIYitwF82GL7465zPJBXtx9Jw0/SoKfBArLy15JADMKKV5Xp5Y8c56dPeBxPWsHrjuONSHg/YxMGL7kYaBTXxnBBhrEnqNuoZ0o+M/oL2IlnEZIoJQAAllI/yIwUu+/Bq91+aFvakssKQ0dAHiwBsKWa6LiV4JPP57bFOKq9TgygcmHSOostDAibykZ+pB4nN1YcZsooiLcD8wDTJn10mmbV89Nkgfqxld3ngQckEWEQeIWnYp+gHcw11NNfMA0IME6Uj9MRERydGTcosgmyThfKDuBF+V+gymDyW634KbLhLAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rpkVaNAK; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rpkVaNAK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyJHg726pz2yrZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 09:11:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B5DD444DD1;
	Thu, 30 Oct 2025 22:11:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78317C4CEF1;
	Thu, 30 Oct 2025 22:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761862317;
	bh=ANsDWcvXGFKqRpeDoJiS5nLcPhuShWzOx6h8WZp7DHo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=rpkVaNAK42KbaB7YIawxEJpZQszaydDn+sfLWBjub8tN2BiwYgI+g+wbSktjaeDVu
	 FTuLYt0u2eg4y7x8tzFHf+NdwLcTuEInmYlMWlcfLtBkiYhr/gNhk7k/BBkxirKzae
	 40hxdubrtE7KZbiwWVMtskS/WEbjJhi3uAhmYXd3BBT60DZ/rid8Lv430KYUASL6kO
	 2nkcjvSMXT6sy8FfPyLz06jghw4bRhUwwIHU6JORtif1qblABRYhitBLwTM9jhKTwh
	 REcsxr8+uO23ShMJSSvGCYA60KrfxdLyUX50AkAZG9/kegTHfBWBymxqIh6GL+23f+
	 DVfmFK1mHUHqw==
Date: Thu, 30 Oct 2025 17:11:56 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Lukas Wunner <lukas@wunner.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	regressions@lists.linux.dev
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251030221156.GA1656310@bhelgaas>
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
In-Reply-To: <20251013210602.GA864364@bhelgaas>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Oct 13, 2025 at 04:06:02PM -0500, Bjorn Helgaas wrote:
> [+cc Adrian, Lukas, Mani, regressions]
> 
> On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
> > Hello,
> > 
> > Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
> > 
> > Without the pci-v6.18-changes, the PPC boards boot without any problems.
> > 
> > Boot log with error messages: https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
> > 
> > Further information: https://github.com/chzigotzky/kernels/issues/17
> > 
> > Please check the pci-v6.18-changes. [2]
> > 
> > Thanks,
> > Christian
> > 
> > 
> > [1]
> > - https://wiki.amiga.org/index.php/X5000
> > - https://en.wikipedia.org/wiki/AmigaOne_X1000
> > 
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f2c7254931f41b5736e3ba12aaa9ac1bbeeeb92
> 
> #regzbot introduced: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")

Maybe this will point regzbot at the correct email report and a better
commit?

#regzbot report: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de
#regzbot introduced: f3ac2ff14834

