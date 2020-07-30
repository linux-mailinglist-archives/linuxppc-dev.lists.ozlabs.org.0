Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 647BA233076
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 12:39:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHRjG3KDBzDqwh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 20:38:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=inria.fr (client-ip=192.134.164.83;
 helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=inria.fr
X-Greylist: delayed 70 seconds by postgrey-1.36 at bilbo;
 Thu, 30 Jul 2020 20:37:28 AEST
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHRgX06zNzDqsX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jul 2020 20:37:27 +1000 (AEST)
X-IronPort-AV: E=Sophos;i="5.75,414,1589234400"; d="scan'208";a="461892474"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 12:35:38 +0200
Date: Thu, 30 Jul 2020 12:35:38 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: sukadev@linux.ibm.com, corbet@lwn.net, linuxppc-dev@lists.ozlabs.org, 
 linux-doc@vger.kernel.org
Subject: Documentation/powerpc: Ultravisor API
Message-ID: <alpine.DEB.2.22.394.2007301231140.2548@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

The file Documentation/powerpc/ultravisor.rst contains:

    Only valid value(s) in ``flags`` are:

        * H_PAGE_IN_SHARED which indicates that the page is to be shared
	  with the Ultravisor.

        * H_PAGE_IN_NONSHARED indicates that the UV is not anymore
          interested in the page. Applicable if the page is a shared page.

The flag H_PAGE_IN_SHARED exists in the Linux kernel
(arch/powerpc/include/asm/hvcall.h), but the flag H_PAGE_IN_NONSHARED does
not.  Should the documentation be changed in some way?

julia
