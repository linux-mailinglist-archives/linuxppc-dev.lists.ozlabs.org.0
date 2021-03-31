Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBECA34F62C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97pd5RnZz3dny
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xw107Zz3cHw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:40 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xv5695z9sj0; Wed, 31 Mar 2021 12:10:36 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 rppt@kernel.org, mpe@ellerman.id.au, christophe.leroy@csgroup.eu,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org, oss@buserror.net,
 paulus@samba.org, akpm@linux-foundation.org
In-Reply-To: <20210314220436.3417083-1-unixbhaskar@gmail.com>
References: <20210314220436.3417083-1-unixbhaskar@gmail.com>
Subject: Re: [PATCH] powerpc: kernel: Trivial spelling fixes throughout the
 file head_fsl_booke.S
Message-Id: <161715297716.226945.9682163470122144049.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:37 +1100
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
Cc: rdunlap@infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Mar 2021 03:34:36 +0530, Bhaskar Chowdhury wrote:
> Trivial spelling fixes throughout the file.

Applied to powerpc/next.

[1/1] powerpc: kernel: Trivial spelling fixes throughout the file head_fsl_booke.S
      https://git.kernel.org/powerpc/c/f239873fcd953557ba9a9781d10ca95c0594e2b3

cheers
