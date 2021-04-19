Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB372363A16
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:08:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtZv6BZMz3cNT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVY6XLCz30Ng
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:21 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVW1MKxz9vH8; Mon, 19 Apr 2021 14:04:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, brking@linux.vnet.ibm.com,
 Leonardo Bras <leobras.c@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210408201915.174217-1-leobras.c@gmail.com>
References: <20210408201915.174217-1-leobras.c@gmail.com>
Subject: Re: [PATCH v3 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
Message-Id: <161880479738.1398509.9530172524794582983.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:57 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 17:19:16 -0300, Leonardo Bras wrote:
> According to LoPAR, ibm,query-pe-dma-window output named "IO Page Sizes"
> will let the OS know all possible pagesizes that can be used for creating a
> new DDW.
> 
> Currently Linux will only try using 3 of the 8 available options:
> 4K, 64K and 16M. According to LoPAR, Hypervisor may also offer 32M, 64M,
> 128M, 256M and 16G.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes present in LoPAR
      https://git.kernel.org/powerpc/c/472724111f0f72042deb6a9dcee9578e5398a1a1

cheers
