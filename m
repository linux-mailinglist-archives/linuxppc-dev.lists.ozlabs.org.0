Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC12363A23
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 06:11:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNtgD6S4sz3g7F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 14:11:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNtVx6V3Nz3cZd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 14:04:41 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FNtVl5gQ4z9tl3; Mon, 19 Apr 2021 14:04:31 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: npiggin@gmail.com, benh@kernel.crashing.org, mpe@ellerman.id.au,
 alistair@popple.id.au, maddy@linux.ibm.com, christophe.leroy@csgroup.eu,
 ravi.bangoria@linux.ibm.com, rppt@kernel.org, paulus@samba.org,
 john.ogness@linutronix.de, jniethe5@gmail.com, pmladek@suse.com,
 Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20210409070151.163424-1-pulehui@huawei.com>
References: <20210409070151.163424-1-pulehui@huawei.com>
Subject: Re: [PATCH -next] powerpc/xmon: Make symbol 'spu_inst_dump' static
Message-Id: <161880479868.1398509.405544111450941367.b4-ty@ellerman.id.au>
Date: Mon, 19 Apr 2021 13:59:58 +1000
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
Cc: zhangjinhao2@huawei.com, yangjihong1@huawei.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 9 Apr 2021 15:01:51 +0800, Pu Lehui wrote:
> Fix sparse warning:
> 
> arch/powerpc/xmon/xmon.c:4216:1: warning:
>  symbol 'spu_inst_dump' was not declared. Should it be static?
> 
> This symbol is not used outside of xmon.c, so make it static.

Applied to powerpc/next.

[1/1] powerpc/xmon: Make symbol 'spu_inst_dump' static
      https://git.kernel.org/powerpc/c/f234ad405a35262ed2d8dd2d29fc633908dce955

cheers
