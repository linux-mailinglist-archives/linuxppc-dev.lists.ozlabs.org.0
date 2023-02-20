Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DC069C4A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 04:55:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKpVG03K6z3fVL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 14:55:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKpPr4Fksz3c1n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 14:51:44 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PKpPr3vVGz4x8f; Mon, 20 Feb 2023 14:51:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PKpPr2mqRz4x5c;
	Mon, 20 Feb 2023 14:51:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Sourabh Jain <sourabhjain@linux.ibm.com>, linuxppc-dev@ozlabs.org
In-Reply-To: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
References: <20221216122708.182154-1-sourabhjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/kexec_file: print error string on usable memory property update failure
Message-Id: <167686495802.2406274.8531227164961185335.b4-ty@ellerman.id.au>
Date: Mon, 20 Feb 2023 14:49:18 +1100
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
Cc: mahesh@linux.vnet.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 16 Dec 2022 17:57:08 +0530, Sourabh Jain wrote:
> Print the FDT error description along with the error message if failed
> to set the "linux,drconf-usable-memory" property in the kdump kernel's
> FDT.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/kexec_file: print error string on usable memory property update failure
      https://git.kernel.org/powerpc/c/b0ae5b6f3c298a005b73556740526c0e24a5633c

cheers
