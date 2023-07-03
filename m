Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42247454BE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:18:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZ2C4JPXz3bWs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ1F5wsPz2ym7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:17:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ190vS2z4wbP;
	Mon,  3 Jul 2023 15:17:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
In-Reply-To: <20230525143454.56878-1-gbatra@linux.vnet.ibm.com>
References: <20230525143454.56878-1-gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/iommu: limit number of TCEs to 512 for H_STUFF_TCE hcall
Message-Id: <168835696944.31199.10219914079762627169.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 14:02:49 +1000
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 25 May 2023 09:34:54 -0500, Gaurav Batra wrote:
> As of now, in tce_freemulti_pSeriesLP(), there is no limit on how many TCEs
> are passed to H_STUFF_TCE hcall. This was not an issue until now. Newer
> firmware releases have started enforcing this requirement.
> 
> The interface has been in it's current form since the beginning.
> 
> Cc: stable@vger.kernel.org
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/iommu: limit number of TCEs to 512 for H_STUFF_TCE hcall
      https://git.kernel.org/powerpc/c/9d2ccf00bddc268045e3d65a8108d61ada0e4b4e

cheers
