Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6B566B4FC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 01:40:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwCq106Kqz3cff
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 11:40:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwCpV4ZVlz3bZk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 11:39:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NwCpV0D4tz4xN6;
	Mon, 16 Jan 2023 11:39:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Yang Yingliang <yangyingliang@huawei.com>
In-Reply-To: <20221228093603.3166599-1-yangyingliang@huawei.com>
References: <20221228093603.3166599-1-yangyingliang@huawei.com>
Subject: Re: [PATCH -next] powerpc/64s/hash: change stress_hpt_timer_fn to static
Message-Id: <167382955906.2429376.13316150501405897456.b4-ty@ellerman.id.au>
Date: Mon, 16 Jan 2023 11:39:19 +1100
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Dec 2022 17:36:03 +0800, Yang Yingliang wrote:
> stress_hpt_timer_fn is only used in hash_utils.c now,
> change it to static.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/64s/hash: change stress_hpt_timer_fn to static
      https://git.kernel.org/powerpc/c/f12cd06109f47c2fb4b23a45ab55404c47ef7fae

cheers
