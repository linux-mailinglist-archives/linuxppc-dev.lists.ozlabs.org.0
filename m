Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C7034F5C7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97Xc71MQz3bxF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:10:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97XJ157nz2y69
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:07 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97XH1V8Wz9sWQ; Wed, 31 Mar 2021 12:10:07 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210318034829.72255-1-aneesh.kumar@linux.ibm.com>
References: <20210318034829.72255-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/book3s64/kuap: Move Kconfig varriables to
 BOOK3S_64
Message-Id: <161715297925.226945.336440247830122579.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:39 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 18 Mar 2021 09:18:29 +0530, Aneesh Kumar K.V wrote:
> With below two commits:
> commit c91435d95c49 ("powerpc/book3s64/hash/kuep: Enable KUEP on hash")
> commit b2ff33a10c8b ("powerpc/book3s64/hash/kuap: Enable kuap on hash")
> the kernel now supports kuap/kuep with hash translation. Hence select the
> Kconfig even when radix is disabled.

Applied to powerpc/next.

[1/1] powerpc/book3s64/kuap: Move Kconfig varriables to BOOK3S_64
      https://git.kernel.org/powerpc/c/8b8adeb3007f67076141f547f0b2f62b299a383c

cheers
