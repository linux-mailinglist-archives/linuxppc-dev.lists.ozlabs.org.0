Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B39F7857DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:22:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW52l35Shz3jSN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:22:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4dy6BR9z3dLF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:54 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dy4jwLz4x3C;
	Wed, 23 Aug 2023 22:04:54 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, christophe.leroy@csgroup.eu, joel@jms.id.au, fbarrat@linux.ibm.com, Xiongfeng Wang <wangxiongfeng2@huawei.com>
In-Reply-To: <20230804080435.191196-1-wangxiongfeng2@huawei.com>
References: <20230804080435.191196-1-wangxiongfeng2@huawei.com>
Subject: Re: [PATCH] powerpc/powernv/pci: use pci_dev_id() to simplify the code
Message-Id: <169279175568.797584.6217403046846078454.b4-ty@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, yangyingliang@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 04 Aug 2023 16:04:35 +0800, Xiongfeng Wang wrote:
> PCI core API pci_dev_id() can be used to get the BDF number for a pci
> device. We don't need to compose it mannually. Use pci_dev_id() to
> simplify the code a little bit.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/powernv/pci: use pci_dev_id() to simplify the code
      https://git.kernel.org/powerpc/c/fe8aa8e3379326ecb77203cae50e8e83c054aedc

cheers
