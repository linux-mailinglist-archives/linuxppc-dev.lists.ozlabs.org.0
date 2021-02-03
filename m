Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6290630DAB2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:11:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DW2Bg2GTbzF3ks
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 00:11:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DW09w670hzDwtW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 22:40:52 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DW09q0rbfz9vG9; Wed,  3 Feb 2021 22:40:46 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20201103044503.917128-1-oohall@gmail.com>
References: <20201103044503.917128-1-oohall@gmail.com>
Subject: Re: [PATCH 1/3] selftests/powerpc: Hoist helper code out of eeh-basic
Message-Id: <161235200685.1516112.2023402360126739651.b4-ty@ellerman.id.au>
Date: Wed,  3 Feb 2021 22:40:46 +1100 (AEDT)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 3 Nov 2020 15:45:01 +1100, Oliver O'Halloran wrote:
> Hoist some of the useful test environment checking and prep code into
> eeh-functions.sh so they can be reused in other tests.

Applied to powerpc/next.

[1/3] selftests/powerpc: Hoist helper code out of eeh-basic
      https://git.kernel.org/powerpc/c/db82f7097c265776c22ad866511074836f17665e
[2/3] selftests/powerpc: Use stderr for debug messages in eeh-functions
      https://git.kernel.org/powerpc/c/d6749ccba7ff86f99b4672e50db871487ba69f19
[3/3] selftests/powerpc: Add VF recovery tests
      https://git.kernel.org/powerpc/c/38132cc0e5a6b22b04fac2e4df25c59435fcd6de

cheers
