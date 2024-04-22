Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D37D98AC3D7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 07:43:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iT5iu5td;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VNDg93Fvfz3dC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Apr 2024 15:43:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iT5iu5td;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VNDfV0vchz30gp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Apr 2024 15:42:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713764545;
	bh=NyxwZWNTdzIr6ata+RlmdKPf/laxRR3U5qmqUBlKEcQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iT5iu5tdfAEH7ZQY7n4pbax8hddPOSWqo5d/jDjiTs54ucpbcdicTJSjhEWzFlm5U
	 i+l/lj7MCMtc8yUu2kqqE4ASgak7YpEYDuSrZboIq5wlIqnEboJQ+NLDlG4wfWNgbb
	 +yBcLOyO0eVTLu82xWlxAcLJpjrECSI+LnXCLKWYovWaR4Z0YOc+rBq/tEfyQHIV+u
	 PwPiXJzY/HEyzzB+v0Ca/rFSO5+Yh8iOzXHWL+U4NX5tgdl1lG+53C0PTD7p9uo+8P
	 MytC20+yZ2NN7Kz+o13v2NyusbCkH/GpIhaBi+5c3c2f9M41B0Wo9O1t3iL2xntcw4
	 V9dzfOhiLjPnw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VNDfT4tQXz4x10;
	Mon, 22 Apr 2024 15:42:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.ibm.com>, Michal =?utf-8?Q?Such=C3=A1nek?=
 <msuchanek@suse.de>
Subject: Re: [PATCH] powerpc/pseries/iommu: LPAR panics when rebooted with a
 frozen PE
In-Reply-To: <3064baac-4727-4b9b-ab86-fc9476c937e0@linux.ibm.com>
References: <20240416205810.28754-1-gbatra@linux.ibm.com>
 <87ttjxanj5.fsf@mail.lhotse> <20240419111127.GZ20665@kitsune.suse.cz>
 <3064baac-4727-4b9b-ab86-fc9476c937e0@linux.ibm.com>
Date: Mon, 22 Apr 2024 15:42:25 +1000
Message-ID: <87ttjuj6m6.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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

Gaurav Batra <gbatra@linux.ibm.com> writes:
> You are right. I think, the "reboot" should be replaced with just "boot 
> up". If there are no other comments, or code changes, I can re-word the 
> commit message and submit for review.

Yeah thanks. The change looks fine, just the change log needs a tweak.

It's fine to mention that the bug happens when a system has been
running, a device has been frozen, then the LPAR is rebooted, and *then*
we hit the bug at boot up.

cheers
