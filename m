Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A47E7D9511
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:19:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W0dEmyCA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzDS2pJ9z3vsL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:19:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=W0dEmyCA;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzW42dnz3cFg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401303;
	bh=2CsgfLf/pUsCN6SDik5dlYFqiH+Yzws7m8cz/m9JN9M=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=W0dEmyCALN9U1BXXzLNC6zKQj20AYyhqZAfdqCMzha5Ns6D9nT4sIG/7VJUKLutYf
	 SOKelr0KHRTtxTYrZ/LGLW8zRQNly5jCkg8r05eqk4BrQh5Xa+rMPmfu8TqHJohVz8
	 OkRwXVZxnaQbAkDss30preYIh/5MH+SKS7WIhpiZQ8GegnT7pjTwa2gBMrDRidgh7h
	 lionJaIev0AaUxtX8QXl3177fXmkR8XwOdvUalSNX/DcG+O+MSqAnNPnyaqmqZMFps
	 MgXqdbRd6ahstZzaqkubRQzSh1ubg2G6ZifTq2yvuVUEtW438ZvmcWrWuBi6Cn6Jg3
	 lpNu93mTF86ew==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzW2tmgz4xVZ;
	Fri, 27 Oct 2023 21:08:23 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <20230314164442.124929-1-nnac123@linux.ibm.com>
References: <20230314164442.124929-1-nnac123@linux.ibm.com>
Subject: Re: [RFC PATCH v1] powerpc: Add version to install filenames
Message-Id: <169840079682.2701453.5693040205919300565.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 14 Mar 2023 11:44:42 -0500, Nick Child wrote:
> Rather than replacing the versionless vmlinux and System.map files,
> copy to files with the version info appended.
> 
> Additionally, since executing the script is a last resort option,
> inform the user about the missing `installkernel` command and the
> location of the installation.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Add version to install filenames
      https://git.kernel.org/powerpc/c/269d79fb30f6b2419b8a67d99d8bdf58ced44d72

cheers
