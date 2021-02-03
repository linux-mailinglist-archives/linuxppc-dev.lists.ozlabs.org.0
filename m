Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 663AD30DB64
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:35:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW2kD3D9MzF32M
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:35:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW0JF6vnFzDwxD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:46:21 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW0JC6G4Nz9tlM; Wed,  3 Feb 2021 22:46:19 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
In-Reply-To: <20210129071745.111466-1-ravi.bangoria@linux.ibm.com>
References: <20210129071745.111466-1-ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/sstep: Fix array out of bound warning
Message-Id: <161235275169.1521894.17491918890471924956.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:46:19 +1100 (AEDT)
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
Cc: naveen.n.rao@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 29 Jan 2021 12:47:45 +0530, Ravi Bangoria wrote:
> Compiling kernel with -Warray-bounds throws below warning:
> 
>   In function 'emulate_vsx_store':
>   warning: array subscript is above array bounds [-Warray-bounds]
>   buf.d[2] = byterev_8(reg->d[1]);
>   ~~~~~^~~
>   buf.d[3] = byterev_8(reg->d[0]);
>   ~~~~~^~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/sstep: Fix array out of bound warning
      https://git.kernel.org/powerpc/c/344717a14cd7272f88346022a77742323346299e

cheers
