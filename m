Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4A45850B1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:18:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSkS5gX8z3gJT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:18:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSjw3cbPz3g9k
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSjw2Zdbz4x1b;
	Fri, 29 Jul 2022 23:17:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220723113048.521744-1-nayna@linux.ibm.com>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
Subject: Re: [PATCH v2 0/3] Provide PowerVM LPAR Platform KeyStore driver for Self Encrypting Drives
Message-Id: <165909977471.253830.3807806364955203071.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:54 +1000
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
Cc: erichte@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, gjoyce@linux.vnet.ibm.com, npiggin@gmail.com, muriloo@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 23 Jul 2022 07:30:45 -0400, Nayna Jain wrote:
> PowerVM provides an isolated Platform KeyStore(PKS)[1] storage allocation
> for each partition(LPAR) with individually managed access controls to store
> sensitive information securely. The Linux Kernel can access this storage by
> interfacing with the hypervisor using a new set of hypervisor calls.
> 
> This storage can be used for multiple purposes. The current two usecases
> are:
> 
> [...]

Patch 1 applied to powerpc/next.

[1/3] powerpc/pseries: define driver for Platform KeyStore
      https://git.kernel.org/powerpc/c/2454a7af0f2a42918aa972147a0bec38e6656cd8

cheers
