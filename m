Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3407A532F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Sep 2023 21:40:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ldS5Vrqt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RqFW9415Rz3cLR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Sep 2023 05:40:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ldS5Vrqt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RqFVJ4zdLz30GC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Sep 2023 05:39:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55A4A61259;
	Mon, 18 Sep 2023 19:39:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4B4C433C9;
	Mon, 18 Sep 2023 19:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695065955;
	bh=MYLjauQjUNrziNJesoyG56GkzOngzUfwuVsg4uLhDPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ldS5Vrqt10ANiv7CRtlv8OWAbxjZAbr2jQoAK1U/2bEAltPy3Ya/7ueilB1o0ORRr
	 lDrFXXPrRwSj/IIjQih8dI3OptEqKRPQXSRiIEnFdNxvkKWDMP+m5VXxgE9EKkWsAw
	 vaWVhkDCG3CtDT4yHexV8pyuu5v8f9+e4XQYlrOa/ur4anhGnb6YiFvrx0NKzuz+RN
	 C2G9DudfC5tNyNlgEPfuYL1bT2ydNTbJxwkHvbbKdAxgiT8gPZuf1N2yC9mPsOa4Bo
	 Sj9wpjI9+604TvjWgU4k8cVt1Ae9o7Sum1jTCEeRtyBTWErpPjmE8lHq3NYwZcDXT0
	 rQVNfDvE+ni3Q==
Date: Mon, 18 Sep 2023 14:39:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Xi Ruoyao <xry111@xry111.site>
Subject: Re: [PATCHv3 pci-next 1/2] PCI/AER: correctable error message as
 KERN_INFO
Message-ID: <20230918193913.GA203601@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3c3f9a2ee7f9effe7cf9d1077652e85de0eae66c.camel@xry111.site>
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
Cc: rajatja@chromium.org, rajat.khandelwal@linux.intel.com, Grant Grundler <grundler@chromium.org>, linux-pci@vger.kernel.org, mahesh@linux.ibm.com, linux-kernel@vger.kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 18, 2023 at 07:42:30PM +0800, Xi Ruoyao wrote:
> ...

> My workstation suffers from too much correctable AER reporting as well
> (related to Intel's errata "RPL013: Incorrectly Formed PCIe Packets May
> Generate Correctable Errors" and/or the motherboard design, I guess).

We should rate-limit correctable error reporting so it's not
overwhelming.

At the same time, I'm *also* interested in the cause of these errors,
in case there's a Linux defect or a hardware erratum that we can work
around.  Do you have a bug report with any more details, e.g., a dmesg
log and "sudo lspci -vv" output?

Bjorn
