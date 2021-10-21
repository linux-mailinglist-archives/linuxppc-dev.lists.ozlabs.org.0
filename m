Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D674368CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 19:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZvD45y3pz3c4y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 04:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Td5mGM7w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Td5mGM7w; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZvCT6jmnz2yHT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Oct 2021 04:11:33 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4352461A0A;
 Thu, 21 Oct 2021 17:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634836291;
 bh=Q03u5Qex8eKAItP0Dg2YZHdrmPOdGUpwH80kTAfzZxI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Td5mGM7w14Slx9FIzv7BOb28GJoHrB9ns/c4MS4UE5lQCExsNbqqBd7gbnQBfGK6d
 wCxieyrBp59hT2zKHPX6adnJws0vsRC9Sz+bubNuDJ6BlWOBOwuh6OWp92vMmSALXk
 ET8S21c0NbukPIMV1IoLs4s0V9meVjRT+WnoP5VUEHnqTr3J8/jQQRxcEAAym2TPR9
 YK+2Mxgf1DT4IBJEH8GBr8iGvsGquy5OFgog5NihLEVIZHqbw9WvybbrpeL0RXJ7cm
 csOEwYACYrD8Q33ogHm2srHLkyKi5Z1cLiH/+8dNAXVEDbUINAVTuB6JcJ3iBZTlBX
 C2fA8AKo22srQ==
Date: Thu, 21 Oct 2021 12:11:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH v4 5/8] PCI/DPC: Converge EDR and DPC Path of clearing
 AER registers
Message-ID: <20211021171130.GA2701430@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021165330.lcqajtwej4s7oadt@theprophet>
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
Cc: Oza Pawandeep <poza@codeaurora.org>, linux-pci@vger.kernel.org,
 Sinan Kaya <okaya@kernel.org>, linux-kernel@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, oohall@gmail.com, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 21, 2021 at 10:23:30PM +0530, Naveen Naidu wrote:
> On 20/10, Bjorn Helgaas wrote:
> > On Tue, Oct 05, 2021 at 10:48:12PM +0530, Naveen Naidu wrote:

> > > In EDR path, AER status registers are cleared irrespective of whether
> > > the error was an RP PIO or unmasked uncorrectable error. But in DPC, the
> > > AER status registers are cleared only when it's an unmasked uncorrectable
> > > error.
> > > 
> > > This leads to two different behaviours for the same task (handling of
> > > DPC errors) in FFS systems and when native OS has control.
> > 
> > FFS?
> 
> Firmware First Systems

I assumed that's what it was, but it's helpful to use the same terms
used by the specs to make things easier to find.  I don't think it's
actually the case that "Firmware First" necessary applies to the
entire system, since the ACPI FIRMWARE_FIRST flag is a per-error
source thing, not a per-system thing.
