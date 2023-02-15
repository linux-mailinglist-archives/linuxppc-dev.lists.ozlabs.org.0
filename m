Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFCD697C15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:44:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGySH1zlBz3fSX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRH2plKz3cKG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRD5kgDz4x7W;
	Wed, 15 Feb 2023 23:43:04 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230203003947.38033-1-bgray@linux.ibm.com>
References: <20230203003947.38033-1-bgray@linux.ibm.com>
Subject: Re: [PATCH 0/5] Expand selftest utils
Message-Id: <167646483229.1421441.5150435840004658838.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:32 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 3 Feb 2023 11:39:42 +1100, Benjamin Gray wrote:
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

Applied to powerpc/next.

[1/5] selftests/powerpc: Add generic read/write file util
      https://git.kernel.org/powerpc/c/a974f0c131891027fe8490e654a220151b4caa82
[2/5] selftests/powerpc: Add read/write debugfs file, int
      https://git.kernel.org/powerpc/c/121d340be9a17ed89d523c56203908c01e09a306
[3/5] selftests/powerpc: Parse long/unsigned long value safely
      https://git.kernel.org/powerpc/c/d1bc05b7bf02f8635fe6c445f67d78f85234cbb7
[4/5] selftests/powerpc: Add {read,write}_{long,ulong}
      https://git.kernel.org/powerpc/c/5c20de57888f0962e25a0eeec1a59c98056fc42e
[5/5] selftests/powerpc: Add automatically allocating read_file
      https://git.kernel.org/powerpc/c/8d7253dc447473dfcf3f09fb0fa2bd6f7d05b43b

cheers
