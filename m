Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4838914A25
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:33:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W76n93cDwz3dBk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:33:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76l20gXcz3cYv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:31:10 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W76l30MYzz4wc8;
	Mon, 24 Jun 2024 22:31:11 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, Ganesh Goudar <ganeshgr@linux.ibm.com>
In-Reply-To: <20240617140240.580453-1-ganeshgr@linux.ibm.com>
References: <20240617140240.580453-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH v3] powerpc/eeh: avoid possible crash when edev->pdev changes
Message-Id: <171923223896.136336.14908435779633218072.b4-ty@ellerman.id.au>
Date: Mon, 24 Jun 2024 22:30:38 +1000
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
Cc: mahesh@linux.ibm.com, wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 17 Jun 2024 19:32:40 +0530, Ganesh Goudar wrote:
> If a PCI device is removed during eeh_pe_report_edev(), edev->pdev
> will change and can cause a crash, hold the PCI rescan/remove lock
> while taking a copy of edev->pdev->bus.
> 
> 

Applied to powerpc/fixes.

[1/1] powerpc/eeh: avoid possible crash when edev->pdev changes
      https://git.kernel.org/powerpc/c/a1216e62d039bf63a539bbe718536ec789a853dd

cheers
