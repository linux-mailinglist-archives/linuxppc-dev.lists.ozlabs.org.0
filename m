Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5305850B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:18:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSkt4ZKqz3gLs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:18:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSjx0Ywdz3g9x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:41 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSjw72w8z4x1c;
	Fri, 29 Jul 2022 23:17:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220525022358.780745-1-npiggin@gmail.com>
References: <20220525022358.780745-1-npiggin@gmail.com>
Subject: Re: [PATCH 0/3] powerpc/64s: Restrict NMMU workarounds
Message-Id: <165909974909.253830.781318649711869709.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:29 +1000
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Haren Myneni <haren@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 25 May 2022 12:23:55 +1000, Nicholas Piggin wrote:
> POWER10 doesn't require the two Nest MMU workarounds according to the
> workbook. Also remove the last vestige of the spurious fault flushing
> for NMMU which shouldn't have been required anyway.
> 
> Thanks,
> Nick
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/64s: POWER10 nest MMU does not require flush escalation workaround
      https://git.kernel.org/powerpc/c/abf0878ce95f8a9b47d8ecf2de1d4617bec21711
[2/3] powerpc/64s: POWER10 nest MMU can upgrade PTE access authority without TLB flush
      https://git.kernel.org/powerpc/c/2a8a0f420f74425bf5f80760fd14d7a2c3abb87d
[3/3] powerpc/64s: Remove spurious fault flushing for NMMU
      https://git.kernel.org/powerpc/c/fd193f85d3206cc7e7aeea2b6033d105cca38d01

cheers
