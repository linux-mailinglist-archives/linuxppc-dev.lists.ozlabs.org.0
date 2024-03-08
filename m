Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BAC875BF9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 02:30:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrTBM3HVlz3vbn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 12:30:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrT9z0Bx3z3bZ4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 12:29:59 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TrT9w2Sjwz4wcK;
	Fri,  8 Mar 2024 12:29:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.ibm.com>
In-Reply-To: <20240125203017.61014-1-gbatra@linux.ibm.com>
References: <20240125203017.61014-1-gbatra@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV
Message-Id: <170986134193.348034.15166657410880655635.b4-ty@ellerman.id.au>
Date: Fri, 08 Mar 2024 12:29:01 +1100
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 Jan 2024 14:30:17 -0600, Gaurav Batra wrote:
> When kdump kernel tries to copy dump data over SR-IOV, LPAR panics due to
> NULL pointer execption.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV
      https://git.kernel.org/powerpc/c/09a3c1e46142199adcee372a420b024b4fc61051

cheers
