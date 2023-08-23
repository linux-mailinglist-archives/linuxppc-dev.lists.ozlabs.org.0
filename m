Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 218CA7857C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4wg0Wh8z3fkP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:17:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4dB1jf6z3cLV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4d62bWBz4x3H;
	Wed, 23 Aug 2023 22:04:10 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
In-Reply-To: <20230817162411.429-1-msuchanek@suse.de>
References: <20230817162411.429-1-msuchanek@suse.de>
Subject: Re: [PATCH] powerpc: Move DMA64_PROPNAME define to a header
Message-Id: <169279175575.797584.229615824024413440.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: Rob Herring <robh@kernel.org>, Gaurav Batra <gbatra@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Russell Currey <ruscur@russell.cc>, Deming Wang <wangdeming@inspur.com>, Alex Williamson <alex.williamson@redhat.com>, linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, Timothy Pearson <tpearson@raptorengineering.com>, Nicholas Piggin <npiggin@gmail.com>, Li Chen <lchen@ambarella.com>, Brian King <brking@linux.vnet.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 17 Aug 2023 18:24:08 +0200, Michal Suchanek wrote:
> Avoid redefining the same value in multiple source.
> 
> 

Applied to powerpc/next.

[1/1] powerpc: Move DMA64_PROPNAME define to a header
      https://git.kernel.org/powerpc/c/89c9ce1c99df553029fc4503506ff5a1793f3eaf

cheers
