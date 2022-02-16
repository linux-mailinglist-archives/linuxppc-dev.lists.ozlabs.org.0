Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A7F4B87C2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:34:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHTN5rSMz3fc4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:34:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNT4B5sz3cR4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:17 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNT6PLNz4xv5;
 Wed, 16 Feb 2022 23:30:17 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ritesh Harjani <riteshh@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <57242c1fe7aba6b7f0fcd0490303bfd5f222ee00.1631512686.git.riteshh@linux.ibm.com>
References: <57242c1fe7aba6b7f0fcd0490303bfd5f222ee00.1631512686.git.riteshh@linux.ibm.com>
Subject: Re: [PATCHv2] selftests/powerpc/copyloops: Add memmove_64 test
Message-Id: <164501435775.521186.12117089875046828615.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:57 +1100
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Sep 2021 11:47:20 +0530, Ritesh Harjani wrote:
> While debugging an issue, we wanted to check whether the arch specific
> kernel memmove implementation is correct.
> This selftest could help test that.
> 
> 

Applied to powerpc/next.

[1/1] selftests/powerpc/copyloops: Add memmove_64 test
      https://git.kernel.org/powerpc/c/2504e5b9827f7fc76ed0e4593adc852ac7a19851

cheers
