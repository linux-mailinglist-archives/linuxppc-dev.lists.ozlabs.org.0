Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCAB914A26
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:33:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W76nZ6ghmz3dK1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:33:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76l32lSzz30VM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:31:11 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W76l33xMDz4wqM;
	Mon, 24 Jun 2024 22:31:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Jinglin Wen <jinglin.wen@shingroup.cn>
In-Reply-To: <20240620024150.14857-1-jinglin.wen@shingroup.cn>
References: <20240617023509.5674-1-jinglin.wen@shingroup.cn> <20240620024150.14857-1-jinglin.wen@shingroup.cn>
Subject: Re: [PATCH v2] powerpc: Fix unnecessary copy to 0 when kernel is booted at address 0.
Message-Id: <171923223894.136336.11371649484834180156.b4-ty@ellerman.id.au>
Date: Mon, 24 Jun 2024 22:30:38 +1000
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
Cc: masahiroy@kernel.org, linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, stable@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 20 Jun 2024 10:41:50 +0800, Jinglin Wen wrote:
> According to the code logic, when the kernel is loaded to address 0,
> no copying operation should be performed, but it is currently being
> done.
> 
> This patch fixes the issue where the kernel code was incorrectly
> duplicated to address 0 when booting from address 0.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: Fix unnecessary copy to 0 when kernel is booted at address 0.
      https://git.kernel.org/powerpc/c/13fc6c175924eaa953cf597ce28ffa4edc4554a6

cheers
