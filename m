Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 077A48BAAEF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:43:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6ps4vFxz3vjN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:43:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6nc1KZgz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6nb72ZFz4x1y;
	Fri,  3 May 2024 20:42:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, Lidong Zhong <lidong.zhong@suse.com>
In-Reply-To: <20240411020450.12725-1-lidong.zhong@suse.com>
References: <20240411020450.12725-1-lidong.zhong@suse.com>
Subject: Re: [PATCH v2] powerpc/pseries: remove returning ENODEV when uevent is triggered
Message-Id: <171473286294.451432.1090485018644583836.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:41:02 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Apr 2024 10:04:50 +0800, Lidong Zhong wrote:
> We noticed the following nuisance messages during boot process
> 
> [    7.120610][ T1060] vio vio: uevent: failed to send synthetic uevent
> [    7.122281][ T1060] vio 4000: uevent: failed to send synthetic uevent
> [    7.122304][ T1060] vio 4001: uevent: failed to send synthetic uevent
> [    7.122324][ T1060] vio 4002: uevent: failedto send synthetic uevent
> [    7.122345][ T1060] vio 4004: uevent: failed to send synthetic uevent
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: remove returning ENODEV when uevent is triggered
      https://git.kernel.org/powerpc/c/29247de4ad753771afef95ace8af738d807ca279

cheers
