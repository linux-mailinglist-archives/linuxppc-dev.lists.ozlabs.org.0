Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0CF063D28D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:55:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZLp4SJyz3gFr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:54:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtv4WGtz3fSL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtv3ClSz4y4W;
	Wed, 30 Nov 2022 20:34:15 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: fbarrat@linux.ibm.com, ajd@linux.ibm.com, gregkh@linuxfoundation.org, Yang Yingliang <yangyingliang@huawei.com>, mpe@ellerman.id.au, arnd@arndb.de
In-Reply-To: <20221121154339.4088935-1-yangyingliang@huawei.com>
References: <20221121154339.4088935-1-yangyingliang@huawei.com>
Subject: Re: [PATCH v2] ocxl: fix pci device refcount leak when calling get_function_0()
Message-Id: <166980026338.3017288.6511474923662559900.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:24:23 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Nov 2022 23:43:39 +0800, Yang Yingliang wrote:
> get_function_0() calls pci_get_domain_bus_and_slot(), as comment
> says, it returns a pci device with refcount increment, so after
> using it, pci_dev_put() needs be called.
> 
> Get the device reference when get_function_0() is not called, so
> pci_dev_put() can be called in the error path and callers
> unconditionally. And add comment above get_dvsec_vendor0() to tell
> callers to call pci_dev_put().
> 
> [...]

Applied to powerpc/next.

[1/1] ocxl: fix pci device refcount leak when calling get_function_0()
      https://git.kernel.org/powerpc/c/5f58cad1e4c65bebee34292696c6d2105eeb2027

cheers
