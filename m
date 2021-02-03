Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF8E30DA9B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:07:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW26J5mkqzF02Y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09w674pzDwv6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:52 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09s09yJz9vGD; Wed,  3 Feb 2021 22:40:47 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20200902035121.1762475-1-oohall@gmail.com>
References: <20200902035121.1762475-1-oohall@gmail.com>
Subject: Re: [PATCH] powerpc/pci: Delete traverse_pci_dn()
Message-Id: <161235200740.1516112.3698966744991084628.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:47 +1100 (AEDT)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Sep 2020 13:51:21 +1000, Oliver O'Halloran wrote:
> Nothing uses it.

Applied to powerpc/next.

[1/1] powerpc/pci: Delete traverse_pci_dn()
      https://git.kernel.org/powerpc/c/7bd2b120f3fdf8e5c6d9a343517a33c2a5108794

cheers
