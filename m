Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A5B7857DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:23:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW53G130hz3gYq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:23:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4dz3Bgkz3c5K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:55 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4dz1Vz6z4x5y;
	Wed, 23 Aug 2023 22:04:55 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, arnd@arndb.de, gregkh@linuxfoundation.org, Xiongfeng Wang <wangxiongfeng2@huawei.com>
In-Reply-To: <20230804075630.186054-1-wangxiongfeng2@huawei.com>
References: <20230804075630.186054-1-wangxiongfeng2@huawei.com>
Subject: Re: [RFC PATCH] cxl: Use pci_find_vsec_capability() to simplify the code
Message-Id: <169279175566.797584.17904559605848424585.b4-ty@ellerman.id.au>
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

On Fri, 04 Aug 2023 15:56:30 +0800, Xiongfeng Wang wrote:
> PCI core add pci_find_vsec_capability() to query VSEC. We can use that
> core API to simplify the code.
> 
> The only logical change is that pci_find_vsec_capability check the
> Vendor ID before finding the VSEC.
> 
> PCI spec rev 5.0 says in 7.9.5.2 Vendor-Specific Header:
>   VSEC ID - This field is a vendor-defined ID number that indicates the
>   nature and format of the VSEC structure
>   Software must qualify the Vendor ID before interpreting this field.
> 
> [...]

Applied to powerpc/next.

[1/1] cxl: Use pci_find_vsec_capability() to simplify the code
      https://git.kernel.org/powerpc/c/0e1cd3d9f82eb5440d32d4c0f12c65403b956cb5

cheers
