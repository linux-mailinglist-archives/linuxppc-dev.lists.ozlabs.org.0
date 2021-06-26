Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D5A3B4E3B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:45:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBrBH2xKyz3ftv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:45:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBr2j3NHqz3c0t
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:39:09 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBr2h23Jdz9sjD; Sat, 26 Jun 2021 20:39:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Jason Wang <wangborong@cdjrlc.com>, mpe@ellerman.id.au
In-Reply-To: <20210624063632.25632-1-wangborong@cdjrlc.com>
References: <20210624063632.25632-1-wangborong@cdjrlc.com>
Subject: Re: [PATCH] powerpc/sysfs: Replace sizeof(arr)/sizeof(arr[0]) with
 ARRAY_SIZE
Message-Id: <162470384814.3589875.5054268468403433734.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:37:28 +1000
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
Cc: christophe.leroy@c-s.fr, maddy@linux.ibm.com, paulus@samba.org,
 clg@kaod.org, linuxppc-dev@lists.ozlabs.org, joel@jms.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 24 Jun 2021 14:36:32 +0800, Jason Wang wrote:
> The ARRAY_SIZE macro is more compact and more formal in linux source.

Applied to powerpc/next.

[1/1] powerpc/sysfs: Replace sizeof(arr)/sizeof(arr[0]) with ARRAY_SIZE
      https://git.kernel.org/powerpc/c/590e1e4254458455477e4e857cd00733280a3d73

cheers
