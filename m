Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DBF40BC92
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 02:24:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8LYZ0STYz2ypD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 10:24:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TPy4x0c0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=TPy4x0c0; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8LXw3xt1z2xs2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 10:23:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1631665405;
 bh=Pliqrcvr6CmlpuzEgkusFjzlu2wuAo+oNPelgwZk/tI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=TPy4x0c0qB00Uky/okfi0agfYTTirGCIOxGnyL3Z2WJjcy9Ij+y6eYt34V0foPR/O
 o1okl98XSAlBWoLSjBK2ST30QS4MIAlF6Q5jA9WbJd+t/pYlgoXvxAw0bJWuqYJ3kd
 7a7a6bYzwZZ6/qCNoSAmjasAfhIO+tm/yfC0Qr4vHTgZfWFSMgRJZ0XA3P/TYxv3W8
 HAXDqW2k6pmwvEaigI491dok7/GBd2trlcrP8o0JI2Q9R8YjbcSTnLHIZiytZzNpto
 aHqxor2QYwZ9tGiIR0+zkTxf7ARZwTpGwCyhJhFhBNQsj7LzgLsiKQ4LnRpQ+coT+7
 P6bVDxR2ZyoQQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4H8LXr70S6z9s5R;
 Wed, 15 Sep 2021 10:23:24 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Bjorn Helgaas <helgaas@kernel.org>, Niklas Schnelle
 <schnelle@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc: Drop superfluous pci_dev_is_added() calls
In-Reply-To: <20210914193130.GA1447657@bjorn-Precision-5520>
References: <20210914193130.GA1447657@bjorn-Precision-5520>
Date: Wed, 15 Sep 2021 10:23:22 +1000
Message-ID: <87o88uk7ph.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Bjorn Helgaas <helgaas@kernel.org> writes:
> On Fri, Sep 10, 2021 at 04:19:40PM +0200, Niklas Schnelle wrote:
>> On powerpc, pci_dev_is_added() is called as part of SR-IOV fixups
>> that are done under pcibios_add_device() which in turn is only called in
>> pci_device_add() whih is called when a PCI device is scanned.
>> 
>> Now pci_dev_assign_added() is called in pci_bus_add_device() which is
>> only called after scanning the device. Thus pci_dev_is_added() is always
>> false and can be dropped.
>> 
>> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
>
> Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
>
> This doesn't touch the PCI core, so maybe makes sense for you to take
> it, Michael?  But let me know if you think otherwise.

Yeah I'm happy to take it, thanks.

cheers
