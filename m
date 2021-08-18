Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 081303F051A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:46:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTh26bqlz3d8L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:46:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GqTgj57NPz306D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:53 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgg5Cszz9sW8; Wed, 18 Aug 2021 23:45:51 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210812132831.233794-1-aneesh.kumar@linux.ibm.com>
References: <20210812132831.233794-1-aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/book3s64/radix: make
 tlb_single_page_flush_ceiling a debugfs entry
Message-Id: <162929393531.3619265.6406890155529830178.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:55 +1000
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

On Thu, 12 Aug 2021 18:58:30 +0530, Aneesh Kumar K.V wrote:
> Similar to x86/s390 add a debugfs file to tune tlb_single_page_flush_ceiling.
> Also add a debugfs entry for tlb_local_single_page_flush_ceiling.

Applied to powerpc/next.

[1/2] powerpc/book3s64/radix: make tlb_single_page_flush_ceiling a debugfs entry
      https://git.kernel.org/powerpc/c/3e188b1ae8807f26cc5a530a9d55f3f643fe050a
[2/2] powerpc: rename powerpc_debugfs_root to arch_debugfs_dir
      https://git.kernel.org/powerpc/c/dbf77fed8b302e87561c7c2fc06050c88f4d3120

cheers
