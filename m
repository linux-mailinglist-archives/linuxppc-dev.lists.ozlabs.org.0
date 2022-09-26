Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7AC5EAE0B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 19:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbqLM6rc6z3c8T
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 03:21:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQi4m3MO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQi4m3MO;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbqKl3mqNz30Qt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 03:21:15 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 418EAB80B2C;
	Mon, 26 Sep 2022 17:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0298C433D6;
	Mon, 26 Sep 2022 17:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664212868;
	bh=nnJQPOkwFK1+jDHcMZbZ1ZPA6870WiPeyZQhh9AHeIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KQi4m3MOueTduJHIuUVB/BBIBRH1auZz+TMGV1gbvyjaYWV97ukOucDbVgfLdDz/U
	 BLRGbznTu00jC/vLYn/JUYCFAM6/RuoYSBeAUXqKRtWJkOmXdxm1SqUYtouUdx3L0h
	 A/IljZ8TsvX08juVJInq1826FqCqt9ieEeciJ0OY+bGnt1DroOdDYZFnLo7PthBCW+
	 flWywRovRhg0gud+xBy2TDCxJekRihHtpx1innborvq6x9KZd5oY/YrLAL4I8lHLHE
	 nTZC9Ubh9EVPgRA5OLjFVWD/qHJYctHCFMMuskv0LCFow8VysVM6OqIxK3fAHARxtL
	 BTWyLp7o1KkoA==
Date: Mon, 26 Sep 2022 12:21:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Zhuo Chen <chenzhuo.1@bytedance.com>
Subject: Re: [PATCH 1/3] PCI/AER: Use pci_aer_clear_uncorrect_error_status()
 to clear uncorrectable error status
Message-ID: <20220926172106.GA1609382@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5e094839-c643-d2e7-698e-0fb6c0e50c4f@bytedance.com>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 09:30:48PM +0800, Zhuo Chen wrote:
> On 9/23/22 4:02 AM, Bjorn Helgaas wrote:
> > On Mon, Sep 12, 2022 at 01:09:05AM +0800, Zhuo Chen wrote:
> > > On 9/12/22 12:22 AM, Serge Semin wrote:
> > > > On Fri, Sep 02, 2022 at 02:16:32AM +0800, Zhuo Chen wrote:

> > > ‘pci_aer_clear_nonfatal_status()’ in drivers/crypto/hisilicon/qm.c will be
> > > removed in the next kernel:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/crypto/hisilicon/qm.c?id=00278564a60e11df8bcca0ececd8b2f55434e406
> > 
> > This is a problem because 00278564a60e ("crypto: hisilicon - Remove
> > pci_aer_clear_nonfatal_status() call") is in Herbert's cryptodev tree,
> > and if I apply this series to the PCI tree and Linus merges it before
> > Herbert's cryptodev changes, it will break the build.
> > 
> > I think we need to split this patch up like this:
> > 
> >    - Add pci_aer_clear_uncorrect_error_status() to PCI core
> >    - Convert dpc to use pci_aer_clear_uncorrect_error_status()
> >      (I might end up squashing with above)
> >    - Convert lpfc to use pci_aer_clear_uncorrect_error_status()
> >    - Convert ntb_hw_idt to use pci_aer_clear_uncorrect_error_status()
> >    - Unexport pci_aer_clear_nonfatal_status()
> > 
> > Then I can apply all but the last patch safely.  If the crypto changes
> > are merged first, we can add the last one; otherwise we can do it for
> > the next cycle.
> > 
> Good proposal. I will implement these in the next version.
> 
> Do I need to put pci related modifications (include patch 2/3 and 3/3) in a
> patch set or just single patches?

When in doubt, put them in separate patches.  It's trivial for me to
squash them together if that makes more sense, but much more difficult
for me to split them apart.

Thanks for helping clean up this area!

Bjorn
