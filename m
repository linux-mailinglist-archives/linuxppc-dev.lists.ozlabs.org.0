Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 532EA63D27F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:52:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZHx1sbmz3hSt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:52:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtr1PNFz3fB5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtr00R1z4y3V;
	Wed, 30 Nov 2022 20:34:11 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221111145440.2426970-1-yangyingliang@huawei.com>
References: <20221111145440.2426970-1-yangyingliang@huawei.com>
Subject: Re: [PATCH 1/2] cxl: fix possible null-ptr-deref in cxl_guest_init_afu|adapter()
Message-Id: <166980026116.3017288.8069429950909068729.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:21 +1100
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
Cc: fbarrat@linux.ibm.com, gregkh@linuxfoundation.org, ajd@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 11 Nov 2022 22:54:39 +0800, Yang Yingliang wrote:
> If device_register() fails in cxl_register_afu|adapter(), the device
> is not added, device_unregister() can not be called in the error path,
> otherwise it will cause a null-ptr-deref because of removing not added
> device.
> 
> As comment of device_register() says, it should use put_device() to give
> up the reference in the error path. So split device_unregister() into
> device_del() and put_device(), then goes to put dev when register fails.
> 
> [...]

Applied to powerpc/next.

[1/2] cxl: fix possible null-ptr-deref in cxl_guest_init_afu|adapter()
      https://git.kernel.org/powerpc/c/f949ccee1dde970bc77dc871b4f0b5e651577344
[2/2] cxl: fix possible null-ptr-deref in cxl_pci_init_afu|adapter()
      https://git.kernel.org/powerpc/c/8bf03f557d6c6e108cf47bea32f4a68e276e1157

cheers
