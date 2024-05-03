Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B50FC8BAAF0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:43:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6qH30kyz3dHt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:43:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6nc53Nbz2ytN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6nc3jsxz4xFg;
	Fri,  3 May 2024 20:42:28 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com, shuah@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240229093711.581230-1-maddy@linux.ibm.com>
References: <20240229093711.581230-1-maddy@linux.ibm.com>
Subject: Re: [PATCH 1/3] selftest/powerpc: Re-order *FLAGS to follow lib.mk
Message-Id: <171473286290.451432.4486404094591945834.b4-ty@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 29 Feb 2024 15:07:09 +0530, Madhavan Srinivasan wrote:
> In some powerpc/ sub-folder Makefiles, CFLAGS are
> defined before lib.mk include. Clean it up by
> re-ordering it to follow after the mk include.
> This is needed to support sub-folders in powerpc/
> buildable on its own.
> 
> 
> [...]

Applied to powerpc/next.

[1/3] selftest/powerpc: Re-order *FLAGS to follow lib.mk
      https://git.kernel.org/powerpc/c/37496845c812db2a470d51088a59ee38156e8058
[2/3] selftest/powerpc: Add flags.mk to support pmu buildable
      https://git.kernel.org/powerpc/c/5553a79387e92ffd812a49fdcf679f392281f6a9
[3/3] selftest/powerpc: make sub-folders buildable on it own
      https://git.kernel.org/powerpc/c/108e5e683333615023265a9a73a29d4c2fa16c70

cheers
