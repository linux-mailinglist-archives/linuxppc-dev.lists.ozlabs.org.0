Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2366F63D280
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:53:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZJV6zSBz3hWq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:52:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtr5FKbz3fRZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtr3fSDz4y3T;
	Wed, 30 Nov 2022 20:34:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221111145929.2429271-1-yangyingliang@huawei.com>
References: <20221111145929.2429271-1-yangyingliang@huawei.com>
Subject: Re: [PATCH] misc: ocxl: fix possible name leak in ocxl_file_register_afu()
Message-Id: <166980026184.3017288.6312216104301377979.b4-ty@ellerman.id.au>
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

On Fri, 11 Nov 2022 22:59:29 +0800, Yang Yingliang wrote:
> If device_register() returns error in ocxl_file_register_afu(),
> the name allocated by dev_set_name() need be freed. As comment
> of device_register() says, it should use put_device() to give
> up the reference in the error path. So fix this by calling
> put_device(), then the name can be freed in kobject_cleanup(),
> and info is freed in info_release().
> 
> [...]

Applied to powerpc/next.

[1/1] misc: ocxl: fix possible name leak in ocxl_file_register_afu()
      https://git.kernel.org/powerpc/c/295faa17722a11cac8dbf51e4c9f9405a5e07ef1

cheers
