Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6A2647004
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 13:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NSYsk27Ymz3fBR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 23:50:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NSYrf1qqMz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Dec 2022 23:49:38 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NSYrc0VgBz4xRB;
	Thu,  8 Dec 2022 23:49:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20221128041948.58339-1-bgray@linux.ibm.com>
References: <20221128041948.58339-1-bgray@linux.ibm.com>
Subject: Re: (subset) [PATCH v3 0/7] Expand selftest utils
Message-Id: <167050320315.1457988.1297752497833504512.b4-ty@ellerman.id.au>
Date: Thu, 08 Dec 2022 23:40:03 +1100
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Nov 2022 15:19:41 +1100, Benjamin Gray wrote:
> Started this when writing tests for a feature I'm working on, needing a way to
> read/write numbers to system files. After writing some utils to safely handle
> file IO and parsing, I realised I'd made the ~6th file read/write implementation
> and only(?) number parser that checks all the failure modes when expecting to
> parse a single number from a file.
> 
> So these utils ended up becoming this series. I also modified some other test
> utils I came across while doing so. My understanding is selftests are not expected
> to be backported, so I wasn't concerned about only introducing new utils and leaving
> the existing implementations be.
> 
> [...]

Patches 1 & 2 applied to powerpc/next.

[1/7] selftests/powerpc: Use mfspr/mtspr macros
      https://git.kernel.org/powerpc/c/aecfd680099ba518c34dff2941017c5aa97def52
[2/7] selftests/powerpc: Add ptrace setup_core_pattern() null-terminator
      https://git.kernel.org/powerpc/c/94ba4f2c33f42dae7813dc169a177e922a39560c

cheers
