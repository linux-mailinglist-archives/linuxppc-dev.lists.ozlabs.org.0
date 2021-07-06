Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A85443BCAFA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 12:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GJzt94VfNz304J
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 20:53:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4GJzsr0LY9z2yYh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jul 2021 20:52:47 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GJzsp5gmnz9sXN; Tue,  6 Jul 2021 20:52:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210701152412.1507612-1-clg@kaod.org>
References: <20210701152412.1507612-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/xive: Fix error handling when allocating an IPI
Message-Id: <162556874248.460578.1726761161638861579.b4-ty@ellerman.id.au>
Date: Tue, 06 Jul 2021 20:52:22 +1000
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
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Jul 2021 17:24:12 +0200, Cédric Le Goater wrote:
> This is a smatch warning:
> 
>   arch/powerpc/sysdev/xive/common.c:1161 xive_request_ipi() warn: unsigned 'xid->irq' is never less than zero.

Applied to powerpc/fixes.

[1/1] powerpc/xive: Fix error handling when allocating an IPI
      https://git.kernel.org/powerpc/c/3f601608b71c3ca1e199898cd16f09d707fedb56

cheers
