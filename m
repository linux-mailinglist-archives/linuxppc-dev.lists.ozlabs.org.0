Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E77363A1C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:09:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtcn2zHsz3fg2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:09:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVn6vVnz3cRY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:33 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVf3BZYz9vHL; Mon, 19 Apr 2021 14:04:25 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210408140630.205502-1-nathanl@linux.ibm.com>
References: <20210408140630.205502-1-nathanl@linux.ibm.com>
Subject: Re: [PATCH v2 0/5] powerpc/rtas: miscellaneous cleanups
Message-Id: <161880479617.1398509.1154162955998163040.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:56 +1000
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
Cc: tyreld@linux.ibm.com, ajd@linux.ibm.com, aik@ozlabs.ru,
 aneesh.kumar@linux.ibm.com, npiggin@gmail.com, brking@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 8 Apr 2021 09:06:25 -0500, Nathan Lynch wrote:
> This is a reroll of the series posted here:
> https://lore.kernel.org/linuxppc-dev/20210114220004.1138993-1-nathanl@linux.ibm.com/
> 
> Originally this work was prompted by failures on radix MMU PowerVM
> guests when passing buffers to RTAS that lay outside of its idea of
> the RMA. In v1 I approached this as a problem to be solved in Linux,
> but RTAS development has since decided to change their code so that
> the RMA restriction does not apply with radix.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/rtas: improve ppc_rtas_rmo_buf_show documentation
      https://git.kernel.org/powerpc/c/c13ff6f3251318f5e1ff5b1a6d05f76996db672a
[2/5] powerpc/rtas-proc: remove unused RMO_READ_BUF_MAX
      https://git.kernel.org/powerpc/c/01c1b9984a12a379f332c39c4b1fd96e473b93b0
[3/5] powerpc/rtas: remove ibm_suspend_me_token
      https://git.kernel.org/powerpc/c/0ab1c929ae38262c4deb18b4a2e03a4f0cb5c5ed
[4/5] powerpc/rtas: move syscall filter setup into separate function
      https://git.kernel.org/powerpc/c/0649cdc8237943c15fc977e96033dc8ae28cc2bd
[5/5] powerpc/rtas: rename RTAS_RMOBUF_MAX to RTAS_USER_REGION_SIZE
      https://git.kernel.org/powerpc/c/e5d56763525e65417dad0d46572b234fa0008e40

cheers
