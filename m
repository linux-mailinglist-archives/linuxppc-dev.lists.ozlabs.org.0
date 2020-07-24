Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A959522C953
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:34:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtXM0lpszDrS9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqgz4v9kzDqBG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgx5jnrz9sTK; Fri, 24 Jul 2020 23:25:16 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <20200709135142.721504-1-santosh@fossix.org>
References: <20200709135142.721504-1-santosh@fossix.org>
Subject: Re: [PATCH v2 1/2] powerpc/mce: Add MCE notification chain
Message-Id: <159559696015.1657499.9992950413511826114.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:16 +1000 (AEST)
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 9 Jul 2020 19:21:41 +0530, Santosh Sivaraj wrote:
> Introduce notification chain which lets us know about uncorrected memory
> errors(UE). This would help prospective users in pmem or nvdimm subsystem
> to track bad blocks for better handling of persistent memory allocations.

Applied to powerpc/next.

[1/2] powerpc/mce: Add MCE notification chain
      https://git.kernel.org/powerpc/c/c37a63afc429ce959402168f67e4f094ab639ace
[2/2] powerpc/papr/scm: Add bad memory ranges to nvdimm bad ranges
      https://git.kernel.org/powerpc/c/85343a8da2d969df1a10ada8f7cb857d52ea70a6

cheers
