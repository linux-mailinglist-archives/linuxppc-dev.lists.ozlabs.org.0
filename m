Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE9428CCA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 14:12:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HSd3S0pRsz3f31
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Oct 2021 23:12:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HScxs12R5z304m
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Oct 2021 23:08:01 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HScxs05F1z4xqg;
 Mon, 11 Oct 2021 23:08:00 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Niklas Schnelle <schnelle@linux.ibm.com>,
 Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <20210910141940.2598035-1-schnelle@linux.ibm.com>
References: <20210910141940.2598035-1-schnelle@linux.ibm.com>
Subject: Re: [PATCH 0/1] Arch use of pci_dev_is_added()
Message-Id: <163395400023.4094789.2020698522524936572.b4-ty@ellerman.id.au>
Date: Mon, 11 Oct 2021 23:06:40 +1100
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 10 Sep 2021 16:19:39 +0200, Niklas Schnelle wrote:
> In my proposal to make pci_dev_is_added() more regularly usable by arch code
> you mentioned[0] that you believe the uses in arch/powerpc are not necessary
> anymore. From code reading I agree and so does Oliver O'Halloran[1].
> 
> So as promised here is a patch removing them. I only compile tested this as
> I don't have access to a powerpc system.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Drop superfluous pci_dev_is_added() calls
      https://git.kernel.org/powerpc/c/452f145eca73945222923525a7eba59cf37909cc

cheers
