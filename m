Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F15AA647020
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:54:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYxt5tg9z3fHH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:54:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrv1432z3bhG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:51 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrt3FPpz4xvP;
	Thu,  8 Dec 2022 23:49:50 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, Bjorn Helgaas <helgaas@kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20221205223231.1268085-1-helgaas@kernel.org>
References: <20221205223231.1268085-1-helgaas@kernel.org>
Subject: Re: [PATCH] cxl: Remove unnecessary cxl_pci_window_alignment()
Message-Id: <167050321594.1457988.6215186331785819055.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:15 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 5 Dec 2022 16:32:31 -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> cxl_pci_window_alignment() is referenced only via the struct
> pci_controller_ops.window_alignment function pointer, and only in the
> powerpc implementation of pcibios_window_alignment().
> 
> pcibios_window_alignment() defaults to returning 1 if the function pointer
> is NULL, which is the same was what cxl_pci_window_alignment() does.
> 
> [...]

Applied to powerpc/next.

[1/1] cxl: Remove unnecessary cxl_pci_window_alignment()
      https://git.kernel.org/powerpc/c/6aecc0a59e07ba895b5473e0c916ba5f3d556c15

cheers
