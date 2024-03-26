Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD4088CFDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 22:17:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d+1kW46n;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V42hC4qz9z3vZH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 08:17:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d+1kW46n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V42gV3gFQz307y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 08:17:10 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22C5961419;
	Tue, 26 Mar 2024 21:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96BCFC433F1;
	Tue, 26 Mar 2024 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711487826;
	bh=fzaOToqMJEgFTyVUFRzzeGvuwsRaqDDI/fsy1nM+zeA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=d+1kW46nvwqIQCN9jRXyPqYBRK8j84s69iFA4xc+ygbdi2Kzue4l86ra0M1vicV4n
	 mYVAwY4MAvY6SpplkMVCD+/gWEbpKkstl695QI0PuDdubcM7eeVqPCj5fkYdSpKZOi
	 NDVlPGOi1o74o0VFZdb246sVnVu0K5bsiBfT+pEglLmwFvIRoexaEyApuWUIyBUtA7
	 7HY2PVui1erJIf0Bkbh/U1o4mdwI3XjcCvs/VyE7vG/BaJZb+jKkGY1dRN8xsH+5FL
	 DfncLKr7mHdEosTuC1kgFvz+mHc9l+TUPudzMIagonCYqgusYdfDANFwebCeC8ZtA5
	 pHGnSST7cTmdA==
Date: Tue, 26 Mar 2024 16:17:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ethan Zhao <haifeng.zhao@linux.intel.com>
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
Message-ID: <20240326211705.GA1497507@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a1d7b4c9-b47e-4b59-a4d5-e091bbbff5d7@linux.intel.com>
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, mahesh@linux.ibm.com, oohall@gmail.com, Xi Ruoyao <xry111@xry111.site>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 26, 2024 at 09:39:54AM +0800, Ethan Zhao wrote:
> On 3/25/2024 6:15 PM, Xi Ruoyao wrote:
> > On Mon, 2024-03-25 at 16:45 +0800, Ethan Zhao wrote:
> > > On 3/25/2024 1:19 AM, Xi Ruoyao wrote:
> > > > On Mon, 2023-09-18 at 14:39 -0500, Bjorn Helgaas wrote:
> > > > > On Mon, Sep 18, 2023 at 07:42:30PM +0800, Xi Ruoyao wrote:
> > > > > > ...
> > > > > > My workstation suffers from too much correctable AER reporting as well
> > > > > > (related to Intel's errata "RPL013: Incorrectly Formed PCIe Packets May
> > > > > > Generate Correctable Errors" and/or the motherboard design, I guess).
> > > > > We should rate-limit correctable error reporting so it's not
> > > > > overwhelming.
> > > > > 
> > > > > At the same time, I'm *also* interested in the cause of these errors,
> > > > > in case there's a Linux defect or a hardware erratum that we can work
> > > > > around.  Do you have a bug report with any more details, e.g., a dmesg
> > > > > log and "sudo lspci -vv" output?
> > > > Hi Bjorn,
> > > > 
> > > > Sorry for the *very* late reply (somehow I didn't see the reply at all
> > > > before it was removed by my cron job, and now I just savaged it from
> > > > lore.kernel.org...)
> > > > 
> > > > The dmesg is like:
> > > > 
> > > > [  882.456994] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:00:1c.1
> > > > [  882.457002] pcieport 0000:00:1c.1: AER: found no error details for 0000:00:1c.1
> > > > [  882.457003] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:06:00.0
> > > > [  883.545763] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:00:1c.1
> > > > [  883.545789] pcieport 0000:00:1c.1: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Receiver ID)
> > > > [  883.545790] pcieport 0000:00:1c.1:   device [8086:7a39] error status/mask=00000001/00002000
> > > > [  883.545792] pcieport 0000:00:1c.1:    [ 0] RxErr                  (First)
> > > > [  883.545794] pcieport 0000:00:1c.1: AER:   Error of this Agent is reported first
> > > > [  883.545798] r8169 0000:06:00.0: PCIe Bus Error: severity=Correctable, type=Physical Layer, (Transmitter ID)
> > > > [  883.545799] r8169 0000:06:00.0:   device [10ec:8125] error status/mask=00001101/0000e000
> > > > [  883.545800] r8169 0000:06:00.0:    [ 0] RxErr                  (First)
> > > > [  883.545801] r8169 0000:06:00.0:    [ 8] Rollover
> > > > [  883.545802] r8169 0000:06:00.0:    [12] Timeout
> > > > [  883.545815] pcieport 0000:00:1c.1: AER: Correctable error message received from 0000:00:1c.1
> > > > [  883.545823] pcieport 0000:00:1c.1: AER: found no error details for 0000:00:1c.1
> > > > [  883.545824] pcieport 0000:00:1c.1: AER: Multiple Correctable error message received from 0000:06:00.0
> > > > 
> > > > lspci output attached.
> > > > 
> > > > Intel has issued an errata "RPL013" saying:
> > > > 
> > > > "Under complex microarchitectural conditions, the PCIe controller may
> > > > transmit an incorrectly formed Transaction Layer Packet (TLP), which
> > > > will fail CRC checks. When this erratum occurs, the PCIe end point may
> > > > record correctable errors resulting in either a NAK or link recovery.
> > > > Intel® has not observed any functional impact due to this erratum."
> > > > 
> > > > But I'm really unsure if it describes my issue.
> > > > 
> > > > Do you think I have some broken hardware and I should replace the CPU
> > > > and/or the motherboard (where the r8169 is soldered)?  I've noticed that
> > > > my 13900K is almost impossible to overclock (despite it's a K), but I've
> > > > not encountered any issue other than these AER reporting so far after I
> > > > gave up overclocking.
> > > Seems there are two r8169 nics on your board, only 0000:06:00.0 reports
> > > aer errors, how about another one the 0000:07:00.0 nic ?
> > It never happens to 0000:07:00.0, even if I plug the ethernet cable into
> > it instead of 0000:06:00.0.
> 
> So something is wrong with the physical layer, I guess.
> 
> > Maybe I should just use 0000:07:00.0 and blacklist 0000:06:00.0 as I
> > don't need two NICs?
> 
> Yup,
> ratelimit the AER warning is another choice instead of change WARN to INFO.
> if corrected error flood happens, even the function is working, suggests
> something was already wrong, likely will be worse, that is the meaning of
> WARN I think.

We should fix this.  IMHO Correctable Errors should be "info" level,
non-alarming, and rate-limited.  They're basically hints about link
integrity.

Bjorn
