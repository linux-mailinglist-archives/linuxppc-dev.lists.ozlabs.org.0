Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C61FE63D28A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:54:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZLD4fcDz3hhV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:54:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYtv0Xckz3fB5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:34:15 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NMYtt6Lwnz4y47;
	Wed, 30 Nov 2022 20:34:14 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Yang Yingliang <yangyingliang@huawei.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221104032551.1075335-1-yangyingliang@huawei.com>
References: <20221104032551.1075335-1-yangyingliang@huawei.com>
Subject: Re: [PATCH v2] macintosh: fix possible memory leak in macio_add_one_device()
Message-Id: <166980022889.3017288.9700736451986386499.b4-ty@ellerman.id.au>
Date: Wed, 30 Nov 2022 20:23:48 +1100
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 4 Nov 2022 11:25:51 +0800, Yang Yingliang wrote:
> Afer commit 1fa5ae857bb1 ("driver core: get rid of struct device's
> bus_id string array"), the name of device is allocated dynamically,
> it need be freed when of_device_register() fails, call put_device()
> to give up the reference that hold in device_initialize(), so that
> it can be freed in kobject_cleanup() when the refcount hit to 0.
> macio device is freed in macio_release_dev(), so the kfree() can be
> removed.
> 
> [...]

Applied to powerpc/next.

[1/1] macintosh: fix possible memory leak in macio_add_one_device()
      https://git.kernel.org/powerpc/c/5ca86eae55a2f006e6c1edd2029b2cacb6979515

cheers
