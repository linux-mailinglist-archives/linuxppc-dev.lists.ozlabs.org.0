Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71905442D40
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:52:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7Yq2YzDz3glF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7GD4TRPz3cBq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:39:00 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7G82qmLz4xdh;
 Tue,  2 Nov 2021 22:38:56 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Wan Jiabing <wanjiabing@vivo.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh@kernel.org>, Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <20211018015418.10182-1-wanjiabing@vivo.com>
References: <20211018015418.10182-1-wanjiabing@vivo.com>
Subject: Re: [PATCH] powerpc/kexec_file: Add of_node_put() before goto
Message-Id: <163584789386.1845480.15708665136918587423.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:33 +1100
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
Cc: kael_w@yeah.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 17 Oct 2021 21:54:16 -0400, Wan Jiabing wrote:
> Fix following coccicheck warning:
> ./arch/powerpc/kexec/file_load_64.c:698:1-22: WARNING: Function
> for_each_node_by_type should have of_node_put() before goto
> 
> Early exits from for_each_node_by_type should decrement the
> node reference counter.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kexec_file: Add of_node_put() before goto
      https://git.kernel.org/powerpc/c/7453f501d443c7febf48809ee1c530b64d625c59

cheers
