Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8E38BAAFD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:47:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6vg3zy5z86sw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:47:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6r12tvtz3cXk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:44:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6r11wgNz4x1P;
	Fri,  3 May 2024 20:44:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Gaurav Batra <gbatra@linux.ibm.com>
In-Reply-To: <20240422205141.10662-1-gbatra@linux.ibm.com>
References: <20240422205141.10662-1-gbatra@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/iommu: LPAR panics during boot up with a frozen PE
Message-Id: <171473304166.454113.12860025914855146124.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:44:01 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Apr 2024 15:51:41 -0500, Gaurav Batra wrote:
> At the time of LPAR boot up, partition firmware provides Open Firmware
> property ibm,dma-window for the PE. This property is provided on the PCI
> bus the PE is attached to.
> 
> There are execptions where the partition firmware might not provide this
> property for the PE at the time of LPAR boot up. One of the scenario is
> where the firmware has frozen the PE due to some error condition. This
> PE is frozen for 24 hours or unless the whole system is reinitialized.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/iommu: LPAR panics during boot up with a frozen PE
      https://git.kernel.org/powerpc/c/49a940dbdc3107fecd5e6d3063dc07128177e058

cheers
