Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 057CA488E71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 02:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JXH3t6hKfz3bTl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jan 2022 12:56:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JXGyW1Xstz2yZY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jan 2022 12:51:31 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JXGyV1sb3z4xmx;
 Mon, 10 Jan 2022 12:51:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linux-kernel@vger.kernel.org, Ammar Faizi <ammarfaizi2@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20211226135314.251221-1-ammar.faizi@intel.com>
References: <20211226135314.251221-1-ammar.faizi@intel.com>
Subject: Re: [PATCH] powerpc/xive: Add missing null check after calling kmalloc
Message-Id: <164177945776.1604045.3067152786407017859.b4-ty@ellerman.id.au>
Date: Mon, 10 Jan 2022 12:50:57 +1100
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
Cc: Yang Li <yang.lee@linux.alibaba.com>, Paul Mackerras <paulus@samba.org>, Cédric Le Goater <clg@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 26 Dec 2021 20:54:02 +0700, Ammar Faizi wrote:
> Commit 930914b7d528fc ("powerpc/xive: Add a debugfs file to dump
> internal XIVE state") forgot to add a null check.
> 
> Add it.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/xive: Add missing null check after calling kmalloc
      https://git.kernel.org/powerpc/c/18dbfcdedc802f9500b2c29794f22a31d27639c0

cheers
