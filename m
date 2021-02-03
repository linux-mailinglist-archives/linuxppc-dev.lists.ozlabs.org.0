Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 652B330DAC9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:14:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW2GH29S5zF1hK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:14:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09y0b8SzDwvQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:54 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09t1PcCz9tlX; Wed,  3 Feb 2021 22:40:49 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Po-Hsu Lin <po-hsu.lin@canonical.com>
In-Reply-To: <20201228043459.14281-1-po-hsu.lin@canonical.com>
References: <20201228043459.14281-1-po-hsu.lin@canonical.com>
Subject: Re: [PATCH] selftests/powerpc: make the test check in eeh-basic.sh
 posix compliant
Message-Id: <161235199965.1516112.16797710998425289109.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:49 +1100 (AEDT)
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
Cc: shuah@kernel.org, oohall@gmail.com, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 28 Dec 2020 12:34:59 +0800, Po-Hsu Lin wrote:
> The == operand is a bash extension, thus this will fail on Ubuntu with
> 
> As the /bin/sh on Ubuntu is pointed to DASH.
> 
> Use -eq to fix this posix compatibility issue.

Applied to powerpc/next.

[1/1] selftests/powerpc: Make the test check in eeh-basic.sh posix compliant
      https://git.kernel.org/powerpc/c/3db380570af7052620ace20c29e244938610ca71

cheers
