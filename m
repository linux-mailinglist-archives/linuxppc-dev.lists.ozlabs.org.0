Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 311FF222416
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 15:41:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6wQT2kDmzDqyB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 23:41:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6vPr681MzDqlS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 22:56:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4B6vPl45qbz9sTZ; Thu, 16 Jul 2020 22:55:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Frederic Barrat <fbarrat@linux.ibm.com>, ajd@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, alastair@au1.ibm.com, clombard@linux.ibm.com
In-Reply-To: <20200619140439.153962-1-fbarrat@linux.ibm.com>
References: <20200619140439.153962-1-fbarrat@linux.ibm.com>
Subject: Re: [PATCH v5] ocxl: control via sysfs whether the FPGA is reloaded
 on a link reset
Message-Id: <159490400534.3805857.2300058940140905291.b4-ty@ellerman.id.au>
Date: Thu, 16 Jul 2020 22:55:55 +1000 (AEST)
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

On Fri, 19 Jun 2020 16:04:39 +0200, Frederic Barrat wrote:
> Some opencapi FPGA images allow to control if the FPGA should be reloaded
> on the next adapter reset. If it is supported, the image specifies it
> through a Vendor Specific DVSEC in the config space of function 0.

Applied to powerpc/next.

[1/1] ocxl: control via sysfs whether the FPGA is reloaded on a link reset
      https://git.kernel.org/powerpc/c/87db7579ebd5ded337056eb765542eb2608f16e3

cheers
