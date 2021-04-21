Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD3366C24
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:12:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLYV4NBPz3d3T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:11:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVL4VNVz2yy9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:14 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVK4GTYz9vFX; Wed, 21 Apr 2021 23:09:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
References: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mce: save ignore_event flag unconditionally for UE
Message-Id: <161901050296.1961279.14875938612170335400.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:22 +1000
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 7 Apr 2021 10:28:16 +0530, Ganesh Goudar wrote:
> When we hit an UE while using machine check safe copy routines,
> ignore_event flag is set and the event is ignored by mce handler,
> And the flag is also saved for defered handling and printing of
> mce event information, But as of now saving of this flag is done
> on checking if the effective address is provided or physical address
> is calculated, which is not right.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/mce: save ignore_event flag unconditionally for UE
      https://git.kernel.org/powerpc/c/92d9d61be519f32f16c07602db5bcbe30a0836fe

cheers
