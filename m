Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4400C7454CB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:24:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZ9d1QSdz3cJC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:24:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ8928wQz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:23:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ874DWqz4wxS;
	Mon,  3 Jul 2023 15:23:19 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, bpf@vger.kernel.org, Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20230425065829.18189-1-hbathini@linux.ibm.com>
References: <20230425065829.18189-1-hbathini@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/bpf: populate extable entries only during the last pass
Message-Id: <168836167606.46386.1266997701169825170.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:21:16 +1000
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, stable@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 25 Apr 2023 12:28:29 +0530, Hari Bathini wrote:
> Since commit 85e031154c7c ("powerpc/bpf: Perform complete extra passes
> to update addresses"), two additional passes are performed to avoid
> space and CPU time wastage on powerpc. But these extra passes led to
> WARN_ON_ONCE() hits in bpf_add_extable_entry() as extable entries are
> populated again, during the extra pass, without resetting the index.
> Fix it by resetting entry index before repopulating extable entries,
> if and when there is an additional pass.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/bpf: populate extable entries only during the last pass
      https://git.kernel.org/powerpc/c/35a4b8ce4ac00e940b46b1034916ccb22ce9bdef

cheers
