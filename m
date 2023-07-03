Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A30087454BD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:17:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZ1h3YkFz3bxH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:17:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZ1C4TX0z3025
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:17:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZ194LZxz4wqX;
	Mon,  3 Jul 2023 15:17:17 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Maninder Singh <maninder1.s@samsung.com>
In-Reply-To: <20230529111337.352990-1-maninder1.s@samsung.com>
References: <CGME20230529111350epcas5p46a1fa16ffb2a39008c26d03c5c63f109@epcas5p4.samsung.com> <20230529111337.352990-1-maninder1.s@samsung.com>
Subject: Re: [PATCH 1/2] hexagon/traps.c: use KSYM_NAME_LEN in array size
Message-Id: <168835696947.31199.7769783904677561364.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 14:02:49 +1000
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
Cc: linux-hexagon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Onkarnath <onkarnath.1@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 May 2023 16:43:36 +0530, Maninder Singh wrote:
> kallsyms_lookup which in turn calls for kallsyms_lookup_buildid()
> writes on index "KSYM_NAME_LEN - 1".
> 
> Thus array size should be KSYM_NAME_LEN.
> 
> for hexagon it was defined as "128" directly.
> and commit '61968dbc2d5d' changed define value to 512,
> So both were missed to update with new size.
> 
> [...]

Patch 2 applied to powerpc/fixes.

[2/2] powerpc/xmon: use KSYM_NAME_LEN in array size
      https://git.kernel.org/powerpc/c/719dfd5925e186e09a2a6f23016936ac436f3d78

cheers
