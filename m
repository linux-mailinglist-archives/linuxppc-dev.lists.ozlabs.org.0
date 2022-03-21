Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C354E1F05
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 03:27:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMJRs3zvBz30FQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 13:27:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Ks1WQ/qH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMJRF4P2vz2xgY
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 13:27:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Ks1WQ/qH; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KMJR96tdqz4xNq;
 Mon, 21 Mar 2022 13:27:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1647829624;
 bh=plT1NW/VqseH3wHAwgIVBIsiL7RgCuaBdXW+C0sq1G0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Ks1WQ/qH0TiFfwdBMd6XOBIfocUU+W0THd6+RZShvKVkOlxyZThigOOqPXWsj+8hr
 fZ6vlAlxihi6Jno6c2bUABJ3b6LJs2LgH1XzntjPKJQCj45VD55FG5xtfbQxJdAe/y
 ygeEHPkgOX5AJbN5FDMXsHgLQ5XTjmUofwu5bGwIl5PDoyhKAUE4BrVBm6Z6aehkFq
 oNofUroPZqFBak8c7VI7j7305dWe0ns78jGYwxduUBGsX2aVJ1HiS/hB5FTdjjDPFX
 qXXX5CXph6ecW1HNTPfnMBCtzj2xrevc9rRGOjDlm77t3w9UD7xWZ3+x8PvX+7g0I4
 4xIONzBqvAW+g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Sathvika Vasireddy
 <sv@linux.ibm.com>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
In-Reply-To: <33447256-81d1-8844-d82f-e8ac94f65fbe@csgroup.eu>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <33447256-81d1-8844-d82f-e8ac94f65fbe@csgroup.eu>
Date: Mon, 21 Mar 2022 13:27:01 +1100
Message-ID: <87pmmgghvu.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 Peter Zijlstra <peterz@infradead.org>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 18/03/2022 =C3=A0 13:26, Peter Zijlstra a =C3=A9crit=C2=A0:
>> On Fri, Mar 18, 2022 at 04:21:40PM +0530, Sathvika Vasireddy wrote:
>>> This patch adds powerpc specific functions required for
>>> 'objtool mcount' to work, and enables mcount for ppc.
>>=20
>> I would love to see more objtool enablement for Power :-)
>
> I have not received this series and I can't see it on powerpc patchwork=20
> either (https://patchwork.ozlabs.org/project/linuxppc-dev/list/)
>
> Did you send it to linuxppc-dev list ? If not can you resend it there ?

It is there, might have been delayed?

http://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=3D291129

There are some CI failures.

cheers
