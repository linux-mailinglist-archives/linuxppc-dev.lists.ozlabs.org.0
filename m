Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BBE8BAAED
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:43:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6pR613Rz3cdZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:43:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6nb4Mh1z2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:27 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6nb3XK1z4x1x;
	Fri,  3 May 2024 20:42:27 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, Ganesh Goudar <ganeshgr@linux.ibm.com>
In-Reply-To: <20240422075737.1405551-1-ganeshgr@linux.ibm.com>
References: <20240422075737.1405551-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/eeh: Permanently disable the removed device
Message-Id: <171473286293.451432.6098541078355300548.b4-ty@ellerman.id.au>
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
Cc: Sahitya.Damerla@ibm.com, mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Apr 2024 13:27:37 +0530, Ganesh Goudar wrote:
> When a device is hot removed on powernv, the hotplug driver clears
> the device's state. However, on pseries, if a device is removed by
> phyp after reaching the error threshold, the kernel remains unaware,
> leading to the device not being torn down. This prevents necessary
> remediation actions like failover.
> 
> Permanently disable the device if the presence check fails.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/eeh: Permanently disable the removed device
      https://git.kernel.org/powerpc/c/d1679b4fa1722e6bb4a17b13aacdc01a130ba362

cheers
