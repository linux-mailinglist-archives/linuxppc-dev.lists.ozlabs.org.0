Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 358F54B62EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:36:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVFG60HFz3fp8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:36:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6K59Gjz3cY4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6K6qZtz4y4V;
 Tue, 15 Feb 2022 16:30:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Sachin Sant <sachinp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <164146703333.19039.10920919226094771665.sendpatchset@MacBook-Pro.local>
References: <164146703333.19039.10920919226094771665.sendpatchset@MacBook-Pro.local>
Subject: Re: [PATCH]powerpc/xive: Export XIVE IPI information for online-only
 processors.
Message-Id: <164490278620.270256.11812384580944326527.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:26 +1100
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
Cc: clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 06 Jan 2022 16:33:53 +0530, Sachin Sant wrote:
> Cédric pointed out that XIVE IPI information exported via sysfs
> (debug/powerpc/xive) display empty lines for processors which are
> not online.
> 
> Switch to using for_each_online_cpu() so that information is
> displayed for online-only processors.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/xive: Export XIVE IPI information for online-only processors.
      https://git.kernel.org/powerpc/c/279d1a72c0f8021520f68ddb0a1346ff9ba1ea8c

cheers
