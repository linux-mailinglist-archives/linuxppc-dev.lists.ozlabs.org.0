Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCAA1F3379
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 07:31:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gzJS2KhpzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 15:31:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gzDZ1L9GzDqRZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 15:28:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzDY6wQYz9sT5; Tue,  9 Jun 2020 15:28:29 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
In-Reply-To: <20200602040341.10152-1-ajd@linux.ibm.com>
References: <20200602040341.10152-1-ajd@linux.ibm.com>
Subject: Re: [PATCH] cxl: Remove dead Kconfig options
Message-Id: <159168035592.1381411.6777625718786912372.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:28:29 +1000 (AEST)
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
Cc: fbarrat@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Jun 2020 14:03:41 +1000, Andrew Donnellan wrote:
> The CXL_AFU_DRIVER_OPS and CXL_LIB Kconfig options were added to coordinate
> merging of new features. They no longer serve any purpose, so remove them.

Applied to powerpc/next.

[1/1] cxl: Remove dead Kconfig options
      https://git.kernel.org/powerpc/c/f44b85da5e7450d0308695ba6f503d75fe6cc166

cheers
